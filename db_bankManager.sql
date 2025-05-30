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

 Date: 23/05/2025 08:06:20
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
-- Records of bank_card
-- ----------------------------
BEGIN;
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (1, 0, '5170835174', '208410', 1, 0, '2025-05-07 09:27:32', '2025-05-07 09:27:32', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (2, 0, '9851166518', '208410', 1, 0, '2025-05-07 09:40:39', '2025-05-07 09:40:39', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (4, 1918939201894678530, '2136851796', '208410', 1, 0, '2025-05-08 07:12:27', '2025-05-08 07:12:27', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (5, 1918939201894678530, '7082235276', '208410', 1, 0, '2025-05-08 07:13:00', '2025-05-08 07:13:00', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (6, 1918939201894678530, '9543162962', '208410', 1, 0, '2025-05-08 07:13:03', '2025-05-08 07:13:03', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (7, 1918939201894678530, '3929530554', '208410', 1, 0, '2025-05-08 07:13:03', '2025-05-08 07:13:03', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (8, 1918939201894678530, '6981540388', '208410', 1, 0, '2025-05-08 07:13:04', '2025-05-08 07:13:04', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (9, 1918939201894678530, '2162964591', '208410', 1, 0, '2025-05-08 07:13:05', '2025-05-08 07:13:05', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (10, 1918939201894678530, '4947871837', '208410', 1, 0, '2025-05-08 07:13:06', '2025-05-08 07:13:06', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (11, 1918939201894678530, '5437321765', '208410', 1, 0, '2025-05-08 07:26:30', '2025-05-08 07:26:30', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (12, 1918939201894678530, '4630226937', '208410', 1, 0, '2025-05-08 07:26:53', '2025-05-08 07:26:53', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (13, 1918939201894678530, '4346198979', '208410', 1, 0, '2025-05-08 07:27:41', '2025-05-08 07:27:41', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (14, 1918939201894678530, '3140913663', '208410', 1, 0, '2025-05-08 07:29:14', '2025-05-08 07:29:14', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (15, 1918939201894678530, '4216282173', '208410', 1, 0, '2025-05-08 08:03:24', '2025-05-08 08:03:24', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (16, 1920386485219688450, '7004742763', '208410', 1, 0, '2025-05-08 08:04:14', '2025-05-08 08:04:14', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (17, 1920386485219688450, '7556649905', '629f07dd13b10d931b914f9b76959cb0', 1, 0, '2025-05-08 08:38:15', '2025-05-08 08:38:15', 0.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (19, 1921053255027154946, '3427669909', '629f07dd13b10d931b914f9b76959cb0', 1, 0, '2025-05-11 07:24:01', '2025-05-11 07:24:01', -20.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (20, 1921053255027154946, '6417118272', '629f07dd13b10d931b914f9b76959cb0', 1, 0, '2025-05-11 07:39:06', '2025-05-11 07:39:06', 20.00);
INSERT INTO `bank_card` (`card_id`, `user_id`, `card_number`, `pay_password`, `type_id`, `status`, `created_at`, `updated_at`, `balance`) VALUES (1922168580766109697, 1921053255027154946, '3515433880', '629f07dd13b10d931b914f9b76959cb0', 1, 0, '2025-05-13 05:54:36', '2025-05-13 05:54:36', 1000.00);
COMMIT;

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
-- Records of loans
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` datetime NOT NULL,
  `news_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
BEGIN;
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (-1547665407, '123', 'tyt', '2025-05-17 16:11:07', '14b3cd2d69c499a419fdbd09c4912f77f5fdfc90.jpg', 'tyt');
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (2, '数字人民币试点范围扩大至全国28个省市', '中国人民银行数字货币研究所最新宣布，数字人民币试点地区将由原来的11个试点地区扩大至全国28个省市。此次扩容后，数字人民币试点将覆盖全国主要经济区域和城市群，包括京津冀、长三角、粤港澳大湾区、成渝双城经济圈等国家重点战略区域。新版数字人民币APP已上线新功能，支持更多生活场景应用，包括公共交通、政务服务、医疗健康、文化旅游等领域。据统计，截至2023年11月，数字人民币累计交易笔数超过5亿笔，交易金额突破1000亿元，支持商户门店数量超过400万家。此次扩容将进一步检验数字人民币在更大范围、更多场景的应用效果，为未来全面推广积累经验。专家表示，数字人民币的推广将有助于降低支付成本，提高支付效率，增强支付系统的韧性和安全性，同时为货币政策实施提供新的工具和渠道。', '2022-01-06 01:01:54', 'news_photos/digital_yuan.jpg', NULL);
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (3, '商业银行数字化转型加速，金融科技投入持续增加', '根据中国银行业协会最新发布的《2023年中国银行业数字化转型报告》显示，2023年上半年商业银行在金融科技领域的投入总额达到1850亿元，同比增长25.3%。其中，六大国有银行科技投入均超过100亿元，股份制银行科技投入占比普遍超过营业收入的3%。数字化转型已成为银行业共识，主要聚焦在以下几个领域：一是智能风控系统建设，利用大数据和人工智能技术提升风险管理能力；二是开放银行平台搭建，通过API接口实现与第三方机构的场景融合；三是远程银行服务升级，通过视频银行、智能客服等方式提升客户体验；四是数据中台建设，打破数据孤岛，实现数据资产的价值挖掘。报告指出，未来银行业数字化转型将呈现三大趋势：一是从单点突破向全面协同转变；二是从技术应用向业务模式创新深化；三是从内部优化向生态共建扩展。专家建议，银行应平衡创新与风险，在推进数字化转型的同时做好网络安全和数据隐私保护。', '2021-05-29 23:55:13', 'news_photos/bank_digital.jpg', NULL);
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (4, '2023年第三季度GDP同比增长4.9%，经济复苏态势良好', '国家统计局今日发布数据显示，2023年第三季度我国国内生产总值(GDP)同比增长4.9%，环比增长1.3%。1-9月份，全国规模以上工业增加值同比增长4.0%，社会消费品零售总额同比增长6.8%，全国固定资产投资(不含农户)同比增长3.1%。分产业看，第一产业增加值同比增长4.3%，第二产业增长4.6%，第三产业增长5.2%。国家统计局新闻发言人表示，国民经济持续恢复向好，高质量发展扎实推进。具体表现为：工业生产稳步回升，服务业增长较快，市场销售活力增强，固定资产投资规模继续扩大，货物进出口总体平稳，就业形势总体稳定，居民收入平稳增长。但同时也要看到，外部环境更趋复杂严峻，国内需求仍显不足，经济回升向好基础仍需巩固。下一阶段，要着力扩大国内需求，加快建设现代化产业体系，持续深化改革扩大开放，切实保障和改善民生，推动经济实现质的有效提升和量的合理增长。专家分析，随着各项稳增长政策效应持续显现，四季度经济有望保持回升向好态势。', '2024-09-23 17:50:55', 'news_photos/gdp_growth.jpg', NULL);
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (5, '央行发布新规加强商业银行风险管理，要求提高资本充足率', '中国人民银行近日发布《商业银行资本管理办法（修订版）》，要求商业银行进一步提高资本充足率，强化风险管理能力。新规将于2024年6月正式实施，重点加强对系统重要性银行的监管，要求其核心一级资本充足率不低于8.5%。同时，新规优化了风险加权资产计量方法，鼓励银行加大对实体经济支持力度。专家表示，此举有助于防范金融风险，提升银行体系稳健性。', '2020-05-03 04:07:40', 'news_photos/bank_regulation.jpg', NULL);
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (6, '国有大行集体下调存款利率，1年期定存利率降至1.5%', '近日，工商银行、建设银行、农业银行等国有大型商业银行宣布下调人民币存款挂牌利率，其中1年期定期存款利率由1.75%降至1.5%，3年期利率由2.75%降至2.5%。此次调整是继2023年后的又一次降息，旨在降低银行负债成本，推动资金更多流向贷款市场和资本市场。业内人士分析，存款利率下调可能促使部分储户转向理财、基金等投资渠道，以寻求更高收益。', '2021-03-04 11:39:39', 'news_photos/deposit_rate_cut.jpg', NULL);
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (7, '数字人民币试点范围扩大至40城，支持跨境支付应用', '中国人民银行宣布，数字人民币试点城市由原来的23个扩展至40个，新增试点包括哈尔滨、兰州、西宁等城市。同时，数字人民币将探索在跨境贸易、国际支付等场景的应用。央行表示，此举有助于提升支付体系效率，降低交易成本。目前，数字人民币累计交易额已突破1.2万亿元，覆盖零售消费、公共交通、政务服务等多个领域。', '2022-12-01 09:22:36', 'news_photos/digital_yuan.jpg', NULL);
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (8, '银行业不良贷款率降至1.62%，资产质量稳中向好', '银保监会最新数据显示，截至2023年底，商业银行不良贷款率降至1.62%，较年初下降0.08个百分点，连续多个季度保持下降趋势。其中，大型银行不良率维持在1.3%左右，城商行、农商行资产质量也明显改善。专家分析，经济复苏和银行加强不良资产处置是主要原因。未来，银行业将继续优化信贷结构，加大对科技创新、绿色金融等领域的支持。', '2022-11-18 17:58:01', 'news_photos/bank_asset_quality.jpg', NULL);
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (9, '六大行绿色贷款余额超12万亿，碳减排支持工具效果显著', '截至2023年末，六大国有银行绿色贷款余额突破12万亿元，同比增长超30%。其中，碳减排支持工具带动相关贷款投放超1.2万亿元，重点支持清洁能源、节能环保等领域。央行表示，未来将进一步完善绿色金融政策体系，鼓励银行创新绿色信贷、绿色债券等产品，助力‘双碳’目标实现。', '2025-04-27 19:54:38', 'news_photos/green_finance.jpg', NULL);
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (738230274, '123', 'tyt', '2025-05-17 16:13:12', '35cb90b7-fedd-4a39-b458-cfe93216e21b_14b3cd2d69c499a419fdbd09c4912f77f5fdfc90.jpg', 'tyt');
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (1036017665, '123', '你好', '2025-05-17 17:01:49', '9f03ca29-a4c5-4522-8f31-f8b98f8136c7_14b3cd2d69c499a419fdbd09c4912f77f5fdfc90.jpg', 'tyt');
INSERT INTO `news` (`id`, `title`, `content`, `time`, `news_photo`, `author`) VALUES (1853906946, 'tyt', 'tyt', '2025-05-17 17:01:30', 'a4057035-b988-4495-8b4c-63539f37bb1a_120545265_p0_master1200.jpg', 'tyt');
COMMIT;

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
-- Records of transaction_record
-- ----------------------------
BEGIN;
INSERT INTO `transaction_record` (`transaction_id`, `card_id`, `transaction_type`, `amount`, `balance_after`, `related_card_id`, `description`, `created_at`) VALUES (1921475499633184769, 19, 'transfer_out', 0.00, -20.00, 20, 'test', '2025-05-11 08:00:33');
INSERT INTO `transaction_record` (`transaction_id`, `card_id`, `transaction_type`, `amount`, `balance_after`, `related_card_id`, `description`, `created_at`) VALUES (1921475499679322113, 20, 'transfer_in', 0.00, 20.00, 19, 'test', '2025-05-11 08:00:33');
COMMIT;

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

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`user_id`, `id_card`, `name`, `gender`, `phone`, `email`, `password_hash`, `address`, `created_at`, `last_login_time`, `login_attempts`) VALUES (1, '1', '1', '1', '1', '1', '1', '1', '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1);
INSERT INTO `user` (`user_id`, `id_card`, `name`, `gender`, `phone`, `email`, `password_hash`, `address`, `created_at`, `last_login_time`, `login_attempts`) VALUES (1918939201894678530, '1', 'ttt', '1', '1', '2084105638@qq.comm', '962012d09b8170d912f0669f6d7d9d07', NULL, '2025-05-04 08:23:14', '2025-05-08 15:12:16', 0);
INSERT INTO `user` (`user_id`, `id_card`, `name`, `gender`, `phone`, `email`, `password_hash`, `address`, `created_at`, `last_login_time`, `login_attempts`) VALUES (1920050500200337409, '1', 'ttt', '1', '1', '2084105638@qqq.comm', '962012d09b8170d912f0669f6d7d9d07', NULL, NULL, NULL, 0);
INSERT INTO `user` (`user_id`, `id_card`, `name`, `gender`, `phone`, `email`, `password_hash`, `address`, `created_at`, `last_login_time`, `login_attempts`) VALUES (1920386485219688450, '500240200412080892', 'ttt', NULL, '15856067009', NULL, '962012d09b8170d912f0669f6d7d9d07', NULL, NULL, '2025-05-08 16:03:58', 0);
INSERT INTO `user` (`user_id`, `id_card`, `name`, `gender`, `phone`, `email`, `password_hash`, `address`, `created_at`, `last_login_time`, `login_attempts`) VALUES (1920386999441326081, '500240200412080892', 'ttt', NULL, '158560670091', NULL, '962012d09b8170d912f0669f6d7d9d07', NULL, '2025-05-08 15:55:14', NULL, 0);
INSERT INTO `user` (`user_id`, `id_card`, `name`, `gender`, `phone`, `email`, `password_hash`, `address`, `created_at`, `last_login_time`, `login_attempts`) VALUES (1921053255027154946, '500240200412080892', 'tyt', NULL, '1585606700911', NULL, '629f07dd13b10d931b914f9b76959cb0', NULL, '2025-05-10 12:02:42', '2025-05-13 16:34:56', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
