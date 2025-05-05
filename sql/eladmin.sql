-- MySQL dump 10.13  Distrib 8.2.0, for macos13 (arm64)
--
-- Host: localhost    Database: eladmin
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Checkup_Items`
--

DROP TABLE IF EXISTS `Checkup_Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Checkup_Items` (
  `item_id` bigint NOT NULL AUTO_INCREMENT COMMENT '体检项目唯一标识符',
  `report_id` bigint NOT NULL COMMENT '体检报告ID（外键，关联体检报告表）',
  `item_name` varchar(100) NOT NULL COMMENT '体检项目名称（如身高、体重）',
  `item_value` varchar(100) NOT NULL COMMENT '体检项目值（如175 cm）',
  `reference_range` varchar(100) DEFAULT NULL COMMENT '正常参考值范围',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最后更新时间',
  PRIMARY KEY (`item_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `checkup_items_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `Health_Reports` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='体检项目明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Checkup_Items`
--

LOCK TABLES `Checkup_Items` WRITE;
/*!40000 ALTER TABLE `Checkup_Items` DISABLE KEYS */;
INSERT INTO `Checkup_Items` VALUES (1,1,'身高','178 cm','160-190 cm','2025-04-29 19:02:23','2025-04-29 19:02:23'),(2,1,'体重','72 kg','50-80 kg','2025-04-29 19:02:23','2025-04-29 19:02:23'),(3,1,'血压','125/80 mmHg','90/60-120/80 mmHg','2025-04-29 19:02:23','2025-04-29 19:02:23'),(4,2,'身高','160 cm','150-180 cm','2025-04-29 19:02:23','2025-04-29 19:02:23'),(5,2,'体重','50 kg','45-65 kg','2025-04-29 19:02:23','2025-04-29 19:02:23'),(6,2,'血糖','4.9 mmol/L','3.9-6.1 mmol/L','2025-04-29 19:02:23','2025-04-29 19:02:23');
/*!40000 ALTER TABLE `Checkup_Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_column`
--

DROP TABLE IF EXISTS `code_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(180) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表名',
  `column_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据库字段名称',
  `column_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据库字段类型',
  `dict_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `extra` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字段额外的参数',
  `form_show` bit(1) DEFAULT NULL COMMENT '是否表单显示',
  `form_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表单类型',
  `key_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据库字段键类型',
  `list_show` bit(1) DEFAULT NULL COMMENT '是否在列表显示',
  `not_null` bit(1) DEFAULT NULL COMMENT '是否为空',
  `query_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '查询类型',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`column_id`) USING BTREE,
  KEY `idx_table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='代码生成字段信息存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_column`
--

LOCK TABLES `code_column` WRITE;
/*!40000 ALTER TABLE `code_column` DISABLE KEYS */;
INSERT INTO `code_column` VALUES (223,'Checkup_Items','item_id','bigint',NULL,'auto_increment',_binary '\0',NULL,'PRI',_binary '\0',_binary '\0',NULL,'体检项目唯一标识符'),(224,'Checkup_Items','report_id','bigint',NULL,'',_binary '','Input','MUL',_binary '',_binary '','=','体检报告ID（外键，关联体检报告表）'),(225,'Checkup_Items','item_name','varchar','体检项目','',_binary '','Select','',_binary '',_binary '','=','体检项目名称（如身高、体重）'),(226,'Checkup_Items','item_value','varchar',NULL,'',_binary '','Input','',_binary '',_binary '','=','体检项目值（如175 cm）'),(227,'Checkup_Items','reference_range','varchar',NULL,'',_binary '','Input','',_binary '',_binary '','=','正常参考值范围'),(228,'Checkup_Items','created_at','datetime',NULL,'DEFAULT_GENERATED',_binary '\0',NULL,'',_binary '\0',_binary '\0',NULL,'记录创建时间'),(229,'Checkup_Items','updated_at','datetime',NULL,'DEFAULT_GENERATED on update CURRENT_TIMESTAMP',_binary '','Date','',_binary '',_binary '\0','BetWeen','记录最后更新时间');
/*!40000 ALTER TABLE `code_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_config`
--

DROP TABLE IF EXISTS `code_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表名',
  `author` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者',
  `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`config_id`) USING BTREE,
  KEY `idx_table_name` (`table_name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='代码生成器配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_config`
--

LOCK TABLES `code_config` WRITE;
/*!40000 ALTER TABLE `code_config` DISABLE KEYS */;
INSERT INTO `code_config` VALUES (7,'sys_role','test',_binary '\0','test','test','test','test/',NULL,'test'),(8,'Checkup_Items','VitalInsight Team',_binary '','VitalInsight-health','com.vitalinsight','/Users/homan/Downloads/VitalInsight/VitalInsight-web/src/views/maint/checkup','/Users/homan/Downloads/VitalInsight/VitalInsight-web/src/api','体检指标记录','view_checkup_items');
/*!40000 ALTER TABLE `code_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Health_Reports`
--

DROP TABLE IF EXISTS `Health_Reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Health_Reports` (
  `report_id` bigint NOT NULL AUTO_INCREMENT COMMENT '体检报告唯一标识符',
  `user_id` bigint NOT NULL COMMENT '用户ID（外键，关联用户表）',
  `institution_name` varchar(100) DEFAULT NULL COMMENT '体检机构名称',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '报告创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '报告最后更新时间',
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `health_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='体检报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Health_Reports`
--

LOCK TABLES `Health_Reports` WRITE;
/*!40000 ALTER TABLE `Health_Reports` DISABLE KEYS */;
INSERT INTO `Health_Reports` VALUES (1,2,'北京协和医院','2025-03-10 08:00:00','2025-04-29 19:02:23'),(2,2,'北京积水潭医院','2025-03-15 09:30:00','2025-04-29 19:02:23');
/*!40000 ALTER TABLE `Health_Reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_app`
--

DROP TABLE IF EXISTS `mnt_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mnt_app` (
  `app_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用名称',
  `upload_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上传目录',
  `deploy_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部署路径',
  `backup_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备份路径',
  `port` int DEFAULT NULL COMMENT '应用端口',
  `start_script` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '启动脚本',
  `deploy_script` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部署脚本',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='应用管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_app`
--

LOCK TABLES `mnt_app` WRITE;
/*!40000 ALTER TABLE `mnt_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_database`
--

DROP TABLE IF EXISTS `mnt_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mnt_database` (
  `db_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `jdbc_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'jdbc连接',
  `user_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `pwd` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`db_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='数据库管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_database`
--

LOCK TABLES `mnt_database` WRITE;
/*!40000 ALTER TABLE `mnt_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_deploy`
--

DROP TABLE IF EXISTS `mnt_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mnt_deploy` (
  `deploy_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_id` bigint DEFAULT NULL COMMENT '应用编号',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`deploy_id`) USING BTREE,
  KEY `idx_app_id` (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部署管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_deploy`
--

LOCK TABLES `mnt_deploy` WRITE;
/*!40000 ALTER TABLE `mnt_deploy` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_deploy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_deploy_history`
--

DROP TABLE IF EXISTS `mnt_deploy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mnt_deploy_history` (
  `history_id` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `app_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用名称',
  `deploy_date` datetime NOT NULL COMMENT '部署日期',
  `deploy_user` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '部署用户',
  `ip` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务器IP',
  `deploy_id` bigint DEFAULT NULL COMMENT '部署编号',
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部署历史管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_deploy_history`
--

LOCK TABLES `mnt_deploy_history` WRITE;
/*!40000 ALTER TABLE `mnt_deploy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_deploy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_deploy_server`
--

DROP TABLE IF EXISTS `mnt_deploy_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mnt_deploy_server` (
  `deploy_id` bigint NOT NULL COMMENT '部署ID',
  `server_id` bigint NOT NULL COMMENT '服务ID',
  PRIMARY KEY (`deploy_id`,`server_id`) USING BTREE,
  KEY `idx_deploy_id` (`deploy_id`),
  KEY `idx_server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='应用与服务器关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_deploy_server`
--

LOCK TABLES `mnt_deploy_server` WRITE;
/*!40000 ALTER TABLE `mnt_deploy_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_deploy_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnt_server`
--

DROP TABLE IF EXISTS `mnt_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mnt_server` (
  `server_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `ip` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `port` int DEFAULT NULL COMMENT '端口',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`server_id`) USING BTREE,
  KEY `idx_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='服务器管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnt_server`
--

LOCK TABLES `mnt_server` WRITE;
/*!40000 ALTER TABLE `mnt_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnt_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint DEFAULT NULL COMMENT '上级部门',
  `sub_count` int DEFAULT '0' COMMENT '子部门数目',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `dept_sort` int DEFAULT '999' COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `idx_pid` (`pid`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (2,7,1,'研发部',3,_binary '','admin','admin','2019-03-25 09:15:32','2020-08-02 14:48:47'),(5,7,0,'运维部',4,_binary '','admin','admin','2019-03-25 09:20:44','2020-05-17 14:27:27'),(6,8,0,'测试部',6,_binary '','admin','admin','2019-03-25 09:52:18','2020-06-08 11:59:21'),(7,NULL,2,'华南分部',0,_binary '','admin','admin','2019-03-25 11:04:50','2020-06-08 12:08:56'),(8,NULL,2,'华北分部',1,_binary '','admin','admin','2019-03-25 11:04:53','2020-05-14 12:54:00'),(15,8,0,'UI部门',7,_binary '','admin','admin','2020-05-13 22:56:53','2020-05-14 12:54:13'),(17,2,0,'研发一组',999,_binary '','admin','admin','2020-08-02 14:49:07','2020-08-02 14:49:07');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'user_status','用户状态',NULL,NULL,'2019-10-27 20:31:36',NULL),(4,'dept_status','部门状态',NULL,NULL,'2019-10-27 20:31:36',NULL),(5,'job_status','岗位状态',NULL,NULL,'2019-10-27 20:31:36',NULL),(7,'体检项目','存储体检项目','admin','admin','2025-04-29 19:08:31','2025-04-29 19:08:31');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_detail`
--

DROP TABLE IF EXISTS `sys_dict_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_detail` (
  `detail_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典值',
  `dict_sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  KEY `idx_dict_id` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='数据字典详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_detail`
--

LOCK TABLES `sys_dict_detail` WRITE;
/*!40000 ALTER TABLE `sys_dict_detail` DISABLE KEYS */;
INSERT INTO `sys_dict_detail` VALUES (1,1,'激活','true',1,NULL,NULL,'2019-10-27 20:31:36',NULL),(2,1,'禁用','false',2,NULL,NULL,NULL,NULL),(3,4,'启用','true',1,NULL,NULL,NULL,NULL),(4,4,'停用','false',2,NULL,NULL,'2019-10-27 20:31:36',NULL),(5,5,'启用','true',1,NULL,NULL,NULL,NULL),(6,5,'停用','false',2,NULL,NULL,'2019-10-27 20:31:36',NULL),(7,7,'身高','身高',1,'admin','admin','2025-04-29 19:08:59','2025-04-29 19:08:59'),(8,7,'体重','体重',2,'admin','admin','2025-04-29 19:09:11','2025-04-29 19:09:11'),(9,7,'血压','血压',3,'admin','admin','2025-04-29 19:09:41','2025-04-29 19:09:41'),(10,7,'血糖','血糖',4,'admin','admin','2025-04-29 20:48:13','2025-04-29 20:48:13'),(11,7,'心率','心率',5,'test','test','2025-04-29 21:02:31','2025-04-29 21:02:31');
/*!40000 ALTER TABLE `sys_dict_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(180) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='岗位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (8,'人事专员',_binary '',3,NULL,NULL,'2019-03-29 14:52:28',NULL),(10,'产品经理',_binary '',4,NULL,NULL,'2019-03-29 14:55:51',NULL),(11,'全栈开发',_binary '',2,NULL,'admin','2019-03-31 13:39:30','2020-05-05 11:33:43'),(12,'软件测试',_binary '',5,NULL,'admin','2019-03-31 13:39:43','2020-05-10 19:56:26');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `log_type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志类型：INFI/ERROR',
  `method` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名',
  `params` text COLLATE utf8mb4_general_ci COMMENT '参数',
  `request_ip` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求IP',
  `time` bigint DEFAULT NULL COMMENT '执行时间',
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `browser` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器',
  `exception_detail` text COLLATE utf8mb4_general_ci COMMENT '异常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `idx_create_time_index` (`create_time`),
  KEY `idx_log_type` (`log_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3649 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (3593,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:3848c48e19c14a9a9d2016af8f0b57fb\"}','172.28.117.158',157,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 00:24:29'),(3594,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:f54fd68e689a43c6841e598f8592c63a\"}','172.28.117.158',125,'admin','内网IP','Chrome 135',NULL,'2025-04-29 00:25:04'),(3595,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:0422728814d04519805fc7cd6120fd10\"}','172.28.117.158',213,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 00:46:23'),(3596,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:adaf022ee1414d2b9d806a99922fcaae\"}','172.28.117.158',126,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 00:47:19'),(3597,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:50261186a85e407fa1dab7466e464de4\"}','172.28.117.158',139,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 00:53:56'),(3598,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:ea0ba724745f43fda96351979e52057c\"}','172.28.117.158',291,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 18:36:58'),(3599,'新增字典','INFO','com.vitalinsight.modules.system.rest.DictController.createDict()','{\"createBy\":\"admin\",\"createTime\":\"2025-04-29 19:08:31.056\",\"description\":\"存储体检项目\",\"id\":7,\"name\":\"体检项目\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 19:08:31.056\"}','172.28.117.158',18,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 19:08:31'),(3600,'新增字典详情','INFO','com.vitalinsight.modules.system.rest.DictDetailController.createDictDetail()','{\"createBy\":\"admin\",\"createTime\":\"2025-04-29 19:08:58.907\",\"dict\":{\"id\":7},\"dictId\":7,\"dictSort\":1,\"id\":7,\"label\":\"身高\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 19:08:58.907\",\"value\":\"身高\"}','172.28.117.158',17,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 19:08:59'),(3601,'新增字典详情','INFO','com.vitalinsight.modules.system.rest.DictDetailController.createDictDetail()','{\"createBy\":\"admin\",\"createTime\":\"2025-04-29 19:09:10.965\",\"dict\":{\"id\":7},\"dictId\":7,\"dictSort\":2,\"id\":8,\"label\":\"体重\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 19:09:10.965\",\"value\":\"体重\"}','172.28.117.158',7,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 19:09:11'),(3602,'新增字典详情','INFO','com.vitalinsight.modules.system.rest.DictDetailController.createDictDetail()','{\"createBy\":\"admin\",\"createTime\":\"2025-04-29 19:09:40.987\",\"dict\":{\"id\":7},\"dictId\":7,\"dictSort\":3,\"id\":9,\"label\":\"血压\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 19:09:40.987\",\"value\":\"血压\"}','172.28.117.158',15,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 19:09:41'),(3603,'新增菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.createMenu()','{\"IFrame\":false,\"cache\":false,\"children\":[{\"IFrame\":false,\"cache\":false,\"component\":\"\",\"createTime\":\"2019-11-17 11:08:33\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"\",\"id\":103,\"label\":\"服务器新增\",\"leaf\":true,\"menuSort\":999,\"path\":\"\",\"permission\":\"serverDeploy:add\",\"pid\":92,\"subCount\":0,\"title\":\"服务器新增\",\"type\":2},{\"IFrame\":false,\"cache\":false,\"component\":\"\",\"createTime\":\"2019-11-17 11:08:57\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"\",\"id\":104,\"label\":\"服务器编辑\",\"leaf\":true,\"menuSort\":999,\"path\":\"\",\"permission\":\"serverDeploy:edit\",\"pid\":92,\"subCount\":0,\"title\":\"服务器编辑\",\"type\":2},{\"IFrame\":false,\"cache\":false,\"component\":\"\",\"createTime\":\"2019-11-17 11:09:15\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"\",\"id\":105,\"label\":\"服务器删除\",\"leaf\":true,\"menuSort\":999,\"path\":\"\",\"permission\":\"serverDeploy:del\",\"pid\":92,\"subCount\":0,\"title\":\"服务器删除\",\"type\":2}],\"component\":\"maint/checkup/index\",\"componentName\":\"CheckupItems\",\"createBy\":\"admin\",\"createTime\":\"2025-04-29 20:19:50.764\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"nested\",\"id\":117,\"label\":\"体检数据记录\",\"leaf\":true,\"menuSort\":1,\"path\":\"maint/checkup\",\"permission\":\"checkup:list\",\"pid\":90,\"subCount\":0,\"title\":\"体检数据记录\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:19:50.767\"}','172.28.117.158',74,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:19:51'),(3604,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":2,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":97,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":98,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":102,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":103,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":104,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":105,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":106,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":107,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":108,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":109,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":110,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":111,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":116,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":117,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":1,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":2,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":6,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":7,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":9,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":80,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":82,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":92,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":93,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":30,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":94,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":32,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',66,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:20:11'),(3605,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":1,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":97,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":98,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":102,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":103,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":104,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":105,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":106,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":107,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":108,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":109,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":110,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":111,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":116,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":117,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":1,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":2,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":3,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":5,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":6,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":7,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":9,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":28,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":30,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":32,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":35,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":37,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":41,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":44,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":45,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":46,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":48,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":49,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":50,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":52,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":53,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":54,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":56,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":57,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":58,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":60,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":61,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":62,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":73,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":74,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":75,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":77,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":78,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":79,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":80,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":82,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":92,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":93,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":94,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',40,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:20:28'),(3606,'新增角色','INFO','com.vitalinsight.modules.system.rest.RoleController.createRole()','{\"createBy\":\"admin\",\"createTime\":\"2025-04-29 20:21:34.254\",\"dataScope\":\"本级\",\"depts\":[],\"description\":\"已入驻的体检机构～\",\"id\":3,\"level\":2,\"name\":\"体检机构\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:21:34.254\"}','172.28.117.158',23,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:21:34'),(3607,'修改角色','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRole()','{\"createTime\":\"2018-11-23 13:09:06\",\"dataScope\":\"本级\",\"depts\":[],\"description\":\"亲爱的用户们～\",\"id\":2,\"level\":3,\"name\":\"普通用户\",\"updateBy\":\"admin\",\"updateTime\":\"2020-09-05 10:45:12\"}','172.28.117.158',32,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:22:11'),(3608,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"system/dict/index\",\"componentName\":\"Dict\",\"createTime\":\"2019-04-10 11:49:04\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"dictionary\",\"id\":39,\"label\":\"字典管理\",\"leaf\":false,\"menuSort\":8,\"path\":\"dict\",\"permission\":\"dict:list\",\"pid\":90,\"subCount\":3,\"title\":\"字典管理\",\"type\":1}','172.28.117.158',30,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:23:45'),(3609,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"children\":[{\"IFrame\":false,\"cache\":false,\"component\":\"maint/checkup/index\",\"componentName\":\"CheckupItems\",\"createBy\":\"admin\",\"createTime\":\"2025-04-29 20:19:51\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"nested\",\"id\":117,\"label\":\"体检数据记录\",\"leaf\":false,\"menuSort\":1,\"path\":\"maint/checkup\",\"permission\":\"checkup:list\",\"pid\":90,\"subCount\":3,\"title\":\"体检数据记录\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:19:51\"},{\"IFrame\":false,\"cache\":false,\"component\":\"system/dict/index\",\"componentName\":\"Dict\",\"createTime\":\"2019-04-10 11:49:04\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"dictionary\",\"id\":39,\"label\":\"字典管理\",\"leaf\":false,\"menuSort\":8,\"path\":\"dict\",\"permission\":\"dict:list\",\"pid\":90,\"subCount\":3,\"title\":\"字典管理\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:23:45\"},{\"IFrame\":false,\"cache\":false,\"component\":\"maint/server/index\",\"componentName\":\"ServerDeploy\",\"createTime\":\"2019-11-10 10:29:25\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"server\",\"id\":92,\"label\":\"服务器\",\"leaf\":false,\"menuSort\":22,\"path\":\"maint/serverDeploy\",\"permission\":\"serverDeploy:list\",\"pid\":90,\"subCount\":3,\"title\":\"服务器\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"maint/app/index\",\"componentName\":\"App\",\"createTime\":\"2019-11-10 11:05:16\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"app\",\"id\":93,\"label\":\"应用管理\",\"leaf\":false,\"menuSort\":23,\"path\":\"maint/app\",\"permission\":\"app:list\",\"pid\":90,\"subCount\":3,\"title\":\"应用管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"maint/deploy/index\",\"componentName\":\"Deploy\",\"createTime\":\"2019-11-10 15:56:55\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"deploy\",\"id\":94,\"label\":\"部署管理\",\"leaf\":false,\"menuSort\":24,\"path\":\"maint/deploy\",\"permission\":\"deploy:list\",\"pid\":90,\"subCount\":3,\"title\":\"部署管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"maint/deployHistory/index\",\"componentName\":\"DeployHistory\",\"createTime\":\"2019-11-10 16:49:44\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"backup\",\"id\":97,\"label\":\"部署备份\",\"leaf\":false,\"menuSort\":25,\"path\":\"maint/deployHistory\",\"permission\":\"deployHistory:list\",\"pid\":90,\"subCount\":1,\"title\":\"部署备份\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"maint/database/index\",\"componentName\":\"Database\",\"createTime\":\"2019-11-10 20:40:04\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"database\",\"id\":98,\"label\":\"数据库管理\",\"leaf\":false,\"menuSort\":26,\"path\":\"maint/database\",\"permission\":\"database:list\",\"pid\":90,\"subCount\":3,\"title\":\"数据库管理\",\"type\":1}],\"component\":\"\",\"componentName\":\"Mnt\",\"createTime\":\"2019-11-09 10:31:08\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"mnt\",\"id\":90,\"label\":\"体检数据管理\",\"leaf\":false,\"menuSort\":20,\"path\":\"mnt\",\"subCount\":7,\"title\":\"体检数据管理\",\"type\":1}','172.28.117.158',23,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:26:02'),(3610,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":2,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":117,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',24,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:27:00'),(3611,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":2,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":77,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":78,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":79,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":117,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',27,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:27:28'),(3612,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"children\":[{\"IFrame\":false,\"cache\":false,\"component\":\"\",\"createTime\":\"2019-10-29 13:09:09\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"\",\"id\":77,\"label\":\"上传文件\",\"leaf\":true,\"menuSort\":2,\"path\":\"\",\"permission\":\"storage:add\",\"pid\":18,\"subCount\":0,\"title\":\"上传文件\",\"type\":2},{\"IFrame\":false,\"cache\":false,\"component\":\"\",\"createTime\":\"2019-10-29 13:09:22\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"\",\"id\":78,\"label\":\"文件编辑\",\"leaf\":true,\"menuSort\":3,\"path\":\"\",\"permission\":\"storage:edit\",\"pid\":18,\"subCount\":0,\"title\":\"文件编辑\",\"type\":2},{\"IFrame\":false,\"cache\":false,\"component\":\"\",\"createTime\":\"2019-10-29 13:09:34\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"\",\"id\":79,\"label\":\"文件删除\",\"leaf\":true,\"menuSort\":4,\"path\":\"\",\"permission\":\"storage:del\",\"pid\":18,\"subCount\":0,\"title\":\"文件删除\",\"type\":2}],\"component\":\"tools/storage/index\",\"componentName\":\"Storage\",\"createTime\":\"2018-12-31 11:12:15\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"qiniu\",\"id\":18,\"label\":\"上传体检报告\",\"leaf\":false,\"menuSort\":34,\"path\":\"storage\",\"permission\":\"storage:list\",\"subCount\":3,\"title\":\"上传体检报告\",\"type\":1}','172.28.117.158',21,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:28:51'),(3613,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"tools/storage/index\",\"componentName\":\"Storage\",\"createTime\":\"2018-12-31 11:12:15\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"qiniu\",\"id\":18,\"label\":\"上传体检报告\",\"leaf\":false,\"menuSort\":34,\"path\":\"storage\",\"permission\":\"storage:list\",\"subCount\":3,\"title\":\"上传体检报告\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:28:51\"}','172.28.117.158',21,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:29:24'),(3614,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"tools/storage/index\",\"componentName\":\"Storage\",\"createTime\":\"2018-12-31 11:12:15\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"qiniu\",\"id\":18,\"label\":\"上传体检报告\",\"leaf\":false,\"menuSort\":34,\"path\":\"storage\",\"permission\":\"storage:list\",\"subCount\":3,\"title\":\"上传体检报告\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:28:51\"}','172.28.117.158',17,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:31:15'),(3615,'新增菜单','ERROR','com.vitalinsight.modules.system.rest.MenuController.createMenu()','{\"IFrame\":false,\"cache\":false,\"children\":[{\"IFrame\":false,\"cache\":false,\"component\":\"system/user/index\",\"componentName\":\"User\",\"createTime\":\"2018-12-18 15:14:44\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"peoples\",\"id\":2,\"label\":\"用户管理\",\"leaf\":false,\"menuSort\":2,\"path\":\"user\",\"permission\":\"user:list\",\"pid\":1,\"subCount\":3,\"title\":\"用户管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/role/index\",\"componentName\":\"Role\",\"createTime\":\"2018-12-18 15:16:07\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"role\",\"id\":3,\"label\":\"角色管理\",\"leaf\":false,\"menuSort\":3,\"path\":\"role\",\"permission\":\"roles:list\",\"pid\":1,\"subCount\":3,\"title\":\"角色管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/menu/index\",\"componentName\":\"Menu\",\"createTime\":\"2018-12-18 15:17:28\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"menu\",\"id\":5,\"label\":\"菜单管理\",\"leaf\":false,\"menuSort\":5,\"path\":\"menu\",\"permission\":\"menu:list\",\"pid\":1,\"subCount\":3,\"title\":\"菜单管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/dept/index\",\"componentName\":\"Dept\",\"createTime\":\"2019-03-25 09:46:00\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"dept\",\"id\":35,\"label\":\"部门管理\",\"leaf\":false,\"menuSort\":6,\"path\":\"dept\",\"permission\":\"dept:list\",\"pid\":1,\"subCount\":3,\"title\":\"部门管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/job/index\",\"componentName\":\"Job\",\"createTime\":\"2019-03-29 13:51:18\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"Steve-Jobs\",\"id\":37,\"label\":\"岗位管理\",\"leaf\":false,\"menuSort\":7,\"path\":\"job\",\"permission\":\"job:list\",\"pid\":1,\"subCount\":3,\"title\":\"岗位管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/timing/index\",\"componentName\":\"Timing\",\"createTime\":\"2019-01-07 20:34:40\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"timing\",\"id\":28,\"label\":\"任务调度\",\"leaf\":false,\"menuSort\":999,\"path\":\"timing\",\"permission\":\"timing:list\",\"pid\":1,\"subCount\":3,\"title\":\"任务调度\",\"type\":1}],\"component\":\"upload/index\",\"componentName\":\"Upload\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"deploy\",\"label\":\"上传体检报告\",\"leaf\":false,\"menuSort\":1,\"path\":\"upload\",\"permission\":\"upload:list\",\"pid\":0,\"subCount\":3,\"title\":\"上传体检报告\",\"type\":1}','172.28.117.158',83,'admin','内网IP','Safari 18.3.1','com.vitalinsight.exception.EntityExistException: Menu with title 上传体检报告 existed\n	at com.vitalinsight.modules.system.service.impl.MenuServiceImpl.create(MenuServiceImpl.java:120)\n	at com.vitalinsight.modules.system.service.impl.MenuServiceImpl$$FastClassBySpringCGLIB$$302274a4.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:707)\n	at com.vitalinsight.modules.system.service.impl.MenuServiceImpl$$EnhancerBySpringCGLIB$$240a33ee.create(<generated>)\n	at com.vitalinsight.modules.system.rest.MenuController.createMenu(MenuController.java:126)\n	at com.vitalinsight.modules.system.rest.MenuController$$FastClassBySpringCGLIB$$9ef93d12.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at com.vitalinsight.aspect.LogAspect.logAround(LogAspect.java:68)\n	at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:580)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:61)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:707)\n	at com.vitalinsight.modules.system.rest.MenuController$$EnhancerBySpringCGLIB$$8ac4fdf9.createMenu(<generated>)\n	at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:580)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1072)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:965)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:555)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:623)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:209)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:111)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:114)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:337)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:115)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:81)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:122)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:116)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:126)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:81)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:109)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:149)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at com.vitalinsight.modules.security.security.TokenFilter.doFilter(TokenFilter.java:73)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:103)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:89)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:112)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:82)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:55)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:346)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:221)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:186)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:96)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:178)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:153)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:168)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:481)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:130)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:390)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:928)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1794)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:1583)\n','2025-04-29 20:42:31'),(3616,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"children\":[{\"IFrame\":false,\"cache\":false,\"component\":\"system/user/index\",\"componentName\":\"User\",\"createTime\":\"2018-12-18 15:14:44\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"peoples\",\"id\":2,\"label\":\"用户管理\",\"leaf\":false,\"menuSort\":2,\"path\":\"user\",\"permission\":\"user:list\",\"pid\":1,\"subCount\":3,\"title\":\"用户管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/role/index\",\"componentName\":\"Role\",\"createTime\":\"2018-12-18 15:16:07\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"role\",\"id\":3,\"label\":\"角色管理\",\"leaf\":false,\"menuSort\":3,\"path\":\"role\",\"permission\":\"roles:list\",\"pid\":1,\"subCount\":3,\"title\":\"角色管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/menu/index\",\"componentName\":\"Menu\",\"createTime\":\"2018-12-18 15:17:28\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"menu\",\"id\":5,\"label\":\"菜单管理\",\"leaf\":false,\"menuSort\":5,\"path\":\"menu\",\"permission\":\"menu:list\",\"pid\":1,\"subCount\":3,\"title\":\"菜单管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/dept/index\",\"componentName\":\"Dept\",\"createTime\":\"2019-03-25 09:46:00\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"dept\",\"id\":35,\"label\":\"部门管理\",\"leaf\":false,\"menuSort\":6,\"path\":\"dept\",\"permission\":\"dept:list\",\"pid\":1,\"subCount\":3,\"title\":\"部门管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/job/index\",\"componentName\":\"Job\",\"createTime\":\"2019-03-29 13:51:18\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"Steve-Jobs\",\"id\":37,\"label\":\"岗位管理\",\"leaf\":false,\"menuSort\":7,\"path\":\"job\",\"permission\":\"job:list\",\"pid\":1,\"subCount\":3,\"title\":\"岗位管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/timing/index\",\"componentName\":\"Timing\",\"createTime\":\"2019-01-07 20:34:40\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"timing\",\"id\":28,\"label\":\"任务调度\",\"leaf\":false,\"menuSort\":999,\"path\":\"timing\",\"permission\":\"timing:list\",\"pid\":1,\"subCount\":3,\"title\":\"任务调度\",\"type\":1}],\"component\":\"tools/storage/index\",\"componentName\":\"Storage\",\"createTime\":\"2018-12-31 11:12:15\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"qiniu\",\"id\":18,\"label\":\"存储管理\",\"leaf\":false,\"menuSort\":34,\"path\":\"storage\",\"permission\":\"storage:list\",\"pid\":36,\"subCount\":3,\"title\":\"存储管理\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:28:51\"}','172.28.117.158',36,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:42:55'),(3617,'新增菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.createMenu()','{\"IFrame\":false,\"cache\":false,\"children\":[{\"IFrame\":false,\"cache\":false,\"component\":\"system/user/index\",\"componentName\":\"User\",\"createTime\":\"2018-12-18 15:14:44\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"peoples\",\"id\":2,\"label\":\"用户管理\",\"leaf\":false,\"menuSort\":2,\"path\":\"user\",\"permission\":\"user:list\",\"pid\":1,\"subCount\":3,\"title\":\"用户管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/role/index\",\"componentName\":\"Role\",\"createTime\":\"2018-12-18 15:16:07\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"role\",\"id\":3,\"label\":\"角色管理\",\"leaf\":false,\"menuSort\":3,\"path\":\"role\",\"permission\":\"roles:list\",\"pid\":1,\"subCount\":3,\"title\":\"角色管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/menu/index\",\"componentName\":\"Menu\",\"createTime\":\"2018-12-18 15:17:28\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"menu\",\"id\":5,\"label\":\"菜单管理\",\"leaf\":false,\"menuSort\":5,\"path\":\"menu\",\"permission\":\"menu:list\",\"pid\":1,\"subCount\":3,\"title\":\"菜单管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/dept/index\",\"componentName\":\"Dept\",\"createTime\":\"2019-03-25 09:46:00\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"dept\",\"id\":35,\"label\":\"部门管理\",\"leaf\":false,\"menuSort\":6,\"path\":\"dept\",\"permission\":\"dept:list\",\"pid\":1,\"subCount\":3,\"title\":\"部门管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/job/index\",\"componentName\":\"Job\",\"createTime\":\"2019-03-29 13:51:18\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"Steve-Jobs\",\"id\":37,\"label\":\"岗位管理\",\"leaf\":false,\"menuSort\":7,\"path\":\"job\",\"permission\":\"job:list\",\"pid\":1,\"subCount\":3,\"title\":\"岗位管理\",\"type\":1},{\"IFrame\":false,\"cache\":false,\"component\":\"system/timing/index\",\"componentName\":\"Timing\",\"createTime\":\"2019-01-07 20:34:40\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"timing\",\"id\":28,\"label\":\"任务调度\",\"leaf\":false,\"menuSort\":999,\"path\":\"timing\",\"permission\":\"timing:list\",\"pid\":1,\"subCount\":3,\"title\":\"任务调度\",\"type\":1}],\"component\":\"upload/index\",\"componentName\":\"Upload\",\"createBy\":\"admin\",\"createTime\":\"2025-04-29 20:43:45.936\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"deploy\",\"id\":118,\"label\":\"上传体检报告\",\"leaf\":true,\"menuSort\":1,\"path\":\"upload\",\"permission\":\"upload:list\",\"subCount\":0,\"title\":\"上传体检报告\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:43:45.937\"}','172.28.117.158',18,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:43:46'),(3618,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":1,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":97,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":98,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":102,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":103,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":104,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":105,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":106,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":107,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":108,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":109,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":110,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":111,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":116,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":117,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":118,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":1,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":2,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":3,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":5,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":6,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":7,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":9,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":28,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":30,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":32,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":35,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":37,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":41,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":44,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":45,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":46,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":48,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":49,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":50,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":52,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":53,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":54,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":56,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":57,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":58,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":60,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":61,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":62,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":73,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":74,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":75,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":77,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":78,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":79,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":80,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":82,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":92,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":93,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":94,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',54,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:43:52'),(3619,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":2,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":117,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":118,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":77,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":78,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":79,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',69,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:43:58'),(3620,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"createTime\":\"2018-12-18 15:11:29\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"system\",\"id\":1,\"label\":\"系统管理\",\"leaf\":false,\"menuSort\":2,\"path\":\"system\",\"subCount\":6,\"title\":\"系统管理\",\"type\":0,\"updateBy\":\"admin\",\"updateTime\":\"2025-01-14 15:48:18\"}','172.28.117.158',18,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:44:34'),(3621,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"createTime\":\"2018-12-18 15:11:29\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"system\",\"id\":1,\"label\":\"系统管理\",\"leaf\":false,\"menuSort\":1,\"path\":\"system\",\"subCount\":6,\"title\":\"系统管理\",\"type\":0,\"updateBy\":\"admin\",\"updateTime\":\"2025-01-14 15:48:18\"}','172.28.117.158',17,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:44:41'),(3622,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:703a3d99dcae40b2ac2a55012609ec9f\"}','172.28.117.158',152,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:44:52'),(3623,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:ea11a54169c843818de3917be7590c00\"}','172.28.117.158',131,'test','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:44:59'),(3624,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:3c998d1f70ec44fbadce3e38f2ee0a42\"}','172.28.117.158',113,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:46:02'),(3625,'新增字典详情','INFO','com.vitalinsight.modules.system.rest.DictDetailController.createDictDetail()','{\"createBy\":\"admin\",\"createTime\":\"2025-04-29 20:48:12.586\",\"dict\":{\"id\":7},\"dictId\":7,\"dictSort\":4,\"id\":10,\"label\":\"血糖\",\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:48:12.587\",\"value\":\"血糖\"}','172.28.117.158',43,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:48:13'),(3626,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"upload/index\",\"componentName\":\"Upload\",\"createBy\":\"admin\",\"createTime\":\"2025-04-29 20:43:46\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"deploy\",\"id\":118,\"label\":\"上传体检报告\",\"leaf\":false,\"menuSort\":1,\"path\":\"upload\",\"permission\":\"\",\"subCount\":3,\"title\":\"上传体检报告\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:43:46\"}','172.28.117.158',35,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:57:49'),(3627,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"maint/checkup/index\",\"componentName\":\"CheckupItems\",\"createBy\":\"admin\",\"createTime\":\"2025-04-29 20:19:51\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"nested\",\"id\":117,\"label\":\"体检数据记录\",\"leaf\":false,\"menuSort\":1,\"path\":\"maint/checkup\",\"permission\":\"\",\"pid\":90,\"subCount\":3,\"title\":\"体检数据记录\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:19:51\"}','172.28.117.158',21,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:58:03'),(3628,'修改菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.updateMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"system/dict/index\",\"componentName\":\"Dict\",\"createTime\":\"2019-04-10 11:49:04\",\"hasChildren\":true,\"hidden\":false,\"icon\":\"dictionary\",\"id\":39,\"label\":\"字典管理\",\"leaf\":false,\"menuSort\":8,\"path\":\"dict\",\"permission\":\"\",\"pid\":90,\"subCount\":3,\"title\":\"字典管理\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-04-29 20:23:45\"}','172.28.117.158',15,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:58:17'),(3629,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:cd43c3fecaca4600950b0f0c2c777057\"}','172.28.117.158',126,'test','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:58:32'),(3630,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:f629539e691343d09b3e0db6b7f5db8a\"}','172.28.117.158',137,'admin','内网IP','Safari 18.3.1',NULL,'2025-04-29 20:58:57'),(3631,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:1497a277f630424f9d0f68bcbc788a74\"}','172.28.117.158',111,'test','内网IP','Safari 18.3.1',NULL,'2025-04-29 21:02:04'),(3632,'新增字典详情','INFO','com.vitalinsight.modules.system.rest.DictDetailController.createDictDetail()','{\"createBy\":\"test\",\"createTime\":\"2025-04-29 21:02:31.023\",\"dict\":{\"id\":7},\"dictId\":7,\"dictSort\":5,\"id\":11,\"label\":\"心率\",\"updateBy\":\"test\",\"updateTime\":\"2025-04-29 21:02:31.024\",\"value\":\"心率\"}','172.28.117.158',14,'test','内网IP','Safari 18.3.1',NULL,'2025-04-29 21:02:31'),(3633,'新增字典','INFO','com.vitalinsight.modules.system.rest.DictController.createDict()','{\"createBy\":\"test\",\"createTime\":\"2025-04-29 21:02:42.388\",\"description\":\"Hello\",\"id\":8,\"name\":\"Hello\",\"updateBy\":\"test\",\"updateTime\":\"2025-04-29 21:02:42.388\"}','172.28.117.158',13,'test','内网IP','Safari 18.3.1',NULL,'2025-04-29 21:02:42'),(3634,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:b814def1ace249a498fa61f3eb4ddb3a\"}','172.28.117.158',288,'test','内网IP','Safari 18.3.1',NULL,'2025-04-29 23:42:03'),(3635,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"11\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:5d095c573fce43d786b454e4635e4bbf\"}','172.28.117.158',266,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-05 20:26:02'),(3636,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:87a81d7c83084b25aa594737a2f7beec\"}','172.28.117.158',146,'test','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:31:50'),(3637,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:64ca43840fa44f4380c83d55f9723d2b\"}','172.28.117.158',117,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:32:23'),(3638,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":2,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":117,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":118,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":77,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":78,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":79,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',66,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:33:44'),(3639,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:cdd09fd524c740289350554a143522de\"}','172.28.117.158',140,'test','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:34:19'),(3640,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:10bb6b0e05514ce7a499a36c6c862a46\"}','172.28.117.158',143,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:45:16'),(3641,'新增菜单','INFO','com.vitalinsight.modules.system.rest.MenuController.createMenu()','{\"IFrame\":false,\"cache\":false,\"component\":\"maint/checkup/index\",\"componentName\":\"CheckupItems\",\"createBy\":\"admin\",\"createTime\":\"2025-05-05 21:47:42.879\",\"hasChildren\":false,\"hidden\":false,\"icon\":\"nested\",\"id\":119,\"label\":\"体检数据记录\",\"leaf\":true,\"menuSort\":1,\"path\":\"maint/checkup\",\"pid\":90,\"subCount\":0,\"title\":\"体检数据记录\",\"type\":1,\"updateBy\":\"admin\",\"updateTime\":\"2025-05-05 21:47:42.879\"}','172.28.117.158',25,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:47:43'),(3642,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":2,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":118,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":119,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":77,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":78,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":79,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',31,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:48:01'),(3643,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:844cd81522624874a90c16f027c626bc\"}','172.28.117.158',139,'test','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:48:15'),(3644,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:4bf051c569a54625bc971329624ac4e5\"}','172.28.117.158',118,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:52:05'),(3645,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:d832934ee5834f4fa5c6242eca2d64f6\"}','172.28.117.158',113,'test','内网IP','Safari 18.3.1',NULL,'2025-05-05 21:53:47'),(3646,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"admin\",\"uuid\":\"captcha_code:0a5b4c6a946d4e02975bc6915bc5c905\"}','172.28.117.158',125,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-06 01:16:21'),(3647,'修改角色菜单','INFO','com.vitalinsight.modules.system.rest.RoleController.updateRoleMenu()','{\"dataScope\":\"本级\",\"id\":1,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":97,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":98,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":102,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":103,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":104,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":105,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":106,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":107,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":108,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":109,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":110,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":111,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":116,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":118,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":119,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":1,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":2,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":3,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":5,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":6,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":7,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":9,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":21,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":22,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":23,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":24,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":27,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":28,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":30,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":32,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":35,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":37,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":41,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":44,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":45,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":46,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":48,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":49,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":50,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":52,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":53,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":54,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":56,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":57,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":58,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":60,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":61,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":62,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":73,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":74,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":75,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":77,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":78,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":79,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":80,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":82,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":92,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":93,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":94,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}','172.28.117.158',66,'admin','内网IP','Safari 18.3.1',NULL,'2025-05-06 01:16:48'),(3648,'用户登录','INFO','com.vitalinsight.modules.security.rest.AuthController.login()','{\"code\":\"\",\"password\":\"******\",\"username\":\"test\",\"uuid\":\"captcha_code:93bd2760cc3c406ebfccb456c8ae1bc7\"}','172.28.117.158',118,'test','内网IP','Safari 18.3.1',NULL,'2025-05-06 01:21:25');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int DEFAULT '0' COMMENT '子菜单数目',
  `type` int DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件',
  `menu_sort` int DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  UNIQUE KEY `uniq_title` (`title`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,NULL,6,0,'系统管理',NULL,NULL,1,'system','system',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,'admin','2018-12-18 15:11:29','2025-01-14 15:48:18'),(2,1,3,1,'用户管理','User','system/user/index',2,'peoples','user',_binary '\0',_binary '\0',_binary '\0','user:list',NULL,NULL,'2018-12-18 15:14:44',NULL),(3,1,3,1,'角色管理','Role','system/role/index',3,'role','role',_binary '\0',_binary '\0',_binary '\0','roles:list',NULL,NULL,'2018-12-18 15:16:07',NULL),(5,1,3,1,'菜单管理','Menu','system/menu/index',5,'menu','menu',_binary '\0',_binary '\0',_binary '\0','menu:list',NULL,NULL,'2018-12-18 15:17:28',NULL),(6,NULL,5,0,'系统监控',NULL,NULL,10,'monitor','monitor',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2018-12-18 15:17:48',NULL),(7,6,0,1,'操作日志','Log','monitor/log/index',11,'log','logs',_binary '\0',_binary '',_binary '\0',NULL,NULL,'admin','2018-12-18 15:18:26','2020-06-06 13:11:57'),(9,6,0,1,'SQL监控','Sql','monitor/sql/index',18,'sqlMonitor','druid',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2018-12-18 15:19:34',NULL),(10,NULL,5,0,'组件管理',NULL,NULL,50,'zujian','components',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2018-12-19 13:38:16',NULL),(11,10,0,1,'图标库','Icons','components/icons/index',51,'icon','icon',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2018-12-19 13:38:49',NULL),(14,36,0,1,'邮件工具','Email','tools/email/index',35,'email','email',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2018-12-27 10:13:09',NULL),(15,10,0,1,'富文本','Editor','components/Editor',52,'fwb','tinymce',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2018-12-27 11:58:25',NULL),(18,36,3,1,'存储管理','Storage','tools/storage/index',34,'qiniu','storage',_binary '\0',_binary '\0',_binary '\0','storage:list',NULL,'admin','2018-12-31 11:12:15','2025-04-29 20:28:51'),(19,36,0,1,'支付宝工具','AliPay','tools/aliPay/index',37,'alipay','aliPay',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2018-12-31 14:52:38',NULL),(21,NULL,2,0,'多级菜单',NULL,'',900,'menu','nested',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,'admin','2019-01-04 16:22:03','2020-06-21 17:27:35'),(22,21,2,0,'二级菜单1',NULL,'',999,'menu','menu1',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,'admin','2019-01-04 16:23:29','2020-06-21 17:27:20'),(23,21,0,1,'二级菜单2',NULL,'nested/menu2/index',999,'menu','menu2',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2019-01-04 16:23:57',NULL),(24,22,0,1,'三级菜单1','Test','nested/menu1/menu1-1',999,'menu','menu1-1',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2019-01-04 16:24:48',NULL),(27,22,0,1,'三级菜单2',NULL,'nested/menu1/menu1-2',999,'menu','menu1-2',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2019-01-07 17:27:32',NULL),(28,1,3,1,'任务调度','Timing','system/timing/index',999,'timing','timing',_binary '\0',_binary '\0',_binary '\0','timing:list',NULL,NULL,'2019-01-07 20:34:40',NULL),(30,36,0,1,'代码生成','GeneratorIndex','generator/index',32,'dev','generator',_binary '\0',_binary '',_binary '\0',NULL,NULL,NULL,'2019-01-11 15:45:55',NULL),(32,6,0,1,'异常日志','ErrorLog','monitor/log/errorLog',12,'error','errorLog',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2019-01-13 13:49:03',NULL),(33,10,0,1,'Markdown','Markdown','components/MarkDown',53,'markdown','markdown',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2019-03-08 13:46:44',NULL),(34,10,0,1,'Yaml编辑器','YamlEdit','components/YamlEdit',54,'dev','yaml',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2019-03-08 15:49:40',NULL),(35,1,3,1,'部门管理','Dept','system/dept/index',6,'dept','dept',_binary '\0',_binary '\0',_binary '\0','dept:list',NULL,NULL,'2019-03-25 09:46:00',NULL),(36,NULL,6,0,'系统工具',NULL,'',30,'sys-tools','sys-tools',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2019-03-29 10:57:35',NULL),(37,1,3,1,'岗位管理','Job','system/job/index',7,'Steve-Jobs','job',_binary '\0',_binary '\0',_binary '\0','job:list',NULL,NULL,'2019-03-29 13:51:18',NULL),(39,90,3,1,'字典管理','Dict','system/dict/index',8,'dictionary','dict',_binary '\0',_binary '\0',_binary '\0','',NULL,'admin','2019-04-10 11:49:04','2025-04-29 20:23:45'),(41,6,0,1,'在线用户','OnlineUser','monitor/online/index',10,'Steve-Jobs','online',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,NULL,'2019-10-26 22:08:43',NULL),(44,2,0,2,'用户新增',NULL,'',2,'','',_binary '\0',_binary '\0',_binary '\0','user:add',NULL,NULL,'2019-10-29 10:59:46',NULL),(45,2,0,2,'用户编辑',NULL,'',3,'','',_binary '\0',_binary '\0',_binary '\0','user:edit',NULL,NULL,'2019-10-29 11:00:08',NULL),(46,2,0,2,'用户删除',NULL,'',4,'','',_binary '\0',_binary '\0',_binary '\0','user:del',NULL,NULL,'2019-10-29 11:00:23',NULL),(48,3,0,2,'角色创建',NULL,'',2,'','',_binary '\0',_binary '\0',_binary '\0','roles:add',NULL,NULL,'2019-10-29 12:45:34',NULL),(49,3,0,2,'角色修改',NULL,'',3,'','',_binary '\0',_binary '\0',_binary '\0','roles:edit',NULL,NULL,'2019-10-29 12:46:16',NULL),(50,3,0,2,'角色删除',NULL,'',4,'','',_binary '\0',_binary '\0',_binary '\0','roles:del',NULL,NULL,'2019-10-29 12:46:51',NULL),(52,5,0,2,'菜单新增',NULL,'',2,'','',_binary '\0',_binary '\0',_binary '\0','menu:add',NULL,NULL,'2019-10-29 12:55:07',NULL),(53,5,0,2,'菜单编辑',NULL,'',3,'','',_binary '\0',_binary '\0',_binary '\0','menu:edit',NULL,NULL,'2019-10-29 12:55:40',NULL),(54,5,0,2,'菜单删除',NULL,'',4,'','',_binary '\0',_binary '\0',_binary '\0','menu:del',NULL,NULL,'2019-10-29 12:56:00',NULL),(56,35,0,2,'部门新增',NULL,'',2,'','',_binary '\0',_binary '\0',_binary '\0','dept:add',NULL,NULL,'2019-10-29 12:57:09',NULL),(57,35,0,2,'部门编辑',NULL,'',3,'','',_binary '\0',_binary '\0',_binary '\0','dept:edit',NULL,NULL,'2019-10-29 12:57:27',NULL),(58,35,0,2,'部门删除',NULL,'',4,'','',_binary '\0',_binary '\0',_binary '\0','dept:del',NULL,NULL,'2019-10-29 12:57:41',NULL),(60,37,0,2,'岗位新增',NULL,'',2,'','',_binary '\0',_binary '\0',_binary '\0','job:add',NULL,NULL,'2019-10-29 12:58:27',NULL),(61,37,0,2,'岗位编辑',NULL,'',3,'','',_binary '\0',_binary '\0',_binary '\0','job:edit',NULL,NULL,'2019-10-29 12:58:45',NULL),(62,37,0,2,'岗位删除',NULL,'',4,'','',_binary '\0',_binary '\0',_binary '\0','job:del',NULL,NULL,'2019-10-29 12:59:04',NULL),(64,39,0,2,'字典新增',NULL,'',2,'','',_binary '\0',_binary '\0',_binary '\0','dict:add',NULL,NULL,'2019-10-29 13:00:17',NULL),(65,39,0,2,'字典编辑',NULL,'',3,'','',_binary '\0',_binary '\0',_binary '\0','dict:edit',NULL,NULL,'2019-10-29 13:00:42',NULL),(66,39,0,2,'字典删除',NULL,'',4,'','',_binary '\0',_binary '\0',_binary '\0','dict:del',NULL,NULL,'2019-10-29 13:00:59',NULL),(73,28,0,2,'任务新增',NULL,'',2,'','',_binary '\0',_binary '\0',_binary '\0','timing:add',NULL,NULL,'2019-10-29 13:07:28',NULL),(74,28,0,2,'任务编辑',NULL,'',3,'','',_binary '\0',_binary '\0',_binary '\0','timing:edit',NULL,NULL,'2019-10-29 13:07:41',NULL),(75,28,0,2,'任务删除',NULL,'',4,'','',_binary '\0',_binary '\0',_binary '\0','timing:del',NULL,NULL,'2019-10-29 13:07:54',NULL),(77,18,0,2,'上传文件',NULL,'',2,'','',_binary '\0',_binary '\0',_binary '\0','storage:add',NULL,NULL,'2019-10-29 13:09:09',NULL),(78,18,0,2,'文件编辑',NULL,'',3,'','',_binary '\0',_binary '\0',_binary '\0','storage:edit',NULL,NULL,'2019-10-29 13:09:22',NULL),(79,18,0,2,'文件删除',NULL,'',4,'','',_binary '\0',_binary '\0',_binary '\0','storage:del',NULL,NULL,'2019-10-29 13:09:34',NULL),(80,6,0,1,'服务监控','ServerMonitor','monitor/server/index',14,'codeConsole','server',_binary '\0',_binary '\0',_binary '\0','monitor:list',NULL,'admin','2019-11-07 13:06:39','2020-05-04 18:20:50'),(82,36,0,1,'生成配置','GeneratorConfig','generator/config',33,'dev','generator/config/:tableName',_binary '\0',_binary '',_binary '','',NULL,NULL,'2019-11-17 20:08:56',NULL),(83,10,0,1,'图表库','Echarts','components/Echarts',50,'chart','echarts',_binary '\0',_binary '',_binary '\0','',NULL,NULL,'2019-11-21 09:04:32',NULL),(90,NULL,7,1,'体检数据管理','Mnt','',20,'mnt','mnt',_binary '\0',_binary '\0',_binary '\0',NULL,NULL,'admin','2019-11-09 10:31:08','2025-04-29 20:26:02'),(92,90,3,1,'服务器','ServerDeploy','maint/server/index',22,'server','maint/serverDeploy',_binary '\0',_binary '\0',_binary '\0','serverDeploy:list',NULL,NULL,'2019-11-10 10:29:25',NULL),(93,90,3,1,'应用管理','App','maint/app/index',23,'app','maint/app',_binary '\0',_binary '\0',_binary '\0','app:list',NULL,NULL,'2019-11-10 11:05:16',NULL),(94,90,3,1,'部署管理','Deploy','maint/deploy/index',24,'deploy','maint/deploy',_binary '\0',_binary '\0',_binary '\0','deploy:list',NULL,NULL,'2019-11-10 15:56:55',NULL),(97,90,1,1,'部署备份','DeployHistory','maint/deployHistory/index',25,'backup','maint/deployHistory',_binary '\0',_binary '\0',_binary '\0','deployHistory:list',NULL,NULL,'2019-11-10 16:49:44',NULL),(98,90,3,1,'数据库管理','Database','maint/database/index',26,'database','maint/database',_binary '\0',_binary '\0',_binary '\0','database:list',NULL,NULL,'2019-11-10 20:40:04',NULL),(102,97,0,2,'删除',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','deployHistory:del',NULL,NULL,'2019-11-17 09:32:48',NULL),(103,92,0,2,'服务器新增',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','serverDeploy:add',NULL,NULL,'2019-11-17 11:08:33',NULL),(104,92,0,2,'服务器编辑',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','serverDeploy:edit',NULL,NULL,'2019-11-17 11:08:57',NULL),(105,92,0,2,'服务器删除',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','serverDeploy:del',NULL,NULL,'2019-11-17 11:09:15',NULL),(106,93,0,2,'应用新增',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','app:add',NULL,NULL,'2019-11-17 11:10:03',NULL),(107,93,0,2,'应用编辑',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','app:edit',NULL,NULL,'2019-11-17 11:10:28',NULL),(108,93,0,2,'应用删除',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','app:del',NULL,NULL,'2019-11-17 11:10:55',NULL),(109,94,0,2,'部署新增',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','deploy:add',NULL,NULL,'2019-11-17 11:11:22',NULL),(110,94,0,2,'部署编辑',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','deploy:edit',NULL,NULL,'2019-11-17 11:11:41',NULL),(111,94,0,2,'部署删除',NULL,'',999,'','',_binary '\0',_binary '\0',_binary '\0','deploy:del',NULL,NULL,'2019-11-17 11:12:01',NULL),(116,36,0,1,'生成预览','Preview','generator/preview',999,'java','generator/preview/:tableName',_binary '\0',_binary '',_binary '',NULL,NULL,NULL,'2019-11-26 14:54:36',NULL),(118,NULL,3,1,'上传体检报告','Upload','upload/index',1,'deploy','upload',_binary '\0',_binary '\0',_binary '\0','','admin','admin','2025-04-29 20:43:46','2025-04-29 20:43:46'),(119,90,3,1,'体检数据记录','CheckupItems','maint/checkup/index',1,'nested','maint/checkup',_binary '\0',_binary '\0',_binary '\0',NULL,'admin','admin','2025-05-05 21:47:43','2025-05-05 21:47:43');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_quartz_job`
--

DROP TABLE IF EXISTS `sys_quartz_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_quartz_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `person_in_charge` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报警邮箱',
  `sub_task` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子任务ID',
  `pause_after_failure` bit(1) DEFAULT NULL COMMENT '任务失败后是否暂停',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  KEY `idx_is_pause` (`is_pause`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_quartz_job`
--

LOCK TABLES `sys_quartz_job` WRITE;
/*!40000 ALTER TABLE `sys_quartz_job` DISABLE KEYS */;
INSERT INTO `sys_quartz_job` VALUES (2,'testTask','0/5 * * * * ?',_binary '','测试1','run1','test','带参测试，多参使用json','测试',NULL,NULL,NULL,NULL,'admin','2019-08-22 14:08:29','2020-05-24 13:58:33'),(3,'testTask','0/5 * * * * ?',_binary '','测试','run','','不带参测试','Zheng Jie','','6',_binary '',NULL,'admin','2019-09-26 16:44:39','2020-05-24 14:48:12'),(5,'Test','0/5 * * * * ?',_binary '','任务告警测试','run',NULL,'测试','test','',NULL,_binary '','admin','admin','2020-05-05 20:32:41','2020-05-05 20:36:13'),(6,'testTask','0/5 * * * * ?',_binary '','测试3','run2',NULL,'测试3','Zheng Jie','',NULL,_binary '','admin','admin','2020-05-05 20:35:41','2020-05-05 20:36:07');
/*!40000 ALTER TABLE `sys_quartz_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_quartz_log`
--

DROP TABLE IF EXISTS `sys_quartz_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_quartz_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Bean名称',
  `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron 表达式',
  `is_success` bit(1) DEFAULT NULL COMMENT '是否执行成功',
  `job_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `time` bigint DEFAULT NULL COMMENT '执行耗时',
  `exception_detail` text COLLATE utf8mb4_general_ci COMMENT '异常详情',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_quartz_log`
--

LOCK TABLES `sys_quartz_log` WRITE;
/*!40000 ALTER TABLE `sys_quartz_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_quartz_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `level` int DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `idx_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员',1,'-','全部',NULL,'admin','2018-11-23 11:04:37','2020-08-06 16:10:24'),(2,'普通用户',3,'亲爱的用户们～','本级',NULL,'admin','2018-11-23 13:09:06','2020-09-05 10:45:12'),(3,'体检机构',2,'已入驻的体检机构～','本级','admin','admin','2025-04-29 20:21:34','2025-04-29 20:21:34');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_roles_depts`
--

DROP TABLE IF EXISTS `sys_roles_depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_roles_depts` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `idx_role_id` (`role_id`),
  KEY `idx_dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色部门关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_roles_depts`
--

LOCK TABLES `sys_roles_depts` WRITE;
/*!40000 ALTER TABLE `sys_roles_depts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_roles_depts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_roles_menus`
--

DROP TABLE IF EXISTS `sys_roles_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_roles_menus` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `idx_menu_id` (`menu_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色菜单关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_roles_menus`
--

LOCK TABLES `sys_roles_menus` WRITE;
/*!40000 ALTER TABLE `sys_roles_menus` DISABLE KEYS */;
INSERT INTO `sys_roles_menus` VALUES (1,1),(2,1),(3,1),(5,1),(6,1),(7,1),(9,1),(10,1),(10,2),(11,1),(11,2),(14,1),(14,2),(15,1),(15,2),(18,1),(18,2),(19,1),(19,2),(21,1),(21,2),(22,1),(22,2),(23,1),(23,2),(24,1),(24,2),(27,1),(27,2),(28,1),(30,1),(32,1),(33,1),(33,2),(34,1),(34,2),(35,1),(36,1),(36,2),(37,1),(39,1),(39,2),(41,1),(44,1),(45,1),(46,1),(48,1),(49,1),(50,1),(52,1),(53,1),(54,1),(56,1),(57,1),(58,1),(60,1),(61,1),(62,1),(64,1),(64,2),(65,1),(65,2),(66,1),(66,2),(73,1),(74,1),(75,1),(77,1),(77,2),(78,1),(78,2),(79,1),(79,2),(80,1),(82,1),(83,1),(83,2),(90,1),(90,2),(92,1),(93,1),(94,1),(97,1),(98,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(116,1),(118,1),(118,2),(119,1),(119,2);
/*!40000 ALTER TABLE `sys_roles_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门名称',
  `username` varchar(180) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(180) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bit(1) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `uniq_email` (`email`) USING BTREE,
  UNIQUE KEY `uniq_username` (`username`) USING BTREE,
  KEY `idx_dept_id` (`dept_id`) USING BTREE,
  KEY `idx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,2,'admin','管理员','男','18888888888','201507802@qq.com','avatar-20250114101539224.png','/Users/jie/Documents/work/me/admin/eladmin-mp/eladmin/~/avatar/avatar-20250114101539224.png','$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa',_binary '',_binary '',NULL,'admin','2020-05-03 16:38:31','2018-08-23 09:11:56','2020-09-05 10:43:31'),(2,2,'test','测试','男','19999999999','231@qq.com',NULL,NULL,'$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK',_binary '\0',_binary '','admin','admin',NULL,'2020-05-05 11:15:49','2020-09-05 10:43:38');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_users_jobs`
--

DROP TABLE IF EXISTS `sys_users_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_users_jobs` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `job_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`job_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users_jobs`
--

LOCK TABLES `sys_users_jobs` WRITE;
/*!40000 ALTER TABLE `sys_users_jobs` DISABLE KEYS */;
INSERT INTO `sys_users_jobs` VALUES (1,11),(2,12);
/*!40000 ALTER TABLE `sys_users_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_users_roles`
--

DROP TABLE IF EXISTS `sys_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_users_roles` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户角色关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users_roles`
--

LOCK TABLES `sys_users_roles` WRITE;
/*!40000 ALTER TABLE `sys_users_roles` DISABLE KEYS */;
INSERT INTO `sys_users_roles` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_alipay_config`
--

DROP TABLE IF EXISTS `tool_alipay_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_alipay_config` (
  `config_id` bigint NOT NULL COMMENT 'ID',
  `app_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `format` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '异步回调',
  `private_key` text COLLATE utf8mb4_general_ci COMMENT '私钥',
  `public_key` text COLLATE utf8mb4_general_ci COMMENT '公钥',
  `return_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='支付宝配置类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_alipay_config`
--

LOCK TABLES `tool_alipay_config` WRITE;
/*!40000 ALTER TABLE `tool_alipay_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_alipay_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_email_config`
--

DROP TABLE IF EXISTS `tool_email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_email_config` (
  `config_id` bigint NOT NULL COMMENT 'ID',
  `from_user` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `port` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '端口',
  `user` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='邮箱配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_email_config`
--

LOCK TABLES `tool_email_config` WRITE;
/*!40000 ALTER TABLE `tool_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_local_storage`
--

DROP TABLE IF EXISTS `tool_local_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_local_storage` (
  `storage_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `real_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `size` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '大小',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='本地存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_local_storage`
--

LOCK TABLES `tool_local_storage` WRITE;
/*!40000 ALTER TABLE `tool_local_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_local_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_qiniu_config`
--

DROP TABLE IF EXISTS `tool_qiniu_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_qiniu_config` (
  `config_id` bigint NOT NULL COMMENT 'ID',
  `access_key` text COLLATE utf8mb4_general_ci COMMENT 'accessKey',
  `bucket` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '外链域名',
  `secret_key` text COLLATE utf8mb4_general_ci COMMENT 'secretKey',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='七牛云配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_qiniu_config`
--

LOCK TABLES `tool_qiniu_config` WRITE;
/*!40000 ALTER TABLE `tool_qiniu_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_qiniu_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_qiniu_content`
--

DROP TABLE IF EXISTS `tool_qiniu_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_qiniu_content` (
  `content_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(180) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件类型：私有或公开',
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件后缀',
  `update_time` datetime DEFAULT NULL COMMENT '上传或同步的时间',
  PRIMARY KEY (`content_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='七牛云文件存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_qiniu_content`
--

LOCK TABLES `tool_qiniu_content` WRITE;
/*!40000 ALTER TABLE `tool_qiniu_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_qiniu_content` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-06  1:24:24
