/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : pet_hospital

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-02-17 14:30:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('1', '小张超市', '111', '武汉', '027-9123131', '张大明', '138123123123', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('2', '小明超市', '222', '深圳', '0755-9123131', '张小明', '138123123123', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('3', '快七超市', '430000', '武汉', '027-11011011', '雷生', '13434134131', '招商银行', '6543123341334133', '6666@66.com', '545341', '1');
INSERT INTO `bus_customer` VALUES ('4', '王健', '100000', '深圳', '18807470305', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) DEFAULT NULL,
  `produceplace` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `goodspackage` varchar(255) DEFAULT NULL,
  `productcode` varchar(255) DEFAULT NULL,
  `promitcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sq0btr2v2lq8gt8b4gb8tlk0i` (`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES ('1', '娃哈哈', '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', '2', '1000', '10', '2020-11-27/1156BC5E0F5641F099C53AA9C0470C11.gif', '1', '3');
INSERT INTO `bus_goods` VALUES ('2', '旺旺雪饼[小包]', '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', '4', '1000', '10', '2018-12-25/userface2.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('3', '旺旺大礼包', '仙桃', '盒', '盒', '11', '11', '111', '28', '1009', '100', '2018-12-25/userface3.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('4', '娃哈哈', '武汉', '200ML', '瓶', '11', '111', '12321', '3', '1000', '10', '2018-12-25/userface4.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('5', '娃哈哈', '武汉', '300ML', '瓶', '1234', '12321', '22221111', '3', '1000', '100', '2018-12-25/userface5.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('7', '123123', '123123', '123123123', '312321', '12312', '2132', '213', '123', '1000', '3123', '2019-09-27/48E8C8FE8F2D4536820435CCCD968AEC.jpg', '1', '2');

-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) DEFAULT NULL,
  `inporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `inportprice` double DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_1o4bujsyd2kl4iqw48fie224v` (`providerid`) USING BTREE,
  KEY `FK_ho29poeu4o2dxu4rg1ammeaql` (`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`),
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------
INSERT INTO `bus_inport` VALUES ('1', '微信', '2018-05-07 00:00:00', '张三', '100', '备注', '3.5', '1', '1');
INSERT INTO `bus_inport` VALUES ('2', '支付宝', '2018-05-07 00:00:00', '张三', '1000', '无', '2.5', '3', '3');
INSERT INTO `bus_inport` VALUES ('3', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '111', '3', '3');
INSERT INTO `bus_inport` VALUES ('4', '银联', '2018-05-07 00:00:00', '张三', '1000', '无', '2', '3', '1');
INSERT INTO `bus_inport` VALUES ('5', '银联', '2018-05-07 00:00:00', '张三', '100', '无', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('6', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '2.5', '1', '2');
INSERT INTO `bus_inport` VALUES ('8', '支付宝', '2018-05-07 00:00:00', '张三', '100', '', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('10', '支付宝', '2018-08-07 17:17:57', '超级管理员', '100', 'sadfasfdsa', '1.5', '3', '1');
INSERT INTO `bus_inport` VALUES ('11', '支付宝', '2018-09-17 16:12:25', '超级管理员', '21', '21', '21', '1', '3');
INSERT INTO `bus_inport` VALUES ('12', '微信', '2018-12-25 16:48:24', '超级管理员', '100', '123213213', '12321321', '3', '1');
INSERT INTO `bus_inport` VALUES ('14', '支付宝', '2019-09-28 03:47:16', '超级管理员', '100', '1111', '4.5', '1', '3');

-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `outputtime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `outportprice` double(10,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------
INSERT INTO `bus_outport` VALUES ('1', '3', '微信', '2019-08-16 08:19:50', '超级管理员', '12321321.00', '1', '', '1');
INSERT INTO `bus_outport` VALUES ('2', '3', '微信', '2019-08-16 08:26:54', '超级管理员', '12321321.00', '11', '11', '1');
INSERT INTO `bus_outport` VALUES ('7', '1', '支付宝', '2019-09-28 06:56:13', '超级管理员', '4.50', '1', '111', '3');

-- ----------------------------
-- Table structure for bus_pet
-- ----------------------------
DROP TABLE IF EXISTS `bus_pet`;
CREATE TABLE `bus_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `birth` varchar(20) DEFAULT NULL,
  `pet_type` varchar(64) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `province` varchar(63) DEFAULT NULL,
  `city` varchar(63) DEFAULT NULL,
  `county` varchar(63) DEFAULT NULL,
  `detail_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_pet
-- ----------------------------
INSERT INTO `bus_pet` VALUES ('6', '小黑', '男', '11', '2022-02-27', '狗狗', '12', '11222', '0', '天津市', '', '', '123');
INSERT INTO `bus_pet` VALUES ('8', '小白', '女', '13', '2022-02-27', '猫咪', '11', '111', '0', '天津市', '', '', '123');
INSERT INTO `bus_pet` VALUES ('9', '小孟', '男', '23', '2022-02-08', '狗狗', '9', '会写代码的宠物', '0', '北京市', '广州市', '罗湖区', '家里蹲');
INSERT INTO `bus_pet` VALUES ('10', '小孟001', '男', '23', '2022-02-02', '狗狗', '11', '写了一手好代码', '0', '北京市', '广州市', '罗湖区', '家里蹲');

-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES ('1', '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('2', '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('3', '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', '1');
INSERT INTO `bus_provider` VALUES ('6', '1', '100000', '深圳', '18807470305', '1', '18807470305', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for bus_sales
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `salestime` datetime DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_sales
-- ----------------------------

-- ----------------------------
-- Table structure for bus_salesback
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) DEFAULT NULL,
  `salesbacktime` datetime DEFAULT NULL,
  `salebackprice` double(10,2) DEFAULT NULL,
  `operateperson` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_salesback
-- ----------------------------

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `content` text COLLATE utf8mb4_bin,
  `type` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `status` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_announcement
-- ----------------------------
INSERT INTO `sys_announcement` VALUES ('6', '111', 0x313233, '寄养公告', '6', '1', null, '1', '2020-11-25 16:04:51');
INSERT INTO `sys_announcement` VALUES ('7', '111', 0x313131, '寄养公告', '6', '1', null, '1', '2020-11-27 01:56:27');
INSERT INTO `sys_announcement` VALUES ('12', '111', 0x313131, '寄养公告', '6', '9', '2', '1', '2020-11-27 03:30:40');
INSERT INTO `sys_announcement` VALUES ('13', '321', 0x32333133313331, '领养公告', '6', '9', '2', '1', '2020-11-27 03:35:15');
INSERT INTO `sys_announcement` VALUES ('14', '11212', 0x3231313231, '寄养公告', '6', '9', '1212', '1', '2020-11-27 03:45:28');
INSERT INTO `sys_announcement` VALUES ('15', '213', 0x3231333231333132, '寄养公告', '6', '9', 'ds', '1', '2020-11-27 03:48:19');
INSERT INTO `sys_announcement` VALUES ('45', '1', 0x33, '招养公告', null, '12', '2', '1', '2020-12-02 01:50:26');
INSERT INTO `sys_announcement` VALUES ('46', '8', 0x38, '寄养公告', '6', '12', '8', '1', '2020-12-02 03:45:40');
INSERT INTO `sys_announcement` VALUES ('47', '1', 0x33, '寄养公告', '6', '12', '2', '1', '2020-12-02 03:48:15');
INSERT INTO `sys_announcement` VALUES ('48', '1', 0x31, '招养公告', '6', '12', '1', '1', '2020-12-02 13:11:07');
INSERT INTO `sys_announcement` VALUES ('49', '456', 0x343536, '招养公告', '6', '12', '456', '1', '2020-12-02 13:12:52');
INSERT INTO `sys_announcement` VALUES ('50', '12', 0x3132, '招养公告', '6', '12', '12', '1', '2020-12-02 15:32:39');

-- ----------------------------
-- Table structure for sys_apply
-- ----------------------------
DROP TABLE IF EXISTS `sys_apply`;
CREATE TABLE `sys_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `type` int(3) DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `apply_user_id` int(11) DEFAULT NULL,
  `has_generate_case` int(2) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100015 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_apply
-- ----------------------------
INSERT INTO `sys_apply` VALUES ('100001', '6', '15', '3', '12', '2020-11-27 23:51:56', '2', '111', '100.00', '12', '1');
INSERT INTO `sys_apply` VALUES ('100003', '6', '2', '2', '11', '2020-11-30 03:04:10', '2', null, '10.00', '12', '1');
INSERT INTO `sys_apply` VALUES ('100004', '6', '2', '2', '12', '2020-11-30 03:04:50', '2', null, '10.00', '12', '1');
INSERT INTO `sys_apply` VALUES ('100005', '6', '2', '2', '11', '2020-11-30 03:05:26', '2', '321313', '10.00', '12', '1');
INSERT INTO `sys_apply` VALUES ('100006', '6', '17', '2', '21', '2020-11-30 03:57:56', '2', '111', '10.00', '12', '1');
INSERT INTO `sys_apply` VALUES ('100007', '6', '17', '2', '11', '2020-11-30 08:13:44', '2', '11111', '10.00', '12', '1');
INSERT INTO `sys_apply` VALUES ('100008', '6', '17', '2', '21', '2020-12-01 17:44:06', '2', '1111', '10.00', '12', '1');
INSERT INTO `sys_apply` VALUES ('100011', '6', '15', '3', '12', '2020-12-02 14:30:08', '1', '332', '10.00', '12', '0');
INSERT INTO `sys_apply` VALUES ('100012', '6', '15', '3', '11', '2020-12-02 15:32:10', '1', '112', '10.00', '12', '0');
INSERT INTO `sys_apply` VALUES ('100013', '6', '2', '2', '11', '2020-12-02 15:37:12', '2', '1121', '10.00', '12', '0');
INSERT INTO `sys_apply` VALUES ('100014', '6', '17', '2', '21', '2020-12-02 15:37:30', '2', '1212', '10.00', '12', '0');

-- ----------------------------
-- Table structure for sys_case
-- ----------------------------
DROP TABLE IF EXISTS `sys_case`;
CREATE TABLE `sys_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `case_time` date DEFAULT NULL,
  `symptom` varchar(255) DEFAULT NULL,
  `expense` decimal(10,2) DEFAULT NULL,
  `pay_status` int(2) DEFAULT NULL,
  `apply_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `confirm_user_id` int(11) DEFAULT NULL,
  `case_type` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_case
-- ----------------------------
INSERT INTO `sys_case` VALUES ('2', '瞧瞧', '瞧瞧', '2020-11-30', '瞧瞧', '1111.00', '2', '100001', '15', '12', '12');
INSERT INTO `sys_case` VALUES ('3', '11', '11', '2020-11-30', '11', '11.00', '2', '100003', '2', '12', '11');
INSERT INTO `sys_case` VALUES ('4', '11', '11', '2020-11-30', '11', '11.00', '2', '100004', '2', '12', '12');
INSERT INTO `sys_case` VALUES ('5', '12', '12', '2020-11-30', '12', '12.00', '2', '100005', '2', '12', '11');
INSERT INTO `sys_case` VALUES ('6', '121', '212', '2020-12-01', '1212', '12.00', '2', '100006', '17', '12', '21');
INSERT INTO `sys_case` VALUES ('7', '121', '121', '2020-12-01', '121', '122.00', '2', '100008', '17', '12', '21');
INSERT INTO `sys_case` VALUES ('8', '1', '1', '2020-12-01', '1', '111.00', '2', '100003', '2', '12', '11');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码【为了调事显示顺序】',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '总经办', '1', '大BOSS', '深圳', '1', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('2', '1', '销售部', '0', '程序员屌丝', '武汉', '1', '2', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('3', '1', '运营部', '0', '无', '武汉', '1', '3', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('4', '1', '生产部', '0', '无', '武汉', '1', '4', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('5', '2', '销售一部', '0', '销售一部', '武汉', '1', '5', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('6', '2', '销售二部', '0', '销售二部', '武汉', '1', '6', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('7', '3', '运营一部', '0', '运营一部', '武汉', '1', '7', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('8', '2', '销售三部', '0', '销售三部', '11', '1', '8', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('9', '2', '销售四部', '0', '销售四部', '222', '1', '9', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('10', '2', '销售五部', '0', '销售五部', '33', '1', '10', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('24', '4', '33', '1', '333', '33', '1', '12', '2019-09-24 02:11:09');
INSERT INTO `sys_dept` VALUES ('25', '4', '444', '1', '444', '44', '1', '13', '2019-09-24 02:11:25');

-- ----------------------------
-- Table structure for sys_hospital
-- ----------------------------
DROP TABLE IF EXISTS `sys_hospital`;
CREATE TABLE `sys_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `province` varchar(63) DEFAULT NULL,
  `city` varchar(63) DEFAULT NULL,
  `county` varchar(63) DEFAULT NULL,
  `detail_address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `leader` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_hospital
-- ----------------------------
INSERT INTO `sys_hospital` VALUES ('2', '攸县人民医院', '湖南省', '株洲市', '攸县', '建设北路', '18807470305', '李四');
INSERT INTO `sys_hospital` VALUES ('3', '旺财医院', '安徽省', '合肥市', '瑶海区', '深圳', '18807470305', '张三');

-- ----------------------------
-- Table structure for sys_in_hospital
-- ----------------------------
DROP TABLE IF EXISTS `sys_in_hospital`;
CREATE TABLE `sys_in_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL,
  `bed_number` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_in_hospital
-- ----------------------------
INSERT INTO `sys_in_hospital` VALUES ('1', '6', '2', '11', '11', '不知道', '2020-11-30 17:15:49', '1', '1');
INSERT INTO `sys_in_hospital` VALUES ('2', '6', '1', '1221', '1221', null, '2020-11-30 09:34:12', '1', '2');
INSERT INTO `sys_in_hospital` VALUES ('3', '8', '1', '11', '11', null, '2020-11-30 09:34:59', '1', '1');
INSERT INTO `sys_in_hospital` VALUES ('4', '6', '1', '11', '11', '11', '2020-11-30 09:36:15', '1', '2');
INSERT INTO `sys_in_hospital` VALUES ('5', '6', '1', '3', '90', '小孟没照看好，被别的小狗欺负了', '2022-02-15 18:04:49', '1', '1');
INSERT INTO `sys_in_hospital` VALUES ('6', '10', '1', '90', '87', '小孟 没时间照顾，结果被其他小母狗欺负了', '2022-02-15 18:08:46', '1', '1');

-- ----------------------------
-- Table structure for sys_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginfo`;
CREATE TABLE `sys_loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `loginip` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES ('2', '超级管理员-system', '127.0.0.1', '2018-12-21 16:54:52');
INSERT INTO `sys_loginfo` VALUES ('3', '超级管理员-system', '127.0.0.1', '2018-12-21 16:55:15');
INSERT INTO `sys_loginfo` VALUES ('4', '超级管理员-system', '127.0.0.1', '2018-12-21 17:29:22');
INSERT INTO `sys_loginfo` VALUES ('5', '超级管理员-system', '127.0.0.1', '2018-12-22 09:05:22');
INSERT INTO `sys_loginfo` VALUES ('6', '超级管理员-system', '127.0.0.1', '2018-12-22 09:20:43');
INSERT INTO `sys_loginfo` VALUES ('7', '超级管理员-system', '127.0.0.1', '2018-12-22 09:25:40');
INSERT INTO `sys_loginfo` VALUES ('8', '超级管理员-system', '127.0.0.1', '2018-12-22 09:27:11');
INSERT INTO `sys_loginfo` VALUES ('9', '超级管理员-system', '127.0.0.1', '2018-12-22 09:29:58');
INSERT INTO `sys_loginfo` VALUES ('10', '超级管理员-system', '127.0.0.1', '2018-12-22 09:36:49');
INSERT INTO `sys_loginfo` VALUES ('11', '超级管理员-system', '127.0.0.1', '2018-12-22 09:46:56');
INSERT INTO `sys_loginfo` VALUES ('12', '超级管理员-system', '127.0.0.1', '2018-12-22 09:48:29');
INSERT INTO `sys_loginfo` VALUES ('13', '超级管理员-system', '127.0.0.1', '2018-12-22 09:49:13');
INSERT INTO `sys_loginfo` VALUES ('14', '超级管理员-system', '127.0.0.1', '2018-12-22 09:49:57');
INSERT INTO `sys_loginfo` VALUES ('15', '超级管理员-system', '127.0.0.1', '2018-12-22 09:57:46');
INSERT INTO `sys_loginfo` VALUES ('16', '超级管理员-system', '127.0.0.1', '2018-12-22 10:21:53');
INSERT INTO `sys_loginfo` VALUES ('17', '超级管理员-system', '127.0.0.1', '2018-12-22 10:38:25');
INSERT INTO `sys_loginfo` VALUES ('18', '超级管理员-system', '127.0.0.1', '2018-12-22 10:49:21');
INSERT INTO `sys_loginfo` VALUES ('19', '超级管理员-system', '127.0.0.1', '2018-12-22 14:01:42');
INSERT INTO `sys_loginfo` VALUES ('20', '超级管理员-system', '127.0.0.1', '2018-12-22 14:19:48');
INSERT INTO `sys_loginfo` VALUES ('21', '超级管理员-system', '127.0.0.1', '2018-12-22 14:45:29');
INSERT INTO `sys_loginfo` VALUES ('22', '超级管理员-system', '127.0.0.1', '2018-12-22 15:58:05');
INSERT INTO `sys_loginfo` VALUES ('23', '超级管理员-system', '127.0.0.1', '2018-12-22 16:40:53');
INSERT INTO `sys_loginfo` VALUES ('24', '超级管理员-system', '127.0.0.1', '2018-12-22 17:12:01');
INSERT INTO `sys_loginfo` VALUES ('25', '超级管理员-system', '127.0.0.1', '2018-12-24 09:19:15');
INSERT INTO `sys_loginfo` VALUES ('26', '超级管理员-system', '127.0.0.1', '2018-12-24 09:37:28');
INSERT INTO `sys_loginfo` VALUES ('27', '超级管理员-system', '127.0.0.1', '2018-12-24 09:46:51');
INSERT INTO `sys_loginfo` VALUES ('28', '超级管理员-system', '127.0.0.1', '2018-12-24 09:50:40');
INSERT INTO `sys_loginfo` VALUES ('29', '超级管理员-system', '127.0.0.1', '2018-12-24 09:52:52');
INSERT INTO `sys_loginfo` VALUES ('30', '超级管理员-system', '127.0.0.1', '2018-12-24 10:00:26');
INSERT INTO `sys_loginfo` VALUES ('31', '超级管理员-system', '127.0.0.1', '2018-12-24 10:10:58');
INSERT INTO `sys_loginfo` VALUES ('32', '超级管理员-system', '127.0.0.1', '2018-12-24 10:21:28');
INSERT INTO `sys_loginfo` VALUES ('33', '超级管理员-system', '127.0.0.1', '2018-12-24 11:22:27');
INSERT INTO `sys_loginfo` VALUES ('34', '超级管理员-system', '127.0.0.1', '2018-12-24 11:35:28');
INSERT INTO `sys_loginfo` VALUES ('35', '超级管理员-system', '127.0.0.1', '2018-12-24 14:05:28');
INSERT INTO `sys_loginfo` VALUES ('36', '超级管理员-system', '127.0.0.1', '2018-12-24 15:16:29');
INSERT INTO `sys_loginfo` VALUES ('37', '李四-ls', '127.0.0.1', '2018-12-24 15:16:50');
INSERT INTO `sys_loginfo` VALUES ('38', '王五-ww', '127.0.0.1', '2018-12-24 15:17:36');
INSERT INTO `sys_loginfo` VALUES ('39', '赵六-zl', '127.0.0.1', '2018-12-24 15:17:47');
INSERT INTO `sys_loginfo` VALUES ('40', '孙七-sq', '127.0.0.1', '2018-12-24 15:17:58');
INSERT INTO `sys_loginfo` VALUES ('41', '刘八-lb', '127.0.0.1', '2018-12-24 15:18:09');
INSERT INTO `sys_loginfo` VALUES ('42', '超级管理员-system', '127.0.0.1', '2018-12-24 15:34:59');
INSERT INTO `sys_loginfo` VALUES ('43', '超级管理员-system', '127.0.0.1', '2018-12-24 15:35:09');
INSERT INTO `sys_loginfo` VALUES ('44', '刘八-lb', '127.0.0.1', '2018-12-24 15:36:09');
INSERT INTO `sys_loginfo` VALUES ('45', '刘八-lb', '127.0.0.1', '2018-12-24 15:42:58');
INSERT INTO `sys_loginfo` VALUES ('46', '刘八-lb', '127.0.0.1', '2018-12-24 15:43:04');
INSERT INTO `sys_loginfo` VALUES ('47', '超级管理员-system', '127.0.0.1', '2018-12-24 15:46:01');
INSERT INTO `sys_loginfo` VALUES ('48', '超级管理员-system', '127.0.0.1', '2018-12-24 17:03:54');
INSERT INTO `sys_loginfo` VALUES ('49', '超级管理员-system', '127.0.0.1', '2018-12-24 17:26:32');
INSERT INTO `sys_loginfo` VALUES ('50', '超级管理员-system', '127.0.0.1', '2018-12-25 09:07:42');
INSERT INTO `sys_loginfo` VALUES ('51', '超级管理员-system', '127.0.0.1', '2018-12-25 09:16:27');
INSERT INTO `sys_loginfo` VALUES ('52', '超级管理员-system', '127.0.0.1', '2018-12-25 09:59:03');
INSERT INTO `sys_loginfo` VALUES ('53', '超级管理员-system', '127.0.0.1', '2018-12-25 10:05:13');
INSERT INTO `sys_loginfo` VALUES ('54', '超级管理员-system', '127.0.0.1', '2018-12-25 10:05:47');
INSERT INTO `sys_loginfo` VALUES ('55', '超级管理员-system', '127.0.0.1', '2018-12-25 10:11:17');
INSERT INTO `sys_loginfo` VALUES ('56', '超级管理员-system', '127.0.0.1', '2018-12-25 10:14:06');
INSERT INTO `sys_loginfo` VALUES ('57', '超级管理员-system', '127.0.0.1', '2018-12-25 10:36:16');
INSERT INTO `sys_loginfo` VALUES ('58', '超级管理员-system', '127.0.0.1', '2018-12-25 14:17:21');
INSERT INTO `sys_loginfo` VALUES ('59', '超级管理员-system', '127.0.0.1', '2018-12-25 14:20:00');
INSERT INTO `sys_loginfo` VALUES ('60', '超级管理员-system', '127.0.0.1', '2018-12-25 14:34:22');
INSERT INTO `sys_loginfo` VALUES ('61', '超级管理员-system', '127.0.0.1', '2018-12-25 14:34:27');
INSERT INTO `sys_loginfo` VALUES ('62', '超级管理员-system', '127.0.0.1', '2018-12-25 14:38:37');
INSERT INTO `sys_loginfo` VALUES ('63', '超级管理员-system', '127.0.0.1', '2018-12-25 14:50:37');
INSERT INTO `sys_loginfo` VALUES ('64', '超级管理员-system', '127.0.0.1', '2018-12-25 16:01:35');
INSERT INTO `sys_loginfo` VALUES ('65', '超级管理员-system', '127.0.0.1', '2018-12-25 16:25:28');
INSERT INTO `sys_loginfo` VALUES ('66', '超级管理员-system', '127.0.0.1', '2018-12-25 16:27:37');
INSERT INTO `sys_loginfo` VALUES ('67', '超级管理员-system', '127.0.0.1', '2018-12-25 16:28:28');
INSERT INTO `sys_loginfo` VALUES ('68', '超级管理员-system', '127.0.0.1', '2018-12-25 16:44:02');
INSERT INTO `sys_loginfo` VALUES ('69', '超级管理员-system', '127.0.0.1', '2018-12-25 16:47:55');
INSERT INTO `sys_loginfo` VALUES ('70', '超级管理员-system', '127.0.0.1', '2018-12-28 15:59:34');
INSERT INTO `sys_loginfo` VALUES ('71', '超级管理员-system', '127.0.0.1', '2018-12-28 17:27:16');
INSERT INTO `sys_loginfo` VALUES ('72', '超级管理员-system', '127.0.0.1', '2018-12-28 17:29:40');
INSERT INTO `sys_loginfo` VALUES ('73', '超级管理员-system', '127.0.0.1', '2018-12-28 17:51:10');
INSERT INTO `sys_loginfo` VALUES ('74', '超级管理员-system', '127.0.0.1', '2019-04-15 17:05:02');
INSERT INTO `sys_loginfo` VALUES ('75', '超级管理员-system', '127.0.0.1', '2019-04-15 17:05:12');
INSERT INTO `sys_loginfo` VALUES ('76', '超级管理员-system', '127.0.0.1', '2019-04-15 17:10:22');
INSERT INTO `sys_loginfo` VALUES ('77', '刘八-lb', '127.0.0.1', '2019-04-15 17:11:45');
INSERT INTO `sys_loginfo` VALUES ('78', '刘八-lb', '127.0.0.1', '2019-04-15 17:28:50');
INSERT INTO `sys_loginfo` VALUES ('79', '超级管理员-system', '127.0.0.1', '2019-04-15 17:29:13');
INSERT INTO `sys_loginfo` VALUES ('80', '刘八-lb', '127.0.0.1', '2019-04-15 17:30:59');
INSERT INTO `sys_loginfo` VALUES ('81', '刘八-lb', '127.0.0.1', '2019-04-15 17:32:42');
INSERT INTO `sys_loginfo` VALUES ('82', '刘八-lb', '127.0.0.1', '2019-04-15 17:33:48');
INSERT INTO `sys_loginfo` VALUES ('83', '刘八-lb', '127.0.0.1', '2019-04-15 17:34:17');
INSERT INTO `sys_loginfo` VALUES ('84', '超级管理员-system', '127.0.0.1', '2019-04-15 17:36:40');
INSERT INTO `sys_loginfo` VALUES ('85', '超级管理员-system', '127.0.0.1', '2019-04-15 17:47:21');
INSERT INTO `sys_loginfo` VALUES ('86', '超级管理员-system', '127.0.0.1', '2019-04-15 17:54:10');
INSERT INTO `sys_loginfo` VALUES ('87', '超级管理员-system', '127.0.0.1', '2019-04-15 17:55:52');
INSERT INTO `sys_loginfo` VALUES ('88', '超级管理员-system', '127.0.0.1', '2019-04-16 09:26:01');
INSERT INTO `sys_loginfo` VALUES ('89', '超级管理员-system', '127.0.0.1', '2019-04-16 09:26:25');
INSERT INTO `sys_loginfo` VALUES ('90', '超级管理员-system', '127.0.0.1', '2019-04-16 09:46:54');
INSERT INTO `sys_loginfo` VALUES ('91', '超级管理员-system', '127.0.0.1', '2019-04-16 10:07:48');
INSERT INTO `sys_loginfo` VALUES ('92', '超级管理员-system', '127.0.0.1', '2019-04-16 10:10:30');
INSERT INTO `sys_loginfo` VALUES ('93', '超级管理员-system', '127.0.0.1', '2019-04-16 10:14:29');
INSERT INTO `sys_loginfo` VALUES ('94', '超级管理员-system', '127.0.0.1', '2019-04-16 10:15:04');
INSERT INTO `sys_loginfo` VALUES ('95', '超级管理员-system', '127.0.0.1', '2019-04-16 10:15:58');
INSERT INTO `sys_loginfo` VALUES ('96', '超级管理员-system', '127.0.0.1', '2019-04-16 10:28:14');
INSERT INTO `sys_loginfo` VALUES ('97', '超级管理员-system', '127.0.0.1', '2019-04-16 10:32:42');
INSERT INTO `sys_loginfo` VALUES ('98', '超级管理员-system', '127.0.0.1', '2019-04-16 10:33:03');
INSERT INTO `sys_loginfo` VALUES ('99', '超级管理员-system', '127.0.0.1', '2019-04-16 11:02:01');
INSERT INTO `sys_loginfo` VALUES ('100', '超级管理员-system', '127.0.0.1', '2019-04-16 11:03:09');
INSERT INTO `sys_loginfo` VALUES ('101', '超级管理员-system', '127.0.0.1', '2019-04-16 11:13:42');
INSERT INTO `sys_loginfo` VALUES ('102', '超级管理员-system', '127.0.0.1', '2019-04-16 11:24:55');
INSERT INTO `sys_loginfo` VALUES ('104', '超级管理员-system', '127.0.0.1', '2019-08-14 01:11:34');
INSERT INTO `sys_loginfo` VALUES ('105', '超级管理员-system', '127.0.0.1', '2019-08-14 01:24:03');
INSERT INTO `sys_loginfo` VALUES ('106', '李四-ls', '127.0.0.1', '2019-08-14 01:25:47');
INSERT INTO `sys_loginfo` VALUES ('107', '李四-ls', '127.0.0.1', '2019-08-14 01:26:41');
INSERT INTO `sys_loginfo` VALUES ('108', '孙七-sq', '127.0.0.1', '2019-08-14 01:28:22');
INSERT INTO `sys_loginfo` VALUES ('109', '刘八-lb', '127.0.0.1', '2019-08-14 01:28:32');
INSERT INTO `sys_loginfo` VALUES ('110', '超级管理员-system', '127.0.0.1', '2019-08-14 01:46:18');
INSERT INTO `sys_loginfo` VALUES ('111', '超级管理员-system', '127.0.0.1', '2019-08-14 02:18:44');
INSERT INTO `sys_loginfo` VALUES ('112', '超级管理员-system', '127.0.0.1', '2019-08-14 02:32:06');
INSERT INTO `sys_loginfo` VALUES ('113', '李四-ls', '127.0.0.1', '2019-08-14 03:00:19');
INSERT INTO `sys_loginfo` VALUES ('114', '李四-ls', '127.0.0.1', '2019-08-14 03:00:56');
INSERT INTO `sys_loginfo` VALUES ('115', '李四-ls', '127.0.0.1', '2019-08-14 03:01:31');
INSERT INTO `sys_loginfo` VALUES ('116', '李四-ls', '127.0.0.1', '2019-08-14 03:01:39');
INSERT INTO `sys_loginfo` VALUES ('117', '李四-ls', '127.0.0.1', '2019-08-14 03:02:25');
INSERT INTO `sys_loginfo` VALUES ('118', '李四-ls', '127.0.0.1', '2019-08-14 03:04:57');
INSERT INTO `sys_loginfo` VALUES ('119', '李四-ls', '127.0.0.1', '2019-08-14 03:07:19');
INSERT INTO `sys_loginfo` VALUES ('120', '李四-ls', '127.0.0.1', '2019-08-14 03:07:54');
INSERT INTO `sys_loginfo` VALUES ('121', '超级管理员-system', '127.0.0.1', '2019-08-14 03:13:06');
INSERT INTO `sys_loginfo` VALUES ('122', '李四-ls', '127.0.0.1', '2019-08-14 03:14:46');
INSERT INTO `sys_loginfo` VALUES ('123', '超级管理员-system', '127.0.0.1', '2019-08-14 06:03:47');
INSERT INTO `sys_loginfo` VALUES ('124', '超级管理员-system', '127.0.0.1', '2019-08-14 07:20:12');
INSERT INTO `sys_loginfo` VALUES ('125', '超级管理员-system', '127.0.0.1', '2019-08-14 07:23:05');
INSERT INTO `sys_loginfo` VALUES ('126', '超级管理员-system', '127.0.0.1', '2019-08-14 07:25:30');
INSERT INTO `sys_loginfo` VALUES ('127', '超级管理员-system', '127.0.0.1', '2019-08-14 07:26:34');
INSERT INTO `sys_loginfo` VALUES ('128', '超级管理员-system', '127.0.0.1', '2019-08-14 07:27:22');
INSERT INTO `sys_loginfo` VALUES ('129', '超级管理员-system', '127.0.0.1', '2019-08-14 07:27:51');
INSERT INTO `sys_loginfo` VALUES ('130', '超级管理员-system', '127.0.0.1', '2019-08-14 08:22:05');
INSERT INTO `sys_loginfo` VALUES ('131', '超级管理员-system', '127.0.0.1', '2019-08-14 08:43:53');
INSERT INTO `sys_loginfo` VALUES ('132', '超级管理员-system', '127.0.0.1', '2019-08-14 08:45:55');
INSERT INTO `sys_loginfo` VALUES ('133', '超级管理员-system', '127.0.0.1', '2019-08-14 08:47:13');
INSERT INTO `sys_loginfo` VALUES ('134', '超级管理员-system', '127.0.0.1', '2019-08-14 09:35:20');
INSERT INTO `sys_loginfo` VALUES ('135', '超级管理员-system', '127.0.0.1', '2019-08-14 09:41:02');
INSERT INTO `sys_loginfo` VALUES ('136', '超级管理员-system', '127.0.0.1', '2019-08-14 09:44:04');
INSERT INTO `sys_loginfo` VALUES ('137', '超级管理员-system', '127.0.0.1', '2019-08-14 09:50:27');
INSERT INTO `sys_loginfo` VALUES ('138', '超级管理员-system', '127.0.0.1', '2019-08-14 09:56:57');
INSERT INTO `sys_loginfo` VALUES ('139', '超级管理员-system', '127.0.0.1', '2019-08-14 09:59:02');
INSERT INTO `sys_loginfo` VALUES ('140', '超级管理员-system', '127.0.0.1', '2019-08-16 01:05:37');
INSERT INTO `sys_loginfo` VALUES ('141', '超级管理员-system', '127.0.0.1', '2019-08-16 02:01:44');
INSERT INTO `sys_loginfo` VALUES ('142', '超级管理员-system', '127.0.0.1', '2019-08-16 02:05:57');
INSERT INTO `sys_loginfo` VALUES ('143', '超级管理员-system', '127.0.0.1', '2019-08-16 02:07:04');
INSERT INTO `sys_loginfo` VALUES ('144', '超级管理员-system', '127.0.0.1', '2019-08-16 02:20:02');
INSERT INTO `sys_loginfo` VALUES ('145', '超级管理员-system', '127.0.0.1', '2019-08-16 02:20:20');
INSERT INTO `sys_loginfo` VALUES ('146', '超级管理员-system', '127.0.0.1', '2019-08-16 02:21:42');
INSERT INTO `sys_loginfo` VALUES ('147', '超级管理员-system', '127.0.0.1', '2019-08-16 03:37:37');
INSERT INTO `sys_loginfo` VALUES ('148', '超级管理员-system', '127.0.0.1', '2019-08-16 03:52:40');
INSERT INTO `sys_loginfo` VALUES ('149', '超级管理员-system', '127.0.0.1', '2019-08-16 03:59:37');
INSERT INTO `sys_loginfo` VALUES ('150', '超级管理员-system', '127.0.0.1', '2019-08-16 06:11:45');
INSERT INTO `sys_loginfo` VALUES ('151', '超级管理员-system', '127.0.0.1', '2019-08-16 06:23:27');
INSERT INTO `sys_loginfo` VALUES ('153', '超级管理员-system', '127.0.0.1', '2019-08-16 06:54:49');
INSERT INTO `sys_loginfo` VALUES ('154', '超级管理员-system', '127.0.0.1', '2019-08-16 07:00:48');
INSERT INTO `sys_loginfo` VALUES ('155', '超级管理员-system', '127.0.0.1', '2019-08-16 07:01:18');
INSERT INTO `sys_loginfo` VALUES ('156', '超级管理员-system', '127.0.0.1', '2019-08-16 07:03:35');
INSERT INTO `sys_loginfo` VALUES ('157', '超级管理员-system', '127.0.0.1', '2019-08-16 07:09:55');
INSERT INTO `sys_loginfo` VALUES ('158', '超级管理员-system', '127.0.0.1', '2019-08-16 07:46:09');
INSERT INTO `sys_loginfo` VALUES ('159', '超级管理员-system', '127.0.0.1', '2019-08-16 08:17:59');
INSERT INTO `sys_loginfo` VALUES ('160', '超级管理员-system', '127.0.0.1', '2019-08-16 08:22:29');
INSERT INTO `sys_loginfo` VALUES ('161', '超级管理员-system', '127.0.0.1', '2019-08-16 08:23:32');
INSERT INTO `sys_loginfo` VALUES ('162', '超级管理员-system', '127.0.0.1', '2019-08-16 08:26:48');
INSERT INTO `sys_loginfo` VALUES ('169', '超级管理员-system', '127.0.0.1', '2019-09-21 06:27:30');
INSERT INTO `sys_loginfo` VALUES ('170', '超级管理员-system', '127.0.0.1', '2019-09-21 08:21:06');
INSERT INTO `sys_loginfo` VALUES ('171', '超级管理员-system', '127.0.0.1', '2019-09-21 08:37:15');
INSERT INTO `sys_loginfo` VALUES ('172', '超级管理员-system', '127.0.0.1', '2019-09-21 09:06:00');
INSERT INTO `sys_loginfo` VALUES ('173', '超级管理员-system', '127.0.0.1', '2019-09-23 01:15:49');
INSERT INTO `sys_loginfo` VALUES ('174', '超级管理员-system', '127.0.0.1', '2019-09-23 01:33:24');
INSERT INTO `sys_loginfo` VALUES ('175', '超级管理员-system', '127.0.0.1', '2019-09-23 03:29:51');
INSERT INTO `sys_loginfo` VALUES ('176', '超级管理员-system', '127.0.0.1', '2019-09-23 06:13:27');
INSERT INTO `sys_loginfo` VALUES ('177', '超级管理员-system', '127.0.0.1', '2019-09-23 06:47:14');
INSERT INTO `sys_loginfo` VALUES ('178', '超级管理员-system', '127.0.0.1', '2019-09-23 07:06:44');
INSERT INTO `sys_loginfo` VALUES ('180', '超级管理员-system', '127.0.0.1', '2019-09-23 09:54:08');
INSERT INTO `sys_loginfo` VALUES ('181', '超级管理员-system', '127.0.0.1', '2019-09-23 09:56:48');
INSERT INTO `sys_loginfo` VALUES ('182', '超级管理员-system', '127.0.0.1', '2019-09-23 13:41:31');
INSERT INTO `sys_loginfo` VALUES ('183', '超级管理员-system', '127.0.0.1', '2019-09-23 14:36:22');
INSERT INTO `sys_loginfo` VALUES ('184', '超级管理员-system', '127.0.0.1', '2019-09-24 01:05:42');
INSERT INTO `sys_loginfo` VALUES ('185', '超级管理员-system', '127.0.0.1', '2019-09-24 01:31:22');
INSERT INTO `sys_loginfo` VALUES ('186', '超级管理员-system', '127.0.0.1', '2019-09-24 02:10:56');
INSERT INTO `sys_loginfo` VALUES ('187', '超级管理员-system', '127.0.0.1', '2019-09-24 06:18:21');
INSERT INTO `sys_loginfo` VALUES ('188', '超级管理员-system', '127.0.0.1', '2019-09-24 06:59:55');
INSERT INTO `sys_loginfo` VALUES ('189', '超级管理员-system', '127.0.0.1', '2019-09-24 07:22:44');
INSERT INTO `sys_loginfo` VALUES ('190', '超级管理员-system', '127.0.0.1', '2019-09-24 07:34:33');
INSERT INTO `sys_loginfo` VALUES ('191', '超级管理员-system', '127.0.0.1', '2019-09-24 08:58:13');
INSERT INTO `sys_loginfo` VALUES ('192', '超级管理员-system', '127.0.0.1', '2019-09-24 12:43:54');
INSERT INTO `sys_loginfo` VALUES ('193', '超级管理员-system', '127.0.0.1', '2019-09-25 01:05:12');
INSERT INTO `sys_loginfo` VALUES ('194', '超级管理员-system', '127.0.0.1', '2019-09-25 01:37:40');
INSERT INTO `sys_loginfo` VALUES ('195', '超级管理员-system', '127.0.0.1', '2019-09-25 01:43:26');
INSERT INTO `sys_loginfo` VALUES ('196', '超级管理员-system', '127.0.0.1', '2019-09-25 01:46:40');
INSERT INTO `sys_loginfo` VALUES ('197', '超级管理员-system', '127.0.0.1', '2019-09-25 01:55:27');
INSERT INTO `sys_loginfo` VALUES ('198', '超级管理员-system', '127.0.0.1', '2019-09-25 02:27:40');
INSERT INTO `sys_loginfo` VALUES ('199', '超级管理员-system', '127.0.0.1', '2019-09-25 02:32:48');
INSERT INTO `sys_loginfo` VALUES ('200', '超级管理员-system', '127.0.0.1', '2019-09-25 02:35:53');
INSERT INTO `sys_loginfo` VALUES ('201', '超级管理员-system', '127.0.0.1', '2019-09-25 03:33:17');
INSERT INTO `sys_loginfo` VALUES ('202', '超级管理员-system', '127.0.0.1', '2019-09-25 06:05:49');
INSERT INTO `sys_loginfo` VALUES ('203', '超级管理员-system', '127.0.0.1', '2019-09-25 06:44:21');
INSERT INTO `sys_loginfo` VALUES ('204', '超级管理员-system', '127.0.0.1', '2019-09-25 06:47:39');
INSERT INTO `sys_loginfo` VALUES ('205', '超级管理员-system', '127.0.0.1', '2019-09-25 06:54:08');
INSERT INTO `sys_loginfo` VALUES ('206', '小小明-xiaoxiaoming', '127.0.0.1', '2019-09-25 06:55:09');
INSERT INTO `sys_loginfo` VALUES ('207', '超级管理员-system', '127.0.0.1', '2019-09-25 06:55:18');
INSERT INTO `sys_loginfo` VALUES ('208', '超级管理员-system', '127.0.0.1', '2019-09-25 08:23:32');
INSERT INTO `sys_loginfo` VALUES ('209', '超级管理员-system', '127.0.0.1', '2019-09-25 09:32:37');
INSERT INTO `sys_loginfo` VALUES ('210', '超级管理员-system', '127.0.0.1', '2019-09-25 09:41:34');
INSERT INTO `sys_loginfo` VALUES ('211', '超级管理员-system', '127.0.0.1', '2019-09-25 09:57:10');
INSERT INTO `sys_loginfo` VALUES ('212', '李四-ls', '127.0.0.1', '2019-09-25 09:58:02');
INSERT INTO `sys_loginfo` VALUES ('213', '王五-ww', '127.0.0.1', '2019-09-25 09:58:13');
INSERT INTO `sys_loginfo` VALUES ('214', '习大大-xidada', '127.0.0.1', '2019-09-25 09:58:24');
INSERT INTO `sys_loginfo` VALUES ('215', '刘八-lb', '127.0.0.1', '2019-09-25 10:06:07');
INSERT INTO `sys_loginfo` VALUES ('216', '刘八-lb', '127.0.0.1', '2019-09-25 10:09:17');
INSERT INTO `sys_loginfo` VALUES ('217', '刘八-lb', '127.0.0.1', '2019-09-25 10:11:39');
INSERT INTO `sys_loginfo` VALUES ('218', '刘八-lb', '127.0.0.1', '2019-09-25 10:13:49');
INSERT INTO `sys_loginfo` VALUES ('219', '刘八-lb', '127.0.0.1', '2019-09-25 10:14:16');
INSERT INTO `sys_loginfo` VALUES ('220', '超级管理员-system', '127.0.0.1', '2019-09-27 01:12:10');
INSERT INTO `sys_loginfo` VALUES ('221', '超级管理员-system', '127.0.0.1', '2019-09-27 01:34:40');
INSERT INTO `sys_loginfo` VALUES ('222', '超级管理员-system', '127.0.0.1', '2019-09-27 01:36:20');
INSERT INTO `sys_loginfo` VALUES ('223', '超级管理员-system', '127.0.0.1', '2019-09-27 03:03:01');
INSERT INTO `sys_loginfo` VALUES ('224', '超级管理员-system', '127.0.0.1', '2019-09-27 06:12:41');
INSERT INTO `sys_loginfo` VALUES ('225', '超级管理员-system', '127.0.0.1', '2019-09-27 06:30:55');
INSERT INTO `sys_loginfo` VALUES ('226', '超级管理员-system', '127.0.0.1', '2019-09-27 06:32:23');
INSERT INTO `sys_loginfo` VALUES ('227', '超级管理员-system', '127.0.0.1', '2019-09-27 06:35:18');
INSERT INTO `sys_loginfo` VALUES ('228', '超级管理员-system', '127.0.0.1', '2019-09-27 06:41:36');
INSERT INTO `sys_loginfo` VALUES ('229', '超级管理员-system', '127.0.0.1', '2019-09-27 06:54:10');
INSERT INTO `sys_loginfo` VALUES ('230', '超级管理员-system', '127.0.0.1', '2019-09-27 07:21:43');
INSERT INTO `sys_loginfo` VALUES ('231', '超级管理员-system', '127.0.0.1', '2019-09-27 07:22:43');
INSERT INTO `sys_loginfo` VALUES ('232', '超级管理员-system', '127.0.0.1', '2019-09-27 07:23:35');
INSERT INTO `sys_loginfo` VALUES ('233', '超级管理员-system', '127.0.0.1', '2019-09-27 07:35:38');
INSERT INTO `sys_loginfo` VALUES ('234', '超级管理员-system', '127.0.0.1', '2019-09-27 08:38:42');
INSERT INTO `sys_loginfo` VALUES ('235', '超级管理员-system', '127.0.0.1', '2019-09-27 08:49:03');
INSERT INTO `sys_loginfo` VALUES ('236', '超级管理员-system', '127.0.0.1', '2019-09-27 08:50:09');
INSERT INTO `sys_loginfo` VALUES ('237', '超级管理员-system', '127.0.0.1', '2019-09-27 08:55:53');
INSERT INTO `sys_loginfo` VALUES ('238', '超级管理员-system', '127.0.0.1', '2019-09-27 09:03:14');
INSERT INTO `sys_loginfo` VALUES ('239', '超级管理员-system', '127.0.0.1', '2019-09-27 09:05:30');
INSERT INTO `sys_loginfo` VALUES ('240', '超级管理员-system', '127.0.0.1', '2019-09-27 09:13:24');
INSERT INTO `sys_loginfo` VALUES ('241', '超级管理员-system', '127.0.0.1', '2019-09-27 11:40:15');
INSERT INTO `sys_loginfo` VALUES ('242', '超级管理员-system', '127.0.0.1', '2019-09-28 01:06:10');
INSERT INTO `sys_loginfo` VALUES ('243', '超级管理员-system', '127.0.0.1', '2019-09-28 01:34:38');
INSERT INTO `sys_loginfo` VALUES ('244', '超级管理员-system', '127.0.0.1', '2019-09-28 01:37:49');
INSERT INTO `sys_loginfo` VALUES ('245', '超级管理员-system', '127.0.0.1', '2019-09-28 01:41:24');
INSERT INTO `sys_loginfo` VALUES ('246', '超级管理员-system', '127.0.0.1', '2019-09-28 02:04:47');
INSERT INTO `sys_loginfo` VALUES ('247', '超级管理员-system', '127.0.0.1', '2019-09-28 02:10:42');
INSERT INTO `sys_loginfo` VALUES ('248', '超级管理员-system', '127.0.0.1', '2019-09-28 03:09:10');
INSERT INTO `sys_loginfo` VALUES ('249', '超级管理员-system', '127.0.0.1', '2019-09-28 03:16:51');
INSERT INTO `sys_loginfo` VALUES ('250', '超级管理员-system', '127.0.0.1', '2019-09-28 03:46:59');
INSERT INTO `sys_loginfo` VALUES ('251', '超级管理员-system', '127.0.0.1', '2019-09-28 06:44:10');
INSERT INTO `sys_loginfo` VALUES ('252', '超级管理员-system', '127.0.0.1', '2019-09-28 06:51:39');
INSERT INTO `sys_loginfo` VALUES ('253', '超级管理员-system', '127.0.0.1', '2019-09-28 06:56:05');
INSERT INTO `sys_loginfo` VALUES ('254', '超级管理员-system', '127.0.0.1', '2019-09-28 07:32:20');
INSERT INTO `sys_loginfo` VALUES ('255', '超级管理员-system', '127.0.0.1', '2019-09-28 07:37:57');
INSERT INTO `sys_loginfo` VALUES ('256', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 01:15:40');
INSERT INTO `sys_loginfo` VALUES ('257', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 01:18:43');
INSERT INTO `sys_loginfo` VALUES ('258', '超级管理员-system', '127.0.0.1', '2020-11-19 01:54:10');
INSERT INTO `sys_loginfo` VALUES ('259', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 02:39:05');
INSERT INTO `sys_loginfo` VALUES ('260', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 02:49:13');
INSERT INTO `sys_loginfo` VALUES ('261', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 03:00:21');
INSERT INTO `sys_loginfo` VALUES ('262', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 03:18:26');
INSERT INTO `sys_loginfo` VALUES ('263', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 05:53:48');
INSERT INTO `sys_loginfo` VALUES ('264', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 05:57:36');
INSERT INTO `sys_loginfo` VALUES ('265', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 05:58:51');
INSERT INTO `sys_loginfo` VALUES ('266', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 06:00:55');
INSERT INTO `sys_loginfo` VALUES ('267', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 06:02:40');
INSERT INTO `sys_loginfo` VALUES ('268', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 06:15:18');
INSERT INTO `sys_loginfo` VALUES ('269', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 06:29:22');
INSERT INTO `sys_loginfo` VALUES ('270', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 06:39:09');
INSERT INTO `sys_loginfo` VALUES ('271', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 06:42:17');
INSERT INTO `sys_loginfo` VALUES ('272', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 06:47:07');
INSERT INTO `sys_loginfo` VALUES ('273', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 06:59:43');
INSERT INTO `sys_loginfo` VALUES ('274', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 07:01:46');
INSERT INTO `sys_loginfo` VALUES ('275', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 07:06:08');
INSERT INTO `sys_loginfo` VALUES ('276', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 07:07:40');
INSERT INTO `sys_loginfo` VALUES ('277', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-19 07:13:30');
INSERT INTO `sys_loginfo` VALUES ('278', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 10:59:13');
INSERT INTO `sys_loginfo` VALUES ('279', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 13:23:55');
INSERT INTO `sys_loginfo` VALUES ('280', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 14:17:01');
INSERT INTO `sys_loginfo` VALUES ('281', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 14:21:30');
INSERT INTO `sys_loginfo` VALUES ('282', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 14:24:27');
INSERT INTO `sys_loginfo` VALUES ('283', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 14:25:57');
INSERT INTO `sys_loginfo` VALUES ('284', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 14:32:33');
INSERT INTO `sys_loginfo` VALUES ('285', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 14:34:55');
INSERT INTO `sys_loginfo` VALUES ('286', '超级管理员-system', '127.0.0.1', '2020-11-25 14:40:01');
INSERT INTO `sys_loginfo` VALUES ('287', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 15:08:50');
INSERT INTO `sys_loginfo` VALUES ('288', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 15:28:10');
INSERT INTO `sys_loginfo` VALUES ('289', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 15:50:45');
INSERT INTO `sys_loginfo` VALUES ('290', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-25 16:00:44');
INSERT INTO `sys_loginfo` VALUES ('291', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 03:14:29');
INSERT INTO `sys_loginfo` VALUES ('292', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 03:16:52');
INSERT INTO `sys_loginfo` VALUES ('293', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 03:24:36');
INSERT INTO `sys_loginfo` VALUES ('294', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 03:27:10');
INSERT INTO `sys_loginfo` VALUES ('295', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 03:29:24');
INSERT INTO `sys_loginfo` VALUES ('296', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 03:33:04');
INSERT INTO `sys_loginfo` VALUES ('297', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 03:49:36');
INSERT INTO `sys_loginfo` VALUES ('298', '超级管理员-system', '127.0.0.1', '2020-11-26 03:53:24');
INSERT INTO `sys_loginfo` VALUES ('299', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 11:39:13');
INSERT INTO `sys_loginfo` VALUES ('300', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 12:29:37');
INSERT INTO `sys_loginfo` VALUES ('301', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 12:32:52');
INSERT INTO `sys_loginfo` VALUES ('302', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 12:35:19');
INSERT INTO `sys_loginfo` VALUES ('303', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 12:42:05');
INSERT INTO `sys_loginfo` VALUES ('304', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 13:25:47');
INSERT INTO `sys_loginfo` VALUES ('305', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 13:26:42');
INSERT INTO `sys_loginfo` VALUES ('306', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 13:30:49');
INSERT INTO `sys_loginfo` VALUES ('307', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 13:45:31');
INSERT INTO `sys_loginfo` VALUES ('308', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 13:53:56');
INSERT INTO `sys_loginfo` VALUES ('309', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 13:59:10');
INSERT INTO `sys_loginfo` VALUES ('310', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 14:01:00');
INSERT INTO `sys_loginfo` VALUES ('311', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 14:12:57');
INSERT INTO `sys_loginfo` VALUES ('312', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 14:13:57');
INSERT INTO `sys_loginfo` VALUES ('313', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 14:26:42');
INSERT INTO `sys_loginfo` VALUES ('314', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 14:30:44');
INSERT INTO `sys_loginfo` VALUES ('315', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 14:38:17');
INSERT INTO `sys_loginfo` VALUES ('316', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 14:45:34');
INSERT INTO `sys_loginfo` VALUES ('317', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 15:03:49');
INSERT INTO `sys_loginfo` VALUES ('318', '超级管理员-system', '127.0.0.1', '2020-11-26 15:05:20');
INSERT INTO `sys_loginfo` VALUES ('319', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 15:08:30');
INSERT INTO `sys_loginfo` VALUES ('320', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 15:25:55');
INSERT INTO `sys_loginfo` VALUES ('321', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 15:30:37');
INSERT INTO `sys_loginfo` VALUES ('322', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 15:38:10');
INSERT INTO `sys_loginfo` VALUES ('323', '超级管理员-system', '127.0.0.1', '2020-11-26 15:41:23');
INSERT INTO `sys_loginfo` VALUES ('324', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 15:43:53');
INSERT INTO `sys_loginfo` VALUES ('325', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 16:18:35');
INSERT INTO `sys_loginfo` VALUES ('326', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 16:26:51');
INSERT INTO `sys_loginfo` VALUES ('327', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 16:28:54');
INSERT INTO `sys_loginfo` VALUES ('328', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 16:44:37');
INSERT INTO `sys_loginfo` VALUES ('329', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 16:51:01');
INSERT INTO `sys_loginfo` VALUES ('330', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 17:07:50');
INSERT INTO `sys_loginfo` VALUES ('331', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 17:14:35');
INSERT INTO `sys_loginfo` VALUES ('332', '超级管理员-system', '127.0.0.1', '2020-11-26 17:19:16');
INSERT INTO `sys_loginfo` VALUES ('333', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 17:21:54');
INSERT INTO `sys_loginfo` VALUES ('334', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 17:23:46');
INSERT INTO `sys_loginfo` VALUES ('335', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 17:30:29');
INSERT INTO `sys_loginfo` VALUES ('336', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 17:33:07');
INSERT INTO `sys_loginfo` VALUES ('337', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 17:41:21');
INSERT INTO `sys_loginfo` VALUES ('338', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-26 17:46:00');
INSERT INTO `sys_loginfo` VALUES ('339', '超级管理员-system', '127.0.0.1', '2020-11-26 17:50:28');
INSERT INTO `sys_loginfo` VALUES ('340', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 01:56:04');
INSERT INTO `sys_loginfo` VALUES ('341', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 02:41:35');
INSERT INTO `sys_loginfo` VALUES ('342', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 02:44:07');
INSERT INTO `sys_loginfo` VALUES ('343', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 02:45:51');
INSERT INTO `sys_loginfo` VALUES ('344', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 02:47:55');
INSERT INTO `sys_loginfo` VALUES ('345', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 02:56:08');
INSERT INTO `sys_loginfo` VALUES ('346', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 02:57:16');
INSERT INTO `sys_loginfo` VALUES ('347', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 02:59:41');
INSERT INTO `sys_loginfo` VALUES ('348', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:04:55');
INSERT INTO `sys_loginfo` VALUES ('349', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:15:34');
INSERT INTO `sys_loginfo` VALUES ('350', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:28:29');
INSERT INTO `sys_loginfo` VALUES ('351', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:30:26');
INSERT INTO `sys_loginfo` VALUES ('352', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:35:03');
INSERT INTO `sys_loginfo` VALUES ('353', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:39:36');
INSERT INTO `sys_loginfo` VALUES ('354', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:44:55');
INSERT INTO `sys_loginfo` VALUES ('355', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:46:23');
INSERT INTO `sys_loginfo` VALUES ('356', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:47:57');
INSERT INTO `sys_loginfo` VALUES ('357', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 03:58:14');
INSERT INTO `sys_loginfo` VALUES ('358', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 04:00:11');
INSERT INTO `sys_loginfo` VALUES ('359', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 05:38:04');
INSERT INTO `sys_loginfo` VALUES ('360', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 06:38:06');
INSERT INTO `sys_loginfo` VALUES ('361', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 06:51:02');
INSERT INTO `sys_loginfo` VALUES ('362', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 07:03:04');
INSERT INTO `sys_loginfo` VALUES ('363', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 07:06:57');
INSERT INTO `sys_loginfo` VALUES ('364', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 07:09:59');
INSERT INTO `sys_loginfo` VALUES ('365', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 07:19:02');
INSERT INTO `sys_loginfo` VALUES ('366', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 07:24:56');
INSERT INTO `sys_loginfo` VALUES ('367', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 07:26:51');
INSERT INTO `sys_loginfo` VALUES ('368', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 07:28:34');
INSERT INTO `sys_loginfo` VALUES ('369', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 07:54:29');
INSERT INTO `sys_loginfo` VALUES ('370', '超级管理员-system', '127.0.0.1', '2020-11-27 08:07:10');
INSERT INTO `sys_loginfo` VALUES ('371', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 08:11:24');
INSERT INTO `sys_loginfo` VALUES ('372', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 08:12:40');
INSERT INTO `sys_loginfo` VALUES ('373', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 08:14:48');
INSERT INTO `sys_loginfo` VALUES ('374', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 08:16:19');
INSERT INTO `sys_loginfo` VALUES ('375', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 08:19:22');
INSERT INTO `sys_loginfo` VALUES ('376', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 08:20:39');
INSERT INTO `sys_loginfo` VALUES ('377', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 08:26:52');
INSERT INTO `sys_loginfo` VALUES ('378', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 08:58:41');
INSERT INTO `sys_loginfo` VALUES ('379', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 09:12:13');
INSERT INTO `sys_loginfo` VALUES ('380', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 09:14:12');
INSERT INTO `sys_loginfo` VALUES ('381', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 09:35:24');
INSERT INTO `sys_loginfo` VALUES ('382', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 11:02:19');
INSERT INTO `sys_loginfo` VALUES ('383', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 11:39:09');
INSERT INTO `sys_loginfo` VALUES ('384', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 11:52:46');
INSERT INTO `sys_loginfo` VALUES ('385', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 11:57:06');
INSERT INTO `sys_loginfo` VALUES ('386', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 12:01:17');
INSERT INTO `sys_loginfo` VALUES ('387', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 12:04:52');
INSERT INTO `sys_loginfo` VALUES ('388', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 12:12:11');
INSERT INTO `sys_loginfo` VALUES ('389', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 12:16:32');
INSERT INTO `sys_loginfo` VALUES ('390', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 12:38:25');
INSERT INTO `sys_loginfo` VALUES ('391', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 12:57:36');
INSERT INTO `sys_loginfo` VALUES ('392', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 12:59:55');
INSERT INTO `sys_loginfo` VALUES ('393', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 13:07:42');
INSERT INTO `sys_loginfo` VALUES ('394', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 13:10:14');
INSERT INTO `sys_loginfo` VALUES ('395', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 13:13:53');
INSERT INTO `sys_loginfo` VALUES ('396', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 14:11:54');
INSERT INTO `sys_loginfo` VALUES ('397', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 14:25:27');
INSERT INTO `sys_loginfo` VALUES ('398', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 15:12:14');
INSERT INTO `sys_loginfo` VALUES ('399', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 15:54:10');
INSERT INTO `sys_loginfo` VALUES ('400', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 15:55:31');
INSERT INTO `sys_loginfo` VALUES ('401', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 16:02:27');
INSERT INTO `sys_loginfo` VALUES ('402', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 16:06:06');
INSERT INTO `sys_loginfo` VALUES ('403', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:07:47');
INSERT INTO `sys_loginfo` VALUES ('404', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 16:08:08');
INSERT INTO `sys_loginfo` VALUES ('405', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 16:10:37');
INSERT INTO `sys_loginfo` VALUES ('406', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 16:10:42');
INSERT INTO `sys_loginfo` VALUES ('407', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-27 16:10:46');
INSERT INTO `sys_loginfo` VALUES ('408', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:17:53');
INSERT INTO `sys_loginfo` VALUES ('409', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:17:57');
INSERT INTO `sys_loginfo` VALUES ('410', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:17:58');
INSERT INTO `sys_loginfo` VALUES ('411', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:17:58');
INSERT INTO `sys_loginfo` VALUES ('412', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:17:59');
INSERT INTO `sys_loginfo` VALUES ('413', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:17:59');
INSERT INTO `sys_loginfo` VALUES ('414', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:18:01');
INSERT INTO `sys_loginfo` VALUES ('415', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:23:20');
INSERT INTO `sys_loginfo` VALUES ('416', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-27 16:27:13');
INSERT INTO `sys_loginfo` VALUES ('417', '张四-zhangsi', '0:0:0:0:0:0:0:1', '2020-11-27 16:27:37');
INSERT INTO `sys_loginfo` VALUES ('418', '张四-zhangsi', '0:0:0:0:0:0:0:1', '2020-11-27 16:45:07');
INSERT INTO `sys_loginfo` VALUES ('419', '张四-zhangsi', '0:0:0:0:0:0:0:1', '2020-11-27 16:55:04');
INSERT INTO `sys_loginfo` VALUES ('420', '张四-zhangsi', '0:0:0:0:0:0:0:1', '2020-11-27 16:59:20');
INSERT INTO `sys_loginfo` VALUES ('421', '张四-zhangsi', '0:0:0:0:0:0:0:1', '2020-11-27 17:02:25');
INSERT INTO `sys_loginfo` VALUES ('422', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 01:11:20');
INSERT INTO `sys_loginfo` VALUES ('423', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 01:18:27');
INSERT INTO `sys_loginfo` VALUES ('424', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 01:18:46');
INSERT INTO `sys_loginfo` VALUES ('425', '张四-zhangsi', '127.0.0.1', '2020-11-30 01:19:29');
INSERT INTO `sys_loginfo` VALUES ('426', '王健3-wangjian3', '127.0.0.1', '2020-11-30 01:19:47');
INSERT INTO `sys_loginfo` VALUES ('427', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 01:42:51');
INSERT INTO `sys_loginfo` VALUES ('428', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 02:01:46');
INSERT INTO `sys_loginfo` VALUES ('429', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 02:07:48');
INSERT INTO `sys_loginfo` VALUES ('430', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 02:53:36');
INSERT INTO `sys_loginfo` VALUES ('431', '王健3-wangjian3', '127.0.0.1', '2020-11-30 02:54:01');
INSERT INTO `sys_loginfo` VALUES ('432', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 03:03:59');
INSERT INTO `sys_loginfo` VALUES ('433', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 03:07:28');
INSERT INTO `sys_loginfo` VALUES ('434', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 03:08:17');
INSERT INTO `sys_loginfo` VALUES ('435', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 03:10:37');
INSERT INTO `sys_loginfo` VALUES ('436', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 03:10:39');
INSERT INTO `sys_loginfo` VALUES ('437', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 03:10:40');
INSERT INTO `sys_loginfo` VALUES ('438', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 03:14:58');
INSERT INTO `sys_loginfo` VALUES ('439', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 03:17:03');
INSERT INTO `sys_loginfo` VALUES ('440', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 03:23:40');
INSERT INTO `sys_loginfo` VALUES ('441', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 03:34:56');
INSERT INTO `sys_loginfo` VALUES ('442', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-11-30 03:35:49');
INSERT INTO `sys_loginfo` VALUES ('443', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-11-30 03:39:08');
INSERT INTO `sys_loginfo` VALUES ('444', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-11-30 03:40:30');
INSERT INTO `sys_loginfo` VALUES ('445', '超级管理员-system', '127.0.0.1', '2020-11-30 03:45:28');
INSERT INTO `sys_loginfo` VALUES ('446', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-11-30 03:47:05');
INSERT INTO `sys_loginfo` VALUES ('447', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 03:50:31');
INSERT INTO `sys_loginfo` VALUES ('448', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 03:52:57');
INSERT INTO `sys_loginfo` VALUES ('449', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 03:57:42');
INSERT INTO `sys_loginfo` VALUES ('450', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 04:01:19');
INSERT INTO `sys_loginfo` VALUES ('451', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 08:13:28');
INSERT INTO `sys_loginfo` VALUES ('452', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-11-30 08:14:05');
INSERT INTO `sys_loginfo` VALUES ('453', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-11-30 08:17:17');
INSERT INTO `sys_loginfo` VALUES ('454', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 08:51:28');
INSERT INTO `sys_loginfo` VALUES ('455', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 09:16:02');
INSERT INTO `sys_loginfo` VALUES ('456', '超级管理员-system', '127.0.0.1', '2020-11-30 09:17:26');
INSERT INTO `sys_loginfo` VALUES ('457', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 09:18:53');
INSERT INTO `sys_loginfo` VALUES ('458', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 09:34:00');
INSERT INTO `sys_loginfo` VALUES ('459', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 09:35:58');
INSERT INTO `sys_loginfo` VALUES ('460', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 12:48:18');
INSERT INTO `sys_loginfo` VALUES ('461', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 13:19:04');
INSERT INTO `sys_loginfo` VALUES ('462', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 13:39:10');
INSERT INTO `sys_loginfo` VALUES ('463', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 13:42:44');
INSERT INTO `sys_loginfo` VALUES ('464', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 13:44:28');
INSERT INTO `sys_loginfo` VALUES ('465', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 13:45:38');
INSERT INTO `sys_loginfo` VALUES ('466', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 13:49:10');
INSERT INTO `sys_loginfo` VALUES ('467', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 13:57:34');
INSERT INTO `sys_loginfo` VALUES ('468', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 14:08:15');
INSERT INTO `sys_loginfo` VALUES ('469', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 14:14:44');
INSERT INTO `sys_loginfo` VALUES ('470', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-11-30 14:20:53');
INSERT INTO `sys_loginfo` VALUES ('471', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 14:24:06');
INSERT INTO `sys_loginfo` VALUES ('472', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 14:27:19');
INSERT INTO `sys_loginfo` VALUES ('473', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 14:31:12');
INSERT INTO `sys_loginfo` VALUES ('474', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 14:32:48');
INSERT INTO `sys_loginfo` VALUES ('475', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 14:37:36');
INSERT INTO `sys_loginfo` VALUES ('476', '李四-ls', '0:0:0:0:0:0:0:1', '2020-11-30 14:40:00');
INSERT INTO `sys_loginfo` VALUES ('477', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 14:44:44');
INSERT INTO `sys_loginfo` VALUES ('478', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 14:44:46');
INSERT INTO `sys_loginfo` VALUES ('479', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-11-30 14:44:47');
INSERT INTO `sys_loginfo` VALUES ('480', '李四-ls', '0:0:0:0:0:0:0:1', '2020-12-01 16:40:32');
INSERT INTO `sys_loginfo` VALUES ('481', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 16:42:05');
INSERT INTO `sys_loginfo` VALUES ('482', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 16:45:17');
INSERT INTO `sys_loginfo` VALUES ('483', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 16:52:34');
INSERT INTO `sys_loginfo` VALUES ('484', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 16:55:32');
INSERT INTO `sys_loginfo` VALUES ('485', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:07:59');
INSERT INTO `sys_loginfo` VALUES ('486', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:11:16');
INSERT INTO `sys_loginfo` VALUES ('487', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:12:57');
INSERT INTO `sys_loginfo` VALUES ('488', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:14:38');
INSERT INTO `sys_loginfo` VALUES ('489', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:15:36');
INSERT INTO `sys_loginfo` VALUES ('490', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:22:28');
INSERT INTO `sys_loginfo` VALUES ('491', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:23:22');
INSERT INTO `sys_loginfo` VALUES ('492', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:25:25');
INSERT INTO `sys_loginfo` VALUES ('493', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:27:09');
INSERT INTO `sys_loginfo` VALUES ('494', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:28:21');
INSERT INTO `sys_loginfo` VALUES ('495', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:32:43');
INSERT INTO `sys_loginfo` VALUES ('496', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:33:41');
INSERT INTO `sys_loginfo` VALUES ('497', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:34:45');
INSERT INTO `sys_loginfo` VALUES ('498', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-12-01 17:37:05');
INSERT INTO `sys_loginfo` VALUES ('499', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:37:39');
INSERT INTO `sys_loginfo` VALUES ('500', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:37:43');
INSERT INTO `sys_loginfo` VALUES ('501', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:37:44');
INSERT INTO `sys_loginfo` VALUES ('502', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-12-01 17:45:24');
INSERT INTO `sys_loginfo` VALUES ('503', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-12-01 17:54:39');
INSERT INTO `sys_loginfo` VALUES ('504', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-12-01 17:57:33');
INSERT INTO `sys_loginfo` VALUES ('505', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 17:58:23');
INSERT INTO `sys_loginfo` VALUES ('506', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 18:00:10');
INSERT INTO `sys_loginfo` VALUES ('507', '王健3-wangjian3', '127.0.0.1', '2020-12-01 18:05:18');
INSERT INTO `sys_loginfo` VALUES ('508', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 18:16:35');
INSERT INTO `sys_loginfo` VALUES ('509', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 18:19:29');
INSERT INTO `sys_loginfo` VALUES ('510', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-01 18:21:49');
INSERT INTO `sys_loginfo` VALUES ('511', '王健4-wangjian4', '0:0:0:0:0:0:0:1', '2020-12-01 18:23:16');
INSERT INTO `sys_loginfo` VALUES ('512', '李四-ls', '0:0:0:0:0:0:0:1', '2020-12-01 18:26:20');
INSERT INTO `sys_loginfo` VALUES ('513', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-12-01 18:32:51');
INSERT INTO `sys_loginfo` VALUES ('514', '超级管理员-system', '127.0.0.1', '2020-12-01 18:37:01');
INSERT INTO `sys_loginfo` VALUES ('515', '王健3-wangjian3', '127.0.0.1', '2020-12-01 18:37:34');
INSERT INTO `sys_loginfo` VALUES ('516', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-12-01 18:41:03');
INSERT INTO `sys_loginfo` VALUES ('517', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-12-02 00:11:30');
INSERT INTO `sys_loginfo` VALUES ('518', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-12-02 15:35:35');
INSERT INTO `sys_loginfo` VALUES ('519', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-12-02 15:36:00');
INSERT INTO `sys_loginfo` VALUES ('520', '王健3-wangjian3', '0:0:0:0:0:0:0:1', '2020-12-02 15:36:38');
INSERT INTO `sys_loginfo` VALUES ('521', '李四-ls', '0:0:0:0:0:0:0:1', '2020-12-02 15:37:51');
INSERT INTO `sys_loginfo` VALUES ('522', '超级管理员-system', '0:0:0:0:0:0:0:1', '2022-02-15 19:11:26');
INSERT INTO `sys_loginfo` VALUES ('523', '超级管理员-system', '127.0.0.1', '2022-02-15 19:23:26');
INSERT INTO `sys_loginfo` VALUES ('524', '超级管理员-system', '0:0:0:0:0:0:0:1', '2022-02-15 19:31:38');
INSERT INTO `sys_loginfo` VALUES ('525', '超级管理员-system', '0:0:0:0:0:0:0:1', '2022-02-15 18:02:07');
INSERT INTO `sys_loginfo` VALUES ('526', '超级管理员-system', '0:0:0:0:0:0:0:1', '2022-02-15 18:03:41');
INSERT INTO `sys_loginfo` VALUES ('527', '超级管理员-system', '0:0:0:0:0:0:0:1', '2022-02-15 18:06:46');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '关于系统V1.3更新公告', '2', '2018-08-07 00:00:00', '管理员');
INSERT INTO `sys_notice` VALUES ('10', '关于系统V1.2更新公告', '12312312<img src=\"/resources/layui/images/face/42.gif\" alt=\"[抓狂]\">', '2018-08-07 00:00:00', '超级管理员');
INSERT INTO `sys_notice` VALUES ('11', '关于系统V1.1更新公告', '21321321321<img src=\"/resources/layui/images/face/18.gif\" alt=\"[右哼哼]\">', '2018-08-07 00:00:00', '超级管理员');
INSERT INTO `sys_notice` VALUES ('17', 'x', 'a', '2019-09-24 08:57:03', 'b');
INSERT INTO `sys_notice` VALUES ('18', '', '啊啊啊', '2020-11-25 11:21:48', '超级管理员');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) DEFAULT NULL,
  `percode` varchar(255) DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', 'menu', '1管理系统', null, '&#xe68e;', '', '', '1', '1', '1');
INSERT INTO `sys_permission` VALUES ('5', '-1', 'menu', '系统管理', null, '&#xe614;', '', '', '0', '5', '1');
INSERT INTO `sys_permission` VALUES ('7', '2', 'menu', '客户管理', null, '&#xe651;', '/bus/toCustomerManager', '', '0', '7', '1');
INSERT INTO `sys_permission` VALUES ('8', '2', 'menu', '供应商管理', null, '&#xe658;', '/bus/toProviderManager', '', '0', '8', '1');
INSERT INTO `sys_permission` VALUES ('9', '2', 'menu', '商品管理', null, '&#xe657;', '/bus/toGoodsManager', '', '0', '9', '1');
INSERT INTO `sys_permission` VALUES ('10', '3', 'menu', '商品进货', null, '&#xe756;', '/bus/toInportManager', '', '0', '10', '1');
INSERT INTO `sys_permission` VALUES ('11', '3', 'menu', '商品退货查询', null, '&#xe65a;', '/bus/toOutportManager', '', '0', '11', '1');
INSERT INTO `sys_permission` VALUES ('12', '4', 'menu', '商品销售', null, '&#xe65b;', '', '', '0', '12', '1');
INSERT INTO `sys_permission` VALUES ('13', '4', 'menu', '销售退货查询', null, '&#xe770;', '', '', '0', '13', '1');
INSERT INTO `sys_permission` VALUES ('14', '5', 'menu', '部门管理', null, '&#xe770;', '/sys/toDeptManager', '', '0', '14', '1');
INSERT INTO `sys_permission` VALUES ('15', '5', 'menu', '菜单管理', null, '&#xe857;', '/sys/toMenuManager', '', '0', '15', '1');
INSERT INTO `sys_permission` VALUES ('16', '5', 'menu', '权限管理', '', '&#xe857;', '/sys/toPermissionManager', '', '0', '16', '1');
INSERT INTO `sys_permission` VALUES ('17', '5', 'menu', '角色管理', '', '&#xe650;', '/sys/toRoleManager', '', '0', '17', '1');
INSERT INTO `sys_permission` VALUES ('18', '5', 'menu', '用户管理', '', '&#xe612;', '/sys/toUserManager', '', '0', '18', '1');
INSERT INTO `sys_permission` VALUES ('21', '6', 'menu', '登陆日志', null, '&#xe675;', '/sys/toLoginfoManager', '', '0', '21', '1');
INSERT INTO `sys_permission` VALUES ('22', '6', 'menu', '系统公告', null, '&#xe756;', '/sys/toNoticeManager', null, '0', '22', '1');
INSERT INTO `sys_permission` VALUES ('23', '6', 'menu', '图标管理', null, '&#xe670;', '../resources/page/icon.html', null, '0', '23', '1');
INSERT INTO `sys_permission` VALUES ('30', '14', 'permission', '添加部门', 'dept:create', '', null, null, '0', '24', '1');
INSERT INTO `sys_permission` VALUES ('31', '14', 'permission', '修改部门', 'dept:update', '', null, null, '0', '26', '1');
INSERT INTO `sys_permission` VALUES ('32', '14', 'permission', '删除部门', 'dept:delete', '', null, null, '0', '27', '1');
INSERT INTO `sys_permission` VALUES ('34', '15', 'permission', '添加菜单', 'menu:create', '', '', '', '0', '29', '1');
INSERT INTO `sys_permission` VALUES ('35', '15', 'permission', '修改菜单', 'menu:update', '', null, null, '0', '30', '1');
INSERT INTO `sys_permission` VALUES ('36', '15', 'permission', '删除菜单', 'menu:delete', '', null, null, '0', '31', '1');
INSERT INTO `sys_permission` VALUES ('38', '16', 'permission', '添加权限', 'permission:create', '', null, null, '0', '33', '1');
INSERT INTO `sys_permission` VALUES ('39', '16', 'permission', '修改权限', 'permission:update', '', null, null, '0', '34', '1');
INSERT INTO `sys_permission` VALUES ('40', '16', 'permission', '删除权限', 'permission:delete', '', null, null, '0', '35', '1');
INSERT INTO `sys_permission` VALUES ('42', '17', 'permission', '添加角色', 'role:create', '', null, null, '0', '37', '1');
INSERT INTO `sys_permission` VALUES ('43', '17', 'permission', '修改角色', 'role:update', '', null, null, '0', '38', '1');
INSERT INTO `sys_permission` VALUES ('44', '17', 'permission', '角色删除', 'role:delete', '', null, null, '0', '39', '1');
INSERT INTO `sys_permission` VALUES ('46', '17', 'permission', '分配权限', 'role:selectPermission', '', null, null, '0', '41', '1');
INSERT INTO `sys_permission` VALUES ('47', '18', 'permission', '添加用户', 'user:create', '', null, null, '0', '42', '1');
INSERT INTO `sys_permission` VALUES ('48', '18', 'permission', '修改用户', 'user:update', '', null, null, '0', '43', '1');
INSERT INTO `sys_permission` VALUES ('49', '18', 'permission', '删除用户', 'user:delete', '', null, null, '0', '44', '1');
INSERT INTO `sys_permission` VALUES ('51', '18', 'permission', '用户分配角色', 'user:selectRole', '', null, null, '0', '46', '1');
INSERT INTO `sys_permission` VALUES ('52', '18', 'permission', '重置密码', 'user:resetPwd', null, null, null, '0', '47', '1');
INSERT INTO `sys_permission` VALUES ('53', '14', 'permission', '部门查询', 'dept:view', null, null, null, '0', '48', '1');
INSERT INTO `sys_permission` VALUES ('54', '15', 'permission', '菜单查询', 'menu:view', null, null, null, '0', '49', '1');
INSERT INTO `sys_permission` VALUES ('55', '16', 'permission', '权限查询', 'permission:view', null, null, null, '0', '50', '1');
INSERT INTO `sys_permission` VALUES ('56', '17', 'permission', '角色查询', 'role:view', null, null, null, '0', '51', '1');
INSERT INTO `sys_permission` VALUES ('57', '18', 'permission', '用户查询', 'user:view', null, null, null, '0', '52', '1');
INSERT INTO `sys_permission` VALUES ('68', '7', 'permission', '客户查询', 'customer:view', null, null, null, null, '60', '1');
INSERT INTO `sys_permission` VALUES ('69', '7', 'permission', '客户添加', 'customer:create', null, null, null, null, '61', '1');
INSERT INTO `sys_permission` VALUES ('70', '7', 'permission', '客户修改', 'customer:update', null, null, null, null, '62', '1');
INSERT INTO `sys_permission` VALUES ('71', '7', 'permission', '客户删除', 'customer:delete', null, null, null, null, '63', '1');
INSERT INTO `sys_permission` VALUES ('73', '21', 'permission', '日志查询', 'info:view', null, null, null, null, '65', '1');
INSERT INTO `sys_permission` VALUES ('74', '21', 'permission', '日志删除', 'info:delete', null, null, null, null, '66', '1');
INSERT INTO `sys_permission` VALUES ('75', '21', 'permission', '日志批量删除', 'info:batchdelete', null, null, null, null, '67', '1');
INSERT INTO `sys_permission` VALUES ('76', '22', 'permission', '公告查询', 'notice:view', null, null, null, null, '68', '1');
INSERT INTO `sys_permission` VALUES ('77', '22', 'permission', '公告添加', 'notice:create', null, null, null, null, '69', '1');
INSERT INTO `sys_permission` VALUES ('78', '22', 'permission', '公告修改', 'notice:update', null, null, null, null, '70', '1');
INSERT INTO `sys_permission` VALUES ('79', '22', 'permission', '公告删除', 'notice:delete', null, null, null, null, '71', '1');
INSERT INTO `sys_permission` VALUES ('81', '8', 'permission', '供应商查询', 'provider:view', null, null, null, null, '73', '1');
INSERT INTO `sys_permission` VALUES ('82', '8', 'permission', '供应商添加', 'provider:create', null, null, null, null, '74', '1');
INSERT INTO `sys_permission` VALUES ('83', '8', 'permission', '供应商修改', 'provider:update', null, null, null, null, '75', '1');
INSERT INTO `sys_permission` VALUES ('84', '8', 'permission', '供应商删除', 'provider:delete', null, null, null, null, '76', '1');
INSERT INTO `sys_permission` VALUES ('86', '22', 'permission', '公告查看', 'notice:viewnotice', null, null, null, null, '78', '1');
INSERT INTO `sys_permission` VALUES ('91', '9', 'permission', '商品查询', 'goods:view', null, null, null, '0', '79', '1');
INSERT INTO `sys_permission` VALUES ('92', '9', 'permission', '商品添加', 'goods:create', null, null, null, '0', '80', '1');
INSERT INTO `sys_permission` VALUES ('94', '9', 'permission', '商品修改', 'goods:update', null, 'goods:update', null, '0', '81', '1');
INSERT INTO `sys_permission` VALUES ('95', '6', 'menu', '缓存管理', null, '&#xe681;', '/sys/toCacheManager', '', '1', '82', '1');
INSERT INTO `sys_permission` VALUES ('97', '1', 'menu', '资料管理', null, '&#xe681;', '', null, '0', '83', '1');
INSERT INTO `sys_permission` VALUES ('98', '97', 'menu', '个人资料管理', null, '&#xe681;', '/sys/toPersonalInfoManager', null, '0', '84', '1');
INSERT INTO `sys_permission` VALUES ('99', '97', 'menu', '宠物资料管理', null, '&#xe681;', '/bus/toPetInfoManager', null, '0', '85', '1');
INSERT INTO `sys_permission` VALUES ('100', '97', 'menu', '公告管理', null, '&#xe681;', '/sys/toAnnouncementManager', null, '0', '86', '1');
INSERT INTO `sys_permission` VALUES ('101', '97', 'menu', '医院资料管理', null, '&#xe681;', '/sys/toHospitalManager', null, '0', '87', '1');
INSERT INTO `sys_permission` VALUES ('102', '97', 'menu', '职工资料管理', null, '&#xe681;', '/sys/toEmployeeManager', null, '0', '88', '1');
INSERT INTO `sys_permission` VALUES ('103', '1', 'menu', '预约管理', null, '&#xe63c;', null, null, '0', '89', '1');
INSERT INTO `sys_permission` VALUES ('104', '103', 'menu', '挂号预约', null, '&#xe63c;', '/sys/toApplyDoctor', null, '0', '90', '1');
INSERT INTO `sys_permission` VALUES ('105', '103', 'menu', '洗美预约', null, '&#xe63c;', '/sys/toApplyBeautician', null, '0', '91', '1');
INSERT INTO `sys_permission` VALUES ('106', '103', 'menu', '挂号预约', null, '&#xe63c;', '/sys/toApplyDoctorForCustomer', null, '0', '92', '1');
INSERT INTO `sys_permission` VALUES ('107', '103', 'menu', '洗美预约', null, '&#xe63c;', '/sys/toApplyBeauticianForCustomer', null, '0', '93', '1');
INSERT INTO `sys_permission` VALUES ('108', '97', 'menu', '住院寄养资料', null, '&#xe681;', '/sys/toInHospital', null, '0', '94', '1');
INSERT INTO `sys_permission` VALUES ('109', '97', 'menu', '病历资料', null, '&#xe681;', '/sys/toCaseManager', null, '0', '95', '1');
INSERT INTO `sys_permission` VALUES ('110', '1', 'menu', '记录管理', null, '&#xe63c;', null, null, '0', '96', '1');
INSERT INTO `sys_permission` VALUES ('111', '110', 'menu', '诊断记录', null, '&#xe63c;', '/sys/toDiagnoseHistory', null, '0', '97', '1');
INSERT INTO `sys_permission` VALUES ('112', '110', 'menu', '洗美记录', null, '&#xe63c;', '/sys/toBeautyHistory', null, '0', '98', '1');
INSERT INTO `sys_permission` VALUES ('113', '110', 'menu', '支付记录', null, '&#xe63c;', '/sys/toPayHistory', null, '0', '99', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '拥有所有菜单权限', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('4', '医院管理员', '医院管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('5', '医生', '医生', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('6', '洗美师', '洗美师', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('7', '普通用户', '普通用户', '1', '2019-04-10 14:06:32');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`rid`) USING BTREE,
  KEY `FK_tcsr9ucxypb3ce1q5qngsfk33` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '5');
INSERT INTO `sys_role_permission` VALUES ('1', '7');
INSERT INTO `sys_role_permission` VALUES ('1', '8');
INSERT INTO `sys_role_permission` VALUES ('1', '9');
INSERT INTO `sys_role_permission` VALUES ('1', '10');
INSERT INTO `sys_role_permission` VALUES ('1', '11');
INSERT INTO `sys_role_permission` VALUES ('1', '12');
INSERT INTO `sys_role_permission` VALUES ('1', '13');
INSERT INTO `sys_role_permission` VALUES ('1', '14');
INSERT INTO `sys_role_permission` VALUES ('1', '15');
INSERT INTO `sys_role_permission` VALUES ('1', '16');
INSERT INTO `sys_role_permission` VALUES ('1', '17');
INSERT INTO `sys_role_permission` VALUES ('1', '18');
INSERT INTO `sys_role_permission` VALUES ('1', '21');
INSERT INTO `sys_role_permission` VALUES ('1', '22');
INSERT INTO `sys_role_permission` VALUES ('1', '23');
INSERT INTO `sys_role_permission` VALUES ('1', '30');
INSERT INTO `sys_role_permission` VALUES ('1', '31');
INSERT INTO `sys_role_permission` VALUES ('1', '32');
INSERT INTO `sys_role_permission` VALUES ('1', '34');
INSERT INTO `sys_role_permission` VALUES ('1', '35');
INSERT INTO `sys_role_permission` VALUES ('1', '36');
INSERT INTO `sys_role_permission` VALUES ('1', '38');
INSERT INTO `sys_role_permission` VALUES ('1', '39');
INSERT INTO `sys_role_permission` VALUES ('1', '40');
INSERT INTO `sys_role_permission` VALUES ('1', '42');
INSERT INTO `sys_role_permission` VALUES ('1', '43');
INSERT INTO `sys_role_permission` VALUES ('1', '44');
INSERT INTO `sys_role_permission` VALUES ('1', '46');
INSERT INTO `sys_role_permission` VALUES ('1', '47');
INSERT INTO `sys_role_permission` VALUES ('1', '48');
INSERT INTO `sys_role_permission` VALUES ('1', '49');
INSERT INTO `sys_role_permission` VALUES ('1', '51');
INSERT INTO `sys_role_permission` VALUES ('1', '52');
INSERT INTO `sys_role_permission` VALUES ('1', '53');
INSERT INTO `sys_role_permission` VALUES ('1', '54');
INSERT INTO `sys_role_permission` VALUES ('1', '55');
INSERT INTO `sys_role_permission` VALUES ('1', '56');
INSERT INTO `sys_role_permission` VALUES ('1', '57');
INSERT INTO `sys_role_permission` VALUES ('1', '68');
INSERT INTO `sys_role_permission` VALUES ('1', '69');
INSERT INTO `sys_role_permission` VALUES ('1', '70');
INSERT INTO `sys_role_permission` VALUES ('1', '71');
INSERT INTO `sys_role_permission` VALUES ('1', '73');
INSERT INTO `sys_role_permission` VALUES ('1', '74');
INSERT INTO `sys_role_permission` VALUES ('1', '75');
INSERT INTO `sys_role_permission` VALUES ('1', '76');
INSERT INTO `sys_role_permission` VALUES ('1', '77');
INSERT INTO `sys_role_permission` VALUES ('1', '78');
INSERT INTO `sys_role_permission` VALUES ('1', '79');
INSERT INTO `sys_role_permission` VALUES ('1', '81');
INSERT INTO `sys_role_permission` VALUES ('1', '82');
INSERT INTO `sys_role_permission` VALUES ('1', '83');
INSERT INTO `sys_role_permission` VALUES ('1', '84');
INSERT INTO `sys_role_permission` VALUES ('1', '86');
INSERT INTO `sys_role_permission` VALUES ('1', '91');
INSERT INTO `sys_role_permission` VALUES ('1', '92');
INSERT INTO `sys_role_permission` VALUES ('1', '94');
INSERT INTO `sys_role_permission` VALUES ('1', '97');
INSERT INTO `sys_role_permission` VALUES ('1', '98');
INSERT INTO `sys_role_permission` VALUES ('1', '99');
INSERT INTO `sys_role_permission` VALUES ('4', '1');
INSERT INTO `sys_role_permission` VALUES ('4', '7');
INSERT INTO `sys_role_permission` VALUES ('4', '8');
INSERT INTO `sys_role_permission` VALUES ('4', '9');
INSERT INTO `sys_role_permission` VALUES ('4', '68');
INSERT INTO `sys_role_permission` VALUES ('4', '69');
INSERT INTO `sys_role_permission` VALUES ('4', '70');
INSERT INTO `sys_role_permission` VALUES ('4', '71');
INSERT INTO `sys_role_permission` VALUES ('4', '81');
INSERT INTO `sys_role_permission` VALUES ('4', '82');
INSERT INTO `sys_role_permission` VALUES ('4', '83');
INSERT INTO `sys_role_permission` VALUES ('4', '84');
INSERT INTO `sys_role_permission` VALUES ('4', '91');
INSERT INTO `sys_role_permission` VALUES ('4', '92');
INSERT INTO `sys_role_permission` VALUES ('4', '94');
INSERT INTO `sys_role_permission` VALUES ('5', '1');
INSERT INTO `sys_role_permission` VALUES ('5', '10');
INSERT INTO `sys_role_permission` VALUES ('5', '11');
INSERT INTO `sys_role_permission` VALUES ('5', '12');
INSERT INTO `sys_role_permission` VALUES ('5', '13');
INSERT INTO `sys_role_permission` VALUES ('5', '97');
INSERT INTO `sys_role_permission` VALUES ('5', '103');
INSERT INTO `sys_role_permission` VALUES ('5', '104');
INSERT INTO `sys_role_permission` VALUES ('5', '109');
INSERT INTO `sys_role_permission` VALUES ('6', '1');
INSERT INTO `sys_role_permission` VALUES ('6', '12');
INSERT INTO `sys_role_permission` VALUES ('6', '13');
INSERT INTO `sys_role_permission` VALUES ('6', '97');
INSERT INTO `sys_role_permission` VALUES ('6', '103');
INSERT INTO `sys_role_permission` VALUES ('6', '105');
INSERT INTO `sys_role_permission` VALUES ('6', '109');
INSERT INTO `sys_role_permission` VALUES ('7', '1');
INSERT INTO `sys_role_permission` VALUES ('7', '14');
INSERT INTO `sys_role_permission` VALUES ('7', '15');
INSERT INTO `sys_role_permission` VALUES ('7', '16');
INSERT INTO `sys_role_permission` VALUES ('7', '17');
INSERT INTO `sys_role_permission` VALUES ('7', '18');
INSERT INTO `sys_role_permission` VALUES ('7', '21');
INSERT INTO `sys_role_permission` VALUES ('7', '22');
INSERT INTO `sys_role_permission` VALUES ('7', '23');
INSERT INTO `sys_role_permission` VALUES ('7', '30');
INSERT INTO `sys_role_permission` VALUES ('7', '31');
INSERT INTO `sys_role_permission` VALUES ('7', '34');
INSERT INTO `sys_role_permission` VALUES ('7', '35');
INSERT INTO `sys_role_permission` VALUES ('7', '36');
INSERT INTO `sys_role_permission` VALUES ('7', '38');
INSERT INTO `sys_role_permission` VALUES ('7', '39');
INSERT INTO `sys_role_permission` VALUES ('7', '40');
INSERT INTO `sys_role_permission` VALUES ('7', '42');
INSERT INTO `sys_role_permission` VALUES ('7', '43');
INSERT INTO `sys_role_permission` VALUES ('7', '44');
INSERT INTO `sys_role_permission` VALUES ('7', '46');
INSERT INTO `sys_role_permission` VALUES ('7', '47');
INSERT INTO `sys_role_permission` VALUES ('7', '48');
INSERT INTO `sys_role_permission` VALUES ('7', '49');
INSERT INTO `sys_role_permission` VALUES ('7', '51');
INSERT INTO `sys_role_permission` VALUES ('7', '52');
INSERT INTO `sys_role_permission` VALUES ('7', '53');
INSERT INTO `sys_role_permission` VALUES ('7', '54');
INSERT INTO `sys_role_permission` VALUES ('7', '55');
INSERT INTO `sys_role_permission` VALUES ('7', '56');
INSERT INTO `sys_role_permission` VALUES ('7', '57');
INSERT INTO `sys_role_permission` VALUES ('7', '73');
INSERT INTO `sys_role_permission` VALUES ('7', '74');
INSERT INTO `sys_role_permission` VALUES ('7', '75');
INSERT INTO `sys_role_permission` VALUES ('7', '76');
INSERT INTO `sys_role_permission` VALUES ('7', '77');
INSERT INTO `sys_role_permission` VALUES ('7', '78');
INSERT INTO `sys_role_permission` VALUES ('7', '79');
INSERT INTO `sys_role_permission` VALUES ('7', '86');
INSERT INTO `sys_role_permission` VALUES ('7', '97');
INSERT INTO `sys_role_permission` VALUES ('7', '98');
INSERT INTO `sys_role_permission` VALUES ('7', '99');
INSERT INTO `sys_role_permission` VALUES ('7', '100');
INSERT INTO `sys_role_permission` VALUES ('7', '101');
INSERT INTO `sys_role_permission` VALUES ('7', '103');
INSERT INTO `sys_role_permission` VALUES ('7', '106');
INSERT INTO `sys_role_permission` VALUES ('7', '107');
INSERT INTO `sys_role_permission` VALUES ('7', '109');
INSERT INTO `sys_role_permission` VALUES ('7', '110');
INSERT INTO `sys_role_permission` VALUES ('7', '111');
INSERT INTO `sys_role_permission` VALUES ('7', '112');
INSERT INTO `sys_role_permission` VALUES ('7', '113');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`) USING BTREE,
  KEY `FK_203gdpkwgtow7nxlo2oap5jru` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `sys_role_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('4', '8');
INSERT INTO `sys_role_user` VALUES ('5', '2');
INSERT INTO `sys_role_user` VALUES ('5', '6');
INSERT INTO `sys_role_user` VALUES ('5', '8');
INSERT INTO `sys_role_user` VALUES ('5', '15');
INSERT INTO `sys_role_user` VALUES ('5', '16');
INSERT INTO `sys_role_user` VALUES ('6', '8');
INSERT INTO `sys_role_user` VALUES ('6', '17');
INSERT INTO `sys_role_user` VALUES ('7', '8');
INSERT INTO `sys_role_user` VALUES ('7', '9');
INSERT INTO `sys_role_user` VALUES ('7', '11');
INSERT INTO `sys_role_user` VALUES ('7', '12');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `loginname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `detail_address` varchar(255) DEFAULT NULL COMMENT '具体地址',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `hospital_id` int(11) DEFAULT NULL COMMENT '医院id（职工）',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `mgr` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT '1' COMMENT '逻辑删除',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序号',
  `type` int(255) DEFAULT NULL COMMENT '用户类型[0超级管理员1，管理员，2普通用户]',
  `imgpath` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `open_id` varchar(50) DEFAULT NULL COMMENT '微信id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `region` varchar(255) DEFAULT NULL COMMENT '省区',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `position` varchar(20) DEFAULT NULL COMMENT '职位',
  `id_number` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `job_number` varchar(20) DEFAULT NULL,
  `province` varchar(63) DEFAULT NULL,
  `city` varchar(63) DEFAULT NULL,
  `county` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_3rrcpvho2w1mx1sfiuuyir1h` (`hospital_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '超级管理员', 'system', '很远很远的地方', '女', '超级管理员', '46826eeef053a14f1001695decb1d270', '1', '2018-06-25 11:06:34', '0', '1', '1', '0', '../resources/images/defaultusertitle.jpg', 'FFB8D3CD86064A78859FC57A1187D477', '999878.00', null, null, null, null, null, null, '430223199003250715', null, '18807470305', null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', '李四', 'ls', '武汉', '男', 'KING', '36ab994b3ffa62e1e948b16a91209436', '2', '2018-06-25 11:06:36', null, '1', '2', '2', '../resources/images/defaultusertitle.jpg', 'E026B6E51D8E4E8BA72126292A99DA32', '1000000.00', null, null, null, null, '18', null, '430223199003250715', '当值', '18807470305', 'XY001', '湖南省', '株洲市', '攸县');
INSERT INTO `sys_user` VALUES ('6', '刘八', 'lb', '深圳', '女', '程序员', 'bcee2b05b4b591106829aec69a094806', '3', '2018-08-06 11:21:12', '3', '1', '6', '2', '../resources/images/defaultusertitle.jpg', 'E6CCF54A09894D998225878BBD139B20', '1000000.00', null, null, null, null, null, null, null, null, '18807470305', null, null, null, null);
INSERT INTO `sys_user` VALUES ('8', '习大大', 'xidada', '北京', '女', '北京', '83c6312d3124527c06f9f32c9f0f4122', '2', '2019-09-25 08:47:38', '3', '1', '7', '1', null, '9A77217BD788418683C5D69CDC85B4AA', '1000000.00', null, null, null, null, null, null, null, null, '18807470305', null, null, null, null);
INSERT INTO `sys_user` VALUES ('9', '小黑', '小黑', '', '女', '', 'd0e1fb59a7b45e1b85a666423faf2d44', '3', '2022-02-19 06:37:23', '0', '1', '8', '4', null, '0858BE15558141B0BF8761C161174E7B', '1000000.00', null, null, null, null, null, null, null, null, '18807470305', null, null, null, null);
INSERT INTO `sys_user` VALUES ('11', '王健2', 'wangjian2', '121', '男', null, '42bc571a3c975841ec8fe85c8a655720', '2', '2022-02-27 12:09:49', null, '1', null, '4', null, 'EFC51AE296C643CA996E94B2BE355C74', '1000000.00', null, '12121', null, null, '12', '12', '12', '当值', '18807470305', '111', '安徽省', '合肥市', '瑶海区');
INSERT INTO `sys_user` VALUES ('12', '王健3', 'wangjian3', '深圳1321', '男', null, '1bab868d120043f0eeb3481cf2c51b9c', '2', '2022-02-27 12:12:41', null, '1', null, '4', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLdjibSZBoU4bia3KFAb81BnCYoedlIcRKEf9kPqL7zuvzWibYno96vQ60Oc8NgmTmicHSRCyzcicLOtQw/132', 'CA1AF45D89F94F1A901EF1F092AED577', '998621.00', null, '123123', null, null, '21', '132', '213', '当值', '18807470305', '21', '安徽省', '合肥市', '瑶海区');
INSERT INTO `sys_user` VALUES ('15', '张四', 'zhangsi', '2132', '女', null, '75116fcde6ede0542bb9e07892d1429b', '3', '2022-02-27 13:08:22', null, '1', null, '2', null, 'F5D9EB8D221A4311977A70209C128EC1', '1000000.00', null, '31231', null, null, '22', '1231', '213213131', '当值', '18807470305', 'xy001', '福建省', '福州市', '鼓楼区');
INSERT INTO `sys_user` VALUES ('16', '李三', 'lisan', null, '1', '21121212', '4483cfc807b282ed771f016d29260528', null, '2022-02-27 16:07:05', '0', '1', '9', '4', null, '4D9449EFE2B94050A94A9DA57DBA3B01', '1000000.00', null, null, null, null, null, null, null, null, '18807470305', null, null, null, null);
INSERT INTO `sys_user` VALUES ('17', '王健4', 'wangjian4', '123123', '男', null, 'c2f5d4acc90014b4127b1724c616c7ab', '2', '2020-11-30 03:35:34', null, '1', null, '3', null, '3DAE73D0C8FB43D8883417BD938B569D', '1000000.00', null, '312313', null, null, '25', '1233', '2313', '当值', '18807470305', 'sadasda', '天津市', '天津市', '和平区');
