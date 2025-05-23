/*
 Navicat Premium Data Transfer

 Source Server         : test_mysql
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : edu_20233067

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 20/05/2025 08:18:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` char(8) NOT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_class_dept` (`dept_id`),
  CONSTRAINT `fk_class_dept` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of classes
-- ----------------------------
BEGIN;
INSERT INTO `classes` (`id`, `dept_id`) VALUES ('190305', 3);
INSERT INTO `classes` (`id`, `dept_id`) VALUES ('190401', 4);
INSERT INTO `classes` (`id`, `dept_id`) VALUES ('190402', 4);
INSERT INTO `classes` (`id`, `dept_id`) VALUES ('200401', 4);
INSERT INTO `classes` (`id`, `dept_id`) VALUES ('200402', 4);
COMMIT;

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` char(11) NOT NULL,
  `teacher_id` char(8) NOT NULL,
  `year` int NOT NULL,
  `grade` int NOT NULL,
  `semester` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_courseinfo_course` (`course_id`),
  KEY `fk_courseinfo_teacher` (`teacher_id`),
  CONSTRAINT `fk_courseinfo_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_courseinfo_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course_info
-- ----------------------------
BEGIN;
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (1, '4MSCT041055', '02100590', 2019, 2019, 1);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (2, '4MSCE041011', '02100596', 2019, 2019, 1);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (3, '4MSCE041036', '02100591', 2020, 2019, 2);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (4, '4MSCT041055', '02100590', 2020, 2020, 1);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (5, '4MSCE041011', '02100596', 2020, 2020, 1);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (6, '4MSCE041027', '02100592', 2020, 2019, 3);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (7, '4MSCE041044', '02100593', 2020, 2019, 3);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (8, '4MSCE041036', '02100591', 2021, 2020, 2);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (9, '4MSCE041021', '02100595', 2021, 2019, 4);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (10, '4MSCE041006', '02100597', 2021, 2019, 4);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (11, '4MSCE041027', '02100592', 2021, 2020, 3);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (12, '4MSCE041044', '02100593', 2021, 2020, 3);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (13, '4MSCE041007', '02100595', 2021, 2019, 5);
INSERT INTO `course_info` (`id`, `course_id`, `teacher_id`, `year`, `grade`, `semester`) VALUES (14, '4MSCE041041', '02100594', 2021, 2019, 5);
COMMIT;

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` char(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `credit` decimal(5,2) NOT NULL,
  `period` int NOT NULL,
  `semester` int NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_dept` (`dept_id`),
  CONSTRAINT `fk_course_dept` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of courses
-- ----------------------------
BEGIN;
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCE041006', '编译原理', 3.00, 48, 4, 4);
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCE041007', '操作系统', 4.00, 64, 5, 4);
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCE041011', '程序设计基础', 4.00, 64, 1, 4);
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCE041021', '计算机组成原理', 4.00, 64, 4, 4);
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCE041027', '面向对象程序设计', 3.00, 48, 3, 4);
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCE041036', '数据结构', 4.00, 64, 2, 4);
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCE041041', '数据库原理及应用', 4.00, 64, 5, 4);
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCE041044', '数字电路与逻辑设计', 3.50, 56, 3, 4);
INSERT INTO `courses` (`id`, `name`, `credit`, `period`, `semester`, `dept_id`) VALUES ('4MSCT041055', '学科概论', 1.00, 16, 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of departments
-- ----------------------------
BEGIN;
INSERT INTO `departments` (`id`, `name`) VALUES (1, '机电工程学院');
INSERT INTO `departments` (`id`, `name`) VALUES (2, '材料科学与工程学院');
INSERT INTO `departments` (`id`, `name`) VALUES (3, '电气与电子工程学院');
INSERT INTO `departments` (`id`, `name`) VALUES (4, '计算机科学与工程学院');
INSERT INTO `departments` (`id`, `name`) VALUES (5, '应用技术学院');
COMMIT;

-- ----------------------------
-- Table structure for scores
-- ----------------------------
DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `student_id` char(8) NOT NULL,
  `cs_id` int NOT NULL,
  `type` char(4) NOT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`cs_id`,`type`),
  KEY `fk_score_courseinfo` (`cs_id`),
  CONSTRAINT `fk_score_courseinfo` FOREIGN KEY (`cs_id`) REFERENCES `course_info` (`id`),
  CONSTRAINT `fk_score_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of scores
-- ----------------------------
BEGIN;
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 1, '正考', 98.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 2, '正考', 87.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 3, '正考', 80.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 6, '正考', 67.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 7, '正考', 53.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 7, '补考', 84.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 9, '正考', 90.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 10, '正考', 62.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 13, '正考', 89.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040001', 14, '正考', 86.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040002', 1, '正考', 61.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040002', 2, '正考', 96.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040002', 3, '正考', 85.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040002', 7, '正考', 72.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040002', 9, '正考', 90.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040002', 10, '正考', 81.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040002', 13, '正考', 71.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040002', 14, '正考', 60.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 1, '正考', 60.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 2, '正考', 67.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 3, '正考', 84.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 7, '正考', 52.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 7, '补考', 63.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 9, '正考', 78.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 10, '正考', 71.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 13, '正考', 88.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040003', 14, '正考', 93.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 1, '正考', 67.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 2, '正考', 97.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 3, '正考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 6, '正考', 50.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 6, '补考', 65.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 7, '正考', 95.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 9, '正考', 72.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 10, '正考', 59.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 10, '补考', 76.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 13, '正考', 78.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040004', 14, '正考', 83.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 1, '正考', 54.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 1, '补考', 65.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 2, '正考', 85.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 3, '正考', 80.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 7, '正考', 67.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 9, '正考', 77.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 10, '正考', 82.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 13, '正考', 76.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040005', 14, '正考', 87.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 1, '正考', 71.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 2, '正考', 84.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 3, '正考', 99.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 6, '正考', 55.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 6, '补考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 7, '正考', 99.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 9, '正考', 68.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 10, '正考', 82.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 13, '正考', 95.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040006', 14, '正考', 84.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 1, '正考', 94.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 2, '正考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 3, '正考', 57.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 3, '补考', 77.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 7, '正考', 95.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 9, '正考', 57.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 9, '补考', 64.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 10, '正考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 13, '正考', 97.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040007', 14, '正考', 61.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 1, '正考', 54.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 1, '补考', 90.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 2, '正考', 76.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 3, '正考', 88.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 6, '正考', 93.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 7, '正考', 80.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 9, '正考', 81.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 10, '正考', 84.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 13, '正考', 52.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 13, '补考', 77.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 14, '正考', 54.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040008', 14, '补考', 84.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 1, '正考', 90.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 2, '正考', 84.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 3, '正考', 68.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 6, '正考', 81.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 7, '正考', 65.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 9, '正考', 85.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 10, '正考', 70.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 13, '正考', 69.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040009', 14, '正考', 87.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 1, '正考', 88.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 2, '正考', 89.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 3, '正考', 76.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 7, '正考', 86.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 9, '正考', 81.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 10, '正考', 51.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 10, '补考', 69.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 13, '正考', 88.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040010', 14, '正考', 71.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 1, '正考', 71.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 2, '正考', 95.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 3, '正考', 75.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 6, '正考', 89.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 7, '正考', 83.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 9, '正考', 50.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 9, '补考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 10, '正考', 94.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 13, '正考', 82.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040011', 14, '正考', 93.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 1, '正考', 88.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 2, '正考', 60.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 3, '正考', 98.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 6, '正考', 64.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 7, '正考', 57.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 7, '补考', 61.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 9, '正考', 58.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 9, '补考', 76.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 10, '正考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 13, '正考', 97.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 14, '正考', 54.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('19040012', 14, '补考', 77.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040001', 4, '正考', 98.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040001', 5, '正考', 73.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040001', 8, '正考', 77.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040001', 11, '正考', 70.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040001', 12, '正考', 96.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040002', 4, '正考', 93.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040002', 5, '正考', 73.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040002', 8, '正考', 82.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040002', 11, '正考', 60.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040003', 4, '正考', 69.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040003', 5, '正考', 97.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040003', 8, '正考', 80.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040003', 11, '正考', 89.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040003', 12, '正考', 89.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040004', 4, '正考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040004', 5, '正考', 67.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040004', 8, '正考', 55.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040004', 8, '补考', 70.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040004', 11, '正考', 67.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040004', 12, '正考', 90.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040005', 4, '正考', 73.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040005', 5, '正考', 92.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040005', 8, '正考', 86.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040005', 11, '正考', 67.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040006', 4, '正考', 69.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040006', 5, '正考', 61.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040006', 8, '正考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040006', 11, '正考', 85.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040007', 4, '正考', 74.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040007', 5, '正考', 80.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040007', 8, '正考', 69.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040007', 11, '正考', 74.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040008', 4, '正考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040008', 5, '正考', 68.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040008', 8, '正考', 96.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040008', 11, '正考', 63.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040008', 12, '正考', 57.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040008', 12, '补考', 86.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040009', 4, '正考', 55.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040009', 4, '补考', 71.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040009', 5, '正考', 97.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040009', 8, '正考', 75.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040009', 11, '正考', 95.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040009', 12, '正考', 97.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040010', 4, '正考', 77.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040010', 5, '正考', 81.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040010', 8, '正考', 88.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040010', 11, '正考', 84.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040010', 12, '正考', 64.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040011', 4, '正考', 69.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040011', 5, '正考', 65.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040011', 8, '正考', 66.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040011', 11, '正考', 87.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040011', 12, '正考', 81.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040012', 4, '正考', 67.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040012', 5, '正考', 82.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040012', 8, '正考', 63.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040012', 11, '正考', 81.00);
INSERT INTO `scores` (`student_id`, `cs_id`, `type`, `score`) VALUES ('20040012', 12, '正考', 63.00);
COMMIT;

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` char(8) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `sex` char(2) NOT NULL,
  `class_id` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stud_class` (`class_id`),
  CONSTRAINT `fk_stud_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of students
-- ----------------------------
BEGIN;
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040001', '魏无羡', '2002-02-05', '男', '190401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040002', '蓝忘机', '2001-10-02', '男', '190401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040003', '温情', '2003-05-06', '女', '190401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040004', '江厌离', '2002-08-06', '女', '190401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040005', '温宁', '2001-06-08', '男', '190401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040006', '江澄', '2001-12-15', '男', '190401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040007', '范闲', '2001-09-20', '男', '190402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040008', '林婉儿', '2002-03-06', '女', '190402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040009', '海棠', '2000-08-13', '女', '190402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040010', '滕梓荆', '2000-03-24', '男', '190402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040011', '范思辙', '2002-11-11', '男', '190402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('19040012', '言冰云', '2000-06-06', '男', '190402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040001', '张长苏', '2003-01-16', '男', '200401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040002', '穆霓凰', '2004-08-25', '女', '200401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040003', '萧景琰', '2003-05-09', '男', '200401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040004', '蒙挚', '2002-09-18', '男', '200401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040005', '夏冬', '2003-07-09', '女', '200401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040006', '秦般若', '2003-08-21', '女', '200401');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040007', '余淮', '2002-05-15', '男', '200402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040008', '耿耿', '2003-09-05', '女', '200402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040009', '路星河', '2001-12-18', '男', '200402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040010', '蒋年年', '2002-11-11', '女', '200402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040011', '韩叙', '2003-04-16', '男', '200402');
INSERT INTO `students` (`id`, `name`, `birthday`, `sex`, `class_id`) VALUES ('20040012', '张平', '2002-07-01', '男', '200402');
COMMIT;

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` char(8) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` char(2) NOT NULL,
  `job_title` varchar(6) NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_dept` (`dept_id`),
  CONSTRAINT `fk_teacher_dept` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teachers
-- ----------------------------
BEGIN;
INSERT INTO `teachers` (`id`, `name`, `sex`, `job_title`, `salary`, `dept_id`) VALUES ('02100590', '李成阳', '男', '副教授', 8800.00, 4);
INSERT INTO `teachers` (`id`, `name`, `sex`, `job_title`, `salary`, `dept_id`) VALUES ('02100591', '林浩', '男', '讲师', 6500.00, 4);
INSERT INTO `teachers` (`id`, `name`, `sex`, `job_title`, `salary`, `dept_id`) VALUES ('02100592', '何勇', '男', '副教授', 8600.00, 4);
INSERT INTO `teachers` (`id`, `name`, `sex`, `job_title`, `salary`, `dept_id`) VALUES ('02100593', '沙瑞金', '男', '教授', 9780.00, 4);
INSERT INTO `teachers` (`id`, `name`, `sex`, `job_title`, `salary`, `dept_id`) VALUES ('02100594', '骆山河', '男', '教授', 9900.00, 4);
INSERT INTO `teachers` (`id`, `name`, `sex`, `job_title`, `salary`, `dept_id`) VALUES ('02100595', '陆亦可', '女', '副教授', 8500.00, 4);
INSERT INTO `teachers` (`id`, `name`, `sex`, `job_title`, `salary`, `dept_id`) VALUES ('02100596', '侯亮平', '男', '讲师', 6500.00, 4);
INSERT INTO `teachers` (`id`, `name`, `sex`, `job_title`, `salary`, `dept_id`) VALUES ('02100597', '李达康', '男', '教授', 8670.00, 4);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
