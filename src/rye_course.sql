/*
Navicat MySQL Data Transfer

Source Server         : user
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : rye_course

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2020-02-27 13:05:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `phone` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `head` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '1正常 2冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '張三', '15939049221', '123', '/2020011611/906ecd87b217458abda0304d751fe5cf.jpeg', null, '1');
INSERT INTO `admin` VALUES ('2', '邱鸿智', '15939049224', '123', '/2020011611/906ecd87b217458abda0304d751fe5cf.jpeg', null, '1');
INSERT INTO `admin` VALUES ('3', '测试', '15939049222', '123', '/2020020813/db9ca19509334978884906be74e1b662.jpeg', null, '1');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播广告',
  `head` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `type` tinyint(10) unsigned DEFAULT '1' COMMENT '1健谈智慧 2家庭教育 3麦田淘宝',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES ('1', '/home/image/zhihui.png', '1', '2020-01-13 17:47:49', null);
INSERT INTO `carousel` VALUES ('2', '/home/image/zhihui.png', '2', '2020-01-13 17:48:59', null);
INSERT INTO `carousel` VALUES ('3', '/home/image/tkban.png', '1', '2020-01-13 17:49:45', null);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(10) unsigned DEFAULT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `priority` int(11) DEFAULT '1',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '1健谈智慧 2家庭教育',
  `if_status` tinyint(3) DEFAULT '1' COMMENT '1免费 2健谈会员 3家庭会员',
  `digest` varchar(240) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '摘要',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cover` varchar(600) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '1', '1', '和和睦睦', '1', '1', '1', '善于谈话，滔滔不绝，经久不倦。', '2020-01-16 14:57:14', '2020-01-16 14:57:16', '/2020011611/906ecd87b217458abda0304d751fe5cf.jpeg');
INSERT INTO `course` VALUES ('5', '2', '1', '标题', '1', '1', '2', '测试', '2020-01-16 17:06:17', null, '/2020011617/5145961a1d37400dbea4f7a540af1b3e.jpeg');
INSERT INTO `course` VALUES ('6', '3', '1', '牧马人', '1', '1', '2', '牧马人》是上海电影制片厂拍摄、谢晋执导的剧情片，由朱时茂、丛珊领衔主演，于1982年上映。该片改编自张贤亮的小说《灵与肉》，讲述了许灵均被打成“右派”，来到西北牧场劳动，得到当地牧民的关怀照料，并与农村姑娘李秀芝结成连理 ...', '2020-01-16 17:08:16', null, '/2020011617/47d81f4591804c6bbd817dc0cc872c6d.jpeg');

-- ----------------------------
-- Table structure for course_catalog
-- ----------------------------
DROP TABLE IF EXISTS `course_catalog`;
CREATE TABLE `course_catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录表',
  `course_id` int(10) unsigned DEFAULT NULL,
  `catalog` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `duration` varchar(64) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '时长',
  `status_num` int(11) DEFAULT NULL COMMENT '学习数量',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '1免费 2vip免费 3收费',
  `video_url` varchar(600) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '视频地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of course_catalog
-- ----------------------------
INSERT INTO `course_catalog` VALUES ('1', '1', '人人为人', '2020-01-28 13:09:32', '6', '2', '1', '/a.shipin');
INSERT INTO `course_catalog` VALUES ('2', '1', '', null, '0', null, '1', null);
INSERT INTO `course_catalog` VALUES ('3', '1', '我爱人人', '2020-02-05 15:18:21', '69', '0', '1', '/2020020515/3c2a29aae51944c2b30a443fa0e2a9b4.mp4');

-- ----------------------------
-- Table structure for course_collect
-- ----------------------------
DROP TABLE IF EXISTS `course_collect`;
CREATE TABLE `course_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of course_collect
-- ----------------------------

-- ----------------------------
-- Table structure for course_comment
-- ----------------------------
DROP TABLE IF EXISTS `course_comment`;
CREATE TABLE `course_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  `content` varchar(600) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of course_comment
-- ----------------------------

-- ----------------------------
-- Table structure for course_image
-- ----------------------------
DROP TABLE IF EXISTS `course_image`;
CREATE TABLE `course_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `image` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `priority` int(64) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of course_image
-- ----------------------------
INSERT INTO `course_image` VALUES ('1', '1', '/1.jpg', '1', '2020-01-28 13:11:54', null);
INSERT INTO `course_image` VALUES ('2', '1', '/2.jpg', '1', '2020-01-16 13:12:08', null);
INSERT INTO `course_image` VALUES ('3', '1', '/2020020515/290e7ef5bd324ff7a465f946cf7ce4df.jpeg', '1', '2020-02-05 15:18:21', null);
INSERT INTO `course_image` VALUES ('4', '1', '/2020020515/f3be1d522d834f4e86ef1617683f4cb1.jpeg', '1', '2020-02-05 15:18:21', null);

-- ----------------------------
-- Table structure for course_intro
-- ----------------------------
DROP TABLE IF EXISTS `course_intro`;
CREATE TABLE `course_intro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '简介表',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `intro` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `priority` int(64) DEFAULT '1',
  `cover` varchar(864) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of course_intro
-- ----------------------------
INSERT INTO `course_intro` VALUES ('1', '1', '人人是好人', '1', '/封面.jpg', '2020-01-28 13:12:32', null);
INSERT INTO `course_intro` VALUES ('2', '1', '第三篇,,,,好看的', '1', '/2020020515/2cc13b29d44c4ebc95a3df2327b8ecf1.jpeg', '2020-02-05 15:18:21', null);

-- ----------------------------
-- Table structure for course_like
-- ----------------------------
DROP TABLE IF EXISTS `course_like`;
CREATE TABLE `course_like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of course_like
-- ----------------------------

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `priority` int(64) DEFAULT '1',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '1健谈  2家庭 3麦田淘课',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', '健谈智慧', '1', '1', '2020-01-13 17:30:34', '2020-01-13 17:34:40');
INSERT INTO `section` VALUES ('2', '精品推荐', '1', '1', '2020-01-13 17:30:52', '2020-01-13 17:30:53');
INSERT INTO `section` VALUES ('3', '名师来了', '1', '1', '2020-01-13 17:34:26', '2020-01-13 17:34:27');
INSERT INTO `section` VALUES ('4', '育儿锦囊', '1', '2', '2020-01-13 17:34:28', '2020-01-13 17:34:30');
INSERT INTO `section` VALUES ('5', '品质培养', '1', '2', '2020-01-13 17:34:31', '2020-01-13 17:34:32');
INSERT INTO `section` VALUES ('6', '家规家风', '1', '2', '2020-01-13 17:34:33', '2020-01-13 17:34:35');
INSERT INTO `section` VALUES ('7', '夫妻关系', '1', '2', '2020-01-13 17:34:36', '2020-01-13 17:34:37');
INSERT INTO `section` VALUES ('8', '幼教陪伴', '1', '2', '2020-01-13 17:34:38', '2020-01-13 17:34:40');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `bill_record_id` int(10) unsigned DEFAULT NULL COMMENT '账单记录',
  `user_name` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `invitation_code` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '邀请码',
  `phone` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `alipay_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付宝名称',
  `alipay_account` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '支付宝账户',
  `balance` float(255,2) DEFAULT '0.00' COMMENT '余额',
  `head` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '真实姓名',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '1正常 2冻结',
  `sex` int(3) unsigned DEFAULT NULL COMMENT '1为男 2为女',
  `birthday` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `pinless` tinyint(5) unsigned DEFAULT '1' COMMENT '1未绑定 2绑定',
  `withdraw_password` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '提现密码',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', '天津市-天津市-天津市', null, '邱鸿智', '81dc9bdb52d04dc20036dbd8313ed055', '53467692', '15939049221', null, '', '0.00', '/2020010915/ca2d4b110e17439291dea5e0d6d1534b.jpeg', '', '1', '1', '2020-01-09', '1', '123456', '2020-01-14 10:54:51');
INSERT INTO `user` VALUES ('5', '北京市-北京市-北京市', null, '张三', '202cb962ac59075b964b07152d234b70', '53467692', '15939049227', null, '', '0.00', '/2020011315/06b0736a3070431daac11dd1926bd175.jpeg', '', '1', '2', '2020-01-13', '1', '', '2020-01-15 10:54:56');
INSERT INTO `user` VALUES ('6', null, null, '', '202cb962ac59075b964b07152d234b70', '53467692', '15939049365', null, '', '0.00', '', '', '1', null, null, '1', '', '2020-02-01 10:54:59');
INSERT INTO `user` VALUES ('7', null, null, '', '202cb962ac59075b964b07152d234b70', '53467692', '15939049242', null, '', '0.00', '', '', '1', null, null, '1', '', '2020-03-01 10:55:03');
INSERT INTO `user` VALUES ('8', null, null, '', '202cb962ac59075b964b07152d234b70', '18869361', '15939049297', null, '', '0.00', '', '', '1', null, '', '1', '', '2020-06-01 10:55:10');

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `way` tinyint(3) unsigned DEFAULT NULL COMMENT '1github 2微信 3qq',
  `open_id` varchar(240) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
INSERT INTO `user_auth` VALUES ('3', '6', '1', 'MDQ6VXNlcjU2NDI4MDA4');
INSERT INTO `user_auth` VALUES ('8', '4', '1', 'MDQ6VXNlcjU2NDI4MDA4');

-- ----------------------------
-- Table structure for user_vip
-- ----------------------------
DROP TABLE IF EXISTS `user_vip`;
CREATE TABLE `user_vip` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` decimal(64,2) DEFAULT NULL,
  `mode` tinyint(6) unsigned DEFAULT '1' COMMENT '1支付宝 2微信 3信用卡',
  `openning_time` datetime DEFAULT NULL COMMENT '开通时间',
  `openning_amount` decimal(64,2) DEFAULT '0.00' COMMENT '开通金额',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `head` varchar(600) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_vip
-- ----------------------------
INSERT INTO `user_vip` VALUES ('1', '4', '健谈智慧vip', '365.00', '1', '2020-01-13 15:04:05', '365.00', '2021-01-28 00:00:00', '/home/image/jtvip.png');
INSERT INTO `user_vip` VALUES ('4', '4', '家庭教育vip', '365.00', '1', '2020-01-13 16:32:20', '700.00', '2021-01-13 16:32:25', '/home/image/jtvip1.png');
