/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yishupin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-06-04 18:14:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fa_ad
-- ----------------------------
DROP TABLE IF EXISTS `fa_ad`;
CREATE TABLE `fa_ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `image` varchar(1024) NOT NULL COMMENT '图片',
  `url` varchar(256) DEFAULT NULL COMMENT '外链地址',
  `type` enum('10','20') NOT NULL COMMENT '链接方式:10=内链,20=外链',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- ----------------------------
-- Records of fa_ad
-- ----------------------------
INSERT INTO `fa_ad` VALUES ('1', '1', '/uploads/20190604/6aef9eb39d62df20a4dac1230694817b.jpg', '/index/goods/4', '10', '2019-06-04 17:28:44');
INSERT INTO `fa_ad` VALUES ('2', '2', '/uploads/20190604/9ab6b8c0e6e5f070cc6ab95269761f28.jpg', '/index/article/3', '10', '2019-06-04 17:29:00');

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES ('1', 'admin', 'Admin', '68fcb8553802d86f466e62ec05e0950a', 'af1816', '/assets/img/avatar.png', 'admin@admin.com', '0', '1559627094', '1492186163', '1559627094', '95ec1f77-e79a-413c-9750-7c37e37bd2a0', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES ('1', '1', 'admin', '/index.php/admin/index/login', '登录', '{\"__token__\":\"355aad8b520a216d61473bb7e40686b1\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627094');
INSERT INTO `fa_admin_log` VALUES ('2', '1', 'admin', '/index.php/admin/auth/rule/del/ids/66', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"66\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627273');
INSERT INTO `fa_admin_log` VALUES ('3', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627273');
INSERT INTO `fa_admin_log` VALUES ('4', '1', 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"11702\",\"token\":\"c4aee0bb-57c8-497a-b0aa-7cb87af1ad66\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20190510_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627293');
INSERT INTO `fa_admin_log` VALUES ('5', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627293');
INSERT INTO `fa_admin_log` VALUES ('6', '1', 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"epay\",\"force\":\"0\",\"uid\":\"11702\",\"token\":\"c4aee0bb-57c8-497a-b0aa-7cb87af1ad66\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190510_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627298');
INSERT INTO `fa_admin_log` VALUES ('7', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627298');
INSERT INTO `fa_admin_log` VALUES ('8', '1', 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"11702\",\"token\":\"c4aee0bb-57c8-497a-b0aa-7cb87af1ad66\",\"version\":\"1.0.3\",\"faversion\":\"1.0.0.20190510_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627303');
INSERT INTO `fa_admin_log` VALUES ('9', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627304');
INSERT INTO `fa_admin_log` VALUES ('10', '1', 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"cropper\",\"force\":\"0\",\"uid\":\"11702\",\"token\":\"c4aee0bb-57c8-497a-b0aa-7cb87af1ad66\",\"version\":\"1.0.1\",\"faversion\":\"1.0.0.20190510_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627316');
INSERT INTO `fa_admin_log` VALUES ('11', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559627316');
INSERT INTO `fa_admin_log` VALUES ('12', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_ad\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637757');
INSERT INTO `fa_admin_log` VALUES ('13', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637761');
INSERT INTO `fa_admin_log` VALUES ('14', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_ad\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637883');
INSERT INTO `fa_admin_log` VALUES ('15', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637888');
INSERT INTO `fa_admin_log` VALUES ('16', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_user\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"user_id\",\"avatar\",\"mobile\",\"createtime\"],\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637897');
INSERT INTO `fa_admin_log` VALUES ('17', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_user\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"user_id\",\"avatar\",\"mobile\",\"createtime\"],\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637898');
INSERT INTO `fa_admin_log` VALUES ('18', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637899');
INSERT INTO `fa_admin_log` VALUES ('19', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_user\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"user_id\",\"avatar\",\"mobile\",\"createtime\"],\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637903');
INSERT INTO `fa_admin_log` VALUES ('20', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_user\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"user_id\",\"avatar\",\"mobile\",\"createtime\"],\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637903');
INSERT INTO `fa_admin_log` VALUES ('21', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637905');
INSERT INTO `fa_admin_log` VALUES ('22', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637908');
INSERT INTO `fa_admin_log` VALUES ('23', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637910');
INSERT INTO `fa_admin_log` VALUES ('24', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637911');
INSERT INTO `fa_admin_log` VALUES ('25', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"User.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637912');
INSERT INTO `fa_admin_log` VALUES ('26', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"User.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637913');
INSERT INTO `fa_admin_log` VALUES ('27', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559637914');
INSERT INTO `fa_admin_log` VALUES ('28', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"u=1986179278,1118313821&amp;fm=26&amp;gp=0.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638294');
INSERT INTO `fa_admin_log` VALUES ('29', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"u=2153937626,1074119156&amp;fm=26&amp;gp=0.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638430');
INSERT INTO `fa_admin_log` VALUES ('30', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"u=2968231382,1111539856&amp;fm=26&amp;gp=0.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638434');
INSERT INTO `fa_admin_log` VALUES ('31', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"u=3300305952,1328708913&amp;fm=26&amp;gp=0.jpg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638439');
INSERT INTO `fa_admin_log` VALUES ('32', '1', 'admin', '/index.php/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"cropper\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638483');
INSERT INTO `fa_admin_log` VALUES ('33', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638483');
INSERT INTO `fa_admin_log` VALUES ('34', '1', 'admin', '/index.php/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"cropper\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638485');
INSERT INTO `fa_admin_log` VALUES ('35', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638485');
INSERT INTO `fa_admin_log` VALUES ('36', '1', 'admin', '/index.php/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"cropper\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638653');
INSERT INTO `fa_admin_log` VALUES ('37', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638654');
INSERT INTO `fa_admin_log` VALUES ('38', '1', 'admin', '/index.php/admin/addon/uninstall', '插件管理 卸载', '{\"name\":\"cropper\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638656');
INSERT INTO `fa_admin_log` VALUES ('39', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559638657');
INSERT INTO `fa_admin_log` VALUES ('40', '1', 'admin', '/index.php/admin/user/add?dialog=1', '用户管理 添加', '{\"dialog\":\"1\",\"row\":{\"avatar\":\"\\/uploads\\/20190604\\/6aef9eb39d62df20a4dac1230694817b.jpg\",\"mobile\":\"14780114469\",\"password\":\"asd123123\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639231');
INSERT INTO `fa_admin_log` VALUES ('41', '1', 'admin', '/index.php/admin/user/edit/ids/1?dialog=1', '用户管理 编辑', '{\"dialog\":\"1\",\"row\":{\"avatar\":\"\\/uploads\\/20190604\\/6aef9eb39d62df20a4dac1230694817b.jpg\",\"mobile\":\"14780114469\",\"password\":\"asd123123\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639426');
INSERT INTO `fa_admin_log` VALUES ('42', '1', 'admin', '/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"system_manage\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"icon\":\"fa fa-wrench\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639525');
INSERT INTO `fa_admin_log` VALUES ('43', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639525');
INSERT INTO `fa_admin_log` VALUES ('44', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_ad\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639618');
INSERT INTO `fa_admin_log` VALUES ('45', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_ad\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639761');
INSERT INTO `fa_admin_log` VALUES ('46', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_ad\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"type\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639805');
INSERT INTO `fa_admin_log` VALUES ('47', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_ad\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"type\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639806');
INSERT INTO `fa_admin_log` VALUES ('48', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639807');
INSERT INTO `fa_admin_log` VALUES ('49', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639809');
INSERT INTO `fa_admin_log` VALUES ('50', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639810');
INSERT INTO `fa_admin_log` VALUES ('51', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Ad.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639811');
INSERT INTO `fa_admin_log` VALUES ('52', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Ad.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639812');
INSERT INTO `fa_admin_log` VALUES ('53', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639813');
INSERT INTO `fa_admin_log` VALUES ('54', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_ad\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639917');
INSERT INTO `fa_admin_log` VALUES ('55', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_ad\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"type\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639927');
INSERT INTO `fa_admin_log` VALUES ('56', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_ad\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"type\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639928');
INSERT INTO `fa_admin_log` VALUES ('57', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639929');
INSERT INTO `fa_admin_log` VALUES ('58', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ad\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"type\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639932');
INSERT INTO `fa_admin_log` VALUES ('59', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_ad\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"type\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639932');
INSERT INTO `fa_admin_log` VALUES ('60', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639933');
INSERT INTO `fa_admin_log` VALUES ('61', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639935');
INSERT INTO `fa_admin_log` VALUES ('62', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639936');
INSERT INTO `fa_admin_log` VALUES ('63', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"Ad.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639938');
INSERT INTO `fa_admin_log` VALUES ('64', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"Ad.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639938');
INSERT INTO `fa_admin_log` VALUES ('65', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559639940');
INSERT INTO `fa_admin_log` VALUES ('66', '1', 'admin', '/index.php/admin/ad/add?dialog=1', '轮播图管理 添加', '{\"dialog\":\"1\",\"row\":{\"weigh\":\"0\",\"image\":\"\\/uploads\\/20190604\\/6aef9eb39d62df20a4dac1230694817b.jpg\",\"type\":\"10\",\"url\":\"\\/index\\/goods\\/4\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640525');
INSERT INTO `fa_admin_log` VALUES ('67', '1', 'admin', '/index.php/admin/ad/add?dialog=1', '轮播图管理 添加', '{\"dialog\":\"1\",\"row\":{\"weigh\":\"0\",\"image\":\"\\/uploads\\/20190604\\/9ab6b8c0e6e5f070cc6ab95269761f28.jpg\",\"type\":\"10\",\"url\":\"\\/index\\/article\\/3\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640540');
INSERT INTO `fa_admin_log` VALUES ('68', '1', 'admin', '/index.php/admin/ajax/weigh', '', '{\"pk\":\"ad_id\",\"ids\":\"1,2\",\"changeid\":\"2\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"ad\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640703');
INSERT INTO `fa_admin_log` VALUES ('69', '1', 'admin', '/index.php/admin/ajax/weigh', '', '{\"pk\":\"ad_id\",\"ids\":\"2,1\",\"changeid\":\"1\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"ad\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640713');
INSERT INTO `fa_admin_log` VALUES ('70', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/105?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"98\",\"name\":\"ad\",\"title\":\"\\u8f6e\\u64ad\\u56fe\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"105\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640731');
INSERT INTO `fa_admin_log` VALUES ('71', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640731');
INSERT INTO `fa_admin_log` VALUES ('72', '1', 'admin', '/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"goods_manage\",\"title\":\"\\u4f5c\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-align-justify\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640850');
INSERT INTO `fa_admin_log` VALUES ('73', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640851');
INSERT INTO `fa_admin_log` VALUES ('74', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_ad\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640857');
INSERT INTO `fa_admin_log` VALUES ('75', '1', 'admin', '/index.php/admin/command/get_field_list', '', '{\"table\":\"fa_type\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640867');
INSERT INTO `fa_admin_log` VALUES ('76', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_type\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640890');
INSERT INTO `fa_admin_log` VALUES ('77', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_type\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640890');
INSERT INTO `fa_admin_log` VALUES ('78', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640891');
INSERT INTO `fa_admin_log` VALUES ('79', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640893');
INSERT INTO `fa_admin_log` VALUES ('80', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640894');
INSERT INTO `fa_admin_log` VALUES ('81', '1', 'admin', '/index.php/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640895');
INSERT INTO `fa_admin_log` VALUES ('82', '1', 'admin', '/index.php/admin/command/command/action/command', '', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Type.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640896');
INSERT INTO `fa_admin_log` VALUES ('83', '1', 'admin', '/index.php/admin/command/command/action/execute', '', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Type.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640897');
INSERT INTO `fa_admin_log` VALUES ('84', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640898');
INSERT INTO `fa_admin_log` VALUES ('85', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/107?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"106\",\"name\":\"type\",\"title\":\"\\u4f5c\\u54c1\\u5206\\u7c7b\",\"icon\":\"fa fa-align-center\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"107\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640937');
INSERT INTO `fa_admin_log` VALUES ('86', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559640938');
INSERT INTO `fa_admin_log` VALUES ('87', '1', 'admin', '/index.php/admin/type/add?dialog=1', '作品管理 作品分类 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7ed8\\u753b\",\"image\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641080');
INSERT INTO `fa_admin_log` VALUES ('88', '1', 'admin', '/index.php/admin/type/add?dialog=1', '作品管理 作品分类 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u96d5\\u5851\",\"image\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641099');
INSERT INTO `fa_admin_log` VALUES ('89', '1', 'admin', '/index.php/admin/type/add?dialog=1', '作品管理 作品分类 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e66\\u6cd5\",\"image\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641111');
INSERT INTO `fa_admin_log` VALUES ('90', '1', 'admin', '/index.php/admin/type/add?dialog=1', '作品管理 作品分类 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7bc6\\u523b\",\"image\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641117');
INSERT INTO `fa_admin_log` VALUES ('91', '1', 'admin', '/index.php/admin/type/add?dialog=1', '作品管理 作品分类 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u74f7\\u827a\",\"image\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641147');
INSERT INTO `fa_admin_log` VALUES ('92', '1', 'admin', '/index.php/admin/type/add?dialog=1', '作品管理 作品分类 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u9676\\u827a\",\"image\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641153');
INSERT INTO `fa_admin_log` VALUES ('93', '1', 'admin', '/index.php/admin/type/add?dialog=1', '作品管理 作品分类 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u6f06\\u5668\",\"image\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641165');
INSERT INTO `fa_admin_log` VALUES ('94', '1', 'admin', '/index.php/admin/type/add_down?pid=&ids=7', '', '{\"pid\":\"\",\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641809');
INSERT INTO `fa_admin_log` VALUES ('95', '1', 'admin', '/index.php/admin/type/add_down?pid=&ids=8', '', '{\"pid\":\"\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559641889');
INSERT INTO `fa_admin_log` VALUES ('96', '1', 'admin', '/index.php/admin/type/del/ids/8', '作品管理 作品分类 删除', '{\"action\":\"del\",\"ids\":\"8\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559642174');
INSERT INTO `fa_admin_log` VALUES ('97', '1', 'admin', '/index.php/admin/type/add_down?pid=7&ids=7&dialog=1', '', '{\"pid\":\"7\",\"ids\":\"7\",\"dialog\":\"1\",\"row\":{\"name\":\"test\",\"image\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559642180');
INSERT INTO `fa_admin_log` VALUES ('98', '1', 'admin', '/index.php/admin/type/add_down?pid=7&ids=7&dialog=1', '', '{\"pid\":\"7\",\"ids\":\"7\",\"dialog\":\"1\",\"row\":{\"name\":\"as\",\"image\":\"as\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559642223');
INSERT INTO `fa_admin_log` VALUES ('99', '1', 'admin', '/index.php/admin/type/del/ids/9', '作品管理 作品分类 删除', '{\"action\":\"del\",\"ids\":\"9\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559642227');
INSERT INTO `fa_admin_log` VALUES ('100', '1', 'admin', '/index.php/admin/type/del/ids/10', '作品管理 作品分类 删除', '{\"action\":\"del\",\"ids\":\"10\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559642230');
INSERT INTO `fa_admin_log` VALUES ('101', '1', 'admin', '/index.php/admin/type/add_down?pid=7&ids=7&dialog=1', '', '{\"pid\":\"7\",\"ids\":\"7\",\"dialog\":\"1\",\"row\":{\"name\":\"test\",\"image\":\"test\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '1559642301');

-- ----------------------------
-- Table structure for fa_article
-- ----------------------------
DROP TABLE IF EXISTS `fa_article`;
CREATE TABLE `fa_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(1024) NOT NULL COMMENT '标题',
  `introduce` text NOT NULL COMMENT '简介',
  `details` text NOT NULL COMMENT '图文详情',
  `author` varchar(64) NOT NULL COMMENT '作者名称',
  `author_avatar` varchar(1024) NOT NULL COMMENT '作者头像',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='阅读表';

