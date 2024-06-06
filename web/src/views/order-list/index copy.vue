<template>
  <div class="card-container">
    <Tabs type="card" v-model:active-key="state.activeKey">
      <TabPane :key="0" tab="未完成订单"></TabPane>
      <TabPane :key="1" tab="未出行订单"></TabPane>
      <TabPane :key="2" tab="历史订单"></TabPane>
    </Tabs>
  </div>
  <Card :bordered="false" :style="{ padding: '0 10px' }">
    <CheckboxGroup
      :style="{ width: '100%' }"
      v-model:value="state.checkList"
      @change="
        (e) => {
          state.checkList = e
        }
      "
    >
      <Table
        :columns="state.columns"
        :data-source="state.dataSource"
        :pagination="false"
        :loading="state.loading"
        :bordered="true"
        rowKey="orderSn"
      >
        <template #id="{ text, record }">
          <div :style="{ display: 'flex', alignItems: 'center' }">
            <div>
              <span :style="{ marginRight: '5px', width: '60%' }">{{ record?.id }}</span>
            </div>
            <div>{{ '身份证' }}</div>
          </div>
        </template>
        <template #seatType="{ text, record }">
          <div>{{ '一等座' }}</div>
          <div>
            <span>{{ '3' }}</span>
            <span>车</span>
            <span>{{ '18A' }}</span>
            <span>号</span>
          </div>
        </template>
        <template #amount="{ text, record }">
          <div>{{ '普通票' }}</div>
          <div :style="{ color: 'orange' }">￥500</div>
        </template>
        <template #status="{ text, record }">
          <div>{{ '未使用' }}</div>
          <div v-if="record?.status === 10">
            <Button type="link" @click="() => { state.visible = true; state.currentOrder = record?.orderSn }">退票</Button>
          </div>
        </template>
      </Table>
    </CheckboxGroup>
    <div :style="{ width: '100%', marginTop: '20px', display: 'flex', justifyContent: 'end' }">
      <Pagination
        :show-total="(total) => `总共 1 条`"
        :current="state.current"
        :size="state.size"
        :total="state.data?.total"
        show-size-changer
        @change="handlePage"
      ></Pagination>
    </div>
    <div class="tips-txt">
      <h2 :style="{ fontSize: '16px' }">温馨提示：</h2>
      <p>1. 席位已锁定，请在指定时间内完成网上确认。</p>
      <p>2. 逾期未确认，系统将取消本次预约。</p>
      <p>3. 在完成确认或取消订单之前，您将无法再进行其他预约活动。</p>
    </div>
  </Card>
  <Modal
    width="40%"
    :visible="state.visible"
    title="退票申请"
    class="custom-modal"
    @cancel="state.visible = false"
    :footer="null"
  >
    <Alert
      message="您确认要退款吗？"
      type="warning"
      description="如有定餐饮或特产，请按规定到网站自行办理退订"
      show-icon
      style="background-color: #fff; border: none"
    >
      <template #icon><QuestionCircleFilled /></template>
    </Alert>
    <Divider :dashed="true" />
    <div style="padding: 0 30px">
      请选择要退票的订单：
      <CheckboxGroup
        v-model:value="state.refundOrder"
        @change="(value) => console.log(value, 'value')"
        :options="
          state.dataSource
            ?.find((item) => item.orderSn === state.currentOrder)
            .passengerDetails.map((item) => ({
              label: item.realName,
              value: item.id
            }))
        "
      ></CheckboxGroup>
    </div>
    <Divider :dashed="true" />
    <div style="padding: 0 30px">
      共计退款：<a>{{ '¥' + state.dataSource.find((item) => item.orderSn === state.currentOrder)?.passengerDetails.filter((item) => state.refundOrder.includes(item.id)).map((item) => item.amount).reduce((after, pre) => after + pre, 0) / 100 }}</a>
    </div>
    <Divider :dashed="true" />
    <div style="padding: 0 30px">
      <div style="margin-bottom: 20px">
        车票票价：<a>{{ '¥' + state.dataSource.find((item) => item.orderSn === state.currentOrder)?.passengerDetails.filter((item) => state.refundOrder.includes(item.id)).map((item) => item.amount).reduce((after, pre) => after + pre, 0) / 100 }}</a>
      </div>
      <div>
        应退票款：<a>{{ '¥' + state.dataSource.find((item) => item.orderSn === state.currentOrder)?.passengerDetails.filter((item) => state.refundOrder.includes(item.id)).map((item) => item.amount).reduce((after, pre) => after + pre, 0) / 100 }}</a>
      </div>
    </div>
    <Divider :dashed="true" />
    <div style="color: #999999; padding: 0 30px">
      <QuestionCircleFilled />
      <span style="margin-left: 20px">实际核收退票费及应退票款将按最终交易时间计算。</span>
    </div>
    <div style="color: #999999; padding: 0 30px">
      <QuestionCircleFilled />
      <span style="margin-left: 20px">如你需要办理该次列车前续、后续退票业务，请于退票车次票面开车时间前办理。</span>
    </div>
    <Space style="width: 100%; justify-content: center; margin-top: 20px">
      <Button @click="state.visible = false">取消</Button>
      <Button @click="handleRefund" type="primary" :disabled="!state.refundOrder.length">确定</Button>
    </Space>
  </Modal>
