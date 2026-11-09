/*
 Navicat Premium Data Transfer

 Source Server         : 本地库
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : reservation-system

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 30/01/2024 01:44:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_card_info', '预约卡片管理', NULL, NULL, 'SysCardInfo', 'crud', 'element-plus', 'com.website.system', 'system', 'cardInfo', '预约卡片管理', 'david', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41', NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_employee_info', '员工管理表', NULL, NULL, 'SysEmployeeInfo', 'crud', 'element-plus', 'com.website.system', 'system', 'employeeInfo', '员工管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:29:50', NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_employee_service', '员工服务表', NULL, NULL, 'SysEmployeeService', 'crud', 'element-plus', 'com.website.system', 'system', 'service', '员工服务', 'david', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:29', NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_service_info', '服务管理', '', '', 'SysServiceInfo', 'tree', 'element-plus', 'com.website.system', 'system', 'serviceInfo', '服务管理', 'david', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"service_name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"4\"}', 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18', NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_income_info', '收入管理表', NULL, NULL, 'SysIncomeInfo', 'crud', 'element-plus', 'com.website.system', 'system', 'incomeInfo', '收入管理', 'david', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07', NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_pay_out_info', '支出管理表', NULL, NULL, 'SysPayOutInfo', 'crud', 'element-plus', 'com.website.system', 'system', 'payOutInfo', '支出管理', 'ruoyi', '0', '/', '{\"parentMenuId\":4}', 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:09:43', NULL);
INSERT INTO `gen_table` VALUES (7, 'sys_gift_card_order', '礼品卡订单记录', NULL, NULL, 'SysGiftCardOrder', 'crud', 'element-plus', 'com.website.system', 'reservation', 'giftCardOrder', '礼品卡订单记录', 'david', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2024-01-26 03:28:15', '', '2024-01-26 03:53:52', NULL);
INSERT INTO `gen_table` VALUES (11, 'sys_gift_card_sell_record', '礼品卡出售记录', NULL, NULL, 'SysGiftCardSellRecord', 'crud', 'element-plus', 'com.website.system', 'reservation', 'giftCardSellRecord', '礼品卡出售记录', 'david', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22', NULL);
INSERT INTO `gen_table` VALUES (12, 'sys_gift_card_type_info', '礼品卡类型', NULL, NULL, 'SysGiftCardTypeInfo', 'crud', 'element-plus', 'com.website.system', 'reservation', 'giftCardTypeInfo', '礼品卡类型', 'david', '0', '/', '{\"parentMenuId\":4}', 'admin', '2024-01-26 05:06:25', '', '2024-01-26 05:07:49', NULL);
INSERT INTO `gen_table` VALUES (13, 'sys_card_order', '预约卡片支付管理', NULL, NULL, 'SysCardOrder', 'crud', 'element-plus', 'com.website.system', 'reservation', 'cardOrder', '预约卡片支付管理', 'david', '0', '/', '{\"parentMenuId\":4}', 'admin', '2024-01-26 10:20:05', '', '2024-01-26 10:26:28', NULL);
INSERT INTO `gen_table` VALUES (14, 'sys_costom_info', '预约客户管理', NULL, NULL, 'SysCostomInfo', 'crud', 'element-plus', 'com.website.system', 'reservation', 'costomInfo', '预约客户管理', 'david', '0', '/', '{\"parentMenuId\":\"4\"}', 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'card_id', '预约卡片ID', 'int', 'Long', 'cardId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (2, 1, 'card_name', '预约卡片名称', 'varchar(255)', 'String', 'cardName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (3, 1, 'start', '预约开始时间', 'varchar(255)', 'String', 'start', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (4, 1, 'end', '预约结束时间', 'varchar(255)', 'String', 'end', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (5, 1, 'employee_id', '预约员工ID', 'bigint', 'Long', 'employeeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (6, 1, 'custom_id', '预约客户ID', 'bigint', 'Long', 'customId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (7, 1, 'card_num', '预约人数', 'int', 'Long', 'cardNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (8, 1, 'service_list', '预约服务列表', 'text', 'String', 'serviceList', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (9, 1, 'order_status', '订单组', 'varchar(255)', 'String', 'orderStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (10, 1, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (11, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:41');
INSERT INTO `gen_table_column` VALUES (12, 2, 'employee_id', '员工ID', 'bigint', 'Long', 'employeeId', '1', '1', '0', '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:29:50');
INSERT INTO `gen_table_column` VALUES (13, 2, 'cover_image', '封面照片', 'varchar(255)', 'String', 'coverImage', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 2, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:29:50');
INSERT INTO `gen_table_column` VALUES (14, 2, 'personal_introduction', '个人介绍', 'longtext', 'String', 'personalIntroduction', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:29:50');
INSERT INTO `gen_table_column` VALUES (15, 2, 'employee_code', '员工编号', 'varchar(255)', 'String', 'employeeCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:29:50');
INSERT INTO `gen_table_column` VALUES (16, 2, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:29:50');
INSERT INTO `gen_table_column` VALUES (17, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:29:50');
INSERT INTO `gen_table_column` VALUES (18, 3, 'service_id', '服务ID', 'bigint', 'Long', 'serviceId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:29');
INSERT INTO `gen_table_column` VALUES (19, 3, 'employee_id', '员工ID', 'bigint', 'Long', 'employeeId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:29');
INSERT INTO `gen_table_column` VALUES (20, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:29');
INSERT INTO `gen_table_column` VALUES (21, 3, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-01-21 22:41:17', '', '2024-01-21 23:30:29');
INSERT INTO `gen_table_column` VALUES (22, 4, 'id', '服务ID', 'bigint', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18');
INSERT INTO `gen_table_column` VALUES (23, 4, 'service_name', '服务名称', 'varchar(255)', 'String', 'serviceName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18');
INSERT INTO `gen_table_column` VALUES (24, 4, 'service_time', '服务时长', 'bigint', 'Long', 'serviceTime', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18');
INSERT INTO `gen_table_column` VALUES (25, 4, 'service_price', '服务价格', 'decimal(10,2)', 'BigDecimal', 'servicePrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18');
INSERT INTO `gen_table_column` VALUES (26, 4, 'service_detail', '服务详情', 'longtext', 'String', 'serviceDetail', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18');
INSERT INTO `gen_table_column` VALUES (27, 4, 'parent_id', '上级目录', 'int', 'Long', 'parentId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18');
INSERT INTO `gen_table_column` VALUES (28, 4, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18');
INSERT INTO `gen_table_column` VALUES (29, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-01-21 22:41:17', '', '2024-01-26 07:57:18');
INSERT INTO `gen_table_column` VALUES (30, 5, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07');
INSERT INTO `gen_table_column` VALUES (31, 5, 'date', '收入时间', 'varchar(255)', 'String', 'date', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07');
INSERT INTO `gen_table_column` VALUES (32, 5, 'cc', 'pos机收入', 'decimal(20,2)', 'BigDecimal', 'cc', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07');
INSERT INTO `gen_table_column` VALUES (33, 5, 'balance_before_work', '上班前现金余额', 'decimal(20,2)', 'BigDecimal', 'balanceBeforeWork', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07');
INSERT INTO `gen_table_column` VALUES (34, 5, 'cash_income', '现金收入', 'decimal(20,2)', 'BigDecimal', 'cashIncome', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07');
INSERT INTO `gen_table_column` VALUES (35, 5, 'gift_card_income', '礼品卡收入', 'decimal(20,2)', 'BigDecimal', 'giftCardIncome', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07');
INSERT INTO `gen_table_column` VALUES (36, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07');
INSERT INTO `gen_table_column` VALUES (37, 5, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:11:07');
INSERT INTO `gen_table_column` VALUES (38, 6, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:09:43');
INSERT INTO `gen_table_column` VALUES (39, 6, 'pay_out_time', '支出时间', 'varchar(255)', 'String', 'payOutTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:09:43');
INSERT INTO `gen_table_column` VALUES (40, 6, 'pay_out_amount', '支出金额', 'varchar(255)', 'String', 'payOutAmount', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:09:43');
INSERT INTO `gen_table_column` VALUES (41, 6, 'pay_out_type', '支出类型', 'varchar(255)', 'String', 'payOutType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:09:43');
INSERT INTO `gen_table_column` VALUES (42, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:09:43');
INSERT INTO `gen_table_column` VALUES (43, 6, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-01-25 00:05:34', '', '2024-01-25 00:09:43');
INSERT INTO `gen_table_column` VALUES (44, 7, 'gift_card_code', '礼品卡编码', 'varchar(255)', 'String', 'giftCardCode', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 1, 'admin', '2024-01-26 03:28:15', '', '2024-01-26 03:53:52');
INSERT INTO `gen_table_column` VALUES (45, 7, 'gift_card_pay_type', '礼品卡支付方式', 'varchar(255)', 'String', 'giftCardPayType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_gift_card_pay_type', 2, 'admin', '2024-01-26 03:28:15', '', '2024-01-26 03:53:52');
INSERT INTO `gen_table_column` VALUES (46, 7, 'gift_card_pay_amount', '礼品卡支付金额', 'decimal(20,2)', 'BigDecimal', 'giftCardPayAmount', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2024-01-26 03:28:15', '', '2024-01-26 03:53:52');
INSERT INTO `gen_table_column` VALUES (47, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-01-26 03:28:15', '', '2024-01-26 03:53:52');
INSERT INTO `gen_table_column` VALUES (48, 7, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-01-26 03:28:15', '', '2024-01-26 03:53:52');
INSERT INTO `gen_table_column` VALUES (67, 11, 'id', 'id', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22');
INSERT INTO `gen_table_column` VALUES (68, 11, 'gift_card_type', '礼品卡类型', 'varchar(2)', 'String', 'giftCardType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22');
INSERT INTO `gen_table_column` VALUES (69, 11, 'gift_card_code', '礼品卡编号', 'varchar(255)', 'String', 'giftCardCode', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22');
INSERT INTO `gen_table_column` VALUES (70, 11, 'gift_card_sell_price', '礼品卡出售价格', 'decimal(20,2)', 'BigDecimal', 'giftCardSellPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22');
INSERT INTO `gen_table_column` VALUES (71, 11, 'gift_card_deduction_price', '礼品卡抵扣价格', 'decimal(20,2)', 'BigDecimal', 'giftCardDeductionPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22');
INSERT INTO `gen_table_column` VALUES (72, 11, 'status', '礼品卡使用状态', 'varchar(2)', 'String', 'status', '0', '0', '0', '0', '1', '1', '1', 'EQ', 'select', 'sys_gift_card_status', 6, 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22');
INSERT INTO `gen_table_column` VALUES (73, 11, 'create_time', '礼品卡出售时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22');
INSERT INTO `gen_table_column` VALUES (74, 11, 'create_by', '礼品卡出售人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-01-26 04:27:12', '', '2024-01-26 04:39:22');
INSERT INTO `gen_table_column` VALUES (75, 12, 'gift_card_type_id', 'id', 'bigint', 'Long', 'giftCardTypeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-26 05:06:25', '', '2024-01-26 05:07:49');
INSERT INTO `gen_table_column` VALUES (76, 12, 'gift_card_type_name', '礼品卡类型名称', 'varchar(255)', 'String', 'giftCardTypeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-01-26 05:06:25', '', '2024-01-26 05:07:49');
INSERT INTO `gen_table_column` VALUES (77, 12, 'gift_card_sell_price', '礼品卡出售价格', 'decimal(20,2)', 'BigDecimal', 'giftCardSellPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2024-01-26 05:06:25', '', '2024-01-26 05:07:49');
INSERT INTO `gen_table_column` VALUES (78, 12, 'gift_card_deduction_price', '礼品卡抵扣价格', 'decimal(20,2)', 'BigDecimal', 'giftCardDeductionPrice', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-01-26 05:06:25', '', '2024-01-26 05:07:49');
INSERT INTO `gen_table_column` VALUES (79, 12, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-01-26 05:06:25', '', '2024-01-26 05:07:49');
INSERT INTO `gen_table_column` VALUES (80, 12, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-01-26 05:06:25', '', '2024-01-26 05:07:49');
INSERT INTO `gen_table_column` VALUES (81, 13, 'card_id', '预约卡片ID', 'bigint', 'Long', 'cardId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-01-26 10:20:05', '', '2024-01-26 10:26:28');
INSERT INTO `gen_table_column` VALUES (82, 13, 'pay_amount', '支付金额', 'decimal(20,2)', 'BigDecimal', 'payAmount', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2024-01-26 10:20:05', '', '2024-01-26 10:26:28');
INSERT INTO `gen_table_column` VALUES (83, 13, 'pay_type', '支付类型', 'varchar(255)', 'String', 'payType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_card_pay_type', 3, 'admin', '2024-01-26 10:20:05', '', '2024-01-26 10:26:28');
INSERT INTO `gen_table_column` VALUES (84, 13, 'pay_time', '支付时间', 'varchar(255)', 'String', 'payTime', '0', '0', '0', '0', '0', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-01-26 10:20:05', '', '2024-01-26 10:26:28');
INSERT INTO `gen_table_column` VALUES (85, 13, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-01-26 10:20:05', '', '2024-01-26 10:26:28');
INSERT INTO `gen_table_column` VALUES (86, 13, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-01-26 10:20:05', '', '2024-01-26 10:26:28');
INSERT INTO `gen_table_column` VALUES (87, 14, 'custom_id', '客户ID', 'bigint', 'Long', 'customId', '1', '1', '0', '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');
INSERT INTO `gen_table_column` VALUES (88, 14, 'custom_user_name', '客户用户名', 'varchar(255)', 'String', 'customUserName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 2, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');
INSERT INTO `gen_table_column` VALUES (89, 14, 'custom_nick_name', '客户姓名', 'varchar(255)', 'String', 'customNickName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');
INSERT INTO `gen_table_column` VALUES (90, 14, 'custom_password', '客户密码', 'varchar(255)', 'String', 'customPassword', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 4, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');
INSERT INTO `gen_table_column` VALUES (91, 14, 'custom_avatar', '客户头像', 'varchar(255)', 'String', 'customAvatar', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 5, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');
INSERT INTO `gen_table_column` VALUES (92, 14, 'custom_address', '客户地址', 'varchar(255)', 'String', 'customAddress', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');
INSERT INTO `gen_table_column` VALUES (93, 14, 'custom_phone', '客户电话', 'varchar(255)', 'String', 'customPhone', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');
INSERT INTO `gen_table_column` VALUES (94, 14, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');
INSERT INTO `gen_table_column` VALUES (95, 14, 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-01-29 09:33:04', '', '2024-01-29 09:39:36');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_card_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_card_info`;
CREATE TABLE `sys_card_info`  (
  `card_id` bigint NOT NULL AUTO_INCREMENT COMMENT '预约卡片ID',
  `card_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约卡片名称',
  `start` datetime NULL DEFAULT NULL COMMENT '预约开始时间',
  `end` datetime NULL DEFAULT NULL COMMENT '预约结束时间',
  `employee_id` bigint NULL DEFAULT NULL COMMENT '预约员工ID',
  `custom_id` bigint NULL DEFAULT NULL COMMENT '预约客户ID',
  `card_num` int NULL DEFAULT NULL COMMENT '预约人数',
  `service_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预约服务列表',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `pay_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '支付金额',
  `service_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务组（统计支付数量）',
  `service_wages` decimal(10, 2) NULL DEFAULT NULL COMMENT '服务工资(统计员工工资)',
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '订单组',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约卡片管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_card_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_card_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_card_order`;
CREATE TABLE `sys_card_order`  (
  `card_id` bigint NOT NULL COMMENT '预约卡片ID',
  `pay_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `gift_card` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '礼品卡编号组',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_card_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-01-20 14:47:33', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-01-20 14:47:33', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-01-20 14:47:33', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-01-20 14:47:33', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-01-20 14:47:33', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', 'true', 'Y', 'admin', '2024-01-20 14:47:33', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_custom_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_custom_info`;
CREATE TABLE `sys_custom_info`  (
  `custom_id` bigint NOT NULL AUTO_INCREMENT,
  `custom_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户用户名',
  `custom_nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `custom_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户密码',
  `custom_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户头像',
  `custom_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `custom_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户电话',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`custom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预约客户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_custom_info
-- ----------------------------
INSERT INTO `sys_custom_info` VALUES (1, NULL, '张某', NULL, NULL, NULL, '13228401554', '2024-01-29 09:49:32', NULL);
INSERT INTO `sys_custom_info` VALUES (2, NULL, '李某', NULL, NULL, NULL, '13229401003', '2024-01-29 09:49:47', NULL);
INSERT INTO `sys_custom_info` VALUES (3, NULL, '陈某', NULL, NULL, NULL, '13328401554', '2024-01-29 09:50:06', NULL);
INSERT INTO `sys_custom_info` VALUES (4, NULL, '丁某', NULL, NULL, NULL, '13229401234', '2024-01-29 11:24:45', NULL);
INSERT INTO `sys_custom_info` VALUES (5, NULL, '124111011', NULL, NULL, NULL, '利', '2024-01-29 12:54:18', NULL);
INSERT INTO `sys_custom_info` VALUES (6, NULL, '王', NULL, NULL, NULL, '13229401444', '2024-01-29 12:55:22', NULL);
INSERT INTO `sys_custom_info` VALUES (7, NULL, 'D', NULL, NULL, NULL, '132241', '2024-01-29 12:56:17', NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 101, '0,100,101', '预约部门', 0, NULL, NULL, NULL, '0', '0', 'admin', '2024-01-22 03:24:05', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '未使用', '1', 'sys_gift_card_status', NULL, 'primary', 'Y', '0', '', NULL, '', NULL, '礼品卡使用状态');
INSERT INTO `sys_dict_data` VALUES (31, 2, '已使用', '2', 'sys_gift_card_status', NULL, 'warning', 'N', '0', '', NULL, '', NULL, '礼品卡未使用状态');
INSERT INTO `sys_dict_data` VALUES (32, 1, '电子支付', '电子支付', 'sys_gift_card_pay_type', NULL, '', 'Y', '0', '', NULL, '', NULL, '礼品卡未支付类型');
INSERT INTO `sys_dict_data` VALUES (33, 2, '现金支付', '现金支付', 'sys_gift_card_pay_type', NULL, '', 'N', '0', '', NULL, '', NULL, '礼品卡未支付类型');
INSERT INTO `sys_dict_data` VALUES (34, 3, '刷卡支付', '刷卡支付', 'sys_gift_card_pay_type', NULL, '', 'N', '0', '', NULL, '', NULL, '礼品卡未支付类型');
INSERT INTO `sys_dict_data` VALUES (35, 1, '电子支付', '电子支付', 'sys_card_pay_type', NULL, '', 'Y', '0', '', NULL, '', NULL, '礼品卡未支付类型');
INSERT INTO `sys_dict_data` VALUES (36, 2, '现金支付', '现金支付', 'sys_card_pay_type', NULL, '', 'N', '0', '', NULL, '', NULL, '礼品卡未支付类型');
INSERT INTO `sys_dict_data` VALUES (37, 3, '刷卡支付', '刷卡支付', 'sys_card_pay_type', NULL, '', 'N', '0', '', NULL, '', NULL, '礼品卡未支付类型');
INSERT INTO `sys_dict_data` VALUES (38, 4, '会员卡支付', '会员卡支付', 'sys_card_pay_type', NULL, '', 'N', '0', '', NULL, '', NULL, '礼品卡未支付类型');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '礼品卡使用状态', 'sys_gift_card_status', '0', '', NULL, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '礼品卡支付类型', 'sys_gift_card_pay_type', '0', '', NULL, '', NULL, '礼品卡支付类型');
INSERT INTO `sys_dict_type` VALUES (13, '预约卡片支付类型', 'sys_card_pay_type', '0', '', NULL, '', NULL, '预约卡片支付类型');

-- ----------------------------
-- Table structure for sys_employee_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee_info`;
CREATE TABLE `sys_employee_info`  (
  `employee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工电话',
  `birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工生日',
  `active_or_not` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否显现',
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面照片',
  `personal_introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人介绍',
  `employee_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工编号',
  `order_num` int NULL DEFAULT 999 COMMENT '员工排序',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_employee_info
-- ----------------------------
INSERT INTO `sys_employee_info` VALUES (100, '员工1', '111', '2024-01-17', '1', '/profile/upload/2024/01/28/5882b2b7d0a20cf431ad7f26d25f5c36acaf2fdd3389_20240128022839A003.png', '111', 'A808', 3, '', '2024-01-28 02:27:54');
INSERT INTO `sys_employee_info` VALUES (101, '员工2', '', NULL, '2', '', NULL, NULL, 999, '', '2024-01-28 02:35:04');
INSERT INTO `sys_employee_info` VALUES (102, '员工3', '', NULL, '2', '', NULL, NULL, 999, '', '2024-01-28 02:35:06');
INSERT INTO `sys_employee_info` VALUES (103, '员工4', '', NULL, '2', '', NULL, NULL, 999, 'admin', '2024-01-28 02:45:57');
INSERT INTO `sys_employee_info` VALUES (104, '员工5', '', NULL, '2', '', NULL, NULL, 999, 'admin', '2024-01-28 02:35:08');
INSERT INTO `sys_employee_info` VALUES (105, '员工6', '', NULL, '2', '', NULL, NULL, 999, 'admin', '2024-01-28 02:45:58');
INSERT INTO `sys_employee_info` VALUES (106, '员工7', '', NULL, '2', '', NULL, NULL, 999, 'admin', '2024-01-28 02:35:10');
INSERT INTO `sys_employee_info` VALUES (107, '员工8', '', NULL, '2', '', NULL, NULL, 999, 'admin', '2024-01-28 02:35:11');
INSERT INTO `sys_employee_info` VALUES (108, '员工9', '', NULL, '1', '', NULL, NULL, 999, 'admin', '2024-01-28 02:35:12');
INSERT INTO `sys_employee_info` VALUES (109, 'HALLO', '111', '2024-01-28', '1', '/profile/upload/2024/01/28/5882b2b7d0a20cf431ad7f26d25f5c36acaf2fdd3389_20240128023039A004.png', '111', '101', 2, NULL, '2024-01-28 02:31:42');
INSERT INTO `sys_employee_info` VALUES (110, 'hallo', '13228401554', '2024-01-28', '1', '/profile/upload/2024/01/28/5882b2b7d0a20cf431ad7f26d25f5c36acaf2fdd3389_20240128023332A005.png', '111', '101', 998, NULL, '2024-01-28 02:33:52');

-- ----------------------------
-- Table structure for sys_employee_service
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee_service`;
CREATE TABLE `sys_employee_service`  (
  `service_id` bigint NOT NULL COMMENT '服务ID',
  `employee_id` bigint NOT NULL COMMENT '员工ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`service_id`, `employee_id`) USING BTREE,
  UNIQUE INDEX `employee_service_unique_index`(`service_id` ASC, `employee_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_employee_service
-- ----------------------------

-- ----------------------------
-- Table structure for sys_gift_card_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_gift_card_order`;
CREATE TABLE `sys_gift_card_order`  (
  `gift_card_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼品卡编码',
  `gift_card_pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼品卡支付方式',
  `gift_card_pay_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '礼品卡支付金额',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '礼品卡订单记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_gift_card_order
-- ----------------------------
INSERT INTO `sys_gift_card_order` VALUES ('001', '现金支付', 40.00, '2024-01-26 12:27:27', '2024-01-26 12:27:28', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('001', '刷卡支付', 20.00, '2024-01-26 12:27:27', '2024-01-26 12:27:28', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('001', '电子支付', 20.00, '2024-01-26 12:27:27', '2024-01-26 12:27:28', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('002', '现金支付', 100.00, '2024-01-26 14:57:17', '2024-01-26 14:57:17', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('003', '现金支付', 80.00, '2024-01-26 22:40:53', '2024-01-26 22:40:54', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('003', '刷卡支付', 10.00, '2024-01-26 22:40:53', '2024-01-26 22:40:54', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('003', '电子支付', 10.00, '2024-01-26 22:40:53', '2024-01-26 22:40:54', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A06', '现金支付', 40.00, '2024-01-29 01:16:39', '2024-01-29 01:16:40', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A06', '刷卡支付', 20.00, '2024-01-29 01:16:39', '2024-01-29 01:16:40', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A06', '电子支付', 20.00, '2024-01-29 01:16:39', '2024-01-29 01:16:40', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A07', '现金支付', 40.00, '2024-01-29 02:04:56', '2024-01-29 02:04:57', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A07', '刷卡支付', 20.00, '2024-01-29 02:04:56', '2024-01-29 02:04:57', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A07', '电子支付', 20.00, '2024-01-29 02:04:56', '2024-01-29 02:04:57', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A01', '现金支付', 40.00, '2024-01-29 12:55:40', '2024-01-29 12:55:40', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A01', '刷卡支付', 20.00, '2024-01-29 12:55:40', '2024-01-29 12:55:40', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A01', '电子支付', 20.00, '2024-01-29 12:55:40', '2024-01-29 12:55:40', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A02', '现金支付', 40.00, '2024-01-29 12:56:40', '2024-01-29 12:56:40', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A02', '刷卡支付', 20.00, '2024-01-29 12:56:40', '2024-01-29 12:56:40', NULL);
INSERT INTO `sys_gift_card_order` VALUES ('A02', '电子支付', 20.00, '2024-01-29 12:56:40', '2024-01-29 12:56:40', NULL);

-- ----------------------------
-- Table structure for sys_gift_card_sell_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_gift_card_sell_record`;
CREATE TABLE `sys_gift_card_sell_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gift_card_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼品卡类型',
  `gift_card_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼品卡编号',
  `gift_card_sell_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '礼品卡出售价格',
  `gift_card_deduction_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '礼品卡抵扣价格',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '礼品卡使用状态',
  `custom_id` bigint NOT NULL COMMENT '客户ID',
  `sell_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出售日期',
  `create_time` datetime NULL DEFAULT NULL COMMENT '礼品卡出售时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼品卡出售人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `gift_card_sell_info_unique_index`(`gift_card_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '礼品卡出售记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_gift_card_sell_record
-- ----------------------------
INSERT INTO `sys_gift_card_sell_record` VALUES (7, '1', '001', 80.00, 100.00, '2', 4, '2024-01-26 12:27:27', '2024-01-26 12:27:28', NULL);
INSERT INTO `sys_gift_card_sell_record` VALUES (8, '2', '002', 100.00, 150.00, '2', 4, '2024-01-26 14:57:17', '2024-01-26 14:57:17', NULL);
INSERT INTO `sys_gift_card_sell_record` VALUES (9, '2', '003', 100.00, 150.00, '2', 4, '2024-01-26 22:40:53', '2024-01-26 22:40:54', NULL);
INSERT INTO `sys_gift_card_sell_record` VALUES (10, '1', 'A06', 80.00, 100.00, '2', 4, '2024-01-29 01:16:39', '2024-01-29 01:16:40', NULL);
INSERT INTO `sys_gift_card_sell_record` VALUES (11, '1', 'A07', 80.00, 100.00, '2', 4, '2024-01-29 02:04:56', '2024-01-29 02:04:57', NULL);
INSERT INTO `sys_gift_card_sell_record` VALUES (12, '1', 'A01', 80.00, 100.00, '1', 6, '2024-01-29 12:55:40', '2024-01-29 12:55:40', NULL);
INSERT INTO `sys_gift_card_sell_record` VALUES (13, '1', 'A02', 80.00, 100.00, '1', 7, '2024-01-29 12:56:40', '2024-01-29 12:56:40', NULL);

-- ----------------------------
-- Table structure for sys_gift_card_type_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_gift_card_type_info`;
CREATE TABLE `sys_gift_card_type_info`  (
  `gift_card_type_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gift_card_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '礼品卡类型名称',
  `gift_card_sell_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '礼品卡出售价格',
  `gift_card_deduction_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '礼品卡抵扣价格',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`gift_card_type_id`) USING BTREE,
  UNIQUE INDEX `sys_gift_card_info_unique_index`(`gift_card_type_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '礼品卡类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_gift_card_type_info
-- ----------------------------
INSERT INTO `sys_gift_card_type_info` VALUES (1, '会员卡80抵100', 80.00, 100.00, '2024-01-26 04:06:07', NULL);
INSERT INTO `sys_gift_card_type_info` VALUES (2, '会员卡100抵150', 100.00, 150.00, '2024-01-26 04:06:37', NULL);

-- ----------------------------
-- Table structure for sys_income_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_income_info`;
CREATE TABLE `sys_income_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收入时间',
  `cc` decimal(20, 2) NULL DEFAULT NULL COMMENT 'pos机收入',
  `balance_before_work` decimal(20, 2) NULL DEFAULT NULL COMMENT '上班前现金余额',
  `cash_income` decimal(20, 2) NULL DEFAULT NULL COMMENT '现金收入',
  `gift_card_income` decimal(20, 2) NULL DEFAULT NULL COMMENT '礼品卡收入',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_income_info_unique_index`(`date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收入管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_income_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-01-20 14:47:33', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 225 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2062 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-01-20 14:47:33', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-01-20 14:47:33', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-01-20 14:47:33', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '预约管理', 0, 0, 'reservation', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-01-20 14:47:33', '', NULL, '预约管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-01-20 14:47:33', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-01-20 14:47:33', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-01-20 14:47:33', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-01-20 14:47:33', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-01-20 14:47:33', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-01-20 14:47:33', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-01-20 14:47:33', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-01-20 14:47:33', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-01-20 14:47:33', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-01-20 14:47:33', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-01-20 14:47:33', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-01-20 14:47:33', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-01-20 14:47:33', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-01-20 14:47:33', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-01-20 14:47:33', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-01-20 14:47:33', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-01-20 14:47:33', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-01-20 14:47:33', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-01-20 14:47:33', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-01-20 14:47:33', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '预约卡片管理', 4, 1, 'cardInfo', 'reservation/cardInfo/index', NULL, 1, 0, 'C', '0', '0', 'system:cardInfo:list', '#', 'admin', '2024-01-21 23:41:07', '', NULL, '预约卡片管理菜单');
INSERT INTO `sys_menu` VALUES (2002, '预约卡片管理查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:cardInfo:query', '#', 'admin', '2024-01-21 23:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '预约卡片管理新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:cardInfo:add', '#', 'admin', '2024-01-21 23:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '预约卡片管理修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:cardInfo:edit', '#', 'admin', '2024-01-21 23:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '预约卡片管理删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:cardInfo:remove', '#', 'admin', '2024-01-21 23:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '预约卡片管理导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:cardInfo:export', '#', 'admin', '2024-01-21 23:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '预约员工管理', 4, 5, 'employeeInfo', 'reservation/employeeInfo/index', NULL, 1, 0, 'C', '0', '0', 'system:employeeInfo:list', '#', 'admin', '2024-01-21 23:41:36', '', NULL, '员工管理菜单');
INSERT INTO `sys_menu` VALUES (2008, '员工管理查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employeeInfo:query', '#', 'admin', '2024-01-21 23:41:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '员工管理新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employeeInfo:add', '#', 'admin', '2024-01-21 23:41:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '员工管理修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employeeInfo:edit', '#', 'admin', '2024-01-21 23:41:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '员工管理删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employeeInfo:remove', '#', 'admin', '2024-01-21 23:41:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '员工管理导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employeeInfo:export', '#', 'admin', '2024-01-21 23:41:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '预约服务管理', 4, 6, 'serviceInfo', 'reservation/serviceInfo/index', NULL, 1, 0, 'C', '0', '0', 'system:serviceInfo:list', '#', 'admin', '2024-01-21 23:42:02', '', NULL, '服务管理菜单');
INSERT INTO `sys_menu` VALUES (2014, '服务管理查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:serviceInfo:query', '#', 'admin', '2024-01-21 23:42:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '服务管理新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:serviceInfo:add', '#', 'admin', '2024-01-21 23:42:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '服务管理修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:serviceInfo:edit', '#', 'admin', '2024-01-21 23:42:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '服务管理删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:serviceInfo:remove', '#', 'admin', '2024-01-21 23:42:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '服务管理导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:serviceInfo:export', '#', 'admin', '2024-01-21 23:42:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '费用收入管理', 4, 3, 'incomeInfo', 'reservation/incomeInfo/index', NULL, 1, 0, 'C', '0', '0', 'system:incomeInfo:list', '#', 'admin', '2024-01-25 00:14:15', '', NULL, '收入管理菜单');
INSERT INTO `sys_menu` VALUES (2020, '收入管理查询', 2019, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:incomeInfo:query', '#', 'admin', '2024-01-25 00:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '收入管理新增', 2019, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:incomeInfo:add', '#', 'admin', '2024-01-25 00:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '收入管理修改', 2019, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:incomeInfo:edit', '#', 'admin', '2024-01-25 00:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '收入管理删除', 2019, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:incomeInfo:remove', '#', 'admin', '2024-01-25 00:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '收入管理导出', 2019, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:incomeInfo:export', '#', 'admin', '2024-01-25 00:14:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '费用支出管理', 4, 4, 'payOutInfo', 'reservation/payOutInfo/index', NULL, 1, 0, 'C', '0', '0', 'system:payOutInfo:list', '#', 'admin', '2024-01-25 00:14:34', '', NULL, '支出管理菜单');
INSERT INTO `sys_menu` VALUES (2026, '支出管理查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:payOutInfo:query', '#', 'admin', '2024-01-25 00:14:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '支出管理新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:payOutInfo:add', '#', 'admin', '2024-01-25 00:14:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '支出管理修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:payOutInfo:edit', '#', 'admin', '2024-01-25 00:14:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '支出管理删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:payOutInfo:remove', '#', 'admin', '2024-01-25 00:14:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '支出管理导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:payOutInfo:export', '#', 'admin', '2024-01-25 00:14:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '会员卡订单记录', 4, 7, 'giftCardOrder', 'reservation/giftCardOrder/index', NULL, 1, 0, 'C', '0', '0', 'reservation:giftCardOrder:list', '#', 'admin', '2024-01-26 03:56:54', '', NULL, '礼品卡订单记录菜单');
INSERT INTO `sys_menu` VALUES (2032, '礼品卡订单记录查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardOrder:query', '#', 'admin', '2024-01-26 03:56:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '礼品卡订单记录新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardOrder:add', '#', 'admin', '2024-01-26 03:56:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '礼品卡订单记录修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardOrder:edit', '#', 'admin', '2024-01-26 03:56:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '礼品卡订单记录删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardOrder:remove', '#', 'admin', '2024-01-26 03:56:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '礼品卡订单记录导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardOrder:export', '#', 'admin', '2024-01-26 03:56:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '会员卡出售记录', 4, 8, 'giftCardSellRecord', 'reservation/giftCardSellRecord/index', NULL, 1, 0, 'C', '0', '0', 'reservation:giftCardSellRecord:list', '#', 'admin', '2024-01-26 03:57:07', '', NULL, '礼品卡出售记录菜单');
INSERT INTO `sys_menu` VALUES (2038, '礼品卡出售记录查询', 2037, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardSellRecord:query', '#', 'admin', '2024-01-26 03:57:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '礼品卡出售记录新增', 2037, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardSellRecord:add', '#', 'admin', '2024-01-26 03:57:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '礼品卡出售记录修改', 2037, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardSellRecord:edit', '#', 'admin', '2024-01-26 03:57:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '礼品卡出售记录删除', 2037, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardSellRecord:remove', '#', 'admin', '2024-01-26 03:57:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '礼品卡出售记录导出', 2037, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardSellRecord:export', '#', 'admin', '2024-01-26 03:57:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '会员卡类型管理', 4, 9, 'giftCardTypeInfo', 'reservation/giftCardTypeInfo/index', NULL, 1, 0, 'C', '0', '0', 'reservation:giftCardTypeInfo:list', '#', 'admin', '2024-01-26 03:57:22', '', NULL, '礼品卡类型菜单');
INSERT INTO `sys_menu` VALUES (2044, '礼品卡类型查询', 2043, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardTypeInfo:query', '#', 'admin', '2024-01-26 03:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '礼品卡类型新增', 2043, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardTypeInfo:add', '#', 'admin', '2024-01-26 03:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '礼品卡类型修改', 2043, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardTypeInfo:edit', '#', 'admin', '2024-01-26 03:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '礼品卡类型删除', 2043, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardTypeInfo:remove', '#', 'admin', '2024-01-26 03:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '礼品卡类型导出', 2043, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:giftCardTypeInfo:export', '#', 'admin', '2024-01-26 03:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '预约订单管理', 4, 2, 'cardOrder', 'reservation/cardOrder/index', NULL, 1, 0, 'C', '0', '0', 'reservation:cardOrder:list', '#', 'admin', '2024-01-26 10:29:16', '', NULL, '预约卡片支付管理菜单');
INSERT INTO `sys_menu` VALUES (2050, '预约卡片支付管理查询', 2049, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:cardOrder:query', '#', 'admin', '2024-01-26 10:29:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '预约卡片支付管理新增', 2049, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:cardOrder:add', '#', 'admin', '2024-01-26 10:29:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '预约卡片支付管理修改', 2049, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:cardOrder:edit', '#', 'admin', '2024-01-26 10:29:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '预约卡片支付管理删除', 2049, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:cardOrder:remove', '#', 'admin', '2024-01-26 10:29:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '预约卡片支付管理导出', 2049, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:cardOrder:export', '#', 'admin', '2024-01-26 10:29:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '员工工资管理', 4, 2, 'wages', 'reservation/wages/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2024-01-26 10:29:16', '', NULL, '员工工资管理');
INSERT INTO `sys_menu` VALUES (2056, '预约客户管理', 4, 1, 'costomInfo', 'reservation/costomInfo/index', NULL, 1, 0, 'C', '0', '0', 'reservation:costomInfo:list', '#', 'admin', '2024-01-29 09:43:09', '', NULL, '预约客户管理菜单');
INSERT INTO `sys_menu` VALUES (2057, '预约客户管理查询', 2056, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:costomInfo:query', '#', 'admin', '2024-01-29 09:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '预约客户管理新增', 2056, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:costomInfo:add', '#', 'admin', '2024-01-29 09:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '预约客户管理修改', 2056, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:costomInfo:edit', '#', 'admin', '2024-01-29 09:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '预约客户管理删除', 2056, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:costomInfo:remove', '#', 'admin', '2024-01-29 09:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '预约客户管理导出', 2056, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'reservation:costomInfo:export', '#', 'admin', '2024-01-29 09:43:09', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-01-20 14:47:33', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-01-20 14:47:33', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 557 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_pay_out_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_pay_out_info`;
CREATE TABLE `sys_pay_out_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pay_out_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支出时间',
  `pay_out_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支出金额',
  `pay_out_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支出类型',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支出原因(其它需要输入原因)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支出管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_pay_out_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-01-20 14:47:33', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-01-20 14:47:33', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-01-20 14:47:33', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_service_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_service_info`;
CREATE TABLE `sys_service_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `service_time` bigint NULL DEFAULT NULL COMMENT '服务时长',
  `service_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '服务价格',
  `service_wages` decimal(10, 2) NULL DEFAULT NULL COMMENT '服务工资',
  `service_cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务封面',
  `service_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '服务详情',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上级目录',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_service_info
-- ----------------------------
INSERT INTO `sys_service_info` VALUES (1, '养生项目', 3600000, 100.00, NULL, NULL, '111111111', 0, NULL, '2024-01-21 23:51:27');
INSERT INTO `sys_service_info` VALUES (2, '家政上门', 1200000, 88.00, NULL, NULL, '22222222', 0, NULL, '2024-01-21 23:52:52');
INSERT INTO `sys_service_info` VALUES (3, '按摩', 60, 198.00, 18.00, NULL, '1000000000', 1, NULL, '2024-01-21 23:53:56');
INSERT INTO `sys_service_info` VALUES (4, '打扫卫生', 90, 398.00, 198.00, NULL, 'jdjd d', 2, NULL, '2024-01-23 04:11:04');
INSERT INTO `sys_service_info` VALUES (6, '上门搬家', 45, 158.00, 58.00, NULL, '1111', 2, NULL, '2024-01-23 08:09:31');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依管理源', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-01-30 00:05:59', 'admin', '2024-01-20 14:47:33', '', '2024-01-30 00:05:58', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依普通管理员', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-01-21 02:27:06', 'admin', '2024-01-20 14:47:33', '', '2024-01-21 02:27:05', '测试员');
INSERT INTO `sys_user` VALUES (100, 200, '员工1', '员工1', '00', '', '', '0', '', '$2a$10$t/NcjIdf8dX.ml/oLuzQ.OdV8Qlu.6/q0Oxr.yJcjrAhgns05hFCK', '0', '0', '', NULL, '', '2024-01-20 19:25:09', 'admin', '2024-01-22 03:24:41', NULL);
INSERT INTO `sys_user` VALUES (101, 200, '员工2', '员工2', '00', '', '', '0', '', '$2a$10$oWvhXhvgsbxV5rg314P5yO0GlsJN8F2o3LHJi8ySZblBmsm.Oh9r6', '0', '0', '127.0.0.1', '2024-01-20 19:30:43', '', '2024-01-20 19:26:58', 'admin', '2024-01-22 03:24:50', NULL);
INSERT INTO `sys_user` VALUES (102, 200, '员工3', '员工3', '00', '', '', '0', '', '$2a$10$uYSbsybTiVXDHM1DGJOCouLG2TqWBURahFw09SHx/I/t2Gz5dnOL6', '0', '0', '127.0.0.1', '2024-01-21 02:25:40', '', '2024-01-20 19:28:14', 'admin', '2024-01-22 03:24:59', NULL);
INSERT INTO `sys_user` VALUES (103, 200, '员工4', '员工4', '00', '', '', '0', '', '$2a$10$qw/UT/tzQU0ElYT.Uo3OO.Sm5V6zMTbwPwaKokbDvgFDGeG.9CPve', '0', '0', '', NULL, 'admin', '2024-01-22 08:12:35', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (104, 200, '员工5', '员工5', '00', '', '', '0', '', '$2a$10$w3sLAX/p/A/L3bZqBli2DevQoyFOh9O3Ygd8jq4Dx7g6xUwpJAHWW', '0', '0', '', NULL, 'admin', '2024-01-22 08:13:18', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 200, '员工6', '员工6', '00', '', '', '0', '', '$2a$10$7I9jDFFvmfPBzl3z1mWXguwZPku3jdHYf1tZ..MPBDB749kFz7pGe', '0', '0', '', NULL, 'admin', '2024-01-22 08:13:41', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, 200, '员工7', '员工7', '00', '', '', '0', '', '$2a$10$1AyLKrAjCO9Dswj6lxdU9OmXMT9C1n3MImIYzaVqp9Kvsnb0YfRqa', '0', '0', '', NULL, 'admin', '2024-01-22 08:14:15', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (107, 200, '员工8', '员工8', '00', '', '', '0', '', '$2a$10$1AyLKrAjCO9Dswj6lxdU9OmXMT9C1n3MImIYzaVqp9Kvsnb0YfRqa', '0', '0', '', NULL, 'admin', '2024-01-22 08:14:15', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (108, 200, '员工9', '员工9', '00', '', '', '0', '', '$2a$10$1AyLKrAjCO9Dswj6lxdU9OmXMT9C1n3MImIYzaVqp9Kvsnb0YfRqa', '0', '0', '', NULL, 'admin', '2024-01-22 08:14:15', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
