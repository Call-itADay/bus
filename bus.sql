/*
 Navicat Premium Data Transfer

 Source Server         : localDB
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : 12306

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 28/05/2024 23:18:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_carriage
-- ----------------------------
DROP TABLE IF EXISTS `t_carriage`;
CREATE TABLE `t_carriage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `train_id` bigint(20) DEFAULT NULL COMMENT '列车ID',
  `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车厢号',
  `carriage_type` int(3) DEFAULT NULL COMMENT '车厢类型',
  `seat_count` int(3) DEFAULT NULL COMMENT '座位数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='车厢表';

-- ----------------------------
-- Records of t_carriage
-- ----------------------------
BEGIN;
INSERT INTO `t_carriage` (`id`, `train_id`, `carriage_number`, `carriage_type`, `seat_count`, `create_time`, `update_time`, `del_flag`) VALUES (1, 1, '1', 0, 50, '2023-06-01 20:50:00', '2023-06-01 20:50:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_sn` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `train_id` bigint(20) DEFAULT NULL COMMENT '列车ID',
  `train_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
  `riding_date` date DEFAULT NULL COMMENT '乘车日期',
  `departure` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出发站点',
  `arrival` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '到达站点',
  `departure_time` datetime DEFAULT NULL COMMENT '出发时间',
  `arrival_time` datetime DEFAULT NULL COMMENT '到达时间',
  `source` int(3) DEFAULT NULL COMMENT '订单来源',
  `status` int(3) DEFAULT NULL COMMENT '订单状态',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `pay_type` int(3) DEFAULT NULL COMMENT '支付方式',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_sn` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `train_id` bigint(20) DEFAULT NULL COMMENT '列车ID',
  `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车厢号',
  `seat_type` int(3) DEFAULT NULL COMMENT '座位类型',
  `seat_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '座位号',
  `real_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `id_type` int(3) DEFAULT NULL COMMENT '证件类型',
  `id_card` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `ticket_type` int(3) DEFAULT NULL COMMENT '车票类型',
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `status` int(3) DEFAULT NULL COMMENT '订单状态',
  `amount` int(11) DEFAULT NULL COMMENT '订单金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_order_sn` (`order_sn`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

-- ----------------------------
-- Records of t_order_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_order_item_passenger
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item_passenger`;
CREATE TABLE `t_order_item_passenger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_sn` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `id_type` int(3) DEFAULT NULL COMMENT '证件类型',
  `id_card` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

-- ----------------------------
-- Records of t_order_item_passenger
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_passenger
-- ----------------------------
DROP TABLE IF EXISTS `t_passenger`;
CREATE TABLE `t_passenger` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `id_type` int(3) DEFAULT NULL COMMENT '证件类型',
  `id_card` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
  `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `create_date` datetime DEFAULT NULL COMMENT '添加日期',
  `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683029597561061377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

-- ----------------------------
-- Records of t_passenger
-- ----------------------------
BEGIN;
INSERT INTO `t_passenger` (`id`, `username`, `real_name`, `id_type`, `id_card`, `discount_type`, `phone`, `create_date`, `verify_status`, `create_time`, `update_time`, `del_flag`) VALUES (1683029289099362304, 'admin', '万重山', 0, '7XT4j1iCfK8DeSiZeJs1M00oDOG/KxdBXKR34j5YLZc=', 0, 'MZObk+5TeYPLHtP2A6+aiw==', '2023-07-23 16:20:26', 0, '2023-07-23 16:20:26', '2023-07-23 16:20:26', 0);
INSERT INTO `t_passenger` (`id`, `username`, `real_name`, `id_type`, `id_card`, `discount_type`, `phone`, `create_date`, `verify_status`, `create_time`, `update_time`, `del_flag`) VALUES (1683029597561061376, 'admin', '金来', 0, 'R0L4oYtT1xHe04P4h9qmZycS0T45NS7WO6J58AqzJgs=', 0, 'RPKP/q6lpWsY06C178ARjA==', '2023-07-23 16:21:40', 0, '2023-07-23 16:21:40', '2023-07-23 16:21:40', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_pay`;
CREATE TABLE `t_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pay_sn` varchar(64) DEFAULT NULL COMMENT '支付流水号',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单号',
  `out_order_sn` varchar(64) DEFAULT NULL COMMENT '商户订单号',
  `channel` varchar(64) DEFAULT NULL COMMENT '支付渠道',
  `trade_type` varchar(64) DEFAULT NULL COMMENT '支付环境',
  `subject` varchar(512) DEFAULT NULL COMMENT '订单标题',
  `order_request_id` varchar(64) DEFAULT NULL COMMENT '商户订单号',
  `total_amount` int(11) DEFAULT NULL COMMENT '交易总金额',
  `trade_no` varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
  `gmt_payment` datetime DEFAULT NULL COMMENT '付款时间',
  `pay_amount` int(11) DEFAULT NULL COMMENT '支付金额',
  `status` varchar(32) DEFAULT NULL COMMENT '支付状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_pay_sn` (`pay_sn`) USING BTREE,
  KEY `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

-- ----------------------------
-- Records of t_pay
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_refund
-- ----------------------------
DROP TABLE IF EXISTS `t_refund`;
CREATE TABLE `t_refund` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pay_sn` varchar(64) DEFAULT NULL COMMENT '支付流水号',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单号',
  `trade_no` varchar(64) DEFAULT NULL COMMENT '三方交易凭证号',
  `amount` int(11) DEFAULT NULL COMMENT '退款金额',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(256) DEFAULT NULL COMMENT '用户名',
  `train_id` bigint(20) DEFAULT NULL COMMENT '列车ID',
  `train_number` varchar(256) DEFAULT NULL COMMENT '列车车次',
  `riding_date` date DEFAULT NULL COMMENT '乘车日期',
  `departure` varchar(64) DEFAULT NULL COMMENT '出发站点',
  `arrival` varchar(64) DEFAULT NULL COMMENT '到达站点',
  `departure_time` datetime DEFAULT NULL COMMENT '出发时间',
  `arrival_time` datetime DEFAULT NULL COMMENT '到达时间',
  `seat_type` int(3) DEFAULT NULL COMMENT '座位类型',
  `id_type` int(3) DEFAULT NULL COMMENT '证件类型',
  `id_card` varchar(256) DEFAULT NULL COMMENT '证件号',
  `real_name` varchar(256) DEFAULT NULL COMMENT '真实姓名',
  `status` int(3) DEFAULT NULL COMMENT '订单状态',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款记录表';

-- ----------------------------
-- Records of t_refund
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_region
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区名称',
  `full_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区全名',
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区编码',
  `initial` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区首字母',
  `spell` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拼音',
  `popular_flag` tinyint(1) DEFAULT NULL COMMENT '热门标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='地区表';

-- ----------------------------
-- Records of t_region
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_seat
-- ----------------------------
DROP TABLE IF EXISTS `t_seat`;
CREATE TABLE `t_seat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `train_id` bigint(20) DEFAULT NULL COMMENT '列车ID',
  `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车厢号',
  `seat_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '座位号',
  `start_station` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始站',
  `end_station` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点站',
  `price` int(11) DEFAULT NULL COMMENT '车票价格',
  `seat_status` int(3) DEFAULT NULL COMMENT '座位状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1684913719228485633 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='座位表';

-- ----------------------------
-- Records of t_seat
-- ----------------------------
BEGIN;
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362265866240, 1, '1', '01A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362270060544, 1, '1', '01B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362278449152, 1, '1', '01C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362286837760, 1, '1', '01D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362295226368, 1, '1', '01F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362299420672, 1, '1', '02A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362307809280, 1, '1', '02B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362316197888, 1, '1', '02C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362320392192, 1, '1', '02D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362328780800, 1, '1', '02F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362332975104, 1, '1', '03A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362341363712, 1, '1', '03B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362345558016, 1, '1', '03C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362353946624, 1, '1', '03D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362362335232, 1, '1', '03F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362366529536, 1, '1', '04A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362374918144, 1, '1', '04B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362379112448, 1, '1', '04C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362387501056, 1, '1', '04D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362391695360, 1, '1', '04F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362400083968, 1, '1', '05A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362404278272, 1, '1', '05B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362412666880, 1, '1', '05C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362416861184, 1, '1', '05D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362425249792, 1, '1', '05F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362429444096, 1, '1', '06A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362437832704, 1, '1', '06B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362446221312, 1, '1', '06C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362450415616, 1, '1', '06D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362458804224, 1, '1', '06F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362467192832, 1, '1', '07A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362471387136, 1, '1', '07B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362479775744, 1, '1', '07C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362483970048, 1, '1', '07D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362492358656, 1, '1', '07F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362500747264, 1, '1', '08A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362509135872, 1, '1', '08B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362513330176, 1, '1', '08C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362521718784, 1, '1', '08D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362530107392, 1, '1', '08F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362538496000, 1, '1', '09A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362542690304, 1, '1', '09B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362551078912, 1, '1', '09C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362559467520, 1, '1', '09D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362567856128, 1, '1', '09F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362576244736, 1, '1', '10A', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362584633344, 1, '1', '10B', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362593021952, 1, '1', '10C', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362601410560, 1, '1', '10D', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
INSERT INTO `t_seat` (`id`, `train_id`, `carriage_number`, `seat_number`, `start_station`, `end_station`, `price`, `seat_status`, `create_time`, `update_time`, `del_flag`) VALUES (1684913362605604864, 1, '1', '10F', '大兴校区', '本部', 100, 0, '2023-07-28 21:06:50', '2023-07-28 21:06:50', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_station
-- ----------------------------
DROP TABLE IF EXISTS `t_station`;
CREATE TABLE `t_station` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车站编号',
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车站名称',
  `spell` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拼音',
  `region` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车站地区',
  `region_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车站地区名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='车站表';

-- ----------------------------
-- Records of t_station
-- ----------------------------
BEGIN;
INSERT INTO `t_station` (`id`, `code`, `name`, `spell`, `region`, `region_name`, `create_time`, `update_time`, `del_flag`) VALUES (1, 'VNP', '本部', 'benbu', 'BJPA', '北京A', '2023-06-01 20:54:00', '2023-06-01 20:54:00', 0);
INSERT INTO `t_station` (`id`, `code`, `name`, `spell`, `region`, `region_name`, `create_time`, `update_time`, `del_flag`) VALUES (2, 'JGK', '大兴校区', 'daxing', 'BJPB', '北京B', '2023-06-01 20:54:00', '2023-06-01 20:54:00', 0);
INSERT INTO `t_station` (`id`, `code`, `name`, `spell`, `region`, `region_name`, `create_time`, `update_time`, `del_flag`) VALUES (3, 'NKH', '新宫地铁站', 'xingong', 'BJPC', '北京C', '2023-06-01 20:54:00', '2023-06-01 20:54:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_ticket
-- ----------------------------
DROP TABLE IF EXISTS `t_ticket`;
CREATE TABLE `t_ticket` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `train_id` bigint(20) DEFAULT NULL COMMENT '列车ID',
  `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车厢号',
  `seat_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '座位号',
  `passenger_id` bigint(20) DEFAULT NULL COMMENT '乘车人ID',
  `ticket_status` int(3) DEFAULT NULL COMMENT '车票状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1682790903965503489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='车票表';

-- ----------------------------
-- Records of t_ticket
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_train
-- ----------------------------
DROP TABLE IF EXISTS `t_train`;
CREATE TABLE `t_train` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `train_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
  `start_station` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始站',
  `end_station` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点站',
  `start_region` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始城市',
  `end_region` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点城市',
  `sale_time` datetime DEFAULT NULL COMMENT '销售时间',
  `sale_status` int(3) DEFAULT NULL COMMENT '销售状态 0：可售 1：不可售 2：未知',
  `departure_time` datetime DEFAULT NULL COMMENT '出发时间',
  `arrival_time` datetime DEFAULT NULL COMMENT '到达时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车表';

-- ----------------------------
-- Records of t_train
-- ----------------------------
BEGIN;
INSERT INTO `t_train` (`id`, `train_number`, `start_station`, `end_station`, `start_region`, `end_region`, `sale_time`, `sale_status`, `departure_time`, `arrival_time`, `create_time`, `update_time`, `del_flag`) VALUES (1, '京A755', '大兴校区', '本部', '北京B', '北京A', '2024-05-29 14:30:00', 1, '2024-05-28 09:56:00', '2024-06-01 15:14:00', '2023-06-01 20:45:00', '2023-06-01 20:45:00', 0);
INSERT INTO `t_train` (`id`, `train_number`, `start_station`, `end_station`, `start_region`, `end_region`, `sale_time`, `sale_status`, `departure_time`, `arrival_time`, `create_time`, `update_time`, `del_flag`) VALUES (2, '京A755', '本部', '大兴校区', '北京A', '北京B', '2023-05-29 14:30:00', 0, '2024-05-28 19:04:00', '2024-06-01 23:22:00', '2023-06-01 20:45:00', '2023-06-01 20:45:00', 0);
INSERT INTO `t_train` (`id`, `train_number`, `start_station`, `end_station`, `start_region`, `end_region`, `sale_time`, `sale_status`, `departure_time`, `arrival_time`, `create_time`, `update_time`, `del_flag`) VALUES (3, '京G666', '大兴校区', '新宫地铁站', '北京B', '北京C', '2023-05-29 14:30:00', 0, '2024-05-28 19:16:00', '2024-06-02 09:00:00', '2023-06-01 20:45:00', '2023-06-01 20:45:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_train_station
-- ----------------------------
DROP TABLE IF EXISTS `t_train_station`;
CREATE TABLE `t_train_station` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `train_id` bigint(20) DEFAULT NULL COMMENT '车次ID',
  `station_id` bigint(20) DEFAULT NULL COMMENT '车站ID',
  `sequence` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '站点顺序',
  `departure` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出发站点',
  `arrival` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '到达站点',
  `start_region` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始城市',
  `end_region` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点城市',
  `arrival_time` datetime DEFAULT NULL COMMENT '到站时间',
  `departure_time` datetime DEFAULT NULL COMMENT '出站时间',
  `stopover_time` int(3) DEFAULT NULL COMMENT '停留时间，单位分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车站点表';

-- ----------------------------
-- Records of t_train_station
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_train_station_price
-- ----------------------------
DROP TABLE IF EXISTS `t_train_station_price`;
CREATE TABLE `t_train_station_price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `train_id` bigint(20) DEFAULT NULL COMMENT '车次ID',
  `departure` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出发站点',
  `arrival` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '到达站点',
  `price` int(11) DEFAULT NULL COMMENT '车票价格',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1677692017354547201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车站点价格表';

-- ----------------------------
-- Records of t_train_station_price
-- ----------------------------
BEGIN;
INSERT INTO `t_train_station_price` (`id`, `train_id`, `departure`, `arrival`, `price`, `create_time`, `update_time`, `del_flag`) VALUES (1664877136352866304, 1, '大兴校区', '本部', 100, '2023-06-03 14:10:16', '2023-06-03 14:10:16', 0);
INSERT INTO `t_train_station_price` (`id`, `train_id`, `departure`, `arrival`, `price`, `create_time`, `update_time`, `del_flag`) VALUES (1664877136424169472, 2, '本部', '大兴校区', 80, '2023-06-03 14:10:16', '2023-06-03 14:10:16', 0);
INSERT INTO `t_train_station_price` (`id`, `train_id`, `departure`, `arrival`, `price`, `create_time`, `update_time`, `del_flag`) VALUES (1664877136453529600, 3, '大兴校区', '新宫地铁站', 90, '2023-06-03 14:10:16', '2023-06-03 14:10:16', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_train_station_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_train_station_relation`;
CREATE TABLE `t_train_station_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `train_id` bigint(20) DEFAULT NULL COMMENT '车次ID',
  `departure` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出发站点',
  `arrival` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '到达站点',
  `start_region` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始城市名称',
  `end_region` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点城市名称',
  `departure_flag` tinyint(1) DEFAULT NULL COMMENT '始发标识',
  `arrival_flag` tinyint(1) DEFAULT NULL COMMENT '终点标识',
  `departure_time` datetime DEFAULT NULL COMMENT '出发时间',
  `arrival_time` datetime DEFAULT NULL COMMENT '到达时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1677689610742865921 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车站点关系表';

-- ----------------------------
-- Records of t_train_station_relation
-- ----------------------------
BEGIN;
INSERT INTO `t_train_station_relation` (`id`, `train_id`, `departure`, `arrival`, `start_region`, `end_region`, `departure_flag`, `arrival_flag`, `departure_time`, `arrival_time`, `create_time`, `update_time`, `del_flag`) VALUES (1665025584123056128, 1, '大兴校区', '本部', '北京B', '北京A', 1, 0, '2024-05-28 22:40:00', '2024-05-28 23:40:00', '2023-06-04 00:00:09', '2023-06-04 00:00:09', 0);
INSERT INTO `t_train_station_relation` (`id`, `train_id`, `departure`, `arrival`, `start_region`, `end_region`, `departure_flag`, `arrival_flag`, `departure_time`, `arrival_time`, `create_time`, `update_time`, `del_flag`) VALUES (1665025584177582080, 2, '本部', '大兴校区', '北京A', '北京B', 1, 0, '2024-05-28 13:00:00', '2024-05-28 13:50:00', '2023-06-04 00:00:09', '2023-06-04 00:00:09', 0);
INSERT INTO `t_train_station_relation` (`id`, `train_id`, `departure`, `arrival`, `start_region`, `end_region`, `departure_flag`, `arrival_flag`, `departure_time`, `arrival_time`, `create_time`, `update_time`, `del_flag`) VALUES (1665025584206942208, 3, '大兴校区', '新宫地铁站', '北京B', '北京C', 1, 0, '2024-05-28 17:00:00', '2024-05-28 17:30:00', '2023-06-04 00:00:09', '2023-06-04 00:00:09', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `region` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '国家/地区',
  `id_type` int(3) DEFAULT NULL COMMENT '证件类型',
  `id_card` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `telephone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '固定电话',
  `mail` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `user_type` int(3) DEFAULT NULL COMMENT '旅客类型',
  `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
  `post_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',
  `address` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1795068519057727489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`id`, `username`, `password`, `real_name`, `region`, `id_type`, `id_card`, `phone`, `telephone`, `mail`, `user_type`, `verify_status`, `post_code`, `address`, `deletion_time`, `create_time`, `update_time`, `del_flag`) VALUES (1795068519057727488, 'admin', 'admin', 'admin', '0', 0, '12345678', '12345678', NULL, '1234@qq.com', NULL, NULL, NULL, NULL, 0, '2024-05-27 20:24:20', '2024-05-27 20:24:20', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_user_deletion
-- ----------------------------
DROP TABLE IF EXISTS `t_user_deletion`;
CREATE TABLE `t_user_deletion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `id_type` int(3) DEFAULT NULL COMMENT '证件类型',
  `id_card` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户注销表';

-- ----------------------------
-- Records of t_user_deletion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_user_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_user_mail`;
CREATE TABLE `t_user_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `mail` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1795068519179362305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

-- ----------------------------
-- Records of t_user_mail
-- ----------------------------
BEGIN;
INSERT INTO `t_user_mail` (`id`, `username`, `mail`, `deletion_time`, `create_time`, `update_time`, `del_flag`) VALUES (1683025552452648960, 'admin', 'machen@apache.org', 0, '2023-07-23 16:05:35', '2023-07-23 16:05:35', 0);
INSERT INTO `t_user_mail` (`id`, `username`, `mail`, `deletion_time`, `create_time`, `update_time`, `del_flag`) VALUES (1795068519179362304, 'admin', '1234@qq.com', 0, '2024-05-27 20:24:20', '2024-05-27 20:24:20', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_user_phone
-- ----------------------------
DROP TABLE IF EXISTS `t_user_phone`;
CREATE TABLE `t_user_phone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1795068519158390785 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

-- ----------------------------
-- Records of t_user_phone
-- ----------------------------
BEGIN;
INSERT INTO `t_user_phone` (`id`, `username`, `phone`, `deletion_time`, `create_time`, `update_time`, `del_flag`) VALUES (1683025552431677440, 'admin', '15601166692', 0, '2023-07-23 16:05:35', '2023-07-23 16:05:35', 0);
INSERT INTO `t_user_phone` (`id`, `username`, `phone`, `deletion_time`, `create_time`, `update_time`, `del_flag`) VALUES (1795068519158390784, 'admin', '12345678', 0, '2024-05-27 20:24:20', '2024-05-27 20:24:20', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_user_reuse
-- ----------------------------
DROP TABLE IF EXISTS `t_user_reuse`;
CREATE TABLE `t_user_reuse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户名复用表';

-- ----------------------------
-- Records of t_user_reuse
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