</template>

<script setup>
import {
  Tabs,
  TabPane,
  Table,
  Card,
  Pagination,
  message,
  CheckboxGroup,
  Modal,
  Alert,
  Divider,
  Space,
  Button
} from 'ant-design-vue'
import { QuestionCircleFilled } from '@ant-design/icons-vue'
import CarInfo from './components/show-card-info'
import EditContent from './components/edit-content'
import RefundTicket from './components/refund-ticket'
import { reactive, watch, h } from 'vue'
import Cookie from 'js-cookie'
import { useRouter } from 'vue-router'

const state = reactive({
  activeKey: 0,
  dataSource: [
    {
      trainNumber: '京A755',
      orderTime: '2024-05-29 9:30',
      arrival: '大兴校区',
      departure: 'Shanghai',
      ridingDate: '2024-05-29',
      departureTime: '13:00',
      id: '01A',
      seatType: 'First Class',
      amount: 50000,
      status: 10,
      orderSn: '20240520001',
      rowSpan: 1
    }
  ],
  data: null,
  current: 1,
  size: 10,
  loading: false,
  columns: [],
  checkList: [],
  checkedAll: false,
  visible: false,
  currentOrder: undefined,
  refundOrder: []
})

const userId = Cookie.get('userId')
const router = useRouter()

const columns = [
  {
    title: '车次信息',
    dataIndex: 'arrival',
    key: 'arrival',
    slots: { customRender: 'info' },
    customRender: ({ text, record }) => {
      return {
        children: h(CarInfo, {
          trainNumber: record.trainNumber,
          orderTime: record.orderTime,
          arrival: record.arrival,
          departure: record.departure,
          ridingDate: record.ridingDate,
          departureTime: record.departureTime
        }),
        props: {
          rowSpan: record.rowSpan
        }
      }
    }
  },
  {
    title: '旅客信息',
    dataIndex: 'id',
    key: 'id',
    slots: { customRender: 'id' },
    customRender: () => '钱来 22000**2001' // 定死的假数据
  },
  {
    title: '席位信息',
    dataIndex: 'seatType',
    key: 'seatType',
    slots: { customRender: 'seatType' },
    customRender: () => '01A'
  },
  {
    title: '车票状态',
    dataIndex: 'amount',
    key: 'amount',
    slots: { customRender: 'amount' },
    customRender: () => '待确认'
  },
  {
    title: '订单状态',
    dataIndex: 'status',
    key: 'status',
    slots: { customRender: 'status' },
    customRender: ({ text, record }) => {
      return h('div', [
      h(Button, { type: 'link', onClick: () => { confirmOrder(record.orderSn) } }, '去确认') &&
h(Button, { type: 'link', onClick: () => { cancelOrder(record.orderSn) } }, '取消订单')

      ])
    }
  }
]

state.columns = columns

const handlePage = (page, pageSize) => {
  state.current = page
  state.size = pageSize
}

const handleRefund = () => {
  // Implement refund logic here
  state.visible = false
}
</script>



<style lang="scss" scoped>
.card-container {
  overflow: hidden;
}
.tips-txt {
  background: #fffbe5;
  border: 1px solid #fbd800;
  padding: 5px;
  margin-top: 10px;
}

.card-container > .ant-tabs-card > .ant-tabs-content {
  height: 120px;
  margin-top: -16px;
}

.card-container > .ant-tabs-card > .ant-tabs-content > .ant-tabs-tabpane {
  background: #fff;
  /* //   padding: 16px; */
}

.card-container > .ant-tabs-card > .ant-tabs-bar {
  border-color: #fff;
}

.card-container > .ant-tabs-card > .ant-tabs-bar .ant-tabs-tab {
  border-color: transparent;
  background: transparent;
}

.card-container > .ant-tabs-card > .ant-tabs-bar .ant-tabs-tab-active {
  border-color: #fff;
  background: #fff;
}

::v-deep {
  .ant-table-thead > tr > th {
    background-color: #f8f8f8;
  }

  .ant-table-thead .ant-table-cell {
    background-image: none;
  }

  .ant-tabs-top > .ant-tabs-nav {
    margin: 0;
  }
  .ant-tabs-content-holder {
    padding: 12px;
    background-color: #fff;
    box-sizing: border-box;
    background-image: none;
  }
  .custom-modal {
    .ant-alert-warning {
      background-color: #fff !important;
      border: none !important;
    }
  }
}
</style>
