/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : group

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 14/06/2020 08:50:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `eventid` int(0) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `starttime` date NULL DEFAULT NULL,
  `length` int(0) NULL DEFAULT NULL,
  `maxperson` int(0) NULL DEFAULT NULL,
  `totalmoney` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`eventid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (1, '聚划算', '淘宝聚划算', '2020-06-18', 2, 10, 10000);
INSERT INTO `event` VALUES (2, 'test', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (3, 'test', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (4, 'test1', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (5, '淘宝618', '淘宝618', '2020-06-18', 2, 5, 1000);
INSERT INTO `event` VALUES (6, '淘宝619', '淘宝619', '2020-06-19', 2, 5, 1000);
INSERT INTO `event` VALUES (7, 'test4', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (8, 'test5', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (9, 'test6', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (10, 'test7', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (11, 'test8', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (12, 'test9', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (13, 'test10', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (14, 'test11', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (15, 'test12', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (16, 'test13', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (17, 'test14', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (18, 'test15', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (19, 'test16', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (20, 'test17', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (21, 'test18', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (22, 'test19', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (23, 'test20', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (24, 'test21', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (25, 'test22', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (26, 'test23', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (27, 'test24', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (28, 'test25', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (29, 'test26', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (30, 'test27', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (31, 'test28', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (32, 'test29', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (33, 'test30', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (34, 'test31', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (35, 'test32', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (36, 'test33', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (37, 'test34', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (38, 'test35', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (39, 'test36', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (40, 'test37', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (41, 'test38', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (42, 'test39', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (43, 'test40', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (44, 'test41', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (45, 'test42', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (46, 'test43', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (47, 'test44', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (48, 'test45', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (49, 'test46', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (50, 'test47', 'This is a test event!', '2020-06-10', 2, 5, 1000);
INSERT INTO `event` VALUES (54, '京东618', '买买买', '2020-06-18', 2, 10, 10000);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `eventid` int(0) NOT NULL,
  `uid` int(0) NOT NULL,
  `isleader` int(0) NULL DEFAULT NULL,
  `payment` int(0) NULL DEFAULT NULL,
  `accept` int(0) NOT NULL,
  INDEX `fk_event`(`eventid`) USING BTREE,
  INDEX `fk_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_event` FOREIGN KEY (`eventid`) REFERENCES `event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 1, 0, 20, 1);
