/*
 Navicat Premium Data Transfer

 Source Server         : amo
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : jizhangmanage

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 01/06/2022 13:56:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for count
-- ----------------------------
DROP TABLE IF EXISTS `count`;
CREATE TABLE `count`  (
  `countid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `day` date NOT NULL,
  `outmoney` float(255, 0) NOT NULL,
  `inmoney` float(255, 0) NOT NULL,
  PRIMARY KEY (`countid`) USING BTREE,
  UNIQUE INDEX `day`(`day`, `userid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `count_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of count
-- ----------------------------
INSERT INTO `count` VALUES (2, 6, '2022-04-26', -200, 0);
INSERT INTO `count` VALUES (3, 6, '2022-04-25', -100, 0);
INSERT INTO `count` VALUES (4, 6, '2022-05-01', -202, 0);
INSERT INTO `count` VALUES (5, 6, '2022-05-02', -251, 100);
INSERT INTO `count` VALUES (6, 6, '2021-05-03', 0, 0);
INSERT INTO `count` VALUES (7, 6, '2022-05-05', 0, 0);
INSERT INTO `count` VALUES (8, 4, '2022-05-08', -200, 0);
INSERT INTO `count` VALUES (9, 9, '2022-05-09', -300, 1000);
INSERT INTO `count` VALUES (10, 18, '2022-05-10', -320, 3000);
INSERT INTO `count` VALUES (11, 21, '2022-05-18', -320, 0);
INSERT INTO `count` VALUES (12, 22, '2022-05-26', -300, 0);
INSERT INTO `count` VALUES (31, 27, '2022-05-26', -300, 0);
INSERT INTO `count` VALUES (32, 30, '2022-05-27', -150, 0);
INSERT INTO `count` VALUES (33, 30, '2022-04-10', -448, 0);
INSERT INTO `count` VALUES (34, 30, '2022-04-23', -700, 0);
INSERT INTO `count` VALUES (35, 30, '2022-04-22', 0, 700);
INSERT INTO `count` VALUES (36, 30, '2022-04-26', -4900, 0);
INSERT INTO `count` VALUES (37, 30, '2022-04-20', 0, 350);
INSERT INTO `count` VALUES (38, 30, '2022-04-19', -700, 0);
INSERT INTO `count` VALUES (39, 31, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (40, 31, '2022-04-10', -64, 0);
INSERT INTO `count` VALUES (41, 31, '2022-04-23', -100, 0);
INSERT INTO `count` VALUES (42, 31, '2022-04-22', 0, 100);
INSERT INTO `count` VALUES (43, 31, '2022-04-26', -700, 0);
INSERT INTO `count` VALUES (44, 31, '2022-04-20', 0, 50);
INSERT INTO `count` VALUES (45, 31, '2022-04-19', -100, 0);
INSERT INTO `count` VALUES (46, 33, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (47, 33, '2022-04-10', -64, 0);
INSERT INTO `count` VALUES (48, 33, '2022-04-23', -100, 0);
INSERT INTO `count` VALUES (49, 33, '2022-04-22', 0, 100);
INSERT INTO `count` VALUES (50, 33, '2022-04-26', -700, 0);
INSERT INTO `count` VALUES (51, 33, '2022-04-20', 0, 50);
INSERT INTO `count` VALUES (52, 33, '2022-04-19', -100, 0);
INSERT INTO `count` VALUES (53, 34, '2022-05-27', -100, 0);
INSERT INTO `count` VALUES (54, 35, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (55, 35, '2022-04-10', -64, 0);
INSERT INTO `count` VALUES (56, 35, '2022-04-23', -100, 0);
INSERT INTO `count` VALUES (57, 35, '2022-04-22', 0, 100);
INSERT INTO `count` VALUES (58, 35, '2022-04-26', -700, 0);
INSERT INTO `count` VALUES (59, 35, '2022-04-20', 0, 50);
INSERT INTO `count` VALUES (60, 35, '2022-04-19', -100, 0);
INSERT INTO `count` VALUES (61, 37, '2022-05-27', -100, 0);
INSERT INTO `count` VALUES (62, 39, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (63, 40, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (64, 41, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (65, 44, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (66, 44, '2022-04-10', -64, 0);
INSERT INTO `count` VALUES (67, 44, '2022-04-23', -100, 0);
INSERT INTO `count` VALUES (68, 44, '2022-04-22', 0, 100);
INSERT INTO `count` VALUES (69, 44, '2022-04-26', -700, 0);
INSERT INTO `count` VALUES (70, 44, '2022-04-20', 0, 50);
INSERT INTO `count` VALUES (71, 44, '2022-04-19', -100, 0);
INSERT INTO `count` VALUES (72, 49, '2022-05-27', -200, 0);
INSERT INTO `count` VALUES (73, 50, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (74, 51, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (75, 51, '2022-04-10', -64, 0);
INSERT INTO `count` VALUES (76, 51, '2022-04-23', -100, 0);
INSERT INTO `count` VALUES (77, 51, '2022-04-22', 0, 100);
INSERT INTO `count` VALUES (78, 51, '2022-04-26', -700, 0);
INSERT INTO `count` VALUES (79, 51, '2022-04-20', 0, 50);
INSERT INTO `count` VALUES (80, 51, '2022-04-19', -100, 0);
INSERT INTO `count` VALUES (81, 52, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (82, 52, '2022-04-10', -64, 0);
INSERT INTO `count` VALUES (83, 52, '2022-04-23', -100, 0);
INSERT INTO `count` VALUES (84, 52, '2022-04-22', 0, 100);
INSERT INTO `count` VALUES (85, 52, '2022-04-26', -700, 0);
INSERT INTO `count` VALUES (86, 52, '2022-04-20', 0, 50);
INSERT INTO `count` VALUES (87, 52, '2022-04-19', -100, 0);
INSERT INTO `count` VALUES (88, 54, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (89, 57, '2022-05-27', -300, 0);
INSERT INTO `count` VALUES (90, 57, '2022-04-10', -64, 0);
INSERT INTO `count` VALUES (91, 57, '2022-04-23', -100, 0);
INSERT INTO `count` VALUES (92, 57, '2022-04-22', 0, 100);
INSERT INTO `count` VALUES (93, 57, '2022-04-26', -700, 0);
INSERT INTO `count` VALUES (94, 57, '2022-04-20', 0, 50);
INSERT INTO `count` VALUES (95, 57, '2022-04-19', -100, 0);
INSERT INTO `count` VALUES (96, 58, '2022-05-27', -100, 0);
INSERT INTO `count` VALUES (97, 58, '2022-04-10', -64, 0);
INSERT INTO `count` VALUES (98, 58, '2022-04-23', -100, 0);
INSERT INTO `count` VALUES (99, 58, '2022-04-22', 0, 100);
INSERT INTO `count` VALUES (100, 58, '2022-04-26', -700, 0);
INSERT INTO `count` VALUES (101, 58, '2022-04-20', 0, 50);
INSERT INTO `count` VALUES (102, 58, '2022-04-19', -100, 0);
INSERT INTO `count` VALUES (103, 59, '2022-05-27', -100, 0);

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `payid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `paytypeid` int(0) NOT NULL,
  `payname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`payid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `paytype`(`paytypeid`) USING BTREE,
  CONSTRAINT `pay_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_ibfk_2` FOREIGN KEY (`paytypeid`) REFERENCES `paytype` (`paytypeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (1, 6, 10, '私房钱', 2996.41, '2022-03-16 20:36:52', '2022-03-16 20:36:57');
INSERT INTO `pay` VALUES (4, 6, 10, '11', 600, '2022-04-19 20:44:52', '2022-04-19 20:44:55');
INSERT INTO `pay` VALUES (7, 6, 20, '微信啊2', 1000, '2022-04-19 20:41:56', '2022-04-19 20:41:56');
INSERT INTO `pay` VALUES (10, 10, 12, '微信2', 1100, '2022-04-20 19:38:40', '2022-04-20 19:38:40');
INSERT INTO `pay` VALUES (11, 10, 12, '微信33', 1900, '2022-04-20 21:34:28', '2022-04-20 21:34:28');
INSERT INTO `pay` VALUES (12, 13, 12, '微信2', 800, '2022-04-21 11:38:08', '2022-04-21 11:38:08');
INSERT INTO `pay` VALUES (13, 14, 12, '微信2', 800, '2022-04-21 12:05:58', '2022-04-21 12:05:58');
INSERT INTO `pay` VALUES (15, 12, 12, '微信4', 800, '2022-04-21 14:05:11', '2022-04-21 14:05:11');
INSERT INTO `pay` VALUES (16, 10, 12, '微信4', 800, '2022-04-21 14:12:17', '2022-04-21 14:12:17');
INSERT INTO `pay` VALUES (17, 15, 12, '微信', 800, '2022-04-21 15:40:11', '2022-04-21 15:40:11');
INSERT INTO `pay` VALUES (28, 6, 12, '的撒', 45200, '2022-04-25 13:59:01', '2022-04-25 13:59:01');
INSERT INTO `pay` VALUES (29, 4, 12, '微信', 1800, '2022-05-08 21:06:11', '2022-05-08 21:06:11');
INSERT INTO `pay` VALUES (30, 9, 12, '微信1', 3000, '2022-05-09 20:03:37', '2022-05-09 20:03:37');
INSERT INTO `pay` VALUES (32, 9, 12, 'weix2', 400, '2022-05-09 20:38:08', '2022-05-09 20:38:08');
INSERT INTO `pay` VALUES (33, 18, 12, '微信', 3200, '2022-05-10 15:12:38', '2022-05-10 15:12:38');
INSERT INTO `pay` VALUES (34, 18, 13, '支付宝', 1800, '2022-05-10 15:13:25', '2022-05-10 15:13:25');
INSERT INTO `pay` VALUES (35, 6, 21, '凤凰于飞', -2000, '2022-05-10 18:19:55', '2022-05-10 18:19:55');
INSERT INTO `pay` VALUES (36, 18, 21, '554', -2000, '2022-05-10 18:34:43', '2022-05-10 18:34:43');
INSERT INTO `pay` VALUES (38, 22, 12, '微信2', 1300, '2022-05-26 19:49:30', '2022-05-26 19:49:30');
INSERT INTO `pay` VALUES (39, 22, 13, '支付宝1', 17900, '2022-05-26 19:50:49', '2022-05-26 19:50:49');
INSERT INTO `pay` VALUES (41, 24, 12, '微信1', 800, '2022-05-27 09:20:09', '2022-05-27 09:20:09');
INSERT INTO `pay` VALUES (42, 24, 13, '支付宝1', 2100, '2022-05-27 09:20:48', '2022-05-27 09:20:48');
INSERT INTO `pay` VALUES (43, 6, 11, 'da', 200, '2022-05-27 09:49:38', '2022-05-27 09:49:38');
INSERT INTO `pay` VALUES (44, 22, 11, '会更好', 0, '2022-05-27 10:02:39', '2022-05-27 10:02:39');
INSERT INTO `pay` VALUES (45, 27, 12, '微信1', 1200, '2022-05-27 10:24:55', '2022-05-27 10:24:55');
INSERT INTO `pay` VALUES (46, 27, 13, '支付宝1', 1800, '2022-05-27 10:25:39', '2022-05-27 10:25:39');
INSERT INTO `pay` VALUES (47, 31, 12, '微信1', 1100, '2022-05-27 12:10:09', '2022-05-27 12:10:09');
INSERT INTO `pay` VALUES (48, 31, 13, '支付宝1', 2000, '2022-05-27 12:10:45', '2022-05-27 12:10:45');
INSERT INTO `pay` VALUES (49, 33, 12, '微信1', 2500, '2022-05-27 12:34:08', '2022-05-27 12:34:08');
INSERT INTO `pay` VALUES (51, 35, 12, '微信1', 1100, '2022-05-27 12:56:31', '2022-05-27 12:56:31');
INSERT INTO `pay` VALUES (52, 35, 13, '支付宝1', 1700, '2022-05-27 12:57:11', '2022-05-27 12:57:11');
INSERT INTO `pay` VALUES (53, 37, 12, '微信1', 1000, '2022-05-27 13:16:40', '2022-05-27 13:16:40');
INSERT INTO `pay` VALUES (54, 39, 12, '微信1', 1300, '2022-05-27 13:25:05', '2022-05-27 13:25:05');
INSERT INTO `pay` VALUES (56, 40, 12, '微信1', 800, '2022-05-27 13:29:11', '2022-05-27 13:29:11');
INSERT INTO `pay` VALUES (57, 41, 12, '微信1', 1000, '2022-05-27 13:31:56', '2022-05-27 13:31:56');
INSERT INTO `pay` VALUES (58, 44, 12, '微信1', 2500, '2022-05-27 13:39:28', '2022-05-27 13:39:28');
INSERT INTO `pay` VALUES (60, 49, 12, '微信1', 900, '2022-05-27 13:55:41', '2022-05-27 13:55:41');
INSERT INTO `pay` VALUES (61, 50, 12, '微信1', 800, '2022-05-27 13:58:17', '2022-05-27 13:58:17');
INSERT INTO `pay` VALUES (62, 51, 12, '微信1', 2300, '2022-05-27 14:02:05', '2022-05-27 14:02:05');
INSERT INTO `pay` VALUES (64, 52, 12, '微信1', 2600, '2022-05-27 14:06:45', '2022-05-27 14:06:45');
INSERT INTO `pay` VALUES (66, 54, 12, '微信1', 1000, '2022-05-27 18:26:42', '2022-05-27 18:26:42');
INSERT INTO `pay` VALUES (68, 57, 12, '微信1', 800, '2022-05-27 18:33:37', '2022-05-27 18:33:37');
INSERT INTO `pay` VALUES (69, 58, 12, '微信', 900, '2022-05-27 18:36:53', '2022-05-27 18:36:53');
INSERT INTO `pay` VALUES (70, 59, 12, '微信1', 900, '2022-05-27 18:45:42', '2022-05-27 18:45:42');

-- ----------------------------
-- Table structure for paytype
-- ----------------------------
DROP TABLE IF EXISTS `paytype`;
CREATE TABLE `paytype`  (
  `paytypeid` int(0) NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `category_level` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`paytypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paytype
-- ----------------------------
INSERT INTO `paytype` VALUES (1, '普通账户', '2022-03-16 20:35:47', '2022-03-16 20:35:49', NULL);
INSERT INTO `paytype` VALUES (2, '信用账户', '2022-03-16 21:23:22', '2022-03-16 21:23:24', NULL);
INSERT INTO `paytype` VALUES (3, '投资账户', '2022-03-16 21:23:27', '2022-03-16 21:23:31', NULL);
INSERT INTO `paytype` VALUES (4, '充值账户', '2022-03-16 21:23:33', '2022-03-16 21:23:36', NULL);
INSERT INTO `paytype` VALUES (5, '其他', '2022-03-16 21:23:38', '2022-03-16 21:23:41', NULL);
INSERT INTO `paytype` VALUES (10, '现金', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 1);
INSERT INTO `paytype` VALUES (11, '储蓄卡', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 1);
INSERT INTO `paytype` VALUES (12, '微信', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 1);
INSERT INTO `paytype` VALUES (13, '支付宝', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 1);
INSERT INTO `paytype` VALUES (14, '云闪付', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 1);
INSERT INTO `paytype` VALUES (15, '其他', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 1);
INSERT INTO `paytype` VALUES (20, '信用卡', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 2);
INSERT INTO `paytype` VALUES (21, '花呗', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 2);
INSERT INTO `paytype` VALUES (22, '借呗', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 2);
INSERT INTO `paytype` VALUES (23, '京东白条', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 2);
INSERT INTO `paytype` VALUES (24, '其他', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 2);
INSERT INTO `paytype` VALUES (30, '股票', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 3);
INSERT INTO `paytype` VALUES (31, '基金', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 3);
INSERT INTO `paytype` VALUES (32, '其他', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 3);
INSERT INTO `paytype` VALUES (40, '饭卡', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 4);
INSERT INTO `paytype` VALUES (41, '公交卡', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 4);
INSERT INTO `paytype` VALUES (42, '会员卡', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 4);
INSERT INTO `paytype` VALUES (43, '其他', '2022-03-16 21:23:44', '2022-03-16 21:23:46', 4);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `pid` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '角色管理', '角色管理', 'rolemanagement');
INSERT INTO `permission` VALUES (2, '用户管理', '用户管理', 'usermanagement');
INSERT INTO `permission` VALUES (3, '权限分配', '权限管理', 'permission');
INSERT INTO `permission` VALUES (4, '个人中心', '个人中心', 'personal');
INSERT INTO `permission` VALUES (8, '记账', '提交记账内容', 'bookkeeping');
INSERT INTO `permission` VALUES (9, '资产账户管理', '资产账户管理', 'accounts');
INSERT INTO `permission` VALUES (10, '统计', '统计', 'count');

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records`  (
  `recordid` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `recordname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount` float NOT NULL,
  `recordtime` date NOT NULL,
  `type` tinyint(0) NOT NULL COMMENT '出账和入账',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收支类型',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `payid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`recordid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `payid`(`payid`) USING BTREE,
  CONSTRAINT `records_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `records_ibfk_2` FOREIGN KEY (`payid`) REFERENCES `pay` (`payid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 368 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES (35, 10, NULL, -100, '2022-04-20', 0, '三餐', '888', '2022-04-20 12:27:24', '2022-04-20 12:27:24', NULL);
INSERT INTO `records` VALUES (36, 10, NULL, -200, '2022-04-20', 0, '吃饭', '666', '2022-04-20 12:28:57', '2022-04-20 12:28:57', NULL);
INSERT INTO `records` VALUES (37, 10, NULL, 1000, '2022-04-20', 1, '奖金', '单独', '2022-04-20 12:30:36', '2022-04-20 12:30:36', NULL);
INSERT INTO `records` VALUES (38, 10, NULL, -100, '2022-04-20', 0, '通信', '话费', '2022-04-20 14:09:53', '2022-04-20 14:09:53', NULL);
INSERT INTO `records` VALUES (39, 11, NULL, -100, '2022-04-20', 0, '通信', '话费', '2022-04-20 14:11:36', '2022-04-20 14:11:36', NULL);
INSERT INTO `records` VALUES (40, 11, NULL, -100, '2022-04-20', 0, '通信', '话费', '2022-04-20 14:13:12', '2022-04-20 14:13:12', NULL);
INSERT INTO `records` VALUES (41, 11, NULL, 1000, '2022-04-20', 1, '奖金', '111', '2022-04-20 14:33:04', '2022-04-20 14:33:04', NULL);
INSERT INTO `records` VALUES (42, 12, NULL, -200, '2022-04-20', 0, '通信', '话费', '2022-04-20 17:21:07', '2022-04-20 17:21:07', NULL);
INSERT INTO `records` VALUES (44, 10, NULL, -100, '2022-04-20', 0, '三餐', '', '2022-04-20 19:36:21', '2022-04-20 19:36:21', NULL);
INSERT INTO `records` VALUES (45, 10, NULL, -100, '2022-04-20', 0, '通信', '话费', '2022-04-20 19:38:57', '2022-04-20 19:38:57', 10);
INSERT INTO `records` VALUES (46, 10, NULL, 1000, '2022-04-20', 1, '奖金', '', '2022-04-20 21:22:05', '2022-04-20 21:22:05', 10);
INSERT INTO `records` VALUES (47, 10, NULL, -100, '2022-04-20', 0, '湖', '', '2022-04-20 21:23:49', '2022-04-20 21:23:49', 10);
INSERT INTO `records` VALUES (49, 10, NULL, -50.53, '2022-04-15', 0, '三餐', '香啊是', '2022-04-20 21:28:08', '2022-04-20 21:28:08', 1);
INSERT INTO `records` VALUES (52, 10, NULL, -100, '2022-04-20', 0, '通信', '话费', '2022-04-20 21:33:47', '2022-04-20 21:33:47', NULL);
INSERT INTO `records` VALUES (53, 10, NULL, 1000, '2022-04-20', 1, '奖金', '啊啊啊', '2022-04-20 21:34:03', '2022-04-20 21:34:03', NULL);
INSERT INTO `records` VALUES (54, 10, NULL, -100, '2022-04-20', 0, '吃饭', '呃呃', '2022-04-20 21:34:46', '2022-04-20 21:34:46', 11);
INSERT INTO `records` VALUES (55, 10, NULL, 200, '2022-04-20', 1, '中奖', '请求其', '2022-04-20 21:35:35', '2022-04-20 21:35:35', 10);
INSERT INTO `records` VALUES (56, 13, NULL, -100, '2022-04-21', 0, '通信', '话费', '2022-04-21 11:37:50', '2022-04-21 11:37:50', NULL);
INSERT INTO `records` VALUES (57, 13, NULL, -200, '2022-04-21', 0, '通信', '000', '2022-04-21 11:38:38', '2022-04-21 11:38:38', 12);
INSERT INTO `records` VALUES (58, 14, NULL, -100, '2022-04-21', 0, '通信', '话费', '2022-04-21 12:05:34', '2022-04-21 12:05:34', NULL);
INSERT INTO `records` VALUES (59, 14, NULL, -200, '2022-04-21', 0, '电费', '000', '2022-04-21 12:06:54', '2022-04-21 12:06:54', 13);
INSERT INTO `records` VALUES (62, 12, NULL, -100, '2022-04-21', 0, '通信', '000', '2022-04-21 14:04:55', '2022-04-21 14:04:55', NULL);
INSERT INTO `records` VALUES (63, 12, NULL, -200, '2022-04-21', 0, '购物', '000', '2022-04-21 14:05:28', '2022-04-21 14:05:28', 15);
INSERT INTO `records` VALUES (64, 10, NULL, -100, '2022-04-21', 0, '通信', '000', '2022-04-21 14:11:57', '2022-04-21 14:11:57', NULL);
INSERT INTO `records` VALUES (65, 10, NULL, -200, '2022-04-21', 0, '购物', '00', '2022-04-21 14:12:29', '2022-04-21 14:12:29', 16);
INSERT INTO `records` VALUES (66, 15, NULL, -100, '2022-04-21', 0, '通信', '111', '2022-04-21 15:39:53', '2022-04-21 15:39:53', NULL);
INSERT INTO `records` VALUES (67, 15, NULL, -200, '2022-04-21', 0, '购物', '00', '2022-04-21 15:40:28', '2022-04-21 15:40:28', 17);
INSERT INTO `records` VALUES (83, 6, NULL, 100, '2022-04-22', 0, '内部转账', '', '2022-04-22 21:53:58', '2022-04-22 21:53:58', 7);
INSERT INTO `records` VALUES (84, 6, NULL, -100, '2022-04-22', 0, '内部转账', '', '2022-04-22 21:57:40', '2022-04-22 21:57:40', 7);
INSERT INTO `records` VALUES (85, 6, NULL, 100, '2022-04-22', 1, '内部转账', '', '2022-04-22 21:57:40', '2022-04-22 21:57:40', 7);
INSERT INTO `records` VALUES (86, 6, NULL, -100, '2022-04-22', 0, '内部转账', '', '2022-04-22 22:01:28', '2022-04-22 22:01:28', 7);
INSERT INTO `records` VALUES (88, 6, NULL, -100, '2022-04-22', 0, '内部转账', '', '2022-04-22 22:02:04', '2022-04-22 22:02:04', 7);
INSERT INTO `records` VALUES (93, 6, NULL, 100, '2022-04-22', 1, '内部转账', '', '2022-04-22 22:03:18', '2022-04-22 22:03:18', 7);
INSERT INTO `records` VALUES (102, 6, NULL, -100, '2022-04-25', 0, '通信', '大苏打', '2022-04-25 13:59:37', '2022-04-25 13:59:37', 28);
INSERT INTO `records` VALUES (103, 6, NULL, -200, '2022-04-26', 0, 'fhb', '三餐', '2022-04-26 09:57:12', '2022-04-26 09:57:12', 28);
INSERT INTO `records` VALUES (106, 6, NULL, -50.53, '2022-05-01', 0, '三餐', '香啊是', '2022-05-01 13:29:57', '2022-05-01 13:29:57', 1);
INSERT INTO `records` VALUES (107, 6, NULL, -50.53, '2022-05-01', 0, '三餐', '香啊是', '2022-05-01 13:41:31', '2022-05-01 13:41:31', 1);
INSERT INTO `records` VALUES (108, 6, NULL, -50.53, '2022-05-01', 0, '三餐', '香啊是', '2022-05-01 13:41:51', '2022-05-01 13:41:51', 1);
INSERT INTO `records` VALUES (109, 6, NULL, -50.53, '2022-05-01', 0, '三餐', '香啊是', '2022-05-01 13:42:09', '2022-05-01 13:42:09', 1);
INSERT INTO `records` VALUES (110, 6, NULL, -50.53, '2022-05-02', 0, '三餐', '香啊是', '2022-05-01 13:43:24', '2022-05-01 13:43:24', 1);
INSERT INTO `records` VALUES (111, 6, NULL, 100, '2022-05-02', 1, '三餐', '香啊是', '2022-05-01 14:32:22', '2022-05-01 14:32:22', 1);
INSERT INTO `records` VALUES (119, 6, NULL, -200, '2022-05-02', 0, '美食', '好吃', '2022-05-02 15:36:56', '2022-05-02 15:36:56', 28);
INSERT INTO `records` VALUES (123, 6, NULL, -700, '2022-05-03', 0, '还款', '', '2022-05-02 21:27:29', '2022-05-02 21:27:29', NULL);
INSERT INTO `records` VALUES (138, 6, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-03 15:44:44', '2022-05-03 15:44:44', NULL);
INSERT INTO `records` VALUES (139, 6, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-03 15:44:44', '2022-05-03 15:44:44', NULL);
INSERT INTO `records` VALUES (140, 6, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-03 15:44:44', '2022-05-03 15:44:44', NULL);
INSERT INTO `records` VALUES (141, 6, NULL, -700, '2022-04-22', 0, '还款', '', '2022-05-03 15:44:44', '2022-05-03 15:44:44', NULL);
INSERT INTO `records` VALUES (142, 6, NULL, 50, '2022-04-19', 1, '返利', '', '2022-05-03 15:44:44', '2022-05-03 15:44:44', NULL);
INSERT INTO `records` VALUES (143, 6, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-03 15:44:44', '2022-05-03 15:44:44', NULL);
INSERT INTO `records` VALUES (145, 4, NULL, -100, '2022-05-02', 0, '购物', '', '2022-05-08 21:05:55', '2022-05-08 21:05:55', NULL);
INSERT INTO `records` VALUES (147, 4, NULL, -200, '2022-05-08', 0, '吃饭', '', '2022-05-08 21:11:27', '2022-05-08 21:11:27', 29);
INSERT INTO `records` VALUES (148, 9, NULL, -100, '2022-05-09', 0, '美食', '好吃', '2022-05-09 20:00:25', '2022-05-09 20:00:25', NULL);
INSERT INTO `records` VALUES (149, 9, NULL, 1000, '2022-05-09', 1, '奖金', '奖励', '2022-05-09 20:00:44', '2022-05-09 20:00:44', NULL);
INSERT INTO `records` VALUES (150, 9, NULL, -200, '2022-05-09', 0, '通信', '', '2022-05-09 20:03:53', '2022-05-09 20:03:53', 30);
INSERT INTO `records` VALUES (152, 9, NULL, 200, '2022-05-09', 1, '内部转账', '', '2022-05-09 20:04:57', '2022-05-09 20:04:57', 30);
INSERT INTO `records` VALUES (154, 9, NULL, 200, '2022-05-09', 1, '内部转账', '', '2022-05-09 20:06:06', '2022-05-09 20:06:06', 30);
INSERT INTO `records` VALUES (155, 9, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-09 20:13:17', '2022-05-09 20:13:17', NULL);
INSERT INTO `records` VALUES (156, 9, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-09 20:13:17', '2022-05-09 20:13:17', NULL);
INSERT INTO `records` VALUES (157, 9, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-09 20:13:17', '2022-05-09 20:13:17', NULL);
INSERT INTO `records` VALUES (158, 9, NULL, -700, '2022-04-22', 0, '还款', '', '2022-05-09 20:13:17', '2022-05-09 20:13:17', NULL);
INSERT INTO `records` VALUES (159, 9, NULL, 50, '2022-04-19', 1, '返利', '', '2022-05-09 20:13:17', '2022-05-09 20:13:17', NULL);
INSERT INTO `records` VALUES (160, 9, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-09 20:13:17', '2022-05-09 20:13:17', NULL);
INSERT INTO `records` VALUES (161, 9, NULL, -200, '2022-05-09', 0, '内部转账', '', '2022-05-09 20:38:23', '2022-05-09 20:38:23', 32);
INSERT INTO `records` VALUES (162, 9, NULL, 200, '2022-05-09', 1, '内部转账', '', '2022-05-09 20:38:23', '2022-05-09 20:38:23', 30);
INSERT INTO `records` VALUES (163, 9, NULL, -200, '2022-05-09', 0, '内部转账', '', '2022-05-09 20:44:21', '2022-05-09 20:44:21', 32);
INSERT INTO `records` VALUES (164, 9, NULL, 200, '2022-05-09', 1, '内部转账', '', '2022-05-09 20:44:21', '2022-05-09 20:44:21', 30);
INSERT INTO `records` VALUES (165, 9, NULL, -200, '2022-05-09', 0, '内部转账', '', '2022-05-09 21:18:29', '2022-05-09 21:18:29', 32);
INSERT INTO `records` VALUES (166, 9, NULL, 200, '2022-05-09', 1, '内部转账', '', '2022-05-09 21:18:29', '2022-05-09 21:18:29', 30);
INSERT INTO `records` VALUES (167, 18, NULL, -100, '2022-05-10', 0, '话费', '150', '2022-05-10 15:10:21', '2022-05-10 15:10:21', NULL);
INSERT INTO `records` VALUES (168, 18, NULL, -200, '2022-05-10', 0, '充值饭卡', '', '2022-05-10 15:10:37', '2022-05-10 15:10:37', NULL);
INSERT INTO `records` VALUES (169, 18, NULL, 1000, '2022-05-10', 1, '红包', '', '2022-05-10 15:10:49', '2022-05-10 15:10:49', NULL);
INSERT INTO `records` VALUES (170, 18, NULL, -20, '2022-05-10', 0, '吃饭', '午餐', '2022-05-10 15:12:54', '2022-05-10 15:12:54', 33);
INSERT INTO `records` VALUES (171, 18, NULL, -20, '2022-05-10', 0, '内部转账', '', '2022-05-10 15:13:35', '2022-05-10 15:13:35', 34);
INSERT INTO `records` VALUES (172, 18, NULL, 20, '2022-05-10', 1, '内部转账', '', '2022-05-10 15:13:35', '2022-05-10 15:13:35', 33);
INSERT INTO `records` VALUES (173, 18, NULL, -200, '2022-05-10', 0, '内部转账', '', '2022-05-10 15:27:27', '2022-05-10 15:27:27', 34);
INSERT INTO `records` VALUES (174, 18, NULL, 200, '2022-05-10', 1, '内部转账', '', '2022-05-10 15:27:27', '2022-05-10 15:27:27', 33);
INSERT INTO `records` VALUES (175, 18, NULL, 2000, '2022-05-10', 1, '打金', '', '2022-05-10 16:24:52', '2022-05-10 16:24:52', 33);
INSERT INTO `records` VALUES (179, 22, NULL, -100, '2022-05-26', 0, '话费', '移动 150', '2022-05-26 19:48:59', '2022-05-26 19:48:59', NULL);
INSERT INTO `records` VALUES (180, 22, NULL, -200, '2022-05-26', 0, '买书', '学习资料', '2022-05-26 19:49:49', '2022-05-26 19:49:49', 38);
INSERT INTO `records` VALUES (181, 22, NULL, -200, '2022-05-26', 0, '内部转账', '', '2022-05-26 19:51:00', '2022-05-26 19:51:00', 39);
INSERT INTO `records` VALUES (182, 22, NULL, 200, '2022-05-26', 1, '内部转账', '', '2022-05-26 19:51:00', '2022-05-26 19:51:00', 38);
INSERT INTO `records` VALUES (184, 22, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-26 20:00:33', '2022-05-26 20:00:33', NULL);
INSERT INTO `records` VALUES (185, 22, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-26 20:00:33', '2022-05-26 20:00:33', NULL);
INSERT INTO `records` VALUES (186, 22, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-26 20:00:33', '2022-05-26 20:00:33', NULL);
INSERT INTO `records` VALUES (187, 22, NULL, -700, '2022-04-22', 0, '还款', '', '2022-05-26 20:00:33', '2022-05-26 20:00:33', NULL);
INSERT INTO `records` VALUES (188, 22, NULL, 50, '2022-04-19', 1, '返利', '', '2022-05-26 20:00:33', '2022-05-26 20:00:33', NULL);
INSERT INTO `records` VALUES (189, 22, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-26 20:00:33', '2022-05-26 20:00:33', NULL);
INSERT INTO `records` VALUES (190, 24, NULL, -100, '2022-05-27', 0, '话费', '移动150', '2022-05-27 09:19:53', '2022-05-27 09:19:53', NULL);
INSERT INTO `records` VALUES (191, 24, NULL, -200, '2022-05-27', 0, '购物', '衣服', '2022-05-27 09:20:25', '2022-05-27 09:20:25', 41);
INSERT INTO `records` VALUES (192, 24, NULL, 1000, '2022-05-26', 1, '奖金', '奖励', '2022-05-27 09:21:09', '2022-05-27 09:21:09', 42);
INSERT INTO `records` VALUES (193, 24, NULL, 100, '2022-05-27', 1, '现金', '', '2022-05-27 09:22:13', '2022-05-27 09:22:13', 42);
INSERT INTO `records` VALUES (194, 25, NULL, -100, '2022-05-27', 0, '话费', '移动150', '2022-05-27 09:28:20', '2022-05-27 09:28:20', NULL);
INSERT INTO `records` VALUES (195, 25, NULL, -100, '2022-05-27', 0, '话费', '移动150', '2022-05-27 09:28:25', '2022-05-27 09:28:25', NULL);
INSERT INTO `records` VALUES (196, 25, NULL, -100, '2022-05-27', 0, '话费', '移动150', '2022-05-27 09:28:49', '2022-05-27 09:28:49', NULL);
INSERT INTO `records` VALUES (197, 26, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 09:30:51', '2022-05-27 09:30:51', NULL);
INSERT INTO `records` VALUES (198, 26, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 09:30:56', '2022-05-27 09:30:56', NULL);
INSERT INTO `records` VALUES (199, 26, NULL, -100, '2022-05-27', 0, 'sdfds', 'sac', '2022-05-27 09:35:28', '2022-05-27 09:35:28', NULL);
INSERT INTO `records` VALUES (200, 26, NULL, -100, '2022-05-27', 0, 'fsd', 'fdsf', '2022-05-27 09:36:53', '2022-05-27 09:36:53', NULL);
INSERT INTO `records` VALUES (201, 6, NULL, -100, '2022-05-27', 0, 'sdf', '', '2022-05-27 09:44:24', '2022-05-27 09:44:24', 35);
INSERT INTO `records` VALUES (202, 6, NULL, -50.53, '2022-04-15', 0, '三餐', '香啊是', '2022-05-27 09:46:16', '2022-05-27 09:46:16', 1);
INSERT INTO `records` VALUES (203, 6, NULL, -50.53, '2022-04-15', 0, '三餐', '香啊是', '2022-05-27 09:47:06', '2022-05-27 09:47:06', 1);
INSERT INTO `records` VALUES (204, 6, NULL, -100, '2022-05-27', 0, 'dsfds', '', '2022-05-27 09:49:56', '2022-05-27 09:49:56', 43);
INSERT INTO `records` VALUES (205, 6, NULL, -100, '2022-05-27', 0, 'tgf', '434', '2022-05-27 09:54:40', '2022-05-27 09:54:40', 43);
INSERT INTO `records` VALUES (206, 6, NULL, -50.53, '2022-04-15', 0, '三餐', '香啊是', '2022-05-27 09:58:02', '2022-05-27 09:58:02', 1);
INSERT INTO `records` VALUES (207, 22, NULL, -200, '2022-05-27', 0, '斯蒂芬', '', '2022-05-27 09:59:05', '2022-05-27 09:59:05', 39);
INSERT INTO `records` VALUES (208, 22, NULL, -100, '2022-05-27', 0, '内部转账', '', '2022-05-27 10:02:23', '2022-05-27 10:02:23', 39);
INSERT INTO `records` VALUES (209, 22, NULL, 100, '2022-05-27', 1, '内部转账', '', '2022-05-27 10:02:23', '2022-05-27 10:02:23', 38);
INSERT INTO `records` VALUES (210, 22, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 10:02:50', '2022-05-27 10:02:50', NULL);
INSERT INTO `records` VALUES (211, 22, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 10:02:50', '2022-05-27 10:02:50', NULL);
INSERT INTO `records` VALUES (212, 22, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 10:02:50', '2022-05-27 10:02:50', NULL);
INSERT INTO `records` VALUES (213, 22, NULL, -700, '2022-04-22', 0, '还款', '', '2022-05-27 10:02:50', '2022-05-27 10:02:50', NULL);
INSERT INTO `records` VALUES (214, 22, NULL, 50, '2022-04-19', 1, '返利', '', '2022-05-27 10:02:50', '2022-05-27 10:02:50', NULL);
INSERT INTO `records` VALUES (215, 22, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 10:02:50', '2022-05-27 10:02:50', NULL);
INSERT INTO `records` VALUES (216, 22, NULL, -100, '2022-05-27', 0, '发的', '', '2022-05-27 10:06:20', '2022-05-27 10:06:20', NULL);
INSERT INTO `records` VALUES (217, 22, NULL, -100, '2022-05-27', 0, '00', '', '2022-05-27 10:11:32', '2022-05-27 10:11:32', NULL);
INSERT INTO `records` VALUES (218, 22, NULL, -100, '2022-05-27', 0, '11', '', '2022-05-27 10:12:44', '2022-05-27 10:12:44', NULL);
INSERT INTO `records` VALUES (219, 22, NULL, -200, '2022-05-27', 0, '导出', '', '2022-05-27 10:19:11', '2022-05-27 10:19:11', 44);
INSERT INTO `records` VALUES (220, 22, NULL, -200, '2022-05-27', 0, '的', '根本改变', '2022-05-27 10:19:27', '2022-05-27 10:19:27', NULL);
INSERT INTO `records` VALUES (221, 27, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 10:24:30', '2022-05-27 10:24:30', NULL);
INSERT INTO `records` VALUES (222, 27, NULL, -200, '2022-05-27', 0, '购物', '衣服', '2022-05-27 10:25:14', '2022-05-27 10:25:14', 45);
INSERT INTO `records` VALUES (223, 27, NULL, -200, '2022-05-27', 0, '内部转账', '', '2022-05-27 10:25:46', '2022-05-27 10:25:46', 46);
INSERT INTO `records` VALUES (224, 27, NULL, 200, '2022-05-27', 1, '内部转账', '', '2022-05-27 10:25:46', '2022-05-27 10:25:46', 45);
INSERT INTO `records` VALUES (225, 27, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 10:25:59', '2022-05-27 10:25:59', NULL);
INSERT INTO `records` VALUES (226, 27, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 10:25:59', '2022-05-27 10:25:59', NULL);
INSERT INTO `records` VALUES (227, 27, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 10:25:59', '2022-05-27 10:25:59', NULL);
INSERT INTO `records` VALUES (228, 27, NULL, -700, '2022-04-22', 0, '还款', '', '2022-05-27 10:25:59', '2022-05-27 10:25:59', NULL);
INSERT INTO `records` VALUES (229, 27, NULL, 50, '2022-04-19', 1, '返利', '', '2022-05-27 10:25:59', '2022-05-27 10:25:59', NULL);
INSERT INTO `records` VALUES (230, 27, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 10:25:59', '2022-05-27 10:25:59', NULL);
INSERT INTO `records` VALUES (231, 30, NULL, -150, '2022-05-27', 0, 'sefd', 'ff', '2022-05-27 11:46:55', '2022-05-27 11:46:55', NULL);
INSERT INTO `records` VALUES (232, 30, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 11:47:07', '2022-05-27 11:47:07', NULL);
INSERT INTO `records` VALUES (233, 30, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 11:47:07', '2022-05-27 11:47:07', NULL);
INSERT INTO `records` VALUES (234, 30, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 11:47:07', '2022-05-27 11:47:07', NULL);
INSERT INTO `records` VALUES (235, 30, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 11:47:07', '2022-05-27 11:47:07', NULL);
INSERT INTO `records` VALUES (236, 30, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 11:47:07', '2022-05-27 11:47:07', NULL);
INSERT INTO `records` VALUES (237, 30, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 11:47:07', '2022-05-27 11:47:07', NULL);
INSERT INTO `records` VALUES (238, 30, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 11:52:59', '2022-05-27 11:52:59', NULL);
INSERT INTO `records` VALUES (239, 30, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 11:52:59', '2022-05-27 11:52:59', NULL);
INSERT INTO `records` VALUES (240, 30, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 11:52:59', '2022-05-27 11:52:59', NULL);
INSERT INTO `records` VALUES (241, 30, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 11:52:59', '2022-05-27 11:52:59', NULL);
INSERT INTO `records` VALUES (242, 30, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 11:52:59', '2022-05-27 11:52:59', NULL);
INSERT INTO `records` VALUES (243, 30, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 11:52:59', '2022-05-27 11:52:59', NULL);
INSERT INTO `records` VALUES (244, 30, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 11:53:03', '2022-05-27 11:53:03', NULL);
INSERT INTO `records` VALUES (245, 30, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 11:53:03', '2022-05-27 11:53:03', NULL);
INSERT INTO `records` VALUES (246, 30, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 11:53:03', '2022-05-27 11:53:03', NULL);
INSERT INTO `records` VALUES (247, 30, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 11:53:03', '2022-05-27 11:53:03', NULL);
INSERT INTO `records` VALUES (248, 30, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 11:53:03', '2022-05-27 11:53:03', NULL);
INSERT INTO `records` VALUES (249, 30, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 11:53:03', '2022-05-27 11:53:03', NULL);
INSERT INTO `records` VALUES (250, 30, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 12:01:44', '2022-05-27 12:01:44', NULL);
INSERT INTO `records` VALUES (251, 30, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 12:01:44', '2022-05-27 12:01:44', NULL);
INSERT INTO `records` VALUES (252, 30, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 12:01:44', '2022-05-27 12:01:44', NULL);
INSERT INTO `records` VALUES (253, 30, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 12:01:44', '2022-05-27 12:01:44', NULL);
INSERT INTO `records` VALUES (254, 30, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 12:01:44', '2022-05-27 12:01:44', NULL);
INSERT INTO `records` VALUES (255, 30, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 12:01:44', '2022-05-27 12:01:44', NULL);
INSERT INTO `records` VALUES (256, 30, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 12:03:51', '2022-05-27 12:03:51', NULL);
INSERT INTO `records` VALUES (257, 30, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 12:03:51', '2022-05-27 12:03:51', NULL);
INSERT INTO `records` VALUES (258, 30, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 12:03:51', '2022-05-27 12:03:51', NULL);
INSERT INTO `records` VALUES (259, 30, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 12:03:51', '2022-05-27 12:03:51', NULL);
INSERT INTO `records` VALUES (260, 30, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 12:03:51', '2022-05-27 12:03:51', NULL);
INSERT INTO `records` VALUES (261, 30, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 12:03:51', '2022-05-27 12:03:51', NULL);
INSERT INTO `records` VALUES (262, 30, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 12:05:10', '2022-05-27 12:05:10', NULL);
INSERT INTO `records` VALUES (263, 30, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 12:05:10', '2022-05-27 12:05:10', NULL);
INSERT INTO `records` VALUES (264, 30, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 12:05:10', '2022-05-27 12:05:10', NULL);
INSERT INTO `records` VALUES (265, 30, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 12:05:10', '2022-05-27 12:05:10', NULL);
INSERT INTO `records` VALUES (266, 30, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 12:05:10', '2022-05-27 12:05:10', NULL);
INSERT INTO `records` VALUES (267, 30, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 12:05:10', '2022-05-27 12:05:10', NULL);
INSERT INTO `records` VALUES (268, 30, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 12:06:40', '2022-05-27 12:06:40', NULL);
INSERT INTO `records` VALUES (269, 30, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 12:06:40', '2022-05-27 12:06:40', NULL);
INSERT INTO `records` VALUES (270, 30, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 12:06:40', '2022-05-27 12:06:40', NULL);
INSERT INTO `records` VALUES (271, 30, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 12:06:40', '2022-05-27 12:06:40', NULL);
INSERT INTO `records` VALUES (272, 30, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 12:06:40', '2022-05-27 12:06:40', NULL);
INSERT INTO `records` VALUES (273, 30, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 12:06:40', '2022-05-27 12:06:40', NULL);
INSERT INTO `records` VALUES (274, 31, NULL, -200, '2022-05-27', 0, 'chifan', '', '2022-05-27 12:09:49', '2022-05-27 12:09:49', NULL);
INSERT INTO `records` VALUES (275, 31, NULL, -100, '2022-05-27', 0, '话费', '', '2022-05-27 12:10:20', '2022-05-27 12:10:20', 47);
INSERT INTO `records` VALUES (276, 31, NULL, -200, '2022-05-27', 0, '内部转账', '', '2022-05-27 12:10:59', '2022-05-27 12:10:59', 48);
INSERT INTO `records` VALUES (277, 31, NULL, 200, '2022-05-27', 1, '内部转账', '', '2022-05-27 12:10:59', '2022-05-27 12:10:59', 47);
INSERT INTO `records` VALUES (278, 31, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 12:11:12', '2022-05-27 12:11:12', NULL);
INSERT INTO `records` VALUES (279, 31, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 12:11:12', '2022-05-27 12:11:12', NULL);
INSERT INTO `records` VALUES (280, 31, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 12:11:12', '2022-05-27 12:11:12', NULL);
INSERT INTO `records` VALUES (281, 31, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 12:11:12', '2022-05-27 12:11:12', NULL);
INSERT INTO `records` VALUES (282, 31, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 12:11:12', '2022-05-27 12:11:12', NULL);
INSERT INTO `records` VALUES (283, 31, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 12:11:12', '2022-05-27 12:11:12', NULL);
INSERT INTO `records` VALUES (284, 33, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 12:33:49', '2022-05-27 12:33:49', NULL);
INSERT INTO `records` VALUES (285, 33, NULL, -200, '2022-05-27', 0, '购物', '买衣服', '2022-05-27 12:34:26', '2022-05-27 12:34:26', 49);
INSERT INTO `records` VALUES (287, 33, NULL, 500, '2022-05-27', 1, '内部转账', '', '2022-05-27 12:35:01', '2022-05-27 12:35:01', 49);
INSERT INTO `records` VALUES (288, 33, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 12:35:25', '2022-05-27 12:35:25', NULL);
INSERT INTO `records` VALUES (289, 33, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 12:35:25', '2022-05-27 12:35:25', NULL);
INSERT INTO `records` VALUES (290, 33, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 12:35:25', '2022-05-27 12:35:25', NULL);
INSERT INTO `records` VALUES (291, 33, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 12:35:25', '2022-05-27 12:35:25', NULL);
INSERT INTO `records` VALUES (292, 33, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 12:35:25', '2022-05-27 12:35:25', NULL);
INSERT INTO `records` VALUES (293, 33, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 12:35:25', '2022-05-27 12:35:25', NULL);
INSERT INTO `records` VALUES (294, 34, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 12:52:10', '2022-05-27 12:52:10', NULL);
INSERT INTO `records` VALUES (295, 35, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 12:56:16', '2022-05-27 12:56:16', NULL);
INSERT INTO `records` VALUES (296, 35, NULL, -200, '2022-05-27', 0, '购物', '买衣服', '2022-05-27 12:56:50', '2022-05-27 12:56:50', 51);
INSERT INTO `records` VALUES (297, 35, NULL, -300, '2022-05-27', 0, '内部转账', '', '2022-05-27 12:57:19', '2022-05-27 12:57:19', 52);
INSERT INTO `records` VALUES (298, 35, NULL, 300, '2022-05-27', 1, '内部转账', '', '2022-05-27 12:57:19', '2022-05-27 12:57:19', 51);
INSERT INTO `records` VALUES (299, 35, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 12:57:33', '2022-05-27 12:57:33', NULL);
INSERT INTO `records` VALUES (300, 35, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 12:57:33', '2022-05-27 12:57:33', NULL);
INSERT INTO `records` VALUES (301, 35, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 12:57:33', '2022-05-27 12:57:33', NULL);
INSERT INTO `records` VALUES (302, 35, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 12:57:33', '2022-05-27 12:57:33', NULL);
INSERT INTO `records` VALUES (303, 35, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 12:57:33', '2022-05-27 12:57:33', NULL);
INSERT INTO `records` VALUES (304, 35, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 12:57:33', '2022-05-27 12:57:33', NULL);
INSERT INTO `records` VALUES (305, 37, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 13:16:23', '2022-05-27 13:16:23', NULL);
INSERT INTO `records` VALUES (306, 39, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 13:24:52', '2022-05-27 13:24:52', NULL);
INSERT INTO `records` VALUES (307, 39, NULL, -200, '2022-05-27', 0, '购物', '买书', '2022-05-27 13:25:22', '2022-05-27 13:25:22', 54);
INSERT INTO `records` VALUES (309, 39, NULL, 500, '2022-05-27', 1, '内部转账', '', '2022-05-27 13:25:51', '2022-05-27 13:25:51', 54);
INSERT INTO `records` VALUES (310, 40, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 13:28:51', '2022-05-27 13:28:51', NULL);
INSERT INTO `records` VALUES (311, 40, NULL, -200, '2022-05-27', 0, '购物', '买书', '2022-05-27 13:29:30', '2022-05-27 13:29:30', 56);
INSERT INTO `records` VALUES (312, 41, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 13:31:42', '2022-05-27 13:31:42', NULL);
INSERT INTO `records` VALUES (313, 41, NULL, -200, '2022-05-27', 0, '购物', '买书', '2022-05-27 13:32:13', '2022-05-27 13:32:13', 57);
INSERT INTO `records` VALUES (314, 44, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 13:39:08', '2022-05-27 13:39:08', NULL);
INSERT INTO `records` VALUES (315, 44, NULL, -200, '2022-05-27', 0, '购物', '买书', '2022-05-27 13:39:45', '2022-05-27 13:39:45', 58);
INSERT INTO `records` VALUES (317, 44, NULL, 500, '2022-05-27', 1, '内部转账', '', '2022-05-27 13:40:24', '2022-05-27 13:40:24', 58);
INSERT INTO `records` VALUES (318, 44, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 13:40:40', '2022-05-27 13:40:40', NULL);
INSERT INTO `records` VALUES (319, 44, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 13:40:40', '2022-05-27 13:40:40', NULL);
INSERT INTO `records` VALUES (320, 44, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 13:40:40', '2022-05-27 13:40:40', NULL);
INSERT INTO `records` VALUES (321, 44, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 13:40:40', '2022-05-27 13:40:40', NULL);
INSERT INTO `records` VALUES (322, 44, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 13:40:40', '2022-05-27 13:40:40', NULL);
INSERT INTO `records` VALUES (323, 44, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 13:40:40', '2022-05-27 13:40:40', NULL);
INSERT INTO `records` VALUES (324, 49, NULL, -100, '2022-05-27', 0, '话费', '移动', '2022-05-27 13:55:21', '2022-05-27 13:55:21', NULL);
INSERT INTO `records` VALUES (325, 49, NULL, -100, '2022-05-27', 0, '购物', '买书', '2022-05-27 13:56:03', '2022-05-27 13:56:03', 60);
INSERT INTO `records` VALUES (326, 50, NULL, -100, '2022-05-27', 0, '购物', '买书', '2022-05-27 13:58:00', '2022-05-27 13:58:00', NULL);
INSERT INTO `records` VALUES (327, 50, NULL, -200, '2022-05-27', 0, '吃饭', '11', '2022-05-27 13:58:34', '2022-05-27 13:58:34', 61);
INSERT INTO `records` VALUES (328, 51, NULL, -100, '2022-05-27', 0, '话费', '150', '2022-05-27 14:01:48', '2022-05-27 14:01:48', NULL);
INSERT INTO `records` VALUES (329, 51, NULL, -200, '2022-05-27', 0, '购物', '买书', '2022-05-27 14:02:26', '2022-05-27 14:02:26', 62);
INSERT INTO `records` VALUES (331, 51, NULL, 800, '2022-05-27', 1, '内部转账', '', '2022-05-27 14:03:10', '2022-05-27 14:03:10', 62);
INSERT INTO `records` VALUES (332, 51, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 14:03:23', '2022-05-27 14:03:23', NULL);
INSERT INTO `records` VALUES (333, 51, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 14:03:23', '2022-05-27 14:03:23', NULL);
INSERT INTO `records` VALUES (334, 51, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 14:03:23', '2022-05-27 14:03:23', NULL);
INSERT INTO `records` VALUES (335, 51, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 14:03:23', '2022-05-27 14:03:23', NULL);
INSERT INTO `records` VALUES (336, 51, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 14:03:23', '2022-05-27 14:03:23', NULL);
INSERT INTO `records` VALUES (337, 51, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 14:03:23', '2022-05-27 14:03:23', NULL);
INSERT INTO `records` VALUES (338, 52, NULL, -100, '2022-05-27', 0, '话费', '150', '2022-05-27 14:06:30', '2022-05-27 14:06:30', NULL);
INSERT INTO `records` VALUES (339, 52, NULL, -200, '2022-05-27', 0, '购物', '买书', '2022-05-27 14:07:02', '2022-05-27 14:07:02', 64);
INSERT INTO `records` VALUES (341, 52, NULL, 600, '2022-05-27', 1, '内部转账', '', '2022-05-27 14:07:36', '2022-05-27 14:07:36', 64);
INSERT INTO `records` VALUES (342, 52, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 14:07:50', '2022-05-27 14:07:50', NULL);
INSERT INTO `records` VALUES (343, 52, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 14:07:50', '2022-05-27 14:07:50', NULL);
INSERT INTO `records` VALUES (344, 52, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 14:07:50', '2022-05-27 14:07:50', NULL);
INSERT INTO `records` VALUES (345, 52, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 14:07:50', '2022-05-27 14:07:50', NULL);
INSERT INTO `records` VALUES (346, 52, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 14:07:50', '2022-05-27 14:07:50', NULL);
INSERT INTO `records` VALUES (347, 52, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 14:07:50', '2022-05-27 14:07:50', NULL);
INSERT INTO `records` VALUES (348, 54, NULL, -100, '2022-05-27', 0, '吃饭', '111', '2022-05-27 18:26:28', '2022-05-27 18:26:28', NULL);
INSERT INTO `records` VALUES (349, 54, NULL, -200, '2022-05-27', 0, '购物', '111', '2022-05-27 18:27:01', '2022-05-27 18:27:01', 66);
INSERT INTO `records` VALUES (351, 54, NULL, 200, '2022-05-27', 1, '内部转账', '', '2022-05-27 18:27:30', '2022-05-27 18:27:30', 66);
INSERT INTO `records` VALUES (352, 57, NULL, -100, '2022-05-27', 0, '购物', '11', '2022-05-27 18:33:24', '2022-05-27 18:33:24', NULL);
INSERT INTO `records` VALUES (353, 57, NULL, -200, '2022-05-27', 0, '购物', '买书', '2022-05-27 18:33:53', '2022-05-27 18:33:53', 68);
INSERT INTO `records` VALUES (354, 57, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 18:34:13', '2022-05-27 18:34:13', NULL);
INSERT INTO `records` VALUES (355, 57, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 18:34:13', '2022-05-27 18:34:13', NULL);
INSERT INTO `records` VALUES (356, 57, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 18:34:13', '2022-05-27 18:34:13', NULL);
INSERT INTO `records` VALUES (357, 57, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 18:34:13', '2022-05-27 18:34:13', NULL);
INSERT INTO `records` VALUES (358, 57, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 18:34:13', '2022-05-27 18:34:13', NULL);
INSERT INTO `records` VALUES (359, 57, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 18:34:13', '2022-05-27 18:34:13', NULL);
INSERT INTO `records` VALUES (360, 58, NULL, -100, '2022-05-27', 0, '购物', '11', '2022-05-27 18:37:08', '2022-05-27 18:37:08', 69);
INSERT INTO `records` VALUES (361, 58, NULL, -64, '2022-04-10', 0, '购物', '', '2022-05-27 18:37:27', '2022-05-27 18:37:27', NULL);
INSERT INTO `records` VALUES (362, 58, NULL, -100, '2022-04-23', 0, '红包', '', '2022-05-27 18:37:27', '2022-05-27 18:37:27', NULL);
INSERT INTO `records` VALUES (363, 58, NULL, 100, '2022-04-22', 1, '红包', '', '2022-05-27 18:37:27', '2022-05-27 18:37:27', NULL);
INSERT INTO `records` VALUES (364, 58, NULL, -700, '2022-04-26', 0, '还款', '', '2022-05-27 18:37:27', '2022-05-27 18:37:27', NULL);
INSERT INTO `records` VALUES (365, 58, NULL, 50, '2022-04-20', 1, '返利', '', '2022-05-27 18:37:27', '2022-05-27 18:37:27', NULL);
INSERT INTO `records` VALUES (366, 58, NULL, -100, '2022-04-19', 0, '话费', '', '2022-05-27 18:37:27', '2022-05-27 18:37:27', NULL);
INSERT INTO `records` VALUES (367, 59, NULL, -100, '2022-05-27', 0, '购物', '111', '2022-05-27 18:45:54', '2022-05-27 18:45:54', 70);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleid` int(0) NOT NULL AUTO_INCREMENT,
  `identity` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, '系统管理员', '管理整个平台');
INSERT INTO `role` VALUES (1, '管理员', '普通管理员');
INSERT INTO `role` VALUES (2, '用户', '普通用户');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `roleid` int(0) NOT NULL,
  `pid` int(0) NOT NULL,
  PRIMARY KEY (`roleid`, `pid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  CONSTRAINT `rolepermission_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rolepermission_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `permission` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES (0, 1);
INSERT INTO `rolepermission` VALUES (0, 2);
INSERT INTO `rolepermission` VALUES (1, 2);
INSERT INTO `rolepermission` VALUES (0, 3);
INSERT INTO `rolepermission` VALUES (0, 4);
INSERT INTO `rolepermission` VALUES (2, 4);
INSERT INTO `rolepermission` VALUES (2, 8);
INSERT INTO `rolepermission` VALUES (2, 9);
INSERT INTO `rolepermission` VALUES (2, 10);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qq` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `roleid` int(0) NOT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  INDEX `roleid`(`roleid`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (3, '11951075895@qq.com', '21218cca77804d2ba1922c33e0151105', '1195107585', '7.png', NULL, 2, '2022-03-17 20:08:09', '2022-03-17 20:08:09');
INSERT INTO `users` VALUES (4, '376855074@qq.com', '670b14728ad9902aecba32e22fa4f6bd', '376855074', '1652096294822.png', '88888888', 1, '2022-03-17 20:10:52', '2022-03-17 20:10:52');
INSERT INTO `users` VALUES (6, '1195107585@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '时mo', '1651745072250.png', '88888', 0, '2022-04-15 22:06:39', '2022-04-15 22:06:39');
INSERT INTO `users` VALUES (9, '3768550889@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '3768550889', '1652097572359.png', '44444', 2, '2022-04-18 13:39:57', '2022-04-18 13:39:57');
INSERT INTO `users` VALUES (10, '11951075859@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '11951075859', '1.png', NULL, 2, '2022-04-20 12:13:07', '2022-04-20 12:13:07');
INSERT INTO `users` VALUES (11, '119510758530@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '119510758530', '2.png', NULL, 2, '2022-04-20 14:11:09', '2022-04-20 14:11:09');
INSERT INTO `users` VALUES (12, '119510758599@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '119510758599', '9.png', NULL, 1, '2022-04-20 17:20:44', '2022-04-20 17:20:44');
INSERT INTO `users` VALUES (13, '119510758500@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '119510758500', '5.png', NULL, 2, '2022-04-21 11:37:29', '2022-04-21 11:37:29');
INSERT INTO `users` VALUES (14, '11951075854@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '11951075854', '13.png', NULL, 2, '2022-04-21 12:05:13', '2022-04-21 12:05:13');
INSERT INTO `users` VALUES (15, '119510758566@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '119510758566', '4.png', NULL, 2, '2022-04-21 15:39:33', '2022-04-21 15:39:33');
INSERT INTO `users` VALUES (18, '119510758533@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_119510758533', '1652177142742.png', '222222', 2, '2022-05-10 15:08:09', '2022-05-10 15:08:09');
INSERT INTO `users` VALUES (20, '1195107585000@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_1195107585000', '6.png', NULL, 2, '2022-05-18 16:45:00', '2022-05-18 16:45:00');
INSERT INTO `users` VALUES (21, '1195107585999@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_1195107585999', '11.png', NULL, 2, '2022-05-18 16:46:45', '2022-05-18 16:46:45');
INSERT INTO `users` VALUES (22, '1195107585110@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'top1', '1653566723456.jpg', '999998', 2, '2022-05-26 19:48:29', '2022-05-26 19:48:29');
INSERT INTO `users` VALUES (23, 'dxb33092@yuoia.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_dxb33092', '9.png', NULL, 2, '2022-05-27 09:12:47', '2022-05-27 09:12:47');
INSERT INTO `users` VALUES (24, 'hny64771@yuoia.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_hny64771', '7.png', NULL, 2, '2022-05-27 09:19:14', '2022-05-27 09:19:14');
INSERT INTO `users` VALUES (25, 'trs81395@yuoia.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_trs81395', '15.png', NULL, 2, '2022-05-27 09:27:48', '2022-05-27 09:27:48');
INSERT INTO `users` VALUES (26, 'exm15705@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_exm15705', '8.png', NULL, 2, '2022-05-27 09:30:22', '2022-05-27 09:30:22');
INSERT INTO `users` VALUES (27, 'kbx73080@yuoia.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_kbx730光标', '1653618488577.jpg', '888888', 2, '2022-05-27 10:24:00', '2022-05-27 10:24:00');
INSERT INTO `users` VALUES (30, '888888@qq.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_888888', '1.png', NULL, 2, '2022-05-27 11:46:28', '2022-05-27 11:46:28');
INSERT INTO `users` VALUES (31, '666666@qq.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_666666', '6.png', NULL, 2, '2022-05-27 12:09:27', '2022-05-27 12:09:27');
INSERT INTO `users` VALUES (32, 'dnw81499@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_dnw81499', '2.png', NULL, 2, '2022-05-27 12:29:32', '2022-05-27 12:29:32');
INSERT INTO `users` VALUES (33, 'vkz39932@yuoia.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_的撒', '1653626243216.jpg', '8888888', 2, '2022-05-27 12:33:04', '2022-05-27 12:33:04');
INSERT INTO `users` VALUES (34, 'rvy23414@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_rvy23414', '4.png', NULL, 2, '2022-05-27 12:51:27', '2022-05-27 12:51:27');
INSERT INTO `users` VALUES (35, 'tzp86417@yuoia.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_石墨', '1653627546666.jpg', '888888', 2, '2022-05-27 12:55:37', '2022-05-27 12:55:37');
INSERT INTO `users` VALUES (37, 'mob50182@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_mob50182', '15.png', NULL, 2, '2022-05-27 13:15:47', '2022-05-27 13:15:47');
INSERT INTO `users` VALUES (38, 'kgh36002@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_kgh36002', '14.png', NULL, 2, '2022-05-27 13:20:32', '2022-05-27 13:20:32');
INSERT INTO `users` VALUES (39, 'kka92499@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_kka92499', '9.png', NULL, 2, '2022-05-27 13:24:10', '2022-05-27 13:24:10');
INSERT INTO `users` VALUES (40, 'tqr62995@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_tqr62995', '6.png', NULL, 2, '2022-05-27 13:28:15', '2022-05-27 13:28:15');
INSERT INTO `users` VALUES (41, 'wbk83179@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_wbk83179', '8.png', NULL, 2, '2022-05-27 13:31:07', '2022-05-27 13:31:07');
INSERT INTO `users` VALUES (42, 'idt83880@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_idt83880', '15.png', NULL, 2, '2022-05-27 13:34:53', '2022-05-27 13:34:53');
INSERT INTO `users` VALUES (43, 'ayn56115@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_ayn56115', '7.png', NULL, 2, '2022-05-27 13:36:40', '2022-05-27 13:36:40');
INSERT INTO `users` VALUES (44, 'otx26726@yuoia.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_速度', '1653630145438.jpg', '8888888', 2, '2022-05-27 13:38:32', '2022-05-27 13:38:32');
INSERT INTO `users` VALUES (45, '59596526@qq.com', '7ebe435e1b7cc230d6a714c1919e5560', 'JZ_59596526', '2.png', NULL, 2, '2022-05-27 13:43:57', '2022-05-27 13:43:57');
INSERT INTO `users` VALUES (46, 'xmg24398@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_xmg24398', '15.png', NULL, 2, '2022-05-27 13:49:46', '2022-05-27 13:49:46');
INSERT INTO `users` VALUES (47, 'xii44424@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_xii44424', '7.png', NULL, 2, '2022-05-27 13:51:35', '2022-05-27 13:51:35');
INSERT INTO `users` VALUES (48, 'juk59571@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_juk59571', '7.png', NULL, 2, '2022-05-27 13:53:12', '2022-05-27 13:53:12');
INSERT INTO `users` VALUES (49, 'nyp29018@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_nyp29018', '7.png', NULL, 2, '2022-05-27 13:54:45', '2022-05-27 13:54:45');
INSERT INTO `users` VALUES (50, 'kya95500@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_kya95500', '11.png', NULL, 2, '2022-05-27 13:57:22', '2022-05-27 13:57:22');
INSERT INTO `users` VALUES (51, 'ajw70016@yuoia.com', '670b14728ad9902aecba32e22fa4f6bd', 'JZ_ajw70016', '6.png', NULL, 2, '2022-05-27 14:01:13', '2022-05-27 14:01:13');
INSERT INTO `users` VALUES (52, 'rwc61980@yuoia.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_使', '1653631783322.jpg', '888888', 2, '2022-05-27 14:05:54', '2022-05-27 14:05:54');
INSERT INTO `users` VALUES (54, '1195107585777@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_1195107585777', '9.png', NULL, 2, '2022-05-27 18:26:04', '2022-05-27 18:26:04');
INSERT INTO `users` VALUES (55, '1195107585444@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_1195107585444', '12.png', '', 2, '2022-05-27 18:29:48', '2022-05-27 18:29:48');
INSERT INTO `users` VALUES (56, '119510758577777@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_119510758577777', '6.png', NULL, 2, '2022-05-27 18:30:39', '2022-05-27 18:30:39');
INSERT INTO `users` VALUES (57, '119510758511@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_119510758511', '7.png', NULL, 2, '2022-05-27 18:32:52', '2022-05-27 18:32:52');
INSERT INTO `users` VALUES (58, '119510758522@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_119510758522', '8.png', NULL, 2, '2022-05-27 18:36:25', '2022-05-27 18:36:25');
INSERT INTO `users` VALUES (59, '119510758544@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'JZ_119510758544', '2.png', NULL, 2, '2022-05-27 18:45:17', '2022-05-27 18:45:17');

SET FOREIGN_KEY_CHECKS = 1;
