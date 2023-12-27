/*
 Navicat Premium Data Transfer

 Source Server         : 本地v8
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 172.29.172.103:3306
 Source Schema         : stu-music-system

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 13/12/2023 15:57:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `collectionId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `songId` int NOT NULL,
  PRIMARY KEY (`collectionId`),
  KEY `fk_collection_1_idx` (`userId`),
  KEY `fk_collection_2_idx` (`songId`),
  CONSTRAINT `fk_collection_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_collection_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of collection
-- ----------------------------
BEGIN;
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (176, 2, 3);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (180, 5, 207);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (181, 5, 192);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (182, 5, 230);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (183, 5, 224);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (184, 5, 1);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (185, 5, 239);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (186, 5, 234);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (187, 5, 228);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (188, 5, 220);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (189, 5, 198);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (190, 5, 212);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (193, 7, 1);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (194, 7, 198);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (195, 7, 239);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (203, 1, 2);
INSERT INTO `collection` (`collectionId`, `userId`, `songId`) VALUES (204, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for download
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `downloadId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `songId` int NOT NULL,
  `downloadTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`downloadId`),
  KEY `fk_download_1_idx` (`userId`),
  KEY `fk_download_2_idx` (`songId`),
  CONSTRAINT `fk_download_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_download_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of download
-- ----------------------------
BEGIN;
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (1, 1, 3, '2018-04-30 20:50:13');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (2, 1, 1, '2018-04-30 21:28:21');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (3, 1, 1, '2018-04-30 21:28:21');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (4, 1, 3, '2018-05-01 09:32:18');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (5, 1, 3, '2018-05-02 18:04:47');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (6, 5, 207, '2018-05-03 23:18:40');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (7, 5, 207, '2018-05-03 23:18:44');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (8, 5, 207, '2018-05-03 23:18:59');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (10, 1, 1, '2018-05-06 18:08:54');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (11, 1, 3, '2018-05-06 19:09:12');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (12, 1, 1, '2018-05-06 19:09:18');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (13, 1, 3, '2018-05-29 11:52:51');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (14, 1, 2, '2018-05-29 11:53:03');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (15, 1, 1, '2023-06-23 19:50:26');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (16, 1, 1, '2023-06-23 19:51:51');
INSERT INTO `download` (`downloadId`, `userId`, `songId`, `downloadTime`) VALUES (17, 1, 1, '2023-06-23 20:03:03');
COMMIT;

-- ----------------------------
-- Table structure for liking
-- ----------------------------
DROP TABLE IF EXISTS `liking`;
CREATE TABLE `liking` (
  `likeId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `reviewId` int NOT NULL,
  PRIMARY KEY (`likeId`),
  KEY `fk_like_1_idx` (`userId`),
  KEY `fk_like_2_idx` (`reviewId`),
  CONSTRAINT `fk_like_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_like_2` FOREIGN KEY (`reviewId`) REFERENCES `review` (`reviewId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of liking
-- ----------------------------
BEGIN;
INSERT INTO `liking` (`likeId`, `userId`, `reviewId`) VALUES (170, 1, 3);
INSERT INTO `liking` (`likeId`, `userId`, `reviewId`) VALUES (171, 15, 3);
INSERT INTO `liking` (`likeId`, `userId`, `reviewId`) VALUES (222, 15, 6);
COMMIT;

-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play` (
  `playId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `songId` int NOT NULL,
  `playTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playId`),
  KEY `fk_play_1_idx` (`userId`),
  KEY `fk_play_2_idx` (`songId`),
  CONSTRAINT `fk_play_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_play_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of play
-- ----------------------------
BEGIN;
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (1, 1, 1, '2018-04-29 20:50:27');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (2, 1, 3, '2018-04-29 20:51:31');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (3, 2, 3, '2018-04-29 23:58:03');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (4, 1, 3, '2018-04-30 19:39:32');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (5, 1, 3, '2018-04-30 19:40:24');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (6, 1, 3, '2018-04-30 19:43:50');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (7, 1, 3, '2018-04-30 19:46:00');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (8, 1, 3, '2018-04-30 19:46:16');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (9, 1, 3, '2018-04-30 19:46:25');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (10, 1, 3, '2018-04-30 19:46:57');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (11, 1, 1, '2018-04-30 19:50:37');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (12, 1, 3, '2018-04-30 19:54:51');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (13, 1, 3, '2018-04-30 19:54:57');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (14, 1, 3, '2018-04-30 19:55:01');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (15, 1, 3, '2018-04-30 19:55:10');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (16, 1, 1, '2018-04-30 20:59:35');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (17, 1, 3, '2018-04-30 21:05:38');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (18, 1, 3, '2018-05-01 09:32:15');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (19, 1, 1, '2018-05-02 15:06:10');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (20, 1, 3, '2018-05-02 15:06:12');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (21, 1, 3, '2018-05-02 15:06:16');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (22, 1, 1, '2018-05-02 15:06:19');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (23, 1, 3, '2018-05-02 15:06:20');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (24, 1, 3, '2018-05-02 18:04:44');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (25, 2, 3, '2018-05-02 19:10:33');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (26, 2, 3, '2018-05-02 19:11:08');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (27, 1, 3, '2018-05-03 10:45:43');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (28, 1, 239, '2018-05-03 10:47:52');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (29, 1, 3, '2018-05-03 10:48:10');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (30, 1, 239, '2018-05-03 10:49:17');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (31, 1, 240, '2018-05-03 10:50:36');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (32, 4, 229, '2018-05-03 17:53:27');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (33, 5, 207, '2018-05-03 23:18:19');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (34, 5, 192, '2018-05-03 23:20:05');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (35, 5, 1, '2018-05-03 23:21:38');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (36, 5, 239, '2018-05-03 23:21:51');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (37, 5, 234, '2018-05-03 23:21:58');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (38, 5, 228, '2018-05-03 23:22:13');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (39, 5, 220, '2018-05-03 23:22:25');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (40, 5, 209, '2018-05-03 23:22:33');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (41, 5, 198, '2018-05-03 23:22:44');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (42, 5, 193, '2018-05-03 23:23:58');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (43, 1, 1, '2018-05-03 23:32:24');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (44, 1, 1, '2018-05-03 23:41:21');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (45, 1, 209, '2018-05-03 23:41:35');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (46, 6, 3, '2018-05-03 23:49:31');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (47, 1, 198, '2018-05-03 23:50:38');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (48, 1, 1, '2018-05-03 23:53:19');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (49, 7, 3, '2018-05-04 00:23:45');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (50, 7, 239, '2018-05-04 00:24:44');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (51, 7, 239, '2018-05-04 00:25:12');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (52, 7, 3, '2018-05-04 00:25:31');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (53, 7, 1, '2018-05-04 00:25:34');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (54, 7, 1, '2018-05-04 00:28:23');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (55, 1, 198, '2018-05-04 00:30:41');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (56, 1, 239, '2018-05-04 00:32:41');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (57, 1, 229, '2018-05-04 00:33:00');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (58, 8, 220, '2018-05-04 08:21:39');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (59, 8, 239, '2018-05-04 08:34:39');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (60, 8, 240, '2018-05-04 08:34:40');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (61, 1, 207, '2018-05-06 11:49:13');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (62, 1, 2, '2018-05-06 14:51:43');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (128, 1, 220, '2018-05-06 17:50:17');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (129, 1, 1, '2018-05-06 17:50:20');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (130, 1, 1, '2018-05-06 17:50:25');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (131, 1, 3, '2018-05-06 17:53:25');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (132, 1, 193, '2018-05-06 17:53:28');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (133, 1, 233, '2018-05-06 17:53:31');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (134, 1, 198, '2018-05-06 17:53:55');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (135, 1, 220, '2018-05-06 17:54:03');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (136, 1, 3, '2018-05-06 17:54:17');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (137, 1, 240, '2018-05-06 17:54:28');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (138, 1, 193, '2018-05-06 17:54:37');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (139, 1, 193, '2018-05-06 17:55:03');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (140, 1, 193, '2018-05-06 17:55:03');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (141, 1, 193, '2018-05-06 17:55:04');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (142, 1, 228, '2018-05-06 17:55:06');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (143, 1, 220, '2018-05-06 17:55:23');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (144, 1, 193, '2018-05-06 17:56:07');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (145, 1, 3, '2018-05-06 17:56:11');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (146, 1, 240, '2018-05-06 17:57:10');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (147, 1, 228, '2018-05-06 17:57:13');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (148, 1, 220, '2018-05-06 17:57:59');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (149, 1, 239, '2018-05-06 17:58:03');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (150, 1, 1, '2018-05-06 17:58:22');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (151, 1, 239, '2018-05-06 17:59:15');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (152, 1, 3, '2018-05-06 17:59:18');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (153, 1, 193, '2018-05-06 17:59:22');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (154, 1, 3, '2018-05-06 18:00:58');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (155, 1, 228, '2018-05-06 18:01:02');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (156, 1, 233, '2018-05-06 18:05:42');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (157, 1, 239, '2018-05-06 18:07:15');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (158, 1, 220, '2018-05-06 18:14:53');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (159, 1, 3, '2018-05-06 18:15:38');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (160, 1, 3, '2018-05-06 18:17:43');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (161, 1, 3, '2018-05-06 18:18:48');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (162, 1, 3, '2018-05-06 18:20:13');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (163, 1, 3, '2018-05-06 18:21:37');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (164, 1, 2, '2018-05-06 18:23:28');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (165, 1, 2, '2018-05-06 18:24:07');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (166, 1, 3, '2018-05-06 18:33:26');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (167, 1, 3, '2018-05-06 18:36:31');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (168, 1, 2, '2018-05-06 18:39:13');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (169, 1, 2, '2018-05-06 18:39:30');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (170, 1, 2, '2018-05-06 18:39:48');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (171, 1, 2, '2018-05-06 18:45:50');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (172, 1, 2, '2018-05-06 18:46:39');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (173, 1, 2, '2018-05-06 18:48:35');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (174, 1, 1, '2018-05-06 18:50:38');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (175, 1, 2, '2018-05-06 18:52:46');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (176, 1, 193, '2018-05-06 18:52:49');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (177, 1, 2, '2018-05-06 18:53:01');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (178, 1, 3, '2018-05-06 18:55:28');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (179, 1, 193, '2018-05-06 18:55:38');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (180, 1, 1, '2018-05-06 18:55:43');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (181, 1, 2, '2018-05-06 18:55:46');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (182, 1, 240, '2018-05-06 18:56:42');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (183, 1, 3, '2018-05-06 19:00:24');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (184, 1, 1, '2018-05-06 19:00:37');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (185, 1, 3, '2018-05-06 19:09:10');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (186, 1, 234, '2018-05-06 19:09:43');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (187, 1, 3, '2018-05-06 19:09:56');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (188, 1, 1, '2018-05-06 19:09:59');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (189, 1, 1, '2018-05-06 19:10:16');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (190, 1, 1, '2018-05-06 19:10:51');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (191, 1, 193, '2018-05-06 19:22:51');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (192, 1, 1, '2018-05-06 19:22:53');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (193, 1, 240, '2018-05-06 19:26:45');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (194, 1, 239, '2018-05-06 19:26:46');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (195, 1, 2, '2018-05-06 19:26:58');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (196, 1, 1, '2018-05-06 19:27:19');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (197, 1, 2, '2018-05-06 19:27:33');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (198, 1, 3, '2018-05-06 19:27:43');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (199, 1, 1, '2018-05-06 19:43:59');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (200, 1, 3, '2018-05-06 19:44:17');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (201, 1, 2, '2018-05-06 19:44:22');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (202, 1, 2, '2018-05-06 19:45:56');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (203, 1, 2, '2018-05-06 20:20:27');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (204, 1, 2, '2018-05-06 20:29:18');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (205, 1, 3, '2018-05-07 11:55:44');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (206, 1, 3, '2018-05-28 14:46:46');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (207, 1, 2, '2018-05-28 14:46:49');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (208, 1, 1, '2018-05-28 14:46:51');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (209, 1, 1, '2018-05-28 15:16:23');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (210, 1, 1, '2018-05-28 16:06:09');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (211, 1, 1, '2018-05-28 16:11:39');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (212, 1, 1, '2018-05-28 17:11:10');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (213, 1, 2, '2018-05-29 11:52:41');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (214, 1, 2, '2018-05-29 11:53:00');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (215, 1, 3, '2018-05-30 21:48:47');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (216, 1, 2, '2018-06-07 21:37:26');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (217, 1, 1, '2018-06-07 21:38:06');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (219, 1, 1, '2023-06-23 19:45:06');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (220, 1, 1, '2023-06-23 19:49:48');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (221, 1, 1, '2023-06-23 19:49:49');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (222, 1, 1, '2023-06-23 19:49:49');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (223, 1, 1, '2023-06-23 19:49:50');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (224, 1, 1, '2023-06-23 19:49:50');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (225, 1, 1, '2023-06-23 19:49:51');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (226, 1, 1, '2023-06-23 19:50:16');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (227, 1, 1, '2023-06-23 19:50:18');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (228, 1, 1, '2023-06-23 19:50:19');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (229, 1, 1, '2023-06-23 19:51:10');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (230, 1, 1, '2023-06-23 19:51:11');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (231, 1, 1, '2023-06-23 19:51:18');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (232, 1, 1, '2023-06-23 19:53:54');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (233, 1, 1, '2023-06-23 19:53:57');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (234, 1, 1, '2023-06-23 19:54:01');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (235, 1, 1, '2023-06-23 19:54:03');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (236, 1, 1, '2023-06-23 20:01:21');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (237, 1, 1, '2023-06-23 20:01:24');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (238, 1, 1, '2023-06-23 20:02:25');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (239, 1, 1, '2023-06-23 20:02:27');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (240, 1, 1, '2023-06-23 20:03:02');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (241, 1, 1, '2023-06-23 20:08:36');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (242, 1, 1, '2023-06-23 20:10:11');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (243, 1, 1, '2023-06-23 20:16:26');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (244, 2, 3, '2023-06-23 20:18:28');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (245, 2, 1, '2023-06-23 20:18:43');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (246, 2, 1, '2023-06-23 20:22:41');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (247, 2, 1, '2023-06-23 20:23:59');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (248, 2011228, 1, '2023-06-23 20:52:13');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (249, 1, 1, '2023-06-24 00:53:52');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (250, 1, 1, '2023-06-26 12:17:04');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (251, 2, 3, '2023-12-06 20:16:40');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (252, 2, 1, '2023-12-06 20:16:49');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (253, 2, 1, '2023-12-06 20:16:51');
INSERT INTO `play` (`playId`, `userId`, `songId`, `playTime`) VALUES (254, 1, 252, '2023-12-08 18:54:33');
COMMIT;

-- ----------------------------
-- Table structure for reca
-- ----------------------------
DROP TABLE IF EXISTS `reca`;
CREATE TABLE `reca` (
  `recId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `songId` int NOT NULL,
  PRIMARY KEY (`recId`),
  KEY `fk_reca_1_idx` (`userId`),
  KEY `fk_reca_2_idx` (`songId`),
  CONSTRAINT `fk_reca_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_reca_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21601 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of reca
-- ----------------------------
BEGIN;
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21481, 2011230, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21482, 2011230, 198);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21483, 2011230, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21484, 2011230, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21485, 2011230, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21486, 2011230, 3);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21487, 2011230, 220);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21488, 2011230, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21489, 2011230, 1);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21490, 2011230, 239);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21491, 1, 4);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21492, 1, 5);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21493, 1, 6);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21494, 1, 7);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21495, 1, 8);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21496, 1, 9);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21497, 1, 10);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21498, 1, 11);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21499, 1, 12);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21500, 1, 13);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21501, 2, 207);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21502, 2, 198);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21503, 2, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21504, 2, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21505, 2, 220);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21506, 2, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21507, 2, 229);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21508, 2, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21509, 2, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21510, 2, 239);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21511, 2011228, 229);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21512, 2011228, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21513, 2011228, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21514, 2011228, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21515, 2011228, 198);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21516, 2011228, 220);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21517, 2011228, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21518, 2011228, 3);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21519, 2011228, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21520, 2011228, 239);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21521, 4, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21522, 4, 4);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21523, 4, 6);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21524, 4, 8);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21525, 4, 5);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21526, 4, 3);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21527, 4, 7);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21528, 4, 1);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21529, 4, 9);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21530, 4, 10);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21531, 5, 11);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21532, 5, 252);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21533, 5, 4);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21534, 5, 229);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21535, 5, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21536, 5, 7);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21537, 5, 8);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21538, 5, 3);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21539, 5, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21540, 5, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21541, 2011227, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21542, 2011227, 198);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21543, 2011227, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21544, 2011227, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21545, 2011227, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21546, 2011227, 3);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21547, 2011227, 220);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21548, 2011227, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21549, 2011227, 1);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21550, 2011227, 239);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21551, 6, 229);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21552, 6, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21553, 6, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21554, 6, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21555, 6, 198);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21556, 6, 220);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21557, 6, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21558, 6, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21559, 6, 1);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21560, 6, 239);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21561, 7, 207);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21562, 7, 209);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21563, 7, 234);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21564, 7, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21565, 7, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21566, 7, 229);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21567, 7, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21568, 7, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21569, 7, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21570, 7, 220);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21571, 8, 212);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21572, 8, 192);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21573, 8, 234);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21574, 8, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21575, 8, 198);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21576, 8, 3);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21577, 8, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21578, 8, 207);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21579, 8, 1);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21580, 8, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21581, 9, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21582, 9, 198);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21583, 9, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21584, 9, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21585, 9, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21586, 9, 3);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21587, 9, 220);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21588, 9, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21589, 9, 1);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21590, 9, 239);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21591, 15, 233);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21592, 15, 198);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21593, 15, 228);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21594, 15, 193);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21595, 15, 240);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21596, 15, 3);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21597, 15, 220);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21598, 15, 2);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21599, 15, 1);
INSERT INTO `reca` (`recId`, `userId`, `songId`) VALUES (21600, 15, 239);
COMMIT;

-- ----------------------------
-- Table structure for recb
-- ----------------------------
DROP TABLE IF EXISTS `recb`;
CREATE TABLE `recb` (
  `recId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `songId` int NOT NULL,
  PRIMARY KEY (`recId`),
  KEY `fk_recb_1_idx` (`userId`),
  KEY `fk_recb_2_idx` (`songId`),
  CONSTRAINT `fk_recb_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_recb_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6751 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of recb
-- ----------------------------
BEGIN;
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6611, 1, 4);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6612, 1, 5);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6613, 1, 6);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6614, 1, 7);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6615, 1, 8);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6616, 1, 9);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6617, 1, 10);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6618, 1, 11);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6619, 1, 12);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6620, 1, 13);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6621, 2, 224);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6622, 2, 234);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6623, 2, 212);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6624, 2, 228);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6625, 2, 198);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6626, 2, 239);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6627, 2, 220);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6628, 2, 1);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6629, 2, 192);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6630, 2, 207);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6631, 4, 212);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6632, 4, 234);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6633, 4, 239);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6634, 4, 228);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6635, 4, 198);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6636, 4, 3);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6637, 4, 220);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6638, 4, 1);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6639, 4, 192);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6640, 4, 207);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6641, 5, 5);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6642, 5, 9);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6643, 5, 4);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6644, 5, 10);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6645, 5, 6);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6646, 5, 7);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6647, 5, 8);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6648, 5, 3);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6649, 5, 229);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6650, 5, 11);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6651, 2011227, 233);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6652, 2011227, 198);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6653, 2011227, 228);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6654, 2011227, 193);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6655, 2011227, 240);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6656, 2011227, 3);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6657, 2011227, 220);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6658, 2011227, 2);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6659, 2011227, 1);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6660, 2011227, 239);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6661, 6, 240);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6662, 6, 207);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6663, 6, 234);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6664, 6, 2);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6665, 6, 198);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6666, 6, 220);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6667, 6, 228);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6668, 6, 239);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6669, 6, 1);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6670, 6, 193);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6671, 7, 209);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6672, 7, 230);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6673, 7, 229);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6674, 7, 220);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6675, 7, 212);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6676, 7, 224);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6677, 7, 228);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6678, 7, 192);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6679, 7, 207);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6680, 7, 234);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6681, 8, 212);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6682, 8, 192);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6683, 8, 234);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6684, 8, 2);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6685, 8, 198);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6686, 8, 3);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6687, 8, 228);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6688, 8, 207);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6689, 8, 1);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6690, 8, 193);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6691, 9, 233);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6692, 9, 198);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6693, 9, 228);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6694, 9, 193);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6695, 9, 240);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6696, 9, 3);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6697, 9, 220);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6698, 9, 2);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6699, 9, 1);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6700, 9, 239);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6701, 15, 233);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6702, 15, 198);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6703, 15, 228);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6704, 15, 193);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6705, 15, 240);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6706, 15, 3);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6707, 15, 220);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6708, 15, 2);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6709, 15, 1);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6710, 15, 239);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6721, 2011228, 206);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6722, 2011228, 208);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6723, 2011228, 218);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6724, 2011228, 240);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6725, 2011228, 200);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6726, 2011228, 240);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6727, 2011228, 225);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6728, 2011228, 227);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6729, 2011228, 236);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6730, 2011228, 199);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6741, 2011230, 207);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6742, 2011230, 230);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6743, 2011230, 244);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6744, 2011230, 213);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6745, 2011230, 227);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6746, 2011230, 234);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6747, 2011230, 222);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6748, 2011230, 220);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6749, 2011230, 207);
INSERT INTO `recb` (`recId`, `userId`, `songId`) VALUES (6750, 2011230, 222);
COMMIT;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `songId` int NOT NULL,
  `review` varchar(140) NOT NULL,
  `reviewTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewId`),
  KEY `fk_review_1_idx` (`userId`),
  KEY `fk_review_2_idx` (`songId`),
  CONSTRAINT `fk_review_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_review_2` FOREIGN KEY (`songId`) REFERENCES `song` (`songId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of review
-- ----------------------------
BEGIN;
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (1, 1, 3, '呵呵，楼上的真搞笑，这个评论模板的插件好丑陋，简直丑爆了，我简单做的都比这个好，信不信，我分分钟肥腻做出来一个，吓屎你们这群都比', '2018-05-30 11:44:40');
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (2, 2, 3, '这才是真正的冷门好歌', '2018-05-30 11:48:33');
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (3, 4, 3, '人生百年，谁不曾大闹天宫，谁不曾头上紧箍，谁不曾爱上层楼，谁不曾孤单上路。', '2018-05-30 11:50:20');
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (4, 15, 3, '有时候，你选择与某人保持距离，不是因为不在乎，而是因为你清楚的知道，她不属于你。人生遇到的每个人，出场顺序真的很重要，很多人如果换一个时间认识，就会有不同的结局。或许，有些爱，只能止于唇齿，掩于岁月！', '2018-05-30 11:53:11');
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (5, 1, 1, '紫棋自己的味道，很好听。欣赏她的才华与实力，加油！', '2018-05-30 23:40:05');
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (6, 15, 1, '还记得曾经有个人对我唱，“喜欢你”，当时，我并不知道。', '2018-05-30 23:41:54');
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (12, 1, 3, '精彩精彩精彩精彩精彩精彩精彩精彩', '2018-06-01 21:25:25');
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (14, 1, 3, '精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩精彩', '2018-06-01 21:25:36');
INSERT INTO `review` (`reviewId`, `userId`, `songId`, `review`, `reviewTime`) VALUES (15, 1, 3, '精彩', '2018-06-01 21:25:40');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`roleId`, `roleName`) VALUES (1, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `songId` int NOT NULL AUTO_INCREMENT,
  `songName` varchar(45) NOT NULL,
  `songAddress` varchar(255) NOT NULL,
  `songCoverAddress` varchar(255) DEFAULT NULL,
  `songType` varchar(45) DEFAULT NULL,
  `songLength` int NOT NULL DEFAULT '0',
  `lyricName` varchar(120) DEFAULT NULL,
  `lyricAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`songId`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of song
-- ----------------------------
BEGIN;
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (1, '喜欢你', 'music-resource/song/喜欢你.mp3', NULL, NULL, 1, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (2, '绝世', 'music-resource/song/绝世.mp3', NULL, NULL, 1, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (3, '一生所爱(Live)', 'music-resource/song/一生所爱(Live).mp3', NULL, NULL, 1, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (4, '天涯', 'music-resource/song/天涯.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (5, '沉默是金', 'music-resource/song/沉默是金.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (6, '哭砂', 'music-resource/song/哭砂.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (7, '飘雪', 'music-resource/song/飘雪.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (8, '千年等一回', 'music-resource/song/千年等一回.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (9, '你那么爱她', 'music-resource/song/你那么爱她.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (10, '太阳星辰', 'music-resource/song/太阳星辰.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (11, '月亮代表我的心', 'music-resource/song/月亮代表我的心.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (12, '雪见—仙凡之旅-麦振鸿', 'music-resource/song/雪见—仙凡之旅-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (13, '月亮惹的祸', 'music-resource/song/月亮惹的祸.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (14, 'The Mass', 'music-resource/song/The Mass.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (15, '醉赤壁', 'music-resource/song/醉赤壁.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (16, '涛声依旧', 'music-resource/song/涛声依旧.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (17, '千千阙歌', 'music-resource/song/千千阙歌.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (18, '仙剑奇缘-麦振鸿', 'music-resource/song/仙剑奇缘-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (19, '遇见', 'music-resource/song/遇见.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (20, '心之焰', 'music-resource/song/心之焰.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (21, '烧酒话', 'music-resource/song/烧酒话.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (22, '一剪梅', 'music-resource/song/一剪梅.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (23, '黑街', 'music-resource/song/黑街.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (24, '懂你', 'music-resource/song/懂你.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (25, '有多少爱可以重来', 'music-resource/song/有多少爱可以重来.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (26, '约定', 'music-resource/song/约定.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (27, 'Main Titles', 'music-resource/song/Main Titles.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (28, 'Panama', 'music-resource/song/Panama.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (29, '酒干倘卖无', 'music-resource/song/酒干倘卖无.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (30, '矜持', 'music-resource/song/矜持.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (31, 'The Day You Went Away', 'music-resource/song/The Day You Went Away.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (32, 'I Just Wanna Run', 'music-resource/song/I Just Wanna Run.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (33, '往事只能回味', 'music-resource/song/往事只能回味.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (34, '知心爱人', 'music-resource/song/知心爱人.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (35, '三万英尺', 'music-resource/song/三万英尺.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (36, '有一个姑娘', 'music-resource/song/有一个姑娘.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (37, '手放开', 'music-resource/song/手放开.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (38, 'tokyo hot', 'music-resource/song/tokyo hot.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (39, '平凡之路', 'music-resource/song/平凡之路.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (40, '美酒加咖啡', 'music-resource/song/美酒加咖啡.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (41, '九九女儿红', 'music-resource/song/九九女儿红.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (42, '「名探偵コナン」~メインテーマ(バラード・ヴァージョン)', 'music-resource/song/「名探偵コナン」~メインテーマ(バラード・ヴァージョン).mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (43, '如果这都不算爱', 'music-resource/song/如果这都不算爱.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (44, 'Something Just Like This', 'music-resource/song/Something Just Like This.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (45, '我从崖边跌落', 'music-resource/song/我从崖边跌落.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (46, 'Toca Toca', 'music-resource/song/Toca Toca.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (47, '月光の雲海', 'music-resource/song/月光の雲海.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (48, '宿敌', 'music-resource/song/宿敌.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (49, '叹十声', 'music-resource/song/叹十声.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (50, '어떤 욕심', 'music-resource/song/어떤 욕심.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (51, '又见炊烟', 'music-resource/song/又见炊烟.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (52, '一生何求', 'music-resource/song/一生何求.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (53, '#Lov3 #Ngẫu Hứng', 'music-resource/song/#Lov3 #Ngẫu Hứng.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (54, '万水千山总是情', 'music-resource/song/万水千山总是情.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (55, '小雨', 'music-resource/song/小雨.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (56, '吻别', 'music-resource/song/吻别.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (57, '站在高岗上', 'music-resource/song/站在高岗上.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (58, '拜月-麦振鸿', 'music-resource/song/拜月-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (59, '你是风儿我是沙', 'music-resource/song/你是风儿我是沙.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (60, '容易受伤的女人', 'music-resource/song/容易受伤的女人.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (61, '相见不如怀念', 'music-resource/song/相见不如怀念.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (62, '月半小夜曲', 'music-resource/song/月半小夜曲.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (63, '空空如也', 'music-resource/song/空空如也.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (64, '外婆的澎湖湾', 'music-resource/song/外婆的澎湖湾.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (65, '偏偏喜欢你', 'music-resource/song/偏偏喜欢你.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (66, '花好月圆', 'music-resource/song/花好月圆.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (67, 'Hey Oh', 'music-resource/song/Hey Oh.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (68, '兰花草', 'music-resource/song/兰花草.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (69, '敖包相会', 'music-resource/song/敖包相会.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (70, '红日', 'music-resource/song/红日.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (71, '你的眼神', 'music-resource/song/你的眼神.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (72, '比翼鸟-麦振鸿', 'music-resource/song/比翼鸟-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (73, '相思风雨中', 'music-resource/song/相思风雨中.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (74, 'Unity', 'music-resource/song/Unity.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (75, '花太香', 'music-resource/song/花太香.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (76, '花香', 'music-resource/song/花香.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (77, '真的爱你', 'music-resource/song/真的爱你.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (78, '相见恨晚', 'music-resource/song/相见恨晚.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (79, 'We Will Rock You', 'music-resource/song/We Will Rock You.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (80, '牵绊一生 (不可说)-麦振鸿', 'music-resource/song/牵绊一生 (不可说)-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (81, '越夜越有机', 'music-resource/song/越夜越有机.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (82, '旧欢如梦', 'music-resource/song/旧欢如梦.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (83, '突然的自我', 'music-resource/song/突然的自我.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (84, '记事本', 'music-resource/song/记事本.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (85, '谁明浪子心', 'music-resource/song/谁明浪子心.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (86, 'I Want My Tears Back', 'music-resource/song/I Want My Tears Back.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (87, '有没有一首歌会让你想起我', 'music-resource/song/有没有一首歌会让你想起我.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (88, '天下第一-麦振鸿', 'music-resource/song/天下第一-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (89, '映山红', 'music-resource/song/映山红.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (90, 'Samsara', 'music-resource/song/Samsara.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (91, '蜗牛与黄鹂鸟', 'music-resource/song/蜗牛与黄鹂鸟.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (92, '笑脸', 'music-resource/song/笑脸.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (93, '舞女', 'music-resource/song/舞女.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (94, '取一念', 'music-resource/song/取一念.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (95, '挪威的森林', 'music-resource/song/挪威的森林.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (96, '痴心绝对', 'music-resource/song/痴心绝对.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (97, 'Wicked Wonderland', 'music-resource/song/Wicked Wonderland.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (98, '一人有一个梦想', 'music-resource/song/一人有一个梦想.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (99, '天涯歌女', 'music-resource/song/天涯歌女.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (100, '走过咖啡屋', 'music-resource/song/走过咖啡屋.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (101, '连锁反应', 'music-resource/song/连锁反应.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (102, '野鸟', 'music-resource/song/野鸟.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (103, 'Epic Sax Guy', 'music-resource/song/Epic Sax Guy.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (104, '泡沫', 'music-resource/song/泡沫.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (105, '只爱西经', 'music-resource/song/只爱西经.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (106, 'Time', 'music-resource/song/Time.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (107, '星星点灯', 'music-resource/song/星星点灯.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (108, '高高在下', 'music-resource/song/高高在下.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (109, '月亮光光', 'music-resource/song/月亮光光.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (110, 'Es rappelt im Karton', 'music-resource/song/Es rappelt im Karton.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (111, 'Silver Scrapes', 'music-resource/song/Silver Scrapes.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (112, 'Bailemen Swing Feat. Zhang Le', 'music-resource/song/Bailemen Swing Feat. Zhang Le.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (113, 'Bom Bom', 'music-resource/song/Bom Bom.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (114, '我在那一角落患过伤风', 'music-resource/song/我在那一角落患过伤风.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (115, '问情', 'music-resource/song/问情.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (116, '你究竟有几个好妹妹', 'music-resource/song/你究竟有几个好妹妹.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (117, '友情岁月', 'music-resource/song/友情岁月.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (118, 'Victory', 'music-resource/song/Victory.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (119, '青青河边草', 'music-resource/song/青青河边草.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (120, 'Loves Me Not', 'music-resource/song/Loves Me Not.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (121, '月满西楼', 'music-resource/song/月满西楼.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (122, '降魔剑-麦振鸿', 'music-resource/song/降魔剑-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (123, '继续奋战(杀破狼 演奏曲)-麦振鸿', 'music-resource/song/继续奋战(杀破狼 演奏曲)-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (124, '大地之母-麦振鸿', 'music-resource/song/大地之母-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (125, '张三的歌', 'music-resource/song/张三的歌.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (126, '心雨', 'music-resource/song/心雨.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (127, '让一切随风', 'music-resource/song/让一切随风.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (128, '将冰山劈开(Live)', 'music-resource/song/将冰山劈开(Live).mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (129, 'Bomba', 'music-resource/song/Bomba.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (130, '浪花一朵朵(任贤齐&Friends演唱会版) - live', 'music-resource/song/浪花一朵朵(任贤齐&Friends演唱会版) - live.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (131, '我很快乐', 'music-resource/song/我很快乐.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (132, '当你', 'music-resource/song/当你.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (133, '九月九的酒', 'music-resource/song/九月九的酒.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (134, 'Breath and Life', 'music-resource/song/Breath and Life.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (135, '不再说永远', 'music-resource/song/不再说永远.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (136, '讲不出再见', 'music-resource/song/讲不出再见.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (137, '梦驼铃', 'music-resource/song/梦驼铃.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (138, 'Go Time', 'music-resource/song/Go Time.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (139, '水手', 'music-resource/song/水手.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (140, '花开花落', 'music-resource/song/花开花落.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (141, '雨一直下', 'music-resource/song/雨一直下.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (142, '狂风卷奔云飙', 'music-resource/song/狂风卷奔云飙.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (143, '分飞燕', 'music-resource/song/分飞燕.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (144, '沧海一声笑', 'music-resource/song/沧海一声笑.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (145, '温柔乡', 'music-resource/song/温柔乡.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (146, '知音梦里寻', 'music-resource/song/知音梦里寻.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (147, 'Jar Of Love', 'music-resource/song/Jar Of Love.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (148, 'Lonely', 'music-resource/song/Lonely.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (149, '顺流逆流', 'music-resource/song/顺流逆流.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (150, '247', 'music-resource/song/247.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (151, '萍聚', 'music-resource/song/萍聚.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (152, '梦醒时分', 'music-resource/song/梦醒时分.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (153, 'Primetime-sexcrime', 'music-resource/song/Primetime-sexcrime.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (154, '酒杯敲钢琴', 'music-resource/song/酒杯敲钢琴.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (155, 'Axel F', 'music-resource/song/Axel F.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (156, '「名探偵コナン」~メインテーマ', 'music-resource/song/「名探偵コナン」~メインテーマ.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (157, '男儿当自强', 'music-resource/song/男儿当自强.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (158, '阿嬷的话', 'music-resource/song/阿嬷的话.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (159, '单身情歌', 'music-resource/song/单身情歌.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (160, 'Yeah', 'music-resource/song/Yeah.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (161, '祝你平安', 'music-resource/song/祝你平安.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (162, 'The Next Episode', 'music-resource/song/The Next Episode.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (163, '运动员进行曲', 'music-resource/song/运动员进行曲.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (164, '慢慢', 'music-resource/song/慢慢.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (165, '賭神', 'music-resource/song/賭神.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (166, 'BOOM', 'music-resource/song/BOOM.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (167, '明月千里寄相思', 'music-resource/song/明月千里寄相思.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (168, 'Hello', 'music-resource/song/Hello.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (169, '独家试唱', 'music-resource/song/独家试唱.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (170, '中华民谣', 'music-resource/song/中华民谣.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (171, 'Turn Down for What', 'music-resource/song/Turn Down for What.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (172, '长相依', 'music-resource/song/长相依.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (173, 'The Discovery', 'music-resource/song/The Discovery.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (174, '帝女芳魂', 'music-resource/song/帝女芳魂.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (175, '爱一点', 'music-resource/song/爱一点.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (176, '情债', 'music-resource/song/情债.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (177, '九百九十九朵玫瑰', 'music-resource/song/九百九十九朵玫瑰.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (178, 'attraction', 'music-resource/song/attraction.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (179, '游子吟', 'music-resource/song/游子吟.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (180, '大海', 'music-resource/song/大海.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (181, '我悄悄蒙上你的眼睛', 'music-resource/song/我悄悄蒙上你的眼睛.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (182, '天外有天', 'music-resource/song/天外有天.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (183, '皆大欢喜', 'music-resource/song/皆大欢喜.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (184, 'Here We Are Again', 'music-resource/song/Here We Are Again.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (185, '落雨大', 'music-resource/song/落雨大.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (186, '家后', 'music-resource/song/家后.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (187, '恨爱交加-麦振鸿', 'music-resource/song/恨爱交加-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (188, 'Freaks', 'music-resource/song/Freaks.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (189, '真真假假', 'music-resource/song/真真假假.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (190, '蝶儿蝶儿满天飞', 'music-resource/song/蝶儿蝶儿满天飞.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (191, '不要说话', 'music-resource/song/不要说话.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (192, '梦里水乡', 'music-resource/song/梦里水乡.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (193, '潇洒走一回', 'music-resource/song/潇洒走一回.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (194, '寻词', 'music-resource/song/寻词.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (195, '我的1997', 'music-resource/song/我的1997.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (196, '重逢', 'music-resource/song/重逢.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (197, '漫步人生路', 'music-resource/song/漫步人生路.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (198, '光辉岁月', 'music-resource/song/光辉岁月.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (199, '爱你一万年', 'music-resource/song/爱你一万年.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (200, '月半弯', 'music-resource/song/月半弯.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (201, '一路上有你', 'music-resource/song/一路上有你.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (202, '狐狸', 'music-resource/song/狐狸.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (203, '风的季节', 'music-resource/song/风的季节.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (204, '月牙湾', 'music-resource/song/月牙湾.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (205, '致姗姗来迟的你', 'music-resource/song/致姗姗来迟的你.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (206, '潮湿的心', 'music-resource/song/潮湿的心.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (207, 'Me Too', 'music-resource/song/Me Too.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (208, '靠近', 'music-resource/song/靠近.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (209, '阿郎', 'music-resource/song/阿郎.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (210, '感恩的心', 'music-resource/song/感恩的心.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (211, 'We Are Electric', 'music-resource/song/We Are Electric.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (212, '新不了情', 'music-resource/song/新不了情.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (213, '铁血丹心', 'music-resource/song/铁血丹心.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (214, '桃花岛-麦振鸿', 'music-resource/song/桃花岛-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (215, '丁香花', 'music-resource/song/丁香花.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (216, '踏浪', 'music-resource/song/踏浪.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (217, '风中有朵雨做的云', 'music-resource/song/风中有朵雨做的云.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (218, '相思', 'music-resource/song/相思.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (219, 'Stronger', 'music-resource/song/Stronger.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (220, 'Faded', 'music-resource/song/Faded.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (221, '林中鸟', 'music-resource/song/林中鸟.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (222, '曾经心痛', 'music-resource/song/曾经心痛.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (223, '太傻', 'music-resource/song/太傻.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (224, '雪花', 'music-resource/song/雪花.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (225, '难得有情人', 'music-resource/song/难得有情人.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (226, '来生缘', 'music-resource/song/来生缘.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (227, '珍重', 'music-resource/song/珍重.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (228, 'Because of You', 'music-resource/song/Because of You.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (229, '倩女幽魂', 'music-resource/song/倩女幽魂.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (230, '羞答答的玫瑰静悄悄地开', 'music-resource/song/羞答答的玫瑰静悄悄地开.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (231, '坐在巷口的那对男女', 'music-resource/song/坐在巷口的那对男女.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (232, '爸爸的汽水', 'music-resource/song/爸爸的汽水.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (233, '窗外', 'music-resource/song/窗外.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (234, 'Mi Mi Mi', 'music-resource/song/Mi Mi Mi.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (235, '甜蜜蜜', 'music-resource/song/甜蜜蜜.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (236, 'Seve', 'music-resource/song/Seve.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (237, '独角戏', 'music-resource/song/独角戏.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (238, '恰似你的温柔', 'music-resource/song/恰似你的温柔.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (239, '江湖笑', 'music-resource/song/江湖笑.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (240, '时空之钥-麦振鸿', 'music-resource/song/时空之钥-麦振鸿.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (242, 'Beat It (12\' Mix) - Michael Jackson', 'music-resource/song/Beat It (12\' Mix) - Michael Jackson.mp3', NULL, NULL, 0, 'Beat It (12\' Mix) - Michael Jackson.lrc', 'music-resource/lyric/Beat It (12\' Mix) - Michael Jackson.lrc');
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (244, 'You Are Not Alone (live) - Michael Jackson', 'music-resource/song/You Are Not Alone (live) - Michael Jackson.mp3', NULL, NULL, 0, 'You Are Not Alone (live) - Michael Jackson.lrc', 'music-resource/lyric/You Are Not Alone (live) - Michael Jackson.lrc');
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (246, '月球下的人', 'music-resource/song/月球下的人.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (247, '月球下的人', 'music-resource/song/月球下的人.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (248, '月球下的人', 'music-resource/song/月球下的人.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (249, '月球下的人', 'music-resource/song/月球下的人.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (250, '月球下的人', 'music-resource/song/月球下的人.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (251, '颜人中 - 有些', 'music-resource/song/251.mp3', NULL, NULL, 0, NULL, NULL);
INSERT INTO `song` (`songId`, `songName`, `songAddress`, `songCoverAddress`, `songType`, `songLength`, `lyricName`, `lyricAddress`) VALUES (252, '颜人中 - 晚安', 'music-resource/song/252.mp3', NULL, NULL, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `userName` varchar(45) NOT NULL DEFAULT '菜鸡一枚我不哭',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2011231 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (1, 'guest@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '菜鸡一枚我不哭');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (2, 'admin@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '一人之下');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (4, '1344986@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'Donald J. Trump');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (5, '2504208@qq.com', 'd9f4e4bb710357210fa9fe30c178fc42', '菜鸡一枚我不哭');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (6, '265991@163.com', 'bf08b01ead83cbd62a9839ca1cf35ada', '菜鸡一枚我不哭');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (7, '5878433@qq.com', '5fc70f8b935595586dbbae4cda7cae3f', '菜鸡一枚我不哭');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (8, '19962007@126.com', '3fde6bb0541387e4ebdadf7c2ff31123', '菜鸡一枚我不哭');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (9, '2145930654@qq.com', 'c943feee03ccd9aa8b842e7efdf4664f', '菜鸡一枚我不哭');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (15, '212582493@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '东方姑凉');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (2011227, 'root@trackstacking.top', '63a9f0ea7bb98050796b649e85481845', 'ROOT');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (2011228, '十大21kqluo@stu.edu.cn', 'e10adc3949ba59abbe56e057f20f883e', '菜鸡一枚我不哭');
INSERT INTO `user` (`userId`, `email`, `password`, `userName`) VALUES (2011230, '21xpmai@stu.edu.cn', 'c9b0654d5a1c649506132bb937312212', '菜鸡一枚我不哭');
COMMIT;

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `userroleId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`userroleId`),
  KEY `fk_userrole_1_idx` (`userId`),
  KEY `fk_userrole_2_idx` (`roleId`),
  CONSTRAINT `fk_userrole_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_userrole_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of userrole
-- ----------------------------
BEGIN;
INSERT INTO `userrole` (`userroleId`, `userId`, `roleId`) VALUES (1, 2, 1);
COMMIT;

-- ----------------------------
-- View structure for monthranking
-- ----------------------------
DROP VIEW IF EXISTS `monthranking`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `monthranking` AS select `play`.`songId` AS `songId`,count(`play`.`songId`) AS `trendingCoefficient` from `play` where (month(`play`.`playTime`) >= (month(now()) - 1)) group by `play`.`songId` limit 50;

-- ----------------------------
-- View structure for trending
-- ----------------------------
DROP VIEW IF EXISTS `trending`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `trending` AS select `play`.`songId` AS `songId`,count(`play`.`songId`) AS `trendingCoefficient` from `play` group by `play`.`songId` limit 50;

-- ----------------------------
-- View structure for weekranking
-- ----------------------------
DROP VIEW IF EXISTS `weekranking`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `weekranking` AS select `play`.`songId` AS `songId`,count(`play`.`songId`) AS `trendingCoefficient` from `play` where (week(`play`.`playTime`,0) >= (week(now(),0) - 1)) group by `play`.`songId` limit 50;

SET FOREIGN_KEY_CHECKS = 1;
