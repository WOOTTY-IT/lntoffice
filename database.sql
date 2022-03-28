/*
Navicat MySQL Data Transfer

Source Server         : pts_server
Source Server Version : 50716
Source Host           : 192.168.2.21:3306
Source Database       : i_smarthosp_plus

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2021-04-19 15:18:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for degree
-- ----------------------------
DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree` (
  `degree_id` int(25) NOT NULL COMMENT 'รหัสวุฒิการศึกษา',
  `degree_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื้อวุฒิการศึกษา',
  `period_upgrade` int(25) DEFAULT NULL COMMENT 'ระยะเวลาเลื่อนระดับ',
  PRIMARY KEY (`degree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of degree
-- ----------------------------
INSERT INTO `degree` VALUES ('1', 'ประถมศึกษา', null);
INSERT INTO `degree` VALUES ('2', 'มัธยมศึกษาตอนต้น', null);
INSERT INTO `degree` VALUES ('3', 'มัธยมศึกษาตอนปลาย', null);
INSERT INTO `degree` VALUES ('4', 'ปวช.', null);
INSERT INTO `degree` VALUES ('5', 'ปวส.', null);
INSERT INTO `degree` VALUES ('6', 'อนุปริญญา', null);
INSERT INTO `degree` VALUES ('7', 'ปริญญาตรี', '6');
INSERT INTO `degree` VALUES ('8', 'ปริญญาโท', '4');
INSERT INTO `degree` VALUES ('9', 'ปริญญาเอก', '2');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` int(25) NOT NULL COMMENT 'รหัสแผนก',
  `dept_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อแผนก',
  `leader_id` int(25) NOT NULL COMMENT 'รหัสหัวหน้าแผนก p_id จาก tb_person',
  `dept_doc_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เลขหนังสือหน่วยงานเช่น .303',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', 'กลุ่มงานการแพทย์', '1', null);
INSERT INTO `dept` VALUES ('2', 'กลุ่มงานทันตกรรม', '2', '.302');
INSERT INTO `dept` VALUES ('3', 'กลุ่มงานเวชกรรมฟื้นฟู', '0', null);
INSERT INTO `dept` VALUES ('4', 'กลุ่มงานเทคนิคการแพทย์', '0', null);
INSERT INTO `dept` VALUES ('5', 'กลุ่มงานรังสีวิทยา', '0', null);
INSERT INTO `dept` VALUES ('6', 'กลุ่มงานโภชนศาสตร์', '0', null);
INSERT INTO `dept` VALUES ('7', 'งานบริการเภสัชกรรมผู้ป่วยนอก', '1', '.305');
INSERT INTO `dept` VALUES ('8', 'งานบริการเภสัชกรรมผู้ป่วยใน', '0', null);
INSERT INTO `dept` VALUES ('9', 'งานบริหารเวชภัณฑ์', '0', null);
INSERT INTO `dept` VALUES ('10', 'งานคุ้มครองผู้บริโภค', '0', null);
INSERT INTO `dept` VALUES ('11', 'งานให้คำปรึกษาด้านเภสัชกรรม', '0', null);
INSERT INTO `dept` VALUES ('12', 'งานประกันสุขภาพ', '0', null);
INSERT INTO `dept` VALUES ('13', 'งานเวชสถิติและงานข้อมูล', '0', null);
INSERT INTO `dept` VALUES ('14', 'งานเทคโนโลยีสารสนเทศและคอมพิวเตอร์', '0', null);
INSERT INTO `dept` VALUES ('15', 'งานแผนงานและยุทธศาสตร์เครือข่ายสุขภาพ', '0', null);
INSERT INTO `dept` VALUES ('16', 'งานสังคมสงเคราะห์', '0', null);
INSERT INTO `dept` VALUES ('17', 'งานการเงินและการบัญชี', '0', null);
INSERT INTO `dept` VALUES ('18', 'งานพัสดุ', '0', null);
INSERT INTO `dept` VALUES ('19', 'งานซ่อมบำรุง', '0', null);
INSERT INTO `dept` VALUES ('20', 'งานธุรการ', '0', null);
INSERT INTO `dept` VALUES ('21', 'งานยานพาหนะ', '0', null);
INSERT INTO `dept` VALUES ('22', 'งานรักษาความปลอดภัย', '0', null);
INSERT INTO `dept` VALUES ('23', 'งานประชาสัมพันธ์', '0', null);
INSERT INTO `dept` VALUES ('24', 'งานซักฟอก', '0', null);
INSERT INTO `dept` VALUES ('25', 'งานอาคารสถานที่', '0', null);
INSERT INTO `dept` VALUES ('26', 'งานการเจ้าหน้าที่', '0', null);
INSERT INTO `dept` VALUES ('27', 'งานเวชปฏิบัติครอบครัวและชุมชน', '0', null);
INSERT INTO `dept` VALUES ('28', 'งานการพยาบาลในชุมชน', '0', null);
INSERT INTO `dept` VALUES ('29', 'งานส่งเสริมสุขภาพทุกกลุ่มวัย', '0', null);
INSERT INTO `dept` VALUES ('30', 'งานป้องกันและควบคุมโรคและระบาดวิทยา', '0', null);
INSERT INTO `dept` VALUES ('31', 'งานอาชีวอนามัย', '0', null);
INSERT INTO `dept` VALUES ('32', 'งานสุขาภิบาลสิ่งแวดล้อมและศูนย์ความปลอดภัย', '0', null);
INSERT INTO `dept` VALUES ('33', 'งานพัฒนาระบบบริการปฐมภูมิและสนับสนุนเครือข่าย', '0', null);
INSERT INTO `dept` VALUES ('34', 'งานสุขภาพจิตและจิตเวช', '0', null);
INSERT INTO `dept` VALUES ('35', 'งานอนามัยโรงเรียน', '0', null);
INSERT INTO `dept` VALUES ('36', 'งานสุขภาพภาคประชาชน', '0', null);
INSERT INTO `dept` VALUES ('37', 'งานบำบัดยาเสพติด สุรา บุหรี่', '0', null);
INSERT INTO `dept` VALUES ('38', 'งานสุขศึกษาและพัฒนาพฤติกรรมสุขภาพ', '0', null);
INSERT INTO `dept` VALUES ('39', 'งานการพยาบาลผู้ป่วยนอก', '0', null);
INSERT INTO `dept` VALUES ('40', 'งานการพยาบาลผู้ป่วยอุบัติเหตุฉุกเฉินและนิติเวช', '0', null);
INSERT INTO `dept` VALUES ('41', 'งานการพยาบาลผู้ป่วยใน', '0', null);
INSERT INTO `dept` VALUES ('42', 'งานการพยาบาลผู้ป่วยหนัก', '0', null);
INSERT INTO `dept` VALUES ('43', 'งานการพยาบาลผู้ป่วยผ่าตัดและวิสัญญีพยาบาล', '0', null);
INSERT INTO `dept` VALUES ('44', 'งานควบคุมการติดเชื้อในโรงพยาบาล', '0', null);
INSERT INTO `dept` VALUES ('45', 'งานจ่ายกลาง', '0', null);
INSERT INTO `dept` VALUES ('46', 'งานศูนย์เครื่องมือแพทย์', '0', null);
INSERT INTO `dept` VALUES ('47', 'งานการพยาบาลผู้คลอด', '0', null);
INSERT INTO `dept` VALUES ('48', 'งานการพยาบาลทารกแรกเกิด', '0', null);
INSERT INTO `dept` VALUES ('49', 'กลุ่มงานแพทย์แผนไทยและการแพทย์ทางเลือก', '0', null);
INSERT INTO `dept` VALUES ('50', 'กลุ่มงานบริหารทั่วไป', '0', null);

-- ----------------------------
-- Table structure for hist_list
-- ----------------------------
DROP TABLE IF EXISTS `hist_list`;
CREATE TABLE `hist_list` (
  `hist_list_id` int(25) NOT NULL COMMENT 'รหัสรายการบันทึกประวัติ',
  `hist_list_name` varchar(255) DEFAULT NULL COMMENT 'รายการบันทึกประวัติ',
  PRIMARY KEY (`hist_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hist_list
-- ----------------------------
INSERT INTO `hist_list` VALUES ('1', 'การบรรจุผู้สอบแข่งขันได้ (มาตรา ๕๓) ');
INSERT INTO `hist_list` VALUES ('2', 'การพ้นทดลองปฏิบัติหน้าที่ราชการ');
INSERT INTO `hist_list` VALUES ('3', 'การย้าย (มาตรา ๖๓ วรรคหนึ่ง วรรคสาม) ');
INSERT INTO `hist_list` VALUES ('4', 'การเลื่อนตําแหน่ง (มาตรา ๖๓ มาตรา ๖๔) ');
INSERT INTO `hist_list` VALUES ('5', 'การโอน (มาตรา ๖๓ มาตรา ๖๔) ');
INSERT INTO `hist_list` VALUES ('6', 'การบรรจุกลับ (มาตรา ๖๓ วรรค ๔ และมาตรา ๖๕) ');
INSERT INTO `hist_list` VALUES ('7', 'การแต่งตั้งผู้ขาดคุณสมบัติเฉพาะสําหรับตําแหน่ง (มาตรา ๖๖) ');
INSERT INTO `hist_list` VALUES ('8', 'การยกเว้นคุณสมบัติ (มาตรา ๖๒) ');
INSERT INTO `hist_list` VALUES ('9', 'การรักษาราชการแทน การรักษาการในตําแหน่ง (มาตรา ๖๘) ');
INSERT INTO `hist_list` VALUES ('10', 'การประจําส่วนราชการ (มาตรา ๖๙) ');
INSERT INTO `hist_list` VALUES ('11', 'การเลื่อนเงินเดือน');
INSERT INTO `hist_list` VALUES ('12', 'การลา');
INSERT INTO `hist_list` VALUES ('13', 'การพักราชการ การให้ออกจากราชการไว้ก่อน');
INSERT INTO `hist_list` VALUES ('14', 'การพ้นจากราชการ (มาตรา ๑๐๙) ');
INSERT INTO `hist_list` VALUES ('15', 'การให้รับราชการต่อไป (มาตรา ๑๐๘) ');
INSERT INTO `hist_list` VALUES ('16', 'การแก้ไขคําสั่ง');

-- ----------------------------
-- Table structure for i_education
-- ----------------------------
DROP TABLE IF EXISTS `i_education`;
CREATE TABLE `i_education` (
  `edu_id` int(25) NOT NULL COMMENT 'รหัสประวัติการศึกษา',
  `pid` int(25) DEFAULT NULL,
  `cid` varchar(13) DEFAULT '',
  `date` date DEFAULT NULL COMMENT 'ช่วงเวลาที่ศึกษา',
  `degree_id` int(25) DEFAULT NULL COMMENT 'รหัสวุฒิการศึกษา',
  `major` varchar(255) DEFAULT NULL COMMENT 'วิชาเอกที่ศึกษา',
  `college` varchar(255) DEFAULT NULL,
  `approve_date` date DEFAULT NULL COMMENT 'วันที่อนุมัติจบการศึกษา',
  `certificate_image` longblob COMMENT 'ใบประกาศนียบัตร',
  PRIMARY KEY (`edu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of i_education
-- ----------------------------

-- ----------------------------
-- Table structure for i_history
-- ----------------------------
DROP TABLE IF EXISTS `i_history`;
CREATE TABLE `i_history` (
  `history_id` int(25) NOT NULL,
  `pid` int(25) DEFAULT NULL,
  `cid` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `history_date` datetime DEFAULT NULL,
  `hist_list_id` int(25) DEFAULT NULL,
  `position_id` int(25) DEFAULT NULL,
  `pos_level_id` int(25) DEFAULT NULL,
  `saraly` double(15,2) DEFAULT NULL,
  `ref_doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เลขที่หนังสือคำสั่งอ้างอิง',
  `rec_pid` int(25) DEFAULT NULL COMMENT 'ผู้บันทึก',
  `certificate_doc` mediumblob COMMENT 'หนังสือคำสั่ง',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of i_history
-- ----------------------------

-- ----------------------------
-- Table structure for i_leave
-- ----------------------------
DROP TABLE IF EXISTS `i_leave`;
CREATE TABLE `i_leave` (
  `leave_id` int(25) NOT NULL AUTO_INCREMENT,
  `pid` int(50) NOT NULL COMMENT 'เลขบุคคล',
  `cid` varchar(13) DEFAULT NULL,
  `leave_year` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `leave_cause` varchar(255) DEFAULT '',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `leave_sum_day` decimal(10,2) DEFAULT '0.00' COMMENT 'จำนวนวีนลา',
  `is_half_day` int(1) DEFAULT '0' COMMENT 'half day',
  `leave_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ข้อมูลติดต่อได้',
  `d_create` date DEFAULT NULL,
  `d_update` date DEFAULT NULL,
  `leave_type_id` int(25) NOT NULL COMMENT 'ประเภทการลา',
  `leave_status_id` int(1) DEFAULT '1' COMMENT 'look(l_status)',
  `info_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'เบอร์ติดต่อ',
  `leave_delegate_id` int(100) DEFAULT NULL COMMENT 'ผู้รับมอบงาน',
  `delegate_phone` varchar(255) DEFAULT NULL COMMENT 'ดึงข้อมูลมาจาก person',
  `non_accept_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เหตุผลที่ไม่อนุญาต',
  `non_allow_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `leave_comm_pid` int(150) DEFAULT NULL COMMENT 'หน.งาน',
  `leave_comm_date` datetime DEFAULT NULL COMMENT 'วันที่หัวหน้าเห็นชอบ',
  `leave_accept_by` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ชื่อผู้อำนวยการ (org)',
  `leave_accept_date` datetime DEFAULT NULL COMMENT 'วันที่อนุมัติ',
  `leave_cancel_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'เหตุผลขอยกเลิกของเจ้าตัว',
  `leave_cancel_date` datetime DEFAULT NULL COMMENT 'วันที่อนุมัติยกเลิก',
  `confirm_check_pid` int(200) DEFAULT NULL COMMENT 'เจ้าหน้าที่งานการเจ้าหน้าที่',
  `last_leave_total` int(11) DEFAULT NULL COMMENT 'รวมวันลาก่อนหน้า',
  `now_leave_total` int(11) DEFAULT NULL COMMENT 'รวมวันลาจนถึงครั้งนี้',
  PRIMARY KEY (`leave_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of i_leave
-- ----------------------------
INSERT INTO `i_leave` VALUES ('1', '1', null, '2564', 'ปวดหัวรุนแรง', '2021-01-24', '2021-01-24', '1.00', '0', '259 ม.9 ต.ท่าตูม อ.ท่าตูม จ.สุรินทร์', '2021-01-24', '2021-01-24', '1', '1', '0902725656', null, '0529899', null, null, null, null, '', null, '', null, null, null, null);

-- ----------------------------
-- Table structure for leave_period
-- ----------------------------
DROP TABLE IF EXISTS `leave_period`;
CREATE TABLE `leave_period` (
  `period_id` int(25) NOT NULL,
  `period_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`period_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_period
-- ----------------------------
INSERT INTO `leave_period` VALUES ('1', 'เติมวัน');
INSERT INTO `leave_period` VALUES ('2', 'ครึ่งวัน(เช้า)');
INSERT INTO `leave_period` VALUES ('3', 'ครึ่งวัน(บ่าย)');

-- ----------------------------
-- Table structure for leave_status
-- ----------------------------
DROP TABLE IF EXISTS `leave_status`;
CREATE TABLE `leave_status` (
  `leave_status_id` int(25) NOT NULL,
  `leave_status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leave_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_status
-- ----------------------------
INSERT INTO `leave_status` VALUES ('1', 'รอดำเนินการ');
INSERT INTO `leave_status` VALUES ('2', 'เห็นชอบแล้ว');
INSERT INTO `leave_status` VALUES ('3', 'อนุมัติแล้ว');
INSERT INTO `leave_status` VALUES ('4', 'ไม่อนุมัติ');
INSERT INTO `leave_status` VALUES ('5', 'ยกเลิกวันลา');

-- ----------------------------
-- Table structure for leave_type
-- ----------------------------
DROP TABLE IF EXISTS `leave_type`;
CREATE TABLE `leave_type` (
  `leave_type_id` int(25) NOT NULL,
  `leave_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `before_day` int(25) DEFAULT NULL COMMENT 'ต้องลาก่อนกี่วัน',
  `leave_type_limited` int(25) DEFAULT NULL COMMENT 'จำนวนวันที่สามารถลาได้',
  PRIMARY KEY (`leave_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_type
-- ----------------------------
INSERT INTO `leave_type` VALUES ('1', 'ลาป่วย', null, '60');
INSERT INTO `leave_type` VALUES ('2', 'ลาคลอดบุตร', null, '90');
INSERT INTO `leave_type` VALUES ('3', 'ลากิจ', '3', '45');
INSERT INTO `leave_type` VALUES ('4', 'ลาพักผ่อน', '7', '30');
INSERT INTO `leave_type` VALUES ('5', 'ลาอุปสมบทหรือลาไปประกอบพิธีฮัจย์', null, '120');
INSERT INTO `leave_type` VALUES ('6', 'ลาไปช่วยภริยาที่คลอดบุตร', null, '15');
INSERT INTO `leave_type` VALUES ('7', 'ลาเข้ารับการคัดเลือกหรือเข้ารับการเตรียมพล', null, null);
INSERT INTO `leave_type` VALUES ('8', 'ลาไปศึกษา ฝึกอบรม ดูงาน หรือปฏิบัติการวิจัย', null, null);
INSERT INTO `leave_type` VALUES ('9', 'ลาไปปฏิบัติงานในองค์การระหว่างประเทศ', null, null);
INSERT INTO `leave_type` VALUES ('10', 'ลาติดตามคู่สมรส', null, '730');
INSERT INTO `leave_type` VALUES ('11', 'ลาไปฟื้นฟูสมรรถภาพด้านอาชีพ', null, '365');
INSERT INTO `leave_type` VALUES ('12', 'ลาออก', null, null);

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `org_id` int(25) NOT NULL AUTO_INCREMENT COMMENT 'รหัสองค์กร',
  `org_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อองค์กร',
  `org_depart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ต้นสังกัดระดับกรม (สำนักงานสาธารณสุข)',
  `org_ministry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ต้นสังกัดระดับกระทรวง (กระทรวงสาธารณสุข)',
  `org_director` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ผู้นำองค์กร',
  `manage_director` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หน.บริหาร',
  `address` varchar(250) COLLATE utf8_unicode_ci NOT NULL COMMENT 'สถานที่ตั้งองค์กร',
  `provine` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'จังหวัด',
  `phone` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เบอร์โทรศัพท์',
  `tax_number` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'หมายเลขผู้เสียภาษี',
  `org_doc_no` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เลขที่หนังสือราชการของหน่วยงาน ',
  `logo` longblob COMMENT 'โลโก้องค์กร',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางข้อมูลองค์กร';

-- ----------------------------
-- Records of org
-- ----------------------------
INSERT INTO `org` VALUES ('1', 'โรงพยาบาลท่าตูม', 'สำนักงานสาธารณสุขจังหวัดสุรินทร์', 'กระทรวงสาธารณสุข', 'นายประเสริฐ อาปัจชิง', 'นายพรมมา  หงษ์แปลง', 'ตำบลท่าตูม อำเภอท่าตูม รัสไปรษณีย์ 55632', 'สุรินทร์', '0447896523', '1234567891', 'สร.0032', null);

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `pid` int(25) NOT NULL,
  `cid` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'lookup(gender)',
  `pname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'lookup (pname)',
  `fname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nick_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` double(5,2) DEFAULT NULL,
  `mobile_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `info_address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ที่อยู่ที่ติดต่อได้',
  `marrystatus` int(1) DEFAULT NULL COMMENT 'lookup(marry_status)',
  `pos_id` int(11) DEFAULT NULL COMMENT 'lookup(position)',
  `pos_level_id` int(11) DEFAULT NULL COMMENT 'lookup(position_level)',
  `pos_group_id` int(11) DEFAULT NULL COMMENT 'lookup(position_group)',
  `pos_type_id` int(25) DEFAULT NULL COMMENT 'ประเภทบุคคลากร (ข้าราชการ,ลูกจ้างชั่วคราว)',
  `pos_group_serv_id` int(25) DEFAULT NULL,
  `pos_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เลขประจำตำแหน่ง',
  `dept_id` int(11) DEFAULT NULL COMMENT 'lookup(dept)',
  `ent_date` date DEFAULT NULL COMMENT 'วันที่บรรจุ',
  `ent_work_date` date DEFAULT NULL COMMENT 'วันที่เข้าทำงาน',
  `exp_work_date` date DEFAULT NULL COMMENT 'วันเกษียณอายุราชการ',
  `salary` decimal(10,2) DEFAULT NULL COMMENT 'เงินเดือน',
  `total_vac` int(11) DEFAULT NULL COMMENT 'วันลาพักผ่อนสะสม',
  `image` mediumblob COMMENT 'ภาพ',
  `signature` mediumblob COMMENT 'ลายเซ้นต์',
  `permis_level_id` int(11) DEFAULT NULL COMMENT 'ระดับสิทธิ์เข้าใช้งาน',
  `line_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT '1' COMMENT '1,0',
  PRIMARY KEY (`pid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '3320200524766', 'ชาย', 'นาย', null, null, 'ประเสริฐ ดีเสมอ', 'หวาน', '180', '85.00', null, null, 'p@gmail.com', '1987-03-01', '257 ม.7 ต.ท่าตูม อ.ท่าตูม จ.สุรินทร์', null, '1', '8', null, null, null, '9998', '1', '2002-04-01', '1987-04-01', null, '80000.00', null, null, null, '1', null, '1');
INSERT INTO `person` VALUES ('2', '3320200524799', 'ชาย', 'นาย', null, null, 'pwan jai', 'หวานจืด', null, null, null, null, null, '2021-04-01', null, null, null, null, null, null, null, null, null, '2021-04-01', '2021-04-01', null, null, null, null, null, null, null, '1');
INSERT INTO `person` VALUES ('3', '3361200362987', null, 'นาย', '?????', '????????', 'พรมมา หงษ์แปลง', 'เจ้ย', '154', '59.00', '0885609339', '044123456', 'bhomma.hong@gmail.com', '1993-04-15', '284/2 ?.????', null, '3', '4', null, null, null, '4562187', '4', '2021-04-15', '2021-04-30', '2081-09-30', '30270.00', null, null, null, null, null, '1');
INSERT INTO `person` VALUES ('4', '3333333333333', null, null, null, null, 'p3333', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for pname
-- ----------------------------
DROP TABLE IF EXISTS `pname`;
CREATE TABLE `pname` (
  `id` int(25) NOT NULL,
  `pname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex_id` int(25) DEFAULT NULL COMMENT 'กลุ่มคำนำหน้าเพศ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pname
-- ----------------------------
INSERT INTO `pname` VALUES ('1', 'นาย', '1');
INSERT INTO `pname` VALUES ('2', 'นาง', '2');
INSERT INTO `pname` VALUES ('3', 'นางสาว', '2');
INSERT INTO `pname` VALUES ('4', 'ดช.', '1');
INSERT INTO `pname` VALUES ('5', 'ดญ.', '2');

-- ----------------------------
-- Table structure for pos_group
-- ----------------------------
DROP TABLE IF EXISTS `pos_group`;
CREATE TABLE `pos_group` (
  `pos_group_id` int(25) NOT NULL AUTO_INCREMENT,
  `pos_group_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อกลุ่มตำแหน่ง',
  PRIMARY KEY (`pos_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pos_group
-- ----------------------------
INSERT INTO `pos_group` VALUES ('1', 'ทั่วไป');
INSERT INTO `pos_group` VALUES ('2', 'วิชาการ');
INSERT INTO `pos_group` VALUES ('3', 'อำนวยการ');
INSERT INTO `pos_group` VALUES ('4', 'บริหาร');

-- ----------------------------
-- Table structure for pos_group_serv
-- ----------------------------
DROP TABLE IF EXISTS `pos_group_serv`;
CREATE TABLE `pos_group_serv` (
  `pos_group_serv_id` int(25) NOT NULL AUTO_INCREMENT,
  `pos_group_serv_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อกลุ่มตำแหน่ง',
  PRIMARY KEY (`pos_group_serv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pos_group_serv
-- ----------------------------
INSERT INTO `pos_group_serv` VALUES ('1', 'กลุ่มสนับสนุนบริการ');
INSERT INTO `pos_group_serv` VALUES ('2', 'กลุ่มงานบริการ');

-- ----------------------------
-- Table structure for pos_level
-- ----------------------------
DROP TABLE IF EXISTS `pos_level`;
CREATE TABLE `pos_level` (
  `pos_level_id` int(25) NOT NULL,
  `pos_level_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ระดับตำแหน่ง',
  `pos_group_id` int(25) DEFAULT NULL,
  PRIMARY KEY (`pos_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pos_level
-- ----------------------------
INSERT INTO `pos_level` VALUES ('1', 'ปฎิบัติงาน', '1');
INSERT INTO `pos_level` VALUES ('2', 'ชำนาญงาน', '1');
INSERT INTO `pos_level` VALUES ('3', 'อาวุโส', '1');
INSERT INTO `pos_level` VALUES ('4', 'ทักษะพิเศษ', '1');
INSERT INTO `pos_level` VALUES ('5', 'ปฎิบัติการ', '2');
INSERT INTO `pos_level` VALUES ('6', 'ชำนาญการ', '2');
INSERT INTO `pos_level` VALUES ('7', 'ชำนาญการพิเศษ', '2');
INSERT INTO `pos_level` VALUES ('8', 'เชี่ยวชาญ', '2');
INSERT INTO `pos_level` VALUES ('9', 'ทรงคุณวุฒิ', '2');
INSERT INTO `pos_level` VALUES ('10', 'อำนวยการระดับต้น', '3');
INSERT INTO `pos_level` VALUES ('11', 'อำนวยการระดับสูง', '3');
INSERT INTO `pos_level` VALUES ('12', 'บริหารระดับต้น', '4');
INSERT INTO `pos_level` VALUES ('13', 'บริหารระดับสูง', '4');

-- ----------------------------
-- Table structure for pos_type
-- ----------------------------
DROP TABLE IF EXISTS `pos_type`;
CREATE TABLE `pos_type` (
  `pos_type_id` int(25) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภทตำแหน่ง',
  `pos_type_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อประเภทตำแหน่ง',
  PRIMARY KEY (`pos_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pos_type
-- ----------------------------
INSERT INTO `pos_type` VALUES ('1', 'ลูกจ้างประจำ');
INSERT INTO `pos_type` VALUES ('2', 'ลูกจ้างชั่วคราวรายวัน');
INSERT INTO `pos_type` VALUES ('3', 'ลูกจ้างชั่วคราวรายเดือน');
INSERT INTO `pos_type` VALUES ('4', 'พนักงานจ้างเหมา');
INSERT INTO `pos_type` VALUES ('5', 'พนักงานกระทรวงสาธารณสุข');
INSERT INTO `pos_type` VALUES ('6', 'พนักงานราชการ');
INSERT INTO `pos_type` VALUES ('7', 'ข้าราชการ');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `pos_id` int(25) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', 'นายแพทย์');
INSERT INTO `position` VALUES ('2', 'ทันตแพทย์');
INSERT INTO `position` VALUES ('3', 'เภสัชกร');
INSERT INTO `position` VALUES ('4', 'นักวิชาการสาธารณสุข');
INSERT INTO `position` VALUES ('5', 'นักวิเคราะห์นโยบายและแผน');
INSERT INTO `position` VALUES ('6', 'นักวิชาการสาธารณสุข (ด้านบริหารสาธารณสุข)');
INSERT INTO `position` VALUES ('8', 'นักจัดการงานทั่วไป\r');
INSERT INTO `position` VALUES ('9', 'นักวิชาการเงินและบัญชี\r');
INSERT INTO `position` VALUES ('10', 'นักวิชาการพัสดุ\r');
INSERT INTO `position` VALUES ('11', 'นักวิชาการคอมพิวเตอร์ ');
INSERT INTO `position` VALUES ('12', 'พยาบาลวิชาชีพ');
INSERT INTO `position` VALUES ('13', 'นิติกร ');
INSERT INTO `position` VALUES ('14', 'นักทรัพยากรบุคคล\r');
INSERT INTO `position` VALUES ('15', 'แพทย์แผนไทย ');
INSERT INTO `position` VALUES ('16', 'นักรังสีการแพทย์ ');
INSERT INTO `position` VALUES ('17', 'นักกายภาพบำบัด');
INSERT INTO `position` VALUES ('18', 'นักวิทยาศาสตร์การแพทย์ ');
INSERT INTO `position` VALUES ('19', 'นักโภชนาการ');
INSERT INTO `position` VALUES ('20', 'พยาบาลเทคนิค');
INSERT INTO `position` VALUES ('21', 'จพ.การเงินและบัญชี');
INSERT INTO `position` VALUES ('22', 'จพ.ธุรการ');
INSERT INTO `position` VALUES ('23', 'จพ.พัสดุ');
INSERT INTO `position` VALUES ('24', 'นายช่างเทคนิค');
INSERT INTO `position` VALUES ('25', 'จพ.โสตทัศนศึกษา');
INSERT INTO `position` VALUES ('26', 'จพ.วิทยาศาสตร์การแพทย์\r');
INSERT INTO `position` VALUES ('27', 'จพ.ทันตสาธารณสุข');
INSERT INTO `position` VALUES ('28', 'จพ.เภสัชกรรม\r');
INSERT INTO `position` VALUES ('29', 'จพ.รังสีการแพทย์');
INSERT INTO `position` VALUES ('30', 'ช่างกายอุปกรณ์');
INSERT INTO `position` VALUES ('31', 'จพ.เวชกรรมฟื้นฟู\r');
INSERT INTO `position` VALUES ('32', 'จพ.เวชสถิติ ');
INSERT INTO `position` VALUES ('33', 'จพ.สาธารณสุข');
INSERT INTO `position` VALUES ('34', 'จพ.สาธารณสุข(เวชกิจฉุกเฉิน)');
INSERT INTO `position` VALUES ('35', 'จพ.ฉุกเฉินการแพทย์');
INSERT INTO `position` VALUES ('36', 'จพ.ห้องสมุด ');
INSERT INTO `position` VALUES ('37', 'นวก.โสตทัศนศึกษา ');
INSERT INTO `position` VALUES ('38', 'จพ.โสตทัศนศึกษา ');
INSERT INTO `position` VALUES ('39', 'นักประชาสัมพันธ์');

-- ----------------------------
-- Table structure for sex
-- ----------------------------
DROP TABLE IF EXISTS `sex`;
CREATE TABLE `sex` (
  `sex_id` int(25) NOT NULL,
  `sex_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sex
-- ----------------------------
INSERT INTO `sex` VALUES ('1', 'ชาย');
INSERT INTO `sex` VALUES ('2', 'หญิง');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `cid` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `users`(`cid`,`full_name`,`username`,`password`,`user_type`) VALUES ('3320200524765', 'pwan', 'ppp', 'ppp', 'admin');
INSERT INTO `users`(`cid`,`full_name`,`username`,`password`,`user_type`) VALUES ('3320200524766', 'ประเสริฐ ดีเสมอ', 'p', 'p', 'admin');
INSERT INTO `users`(`cid`,`full_name`,`username`,`password`,`user_type`) VALUES ('3320200524799', 'pwan jai', 'jai', 'jai', 'admin');
INSERT INTO `users`(`cid`,`full_name`,`username`,`password`,`user_type`) VALUES ('3333333333333', 'p3333', 'p3', 'p3', 'admin');
INSERT INTO `users`(`cid`,`full_name`,`username`,`password`,`user_type`) VALUES ('3361200362987', 'พรมมา หงษ์แปลง', 'bhomma', '1234', 'admin');

