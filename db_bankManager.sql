/*
 Navicat Premium Data Transfer

 Source Server         : test_mysql
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : db_bankManager

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 13/05/2025 16:41:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bank_card
-- ----------------------------
DROP TABLE IF EXISTS `bank_card`;
CREATE TABLE `bank_card` (
  `card_id` bigint unsigned NOT NULL COMMENT '银行卡ID',
  `user_id` bigint unsigned NOT NULL COMMENT '所属账户ID',
  `card_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '银行卡号',
  `pay_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付密码',
  `type_id` int NOT NULL COMMENT '卡类型ID',
  `status` tinyint DEFAULT '1' COMMENT '卡状态 1=正常 0=冻结 2=挂失',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发卡时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `balance` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '卡内余额，单位：元',
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_number` (`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='银行卡表';

-- ----------------------------
-- Table structure for loans
-- ----------------------------
DROP TABLE IF EXISTS `loans`;
CREATE TABLE `loans` (
  `loan_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '借款ID，主键',
  `borrower_id` bigint unsigned NOT NULL COMMENT '借款人ID，引用 account 表',
  `lender_id` bigint unsigned DEFAULT NULL COMMENT '出借人ID，可为 NULL，引用 account 表',
  `amount` decimal(18,2) NOT NULL COMMENT '借款金额，单位：元',
  `interest_rate` decimal(5,2) NOT NULL COMMENT '年利率（百分比）',
  `term_months` int NOT NULL COMMENT '借款期限（月）',
  `start_date` date DEFAULT NULL COMMENT '借款开始日期',
  `end_date` date DEFAULT NULL COMMENT '借款结束日期',
  `status` enum('pending','approved','rejected','active','completed','defaulted') DEFAULT 'pending' COMMENT '借款状态',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='借款主表，记录借贷基本信息';

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` datetime NOT NULL,
  `news_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for transaction_record
-- ----------------------------
DROP TABLE IF EXISTS `transaction_record`;
CREATE TABLE `transaction_record` (
  `transaction_id` bigint unsigned NOT NULL COMMENT '交易ID',
  `card_id` bigint unsigned NOT NULL COMMENT '银行卡ID',
  `transaction_type` enum('deposit','withdrawal','transfer_out','transfer_in') NOT NULL COMMENT '交易类型',
  `amount` decimal(18,2) NOT NULL COMMENT '交易金额（正值）',
  `balance_after` decimal(18,2) NOT NULL COMMENT '交易后余额',
  `related_card_id` bigint unsigned NOT NULL COMMENT '关联卡ID（如转账对方）',
  `description` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间',
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='交易记录表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '账户ID（用户ID）',
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `name` varchar(100) NOT NULL COMMENT '真实姓名',
  `gender` char(1) DEFAULT NULL COMMENT '性别 M/F',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱地址',
  `password_hash` varchar(500) NOT NULL COMMENT '加密密码',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `login_attempts` int DEFAULT '0' COMMENT '登录失败次数',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1921053255027154947 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='账户信息表';

SET FOREIGN_KEY_CHECKS = 1;