-- ----------------------------
-- Records of fa_article
-- ----------------------------

-- ----------------------------
-- Table structure for fa_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `fa_article_comment`;
CREATE TABLE `fa_article_comment` (
  `article_comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `reply` text NOT NULL COMMENT '回复内容',
  `article_id` int(11) NOT NULL COMMENT '阅读id',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`article_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='阅读评论表';

-- ----------------------------
-- Records of fa_article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for fa_artist
-- ----------------------------
DROP TABLE IF EXISTS `fa_artist`;
CREATE TABLE `fa_artist` (
  `artist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '艺术家名称',
  `avatar` varchar(1024) NOT NULL COMMENT '艺术家头像',
  `introduce` text NOT NULL COMMENT '简介',
  `wallet` decimal(10,2) NOT NULL COMMENT '钱包',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='艺术家表';

-- ----------------------------
-- Records of fa_artist
-- ----------------------------

-- ----------------------------
-- Table structure for fa_artist_comment
-- ----------------------------
DROP TABLE IF EXISTS `fa_artist_comment`;
CREATE TABLE `fa_artist_comment` (
  `artist_comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `artist_id` int(11) NOT NULL COMMENT '艺术家id',
  `reply` text NOT NULL COMMENT '回复内容',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`artist_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='艺术家评论表';

-- ----------------------------
-- Records of fa_artist_comment
-- ----------------------------

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES ('2', '1', '0', '/uploads/20190604/85bf06bb5108d81111cb2d0bf3c862a2.jpg', '528', '300', 'jpg', '0', '49709', 'image/jpeg', '{\"name\":\"u=1986179278,1118313821&amp;fm=26&amp;gp=0.jpg\"}', '1559638294', '1559638294', '1559638294', 'local', '7c04781b4a634fa224e1b2146c6a368009b0d762');
INSERT INTO `fa_attachment` VALUES ('3', '1', '0', '/uploads/20190604/952b84a84bdaefec1224364c95ebb53a.jpg', '500', '375', 'jpg', '0', '28111', 'image/jpeg', '{\"name\":\"u=2153937626,1074119156&amp;fm=26&amp;gp=0.jpg\"}', '1559638430', '1559638430', '1559638430', 'local', '78ce10bcde1fe9ec311f8b269d1e761a3c1849e8');
INSERT INTO `fa_attachment` VALUES ('4', '1', '0', '/uploads/20190604/9ab6b8c0e6e5f070cc6ab95269761f28.jpg', '500', '313', 'jpg', '0', '38837', 'image/jpeg', '{\"name\":\"u=2968231382,1111539856&amp;fm=26&amp;gp=0.jpg\"}', '1559638434', '1559638434', '1559638434', 'local', 'eb9c81e54ee34c36f2b899792527ef85b6d0990f');
INSERT INTO `fa_attachment` VALUES ('5', '1', '0', '/uploads/20190604/6aef9eb39d62df20a4dac1230694817b.jpg', '605', '300', 'jpg', '0', '16256', 'image/jpeg', '{\"name\":\"u=3300305952,1328708913&amp;fm=26&amp;gp=0.jpg\"}', '1559638438', '1559638438', '1559638438', 'local', 'aab05b1b8a3cae9543d3c4b5795254d711498bb0');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `fa_auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `fa_auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `fa_auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `fa_auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '1', '1497429920', '1497429920', '143', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '137', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('3', 'file', '0', 'category', 'Category', 'fa fa-leaf', '', 'Category tips', '1', '1497429920', '1497429920', '119', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('4', 'file', '0', 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '99', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '113', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '109', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1497430581', '104', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '136', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '133', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '134', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '132', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '142', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '141', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '140', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '139', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '138', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '117', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '116', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '115', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '114', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '112', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '111', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '110', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '108', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '107', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '106', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '105', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '103', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '102', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '101', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '100', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('59', 'file', '4', 'addon/local', 'Local install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('61', 'file', '4', 'addon/install', 'Install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('62', 'file', '4', 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('85', 'file', '0', 'command', '在线命令管理', 'fa fa-terminal', '', '', '1', '1559627293', '1559627293', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('86', 'file', '85', 'command/index', '查看', 'fa fa-circle-o', '', '', '0', '1559627293', '1559627293', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('87', 'file', '85', 'command/add', '添加', 'fa fa-circle-o', '', '', '0', '1559627293', '1559627293', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('88', 'file', '85', 'command/detail', '详情', 'fa fa-circle-o', '', '', '0', '1559627293', '1559627293', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('89', 'file', '85', 'command/execute', '运行', 'fa fa-circle-o', '', '', '0', '1559627293', '1559627293', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('90', 'file', '85', 'command/del', '删除', 'fa fa-circle-o', '', '', '0', '1559627293', '1559627293', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('91', 'file', '85', 'command/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1559627293', '1559627293', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('92', 'file', '0', 'user', '用户管理', 'fa fa-user', '', '', '1', '1559637913', '1559637913', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('93', 'file', '92', 'user/index', '查看', 'fa fa-circle-o', '', '', '0', '1559637913', '1559637913', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('94', 'file', '92', 'user/add', '添加', 'fa fa-circle-o', '', '', '0', '1559637913', '1559637913', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('95', 'file', '92', 'user/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1559637913', '1559637913', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('96', 'file', '92', 'user/del', '删除', 'fa fa-circle-o', '', '', '0', '1559637913', '1559637913', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('97', 'file', '92', 'user/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1559637913', '1559637913', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('98', 'file', '0', 'system_manage', '系统设置', 'fa fa-wrench', '', '', '1', '1559639525', '1559639525', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('100', 'file', '105', 'ad/add', '添加', 'fa fa-circle-o', '', '', '0', '1559639812', '1559639938', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('101', 'file', '105', 'ad/index', '查看', 'fa fa-circle-o', '', '', '0', '1559639812', '1559639938', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('102', 'file', '105', 'ad/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1559639812', '1559639938', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('103', 'file', '105', 'ad/del', '删除', 'fa fa-circle-o', '', '', '0', '1559639812', '1559639938', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('104', 'file', '105', 'ad/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1559639812', '1559639938', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('105', 'file', '98', 'ad', '轮播图管理', 'fa fa-circle-o', '', '', '1', '1559639938', '1559640731', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('106', 'file', '0', 'goods_manage', '作品管理', 'fa fa-align-justify', '', '', '1', '1559640850', '1559640850', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('107', 'file', '106', 'type', '作品分类', 'fa fa-align-center', '', '', '1', '1559640897', '1559640937', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('108', 'file', '107', 'type/add', '添加', 'fa fa-circle-o', '', '', '0', '1559640897', '1559640897', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('109', 'file', '107', 'type/index', '查看', 'fa fa-circle-o', '', '', '0', '1559640897', '1559640897', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('110', 'file', '107', 'type/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1559640897', '1559640897', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('111', 'file', '107', 'type/del', '删除', 'fa fa-circle-o', '', '', '0', '1559640897', '1559640897', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('112', 'file', '107', 'type/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1559640897', '1559640897', '0', 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES ('1', '0', 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', '1495262190', '1495262190', '1', 'normal');
INSERT INTO `fa_category` VALUES ('2', '0', 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', '1495262244', '1495262244', '2', 'normal');
INSERT INTO `fa_category` VALUES ('3', '2', 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', '1495262288', '1495262288', '3', 'normal');
INSERT INTO `fa_category` VALUES ('4', '2', 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', '1495262317', '1495262317', '4', 'normal');
INSERT INTO `fa_category` VALUES ('5', '0', 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', '1495262336', '1499681850', '5', 'normal');
INSERT INTO `fa_category` VALUES ('6', '5', 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', '1495262357', '1495262357', '6', 'normal');
INSERT INTO `fa_category` VALUES ('7', '5', 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', '1495262391', '1495262391', '7', 'normal');
INSERT INTO `fa_category` VALUES ('8', '6', 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', '1495262424', '1495262424', '8', 'normal');
INSERT INTO `fa_category` VALUES ('9', '6', 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', '1495262456', '1495262456', '9', 'normal');
INSERT INTO `fa_category` VALUES ('10', '7', 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', '1495262487', '1495262487', '10', 'normal');
INSERT INTO `fa_category` VALUES ('11', '7', 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', '1495262515', '1495262515', '11', 'normal');
INSERT INTO `fa_category` VALUES ('12', '0', 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', '1497015727', '1497015727', '12', 'normal');
INSERT INTO `fa_category` VALUES ('13', '0', 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', '1497015738', '1497015738', '13', 'normal');

-- ----------------------------
-- Table structure for fa_command
-- ----------------------------
DROP TABLE IF EXISTS `fa_command`;
CREATE TABLE `fa_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('successed','failured') NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='在线命令表';

-- ----------------------------
-- Records of fa_command
-- ----------------------------
INSERT INTO `fa_command` VALUES ('1', 'crud', '[\"--table=fa_user\",\"--fields=user_id,avatar,mobile,createtime\",\"--local=0\"]', 'php think crud --table=fa_user --fields=user_id,avatar,mobile,createtime --local=0', 'model already exists!\nIf you need to rebuild again, use the parameter --force=true', '1559637898', '1559637898', '1559637898', 'failured');
INSERT INTO `fa_command` VALUES ('2', 'crud', '[\"--force=1\",\"--table=fa_user\",\"--fields=user_id,avatar,mobile,createtime\",\"--local=0\"]', 'php think crud --force=1 --table=fa_user --fields=user_id,avatar,mobile,createtime --local=0', 'Build Successed', '1559637903', '1559637903', '1559637903', 'successed');
INSERT INTO `fa_command` VALUES ('3', 'menu', '[\"--controller=User\"]', 'php think menu --controller=User', 'Build Successed!', '1559637913', '1559637913', '1559637913', 'successed');
INSERT INTO `fa_command` VALUES ('4', 'crud', '[\"--table=fa_ad\",\"--local=0\",\"--headingfilterfield=type\"]', 'php think crud --table=fa_ad --local=0 --headingfilterfield=type', 'Build Successed', '1559639805', '1559639805', '1559639806', 'successed');
INSERT INTO `fa_command` VALUES ('5', 'menu', '[\"--controller=Ad\"]', 'php think menu --controller=Ad', 'Build Successed!', '1559639812', '1559639812', '1559639812', 'successed');
INSERT INTO `fa_command` VALUES ('6', 'crud', '[\"--table=fa_ad\",\"--local=0\",\"--headingfilterfield=type\"]', 'php think crud --table=fa_ad --local=0 --headingfilterfield=type', 'model already exists!\nIf you need to rebuild again, use the parameter --force=true', '1559639928', '1559639928', '1559639928', 'failured');
INSERT INTO `fa_command` VALUES ('7', 'crud', '[\"--force=1\",\"--table=fa_ad\",\"--local=0\",\"--headingfilterfield=type\"]', 'php think crud --force=1 --table=fa_ad --local=0 --headingfilterfield=type', 'Build Successed', '1559639932', '1559639932', '1559639932', 'successed');
INSERT INTO `fa_command` VALUES ('8', 'menu', '[\"--controller=Ad\"]', 'php think menu --controller=Ad', 'Build Successed!', '1559639938', '1559639938', '1559639938', 'successed');
INSERT INTO `fa_command` VALUES ('9', 'crud', '[\"--table=fa_type\",\"--local=0\"]', 'php think crud --table=fa_type --local=0', 'Build Successed', '1559640890', '1559640890', '1559640890', 'successed');
INSERT INTO `fa_command` VALUES ('10', 'menu', '[\"--controller=Type\"]', 'php think menu --controller=Type', 'Build Successed!', '1559640897', '1559640897', '1559640897', 'successed');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `fa_config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for fa_demand
-- ----------------------------
DROP TABLE IF EXISTS `fa_demand`;
CREATE TABLE `fa_demand` (
  `demand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type1_id` int(11) NOT NULL COMMENT '作品一级分类id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `details` text NOT NULL COMMENT '需求内容',
  `mobile` bigint(11) NOT NULL COMMENT '手机号',
  `artist_id` int(11) NOT NULL DEFAULT '0' COMMENT '艺术家id',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`demand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='需求表';

-- ----------------------------
-- Records of fa_demand
-- ----------------------------

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of fa_ems
-- ----------------------------

-- ----------------------------
-- Table structure for fa_goods
-- ----------------------------
DROP TABLE IF EXISTS `fa_goods`;
CREATE TABLE `fa_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `artist_id` int(11) NOT NULL COMMENT '艺术家id',
  `type1_id` int(11) NOT NULL COMMENT '一级分类id',
  `type2_id` int(11) NOT NULL COMMENT '二级分类id',
  `type3_id` int(11) NOT NULL COMMENT '三级分类id',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `details` text NOT NULL COMMENT '作品详情',
  `tags` varchar(256) NOT NULL COMMENT '标签',
  `size` varchar(64) NOT NULL COMMENT '作品尺寸',
  `year` varchar(64) NOT NULL COMMENT '创作年限',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `image` varchar(1024) NOT NULL COMMENT '封面',
  `images` text NOT NULL COMMENT '轮播图',
  `type` enum('10','20') DEFAULT NULL COMMENT '10=普通,20=热门推荐,30=最新作品',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品表';

-- ----------------------------
-- Records of fa_goods
-- ----------------------------

-- ----------------------------
-- Table structure for fa_goods_comments
-- ----------------------------
DROP TABLE IF EXISTS `fa_goods_comments`;
CREATE TABLE `fa_goods_comments` (
  `goods_comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` int(11) NOT NULL COMMENT '作品id',
  `reply` text NOT NULL COMMENT '回复内容',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`goods_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品评论表';

-- ----------------------------
-- Records of fa_goods_comments
-- ----------------------------

-- ----------------------------
-- Table structure for fa_likes
-- ----------------------------
DROP TABLE IF EXISTS `fa_likes`;
CREATE TABLE `fa_likes` (
  `likes_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `article_id` int(11) DEFAULT NULL COMMENT '文章id',
  `artist_id` int(11) DEFAULT NULL COMMENT '艺术家id',
  `goods_id` int(11) DEFAULT NULL COMMENT '作品id',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`likes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点赞表';

-- ----------------------------
-- Records of fa_likes
-- ----------------------------

-- ----------------------------
-- Table structure for fa_order
-- ----------------------------
DROP TABLE IF EXISTS `fa_order`;
CREATE TABLE `fa_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_num` varchar(64) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '作品id',
  `artist_id` int(11) NOT NULL COMMENT '艺术家id',
  `price` decimal(10,2) NOT NULL COMMENT '订单金额',
  `receive_name` varchar(64) NOT NULL COMMENT '收货人名称',
  `receive_mobile` bigint(11) NOT NULL COMMENT '收货人手机号',
  `receive_address` varchar(256) NOT NULL COMMENT '收货人地址',
  `pay_type` enum('10','20') NOT NULL COMMENT '订单支付方式:10=微信支付,20=支付宝支付',
  `out_trade_no` varchar(64) NOT NULL COMMENT '商户号',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of fa_order
-- ----------------------------

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

-- ----------------------------
-- Records of fa_sms
-- ----------------------------

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES ('1', '0', '12', '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', '0.00', '0', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', '1499682285', '1499682526', '1499682526', null, '0', '1', 'normal', '1');

-- ----------------------------
-- Table structure for fa_tx
-- ----------------------------
DROP TABLE IF EXISTS `fa_tx`;
CREATE TABLE `fa_tx` (
  `tx_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `artist_id` int(11) NOT NULL COMMENT '艺术家id',
  `tx_price` decimal(10,2) NOT NULL COMMENT '提现金额',
  `sj_price` decimal(10,2) NOT NULL COMMENT '实际金额',
  `status` enum('10','20','30') NOT NULL COMMENT '状态:10=待审核,20=已通过,30=已拒绝',
  PRIMARY KEY (`tx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现记录表';

-- ----------------------------
-- Records of fa_tx
-- ----------------------------

-- ----------------------------
-- Table structure for fa_type
-- ----------------------------
DROP TABLE IF EXISTS `fa_type`;
CREATE TABLE `fa_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '分类名称',
  `image` varchar(1024) NOT NULL COMMENT '图片',
  `pid` int(11) NOT NULL COMMENT '上级分类id',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='作品分类表';

-- ----------------------------
-- Records of fa_type
-- ----------------------------
INSERT INTO `fa_type` VALUES ('1', '绘画', '1', '0', '2019-06-04 17:38:00');
INSERT INTO `fa_type` VALUES ('2', '雕塑', '1', '0', '2019-06-04 17:38:18');
INSERT INTO `fa_type` VALUES ('3', '书法', '1', '0', '2019-06-04 17:38:31');
INSERT INTO `fa_type` VALUES ('4', '篆刻', '1', '0', '2019-06-04 17:38:37');
INSERT INTO `fa_type` VALUES ('5', '瓷艺', '1', '0', '2019-06-04 17:39:07');
INSERT INTO `fa_type` VALUES ('6', '陶艺', '1', '0', '2019-06-04 17:39:13');
INSERT INTO `fa_type` VALUES ('7', '漆器', '1', '0', '2019-06-04 17:39:25');
INSERT INTO `fa_type` VALUES ('11', 'test', 'test', '7', '2019-06-04 17:58:21');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(1024) DEFAULT NULL COMMENT '头像',
  `mobile` bigint(11) NOT NULL COMMENT '手机号',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `salt` varchar(64) NOT NULL COMMENT '盐',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES ('1', '/uploads/20190604/6aef9eb39d62df20a4dac1230694817b.jpg', '14780114469', 'fe11657374e7b8013b915ea56cf9de93', 'rh8g', '2019-06-04 17:07:11');

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

-- ----------------------------
-- Records of fa_version
-- ----------------------------
INSERT INTO `fa_version` VALUES ('1', '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', '1', '1520425318', '0', '0', 'normal');

-- ----------------------------
-- Table structure for fa_weekstar
-- ----------------------------
DROP TABLE IF EXISTS `fa_weekstar`;
CREATE TABLE `fa_weekstar` (
  `weekstar_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '作者名称',
  `detials` text NOT NULL COMMENT '详情介绍',
  `image` varchar(1024) NOT NULL COMMENT '封面',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`weekstar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='本周之星';

-- ----------------------------
-- Records of fa_weekstar
-- ----------------------------
