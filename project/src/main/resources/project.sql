/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.6.20 : Database - dyneproject
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dyneproject` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dyneproject`;

/*Table structure for table `mapping_role_permission` */

DROP TABLE IF EXISTS `mapping_role_permission`;

CREATE TABLE `mapping_role_permission` (
  `roleId` bigint(20) NOT NULL,
  `sys_permission_code` varchar(20) NOT NULL,
  PRIMARY KEY (`roleId`,`sys_permission_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mapping_role_permission` */

insert  into `mapping_role_permission`(`roleId`,`sys_permission_code`) values (1,'appointmentList'),(1,'appointmentToday'),(1,'constList'),(1,'doctor'),(1,'doctorList'),(1,'editRoot'),(1,'editTagInfo'),(1,'examinationList'),(1,'getRole'),(1,'goPatientList'),(1,'goPermission'),(1,'healthEducationList'),(1,'lookDoctor'),(1,'looktest'),(1,'moduleList'),(1,'noCheckeddoctorList'),(1,'noCheckedPatientList'),(1,'officeDescription'),(1,'patient'),(1,'recentVisitList'),(1,'safe'),(1,'system'),(1,'systemNoticeList'),(9,'appointmentList'),(9,'appointmentToday'),(9,'constList'),(9,'doctor'),(9,'doctorList'),(9,'editRoot'),(9,'editTagInfo'),(9,'examinationList'),(9,'getRole'),(9,'goPatientList'),(9,'goPermission'),(9,'healthEducationList'),(9,'moduleList'),(9,'noCheckeddoctorList'),(9,'noCheckedPatientList'),(9,'officeDescription'),(9,'patient'),(9,'recentVisitList'),(9,'safe'),(9,'system'),(9,'systemNoticeList'),(10,'appointmentList'),(10,'appointmentToday'),(10,'constList'),(10,'doctor'),(10,'doctorList'),(10,'editRoot'),(10,'editTagInfo'),(10,'examinationList'),(10,'getRole'),(10,'goPatientList'),(10,'goPermission'),(10,'healthEducationList'),(10,'lookDoctor'),(10,'looktest'),(10,'moduleList'),(10,'noCheckeddoctorList'),(10,'noCheckedPatientList'),(10,'officeDescription'),(10,'patient'),(10,'recentVisitList'),(10,'safe'),(10,'system'),(10,'systemNoticeList'),(10,'updateDelete'),(11,'appointmentList'),(11,'appointmentToday'),(11,'constList'),(11,'editRoot'),(11,'editTagInfo'),(11,'examinationList'),(11,'getRole'),(11,'goPatientList'),(11,'goPermission'),(11,'healthEducationList'),(11,'lookStudent'),(11,'moduleList'),(11,'noCheckedPatientList'),(11,'officeDescription'),(11,'patient'),(11,'recentVisitList'),(11,'safe'),(11,'system'),(11,'systemNoticeList'),(11,'werwer'),(11,'wqeqwe'),(11,'wqewqe');

/*Table structure for table `mapping_user_role` */

DROP TABLE IF EXISTS `mapping_user_role`;

CREATE TABLE `mapping_user_role` (
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mapping_user_role` */

insert  into `mapping_user_role`(`userId`,`roleId`) values (1,1),(1,2);

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` bigint(20) NOT NULL,
  `module_name` varchar(50) DEFAULT NULL,
  `module_uri` varchar(100) DEFAULT NULL,
  `module_baseId` bigint(20) DEFAULT NULL,
  `module_code` varchar(20) DEFAULT NULL,
  `orderBy` bigint(20) DEFAULT NULL,
  `module_description` varchar(200) DEFAULT NULL,
  `isdelete` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `module` */

insert  into `module`(`id`,`module_name`,`module_uri`,`module_baseId`,`module_code`,`orderBy`,`module_description`,`isdelete`) values (1,'翻转课堂','#',0,'root',0,'根节点',0),(3,'患者管理',NULL,1,'patient',2,'患者管理模块',0),(4,'系统维护',NULL,1,'system',3,'系统维护模块',0),(5,'安全管理',NULL,1,'safe',4,'安全管理模块',0),(8,'患者列表','patient/goPatientList',3,'goPatientList',7,'患者列表模块',0),(9,'今日预约','patient/appointmentToday',3,'appointmentToday',8,'今日预约模块',0),(10,'预约列表','patient/appointmentList',3,'appointmentList',9,'预约列表模块',0),(11,'待审核患者','patient/noCheckedList',3,'noCheckedPatientList',10,'待审核患者模块',0),(12,'近期就诊列表','patient/recentVisitList',3,'recentVisitList',11,'近期就诊列表模块',0),(13,'系统通知','pcManage/selectSystemNoticeList',4,'systemNoticeList',12,'系统通知模块',0),(14,'健康教育','healthResource/findHealthEducationList',4,'healthEducationList',13,'健康教育模块',0),(15,'数据字典','dictionary/selectConstList',4,'constList',14,'数据字典模块',0),(16,'体检参数','examination/selectExaminationList',4,'examinationList',15,'体检参数模块',0),(17,'科室简介','organization/officeDescription',4,'officeDescription',16,'科室简介模块',0),(18,'标签管理','dictionary/editTagInfo',4,'editTagInfo',17,'标签管理模块',0),(19,'角色管理','role/getRole',5,'getRole',18,'角色管理模块',0),(20,'模块管理','module/moduleList',5,'moduleList',19,'模块管理模块',0),(21,'权限管理','permission/goPermission',5,'goPermission',20,'权限管理模块',0),(82,'学生管理','#',1,'studentManag',2,'',0),(83,'学生列表','#',82,'studentList',1,'',0),(84,'增加学生','#',83,'6',1,'',0);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) DEFAULT NULL,
  `permission_code` varchar(20) DEFAULT NULL,
  `permission_description` varchar(200) DEFAULT NULL,
  `moduleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permission_name`,`permission_code`,`permission_description`,`moduleId`) values (1,'根目录菜单','editRoot','操作根目录菜单',1),(2,'医生管理菜单','doctor','操作医生管理菜单',2),(3,'患者管理菜单','patient','操作患者管理菜单',3),(4,'系统维护菜单','system','操作系统维护菜单',4),(5,'安全管理菜单','safe','操作安全管理菜单',5),(6,'医生列表菜单','doctorList','操作医生列表菜单',6),(7,'待审核医生菜单','noCheckeddoctorList','操作待审核医生菜单',7),(8,'患者列表菜单','goPatientList','操作患者列表菜单',8),(9,'今日预约菜单','appointmentToday','操作今日预约菜单',9),(10,'预约列表菜单','appointmentList','操作预约列表菜单',10),(11,'待审核患者菜单','noCheckedPatientList','操作待审核患者菜单',11),(12,'近期就诊列表菜单','recentVisitList','操作近期就诊列表菜单',12),(13,'系统通知菜单','systemNoticeList','操作系统通知菜单',13),(14,'健康教育菜单','healthEducationList','操作健康教育菜单',14),(15,'数据字典菜单','constList','操作数据字典菜单',15),(16,'体检参数菜单','examinationList','操作体检参数菜单',16),(17,'科室简介菜单','officeDescription','操作科室简介菜单',17),(18,'标签管理菜单','editTagInfo','操作标签管理菜单',18),(19,'角色管理菜单','getRole','操作角色管理菜单',19),(20,'模块管理菜单','moduleList','操作模块管理菜单',20),(21,'权限管理菜单','goPermission','操作',21),(22,'查看医生','lookDoctor','仅限于查看',6),(23,'编辑删除医生','updateDelete','便捷删除分配患者',6),(27,'查看测试页6','looktest','DD',26),(28,'asas','asas','asasas',26),(29,'we','we','we',26),(31,'ewrwerew','werwer','ewrewr',8),(32,'wqeqwe','wqewqe','weqe',8),(33,'qwewqe','wqeqwe','wqeqwewqewq',8),(34,'qweqw','qwew','wqewqe',81),(35,'查看学生列表','lookStudent','',83),(36,'编辑学生','editStudent','',83);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_code` varchar(20) DEFAULT NULL,
  `role_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`role_name`,`role_code`,`role_description`) values (1,'管理员','manage','管理员'),(2,'医生','doctor','医生、主任、护士'),(3,'患者','patient','患者、用户'),(11,'admin','admin','admin');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`user_name`,`sex`,`phone`,`photo`,`email`,`create_time`) values (1,'admin','123456','管理员','男','133562356235',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
