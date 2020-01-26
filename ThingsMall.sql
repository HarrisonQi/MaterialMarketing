/*
 Navicat Premium Data Transfer

 Source Server         : loc mysql
 Source Server Type    : MySQL
 Source Server Version : 50027
 Source Host           : localhost:3306
 Source Schema         : book_mall

 Target Server Type    : MySQL
 Target Server Version : 50027
 File Encoding         : 65001

 Date: 08/04/2018 16:20:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书介绍',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书作者',
  `price` int(11) NULL DEFAULT NULL COMMENT '图书价格',
  `create_time` datetime NULL DEFAULT NULL COMMENT '图书上架时间',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (35, '胶合板2-25mm', '包装板胶合板多层板托盘板', '费县', 30, '2018-04-08 09:32:04');
INSERT INTO `book` VALUES (36, '黄铜合金', '供应C3604黄铜合金耐磨黄铜板 铜合金零切', '苏州市', 40, '2018-04-08 09:33:59');
INSERT INTO `book` VALUES (37, '紫铜棒', '紫铜棒 t2紫铜棒直径 40 45 50 55 60', '上海', 45, '2018-04-08 09:34:40');
INSERT INTO `book` VALUES (38, '高透明亚克力板', '厂家直销 高透明亚克力板定做加工 PMMA 有机玻璃板尺', '永嘉县', 10, '2018-04-08 09:36:56');
INSERT INTO `book` VALUES (39, 'PBT塑料', '热销供应PBT塑料 台湾长春PBT纯树脂全系列', '东莞市', 38, '2018-04-08 09:38:01');
INSERT INTO `book` VALUES (32, '彩钢板0.8mm', '0.8mm厚白灰彩钢板', '天津', 4, '2018-04-08 09:25:31');
INSERT INTO `book` VALUES (33, '聚乙烯闭孔泡沫板', '发泡板, 填缝板, 接缝板', '衡水', 700, '2018-04-08 09:28:30');
INSERT INTO `book` VALUES (34, '异型珍珠棉', 'EPE珍珠棉', '常州市武进区', 5, '2018-04-08 09:31:03');
INSERT INTO `book` VALUES (40, '塑料制钢', '塑钢材料', '北京', 1, '2018-04-08 14:41:28');

-- ----------------------------
-- Table structure for custom_service
-- ----------------------------
DROP TABLE IF EXISTS `custom_service`;
CREATE TABLE `custom_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '信息',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'unknown' COMMENT '留言者',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_service
-- ----------------------------
INSERT INTO `custom_service` VALUES (16, '服务再好一点, 发货再快一点', '2018-04-08 14:40:47', '123');
INSERT INTO `custom_service` VALUES (15, '物流需要再快点, 服务需要在热情点', '2018-04-08 14:10:23', '123');

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '图书ID',
  `grade` int(255) NULL DEFAULT NULL COMMENT '评价级别',
  `discription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价描述',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES (8, '高透明亚克力板', 38, 5, '好', '123');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `order_item_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `order_item_status` int(11) NULL DEFAULT NULL COMMENT '订单类型；0：已付款； 1：已接收 ；2：已评价；3：退货',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `price` int(11) NULL DEFAULT NULL COMMENT '购买总价格',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '图书id',
  `count` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `sender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货者',
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收者',
  `send_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货地址',
  `send_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货者联系方式',
  `receive_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货者',
  `receive_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货者联系方式',
  `create_time` datetime NULL DEFAULT NULL COMMENT '下单时间',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY USING BTREE (`order_item_no`)
) ENGINE = MyISAM AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (93, 0, '紫铜棒', 45, 37, 1, 'XXX物料商店', '123', 'XXX物料商店', '400-123456', '中国北京', '12300000000', '2018-04-08 14:40:18', '123');
INSERT INTO `order_item` VALUES (92, 0, 'PBT塑料', 38, 39, 1, 'XXX物料商店', '123', 'XXX物料商店', '400-123456', '中国北京', '12300000000', '2018-04-08 14:09:30', '123');
INSERT INTO `order_item` VALUES (91, 3, '高透明亚克力板', 10, 38, 1, 'XXX物料商店', '123', 'XXX物料商店', '400-123456', '中国北京', '12300000000', '2018-04-08 13:58:32', '123');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `unit_price` int(11) NULL DEFAULT NULL COMMENT '图书单价',
  `total_price` int(11) NULL DEFAULT NULL COMMENT '商品总价',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '图书ID',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (13, 'PBT塑料', 38, 76, 2, '123', 39);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `isAdmin` int(11) NULL DEFAULT 0 COMMENT '是否管理员 1：是，2：不是',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '15512345678', '北京', 1);
INSERT INTO `user` VALUES (8, '123', '123', '12300000000', '中国北京', 0);

SET FOREIGN_KEY_CHECKS = 1;