INSERT INTO `member` VALUES (1, 2, 1, 40, 1);
INSERT INTO `member` VALUES (54, 1, 0, 0, 1);
INSERT INTO `member` VALUES (54, 2, 1, 0, 1);
INSERT INTO `member` VALUES (50, 2, 1, 0, 1);
INSERT INTO `member` VALUES (49, 2, 1, 0, 1);
INSERT INTO `member` VALUES (6, 2, 1, 0, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `identity` int(0) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `User_username_uindex`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', 'male', '18260760022', 0);
INSERT INTO `users` VALUES (2, 'visitor', 'visitor', 'female', '13478492033', 1);
INSERT INTO `users` VALUES (7, 'linkchen', 'linkchen', 'male', '18012616056', 1);
INSERT INTO `users` VALUES (8, 'visitor1', 'visitor1', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (9, 'visitor2', 'visitor2', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (10, 'visitor3', 'visitor3', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (11, 'visitor4', 'visitor4', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (12, 'visitor5', 'visitor5', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (13, 'visitor6', 'visitor6', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (14, 'visitor7', 'visitor7', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (15, 'visitor8', 'visitor8', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (16, 'visitor9', 'visitor9', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (17, 'visitor10', 'visitor10', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (18, 'visitor11', 'visitor11', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (19, 'visitor12', 'visitor12', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (20, 'visitor13', 'visitor13', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (21, 'visitor14', 'visitor14', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (22, 'visitor15', 'visitor15', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (23, 'visitor16', 'visitor16', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (24, 'visitor17', 'visitor17', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (25, 'visitor18', 'visitor18', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (26, 'visitor19', 'visitor19', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (27, 'visitor20', 'visitor20', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (28, 'visitor21', 'visitor21', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (29, 'visitor22', 'visitor22', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (30, 'visitor23', 'visitor23', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (31, 'visitor24', 'visitor24', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (32, 'visitor25', 'visitor25', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (33, 'visitor26', 'visitor26', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (34, 'visitor27', 'visitor27', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (35, 'visitor28', 'visitor28', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (36, 'visitor29', 'visitor29', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (37, 'visitor30', 'visitor30', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (38, 'visitor31', 'visitor31', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (39, 'visitor32', 'visitor32', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (40, 'visitor33', 'visitor33', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (41, 'visitor34', 'visitor34', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (42, 'visitor35', 'visitor35', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (43, 'visitor36', 'visitor36', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (44, 'visitor37', 'visitor37', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (45, 'visitor38', 'visitor38', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (46, 'visitor39', 'visitor39', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (47, 'visitor40', 'visitor40', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (48, 'visitor41', 'visitor41', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (49, 'visitor42', 'visitor42', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (50, 'visitor43', 'visitor43', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (51, 'visitor44', 'visitor44', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (52, 'visitor45', 'visitor45', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (53, 'visitor46', 'visitor46', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (54, 'visitor47', 'visitor47', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (55, 'visitor48', 'visitor48', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (56, 'visitor49', 'visitor49', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (57, 'visitor50', 'visitor50', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (58, 'visitor51', 'visitor51', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (59, 'visitor52', 'visitor52', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (60, 'visitor53', 'visitor53', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (61, 'visitor54', 'visitor54', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (62, 'visitor55', 'visitor55', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (63, 'visitor56', 'visitor56', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (64, 'visitor57', 'visitor57', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (65, 'visitor58', 'visitor58', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (66, 'visitor59', 'visitor59', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (67, 'visitor60', 'visitor60', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (68, 'visitor61', 'visitor61', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (69, 'visitor62', 'visitor62', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (70, 'visitor63', 'visitor63', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (71, 'visitor64', 'visitor64', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (72, 'visitor65', 'visitor65', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (73, 'visitor66', 'visitor66', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (74, 'visitor67', 'visitor67', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (75, 'visitor68', 'visitor68', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (76, 'visitor69', 'visitor69', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (77, 'visitor70', 'visitor70', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (78, 'visitor71', 'visitor71', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (79, 'visitor72', 'visitor72', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (80, 'visitor73', 'visitor73', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (81, 'visitor74', 'visitor74', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (82, 'visitor75', 'visitor75', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (83, 'visitor76', 'visitor76', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (84, 'visitor77', 'visitor77', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (85, 'visitor78', 'visitor78', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (86, 'visitor79', 'visitor79', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (87, 'visitor80', 'visitor80', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (88, 'visitor81', 'visitor81', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (89, 'visitor82', 'visitor82', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (90, 'visitor83', 'visitor83', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (91, 'visitor84', 'visitor84', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (92, 'visitor85', 'visitor85', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (93, 'visitor86', 'visitor86', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (94, 'visitor87', 'visitor87', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (95, 'visitor88', 'visitor88', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (96, 'visitor89', 'visitor89', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (97, 'visitor90', 'visitor90', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (98, 'visitor91', 'visitor91', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (99, 'visitor92', 'visitor92', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (100, 'visitor93', 'visitor93', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (101, 'visitor94', 'visitor94', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (102, 'visitor95', 'visitor95', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (103, 'visitor96', 'visitor96', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (104, 'visitor97', 'visitor97', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (105, 'visitor98', 'visitor98', 'male', '18012616025', 1);
INSERT INTO `users` VALUES (106, 'visitor99', 'visitor99', 'male', '18012616025', 1);

SET FOREIGN_KEY_CHECKS = 1;
