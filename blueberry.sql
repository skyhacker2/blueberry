CREATE DATABASE  IF NOT EXISTS `question` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `question`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: question
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answerquestion`
--

DROP TABLE IF EXISTS `answerquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answerquestion` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试题id',
  `chapter_id` int(11) NOT NULL COMMENT '所属章节',
  `topic` text NOT NULL COMMENT '题目',
  `answer` text NOT NULL COMMENT '答案',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_id_UNIQUE` (`question_id`),
  KEY `chapter_id5_idx` (`chapter_id`),
  CONSTRAINT `chapter_id5` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='解答题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answerquestion`
--

LOCK TABLES `answerquestion` WRITE;
/*!40000 ALTER TABLE `answerquestion` DISABLE KEYS */;
INSERT INTO `answerquestion` VALUES (1,1,'试述数据、数据库、数据库系统、数据库管理系统的概念。','　　数据： ','2014-03-19 16:03:41'),(2,1,'举出适合用文件系统而不是数据库系统的例子；再举出适合用数据库系统的应用例子。','•适用于文件系统而不是数据库系统的应用例子 ','2014-03-19 16:03:41'),(3,1,'试述数据库系统的特点。','　　数据库系统的主要特点有： ','2014-03-19 16:03:41'),(4,1,'数据库管理系统的主要功能有哪些？','　　①数据库定义功能； ','2014-03-19 16:03:42'),(5,1,'试述数据模型的概念、数据模型的作用和数据模型的三个要素。','　　数据模型是数据库中用来对现实世界进行抽象的工具，是数据库中用于提供信息表示和操作手段的形式构架。 ','2014-03-19 16:03:42'),(6,1,'试述概念模型的作用。','　　概念模型实际上是现实世界到机器世界的一个中间层次。概念模型用于信息世界的建模，是现实世界到信息世界的第一层抽象，是数据库设计人员进行数据库设计的有力工具，也是数据库设计人员和用户之间进行交流的语言。 ','2014-03-19 16:03:42'),(7,1,'定义并解释概念模型中以下术语： ','　　实体：客观存在并可以相互区分的事物叫实体。 ','2014-03-19 16:03:42'),(8,2,'试述网状、层次数据库的优缺点。','层次模型的优点主要有：①模型简单，对具有一对多的层次关系的部门描述非常自然、直观，容易理解，这是层次数据库的突出优点；②用层次模型的应用系统性能好，特别是对于那些实体间联系是固定的预先定义好的应用，采用层次模型来实现，其性能优于关系模型；③次数据模型提供了良好的完整性支持。 ','2014-03-19 17:06:27'),(9,2,'试述层次模型的概念，举出三个层次模型的实例。','在数据结构中，定义满足下面两个条件的基本层次联系的集合为层次模型：①有且仅有一个结点没有双亲结点，这个结点称为根结点。②除跟结点之外的其他结点有且只有一个双亲结点。模型实例如图所示。','2014-03-19 17:06:27'),(10,2,'试述网状模型的概念，举出三个网状模型的实例。','满足以下两个条件的基本层次联系的集合称为网状模型：①有一个以上的结点没有双亲。②结点可以有多于一个的双亲。模型实例如图所示。','2014-03-19 17:06:27'),(11,2,'试述关系数据库的特点。','关系数据模型具有下列优点：①关系模型与非关系模型不同，它是建立在严格的数学概念的基础上的。②关系模型的概念单一。无论实体还是实体之间的联系都用关系表示。操作的对象和操作的结果都是关系。所以其数据结构简单、清晰，用户易懂易用。③关系模型的存取路径对用户透明，从而具有更高的数据独立性、更好的安全保密性，也简化了程序员的工作和数据库开发建立的工作。 ','2014-03-19 17:06:27'),(12,2,'试述关系模型的三个组成部分。','关系模型由关系数据结构、关系操作集合和关系完整性约束三部分组成。','2014-03-19 17:06:27');
/*!40000 ALTER TABLE `answerquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter` (
  `chapter_id` int(11) NOT NULL COMMENT '章id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  PRIMARY KEY (`chapter_id`),
  UNIQUE KEY `chapter_id_UNIQUE` (`chapter_id`),
  UNIQUE KEY `chapter_name_UNIQUE` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` VALUES (16,'XML数据库'),(2,'关系数据库'),(3,'关系数据库标准语言SQL'),(6,'关系数据理论'),(9,'关系查询处理和查询优化'),(14,'分布式数据库系统'),(15,'对象关系数据库系统'),(11,'并发控制'),(17,'数据仓库与联机分析处理'),(4,'数据库安全性'),(5,'数据库完整性'),(10,'数据库恢复技术'),(13,'数据库技术新发展'),(12,'数据库管理系统'),(8,'数据库编程'),(7,'数据库设计'),(1,'绪论');
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fill`
--

DROP TABLE IF EXISTS `fill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fill` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试题id',
  `chapter_id` int(11) NOT NULL COMMENT '所属章节',
  `topic` text NOT NULL COMMENT '题目',
  `fillCount` int(11) NOT NULL COMMENT '填空的个数',
  `answer` varchar(255) NOT NULL COMMENT '答案',
  `answer_explain` varchar(255) DEFAULT NULL COMMENT '答案说明',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`question_id`),
  KEY `chapter_id4_idx` (`chapter_id`),
  CONSTRAINT `chapter_id4` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='填空题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fill`
--

LOCK TABLES `fill` WRITE;
/*!40000 ALTER TABLE `fill` DISABLE KEYS */;
INSERT INTO `fill` VALUES (11,1,'数据库管理技术的发展是与计算机技术及其应用的发展联系在一起的，它经历了三个阶段：_阶段，_阶段和_阶段。',3,'人工管理、文件系统、 数据库系统',NULL,'2014-03-19 16:31:30'),(12,1,'数据库系统是指在计算机系统中引入数据库后的系统，一般由_、_、_和_构成。',4,'数据库、数据库管理系统（及其开发工具）、应用系统、数据库管理员',NULL,'2014-03-19 16:31:30'),(13,1,'数据库的三级体系结构是_、_和_。',3,'用户数据逻辑结构、数据的物理存储结构、整体逻辑结构',NULL,'2014-03-19 16:31:30'),(14,1,'模式（Schema）是数据库中全体数据的_和_的描述，它仅仅涉及到_的描述，不涉及到具体的值。',3,'逻辑结构、特征、型',NULL,'2014-03-19 16:31:30'),(15,1,'三级模式之间的两层映象保证了数据库系统中的数据能够具有较高的_和_。',2,'逻辑独立性、物理独立性',NULL,'2014-03-19 16:31:30'),(16,1,'定义用户数据库的语言称为_。',1,'DDL',NULL,'2014-03-19 16:31:30'),(17,1,'在数据库系统中，用户对数据的操作只能通过_语言进行。',1,'DML',NULL,'2014-03-19 16:31:30'),(18,1,'数据库数据具有_、_和_三个基本特点。',3,'永久存储、有组织、可共享',NULL,'2014-03-19 16:31:30'),(19,1,'数据库管理系统是数据库系统的一个重要组成部分，它的功能包括_、_、_、_。',4,'数据定义功能、数据操纵功能、数据库的运行管理、数据库的建立和维护功能',NULL,'2014-03-19 16:31:30'),(20,1,'数据库具有数据结构化、最小的_、较高的_等特点。',2,'冗余度、数据独立性',NULL,'2014-03-19 16:31:30'),(21,1,'DBMS还必须提供_保护、_检查、_、_等数据控制功能。',4,'数据的安全性、数据的完整性、并发控制、数据库恢复',NULL,'2014-03-19 16:31:30'),(22,1,'根据模型应用的不同目的，可以将这些模型划分为两类，它们分别属于两个不同的层次。',2,'概念模型、数据模型',NULL,'2014-03-19 16:31:30'),(23,1,'唯一标识实体的属性集称为_。',1,'关键字',NULL,'2014-03-19 16:31:30'),(24,1,'实体之间的联系有_、_、_三种。',3,'一对一、一对多、多对多',NULL,'2014-03-19 16:31:30'),(25,2,'数据模型的三要素是指_，_，_。实际数据库系统中所支持的主要数据模型是_，_，_。',6,'数据结构、数据操作、完整性约束、关系模型、层次模型、网状模型',NULL,'2014-03-19 17:00:52'),(26,2,'数据模型中的_是对数据系统的静态特征描述，包括数据结构和数据间联系的描述，_是对数据库系统的动态特征描述，是一组定义在数据上的操作，包括操作的涵义、操作符、运算规则及其语言等。',2,'数据结构、数据操作',NULL,'2014-03-19 17:00:52'),(27,2,'用树型结构表示实体类型及实体间联系的数据模型称为_模型，上一层的父结点和下一层的子结点之间的联系是_的联系。',2,'层次、一对多',NULL,'2014-03-19 17:00:52'),(28,2,'用有向图结构表示实体类型及实体间联系的数据模型称为_模型，数据之间的联系通常通过_实现。',2,'网状、指针',NULL,'2014-03-19 17:00:52'),(29,2,'层次模型的上层实体和下层实体之间表现为_联系。',1,'1：n',NULL,'2014-03-19 17:00:52'),(30,2,'_是目前最常用也是最重要的一种数据模型。采用该模型作为数据的组织方式的数据库系统称为_。',2,'关系模型、关系数据库系统',NULL,'2014-03-19 17:00:52'),(31,2,'关系的完整性约束条件包括三大类：_、_和_。',3,'实体完整性、参照完整性、用户定义的完整性',NULL,'2014-03-19 17:00:52'),(32,2,'关系操作的特点是_操作。',1,'集合',NULL,'2014-03-19 17:00:52'),(33,2,'关系数据模型中，二维表的列称为_，二维表的行称为_。',2,'属性、记录或元组',NULL,'2014-03-19 17:00:52'),(34,2,'关系代数运算中，传统的集合运算有_，_，_，_。',4,'笛卡尔积、并、交、差',NULL,'2014-03-19 17:00:52'),(35,3,'SQL是_。',1,'结构化查询语言',NULL,'2014-03-20 05:52:52'),(36,4,'保护数据安全性的一般方法是_和_。',2,'设置用户标识、存取权限控制',NULL,'2014-03-20 05:52:52'),(37,5,'实体完整性是指在基本表中，主属性_。',1,'主属性不能取空值',NULL,'2014-03-20 05:52:52'),(38,6,'在关系A(S，SN，D)和B(D，CN，NM中，A的主键是S，B的主键是D，则D在S中称为_。',1,'外部键',NULL,'2014-03-20 05:52:52'),(39,7,'数据库设计的几个步骤是_、_、_、_、_、_。',6,'需求分析、概念设计、逻辑设计、物理设计、系统实施、系统运行和维护',NULL,'2014-03-20 05:52:52'),(40,10,'_是DBMS的基本单位，它是用户定义的一组逻辑一致的程序序列。',1,'事务',NULL,'2014-03-20 05:52:52'),(41,11,'DBMS的基本工作单位是事务，它是用户定义的一组逻辑一致的程序序列；并发控制的主要方法是_机制。',1,'封锁',NULL,'2014-03-20 05:52:52');
/*!40000 ALTER TABLE `fill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `judge`
--

DROP TABLE IF EXISTS `judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `judge` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) NOT NULL COMMENT '所属章节',
  `topic` text NOT NULL COMMENT '题目',
  `answer` tinyint(1) NOT NULL,
  `answer_explain` varchar(255) DEFAULT NULL COMMENT '答案说明',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`question_id`),
  KEY `chapter_id_idx` (`chapter_id`),
  CONSTRAINT `chapter_id3` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='判断题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `judge`
--

LOCK TABLES `judge` WRITE;
/*!40000 ALTER TABLE `judge` DISABLE KEYS */;
INSERT INTO `judge` VALUES (1,1,'实体是指现实世界客观存在的事物，概念性的事物不能叫做实体。',0,NULL,'2014-03-19 16:08:07'),(2,1,'事物之间往往存在某种自然联系，这种联系不能叫实体。',0,NULL,'2014-03-19 16:10:40'),(3,1,'属性是指实体具有的某种特性或若干方面的特性。',1,NULL,'2014-03-19 16:10:41'),(4,1,'实体型是指实体属性的集合，表示实体所固有的若特征。',1,NULL,'2014-03-19 16:10:41'),(5,1,'实体型中各属性的具体取值称为实体值。',1,NULL,'2014-03-19 16:10:41'),(6,1,'属性取值的变化范围称为该属性的域。',1,NULL,'2014-03-19 16:10:41'),(7,1,'关系模型就是关系数据库。',0,NULL,'2014-03-19 16:10:41'),(8,1,'数据是信息的符号表示形式，两者之间相互联系，没有任何区别。',0,NULL,'2014-03-19 16:10:41'),(9,1,'在数据处理过程中对已知数据进行加工，获得新的数据，这些新的数据又为人们提供了新的信息，作为管理决策的依据。',1,NULL,'2014-03-19 16:10:41'),(10,2,'用二维表结构表示实体型，外键实现实体之间联系的模型称为关系模型。',1,NULL,'2014-03-19 17:03:20'),(11,2,'关系模型不能表示实体之间多对多联系。',0,NULL,'2014-03-19 17:03:20'),(12,2,'任何一张二维表格都表示一个关系。',0,NULL,'2014-03-19 17:03:20'),(13,2,'关系是元组的集合。',1,NULL,'2014-03-19 17:03:20'),(14,2,'E-R图是一种描述实体世界的数据模型。',0,NULL,'2014-03-20 02:32:13'),(15,2,'数据库的三级模式结构保证了数据的独立性。',1,NULL,'2014-03-20 02:32:13'),(16,2,'等值连接就是自然连接。',0,NULL,'2014-03-20 02:32:13'),(17,2,'关系代数与关系演算是等价的。',1,NULL,'2014-03-20 02:32:13'),(18,6,'若关系模式 AB∈2NF，则 AB∈3NF。',0,NULL,'2014-03-20 06:05:45'),(19,6,'在一个关系模式中，有可能没有非主属性。',1,NULL,'2014-03-20 06:05:45'),(20,7,'数据库开发的需求分析阶段必须要有用户参与。',1,NULL,'2014-03-20 06:05:45');
/*!40000 ALTER TABLE `judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiple`
--

DROP TABLE IF EXISTS `multiple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multiple` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试题id',
  `chapter_id` int(11) NOT NULL COMMENT '所属章节',
  `topic` text NOT NULL COMMENT '题目',
  `optionA` varchar(255) NOT NULL COMMENT '选项A',
  `optionB` varchar(255) NOT NULL COMMENT '选项B',
  `optionC` varchar(255) NOT NULL COMMENT '选项C',
  `optionD` varchar(255) NOT NULL COMMENT '选项D',
  `answer` varchar(45) NOT NULL COMMENT '答案',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`question_id`),
  KEY `chapter_id_idx` (`chapter_id`),
  CONSTRAINT `chapter_id2` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='多选题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiple`
--

LOCK TABLES `multiple` WRITE;
/*!40000 ALTER TABLE `multiple` DISABLE KEYS */;
INSERT INTO `multiple` VALUES (1,1,'E-R图用来描述现实世界的概念模型，基本要素包括（）。','实体型','属性','联系','元祖','A-B-C','2014-03-20 01:30:13'),(2,1,'数据模型的组成要素包括（）。','数据结构','数据操作','试题','完整性约束','A-B-D','2014-03-20 01:30:14'),(3,1,'与人工管理和文件系统相比，数据库系统的特点主要体现在以下哪些方面（）。','数据结构化','数据的共享性高，冗余度低，易扩充','数据独立性高','数据有DBMS统一管理和控制','A-B-C-D','2014-03-20 01:30:14'),(4,1,'数据库管理系统的主要功能有（）。','数据库定义功能','数据存取功能','数据库运行管理','数据库的建立和维护功能','A-B-C-D','2014-03-20 01:30:14'),(5,1,'使用数据库系统的好处体现在（）。','提高应用开发的效率','方便用户的使用，减轻数据库系统管理人员维护的负担','便于数据的集中管理，控制数据冗余，提高数据的利用率和一致性','有利于应用程序的开发和维护','A-B-C-D','2014-03-20 01:30:14'),(6,2,'关系模型的三类完整性约束是指（）。','实体完整性','参照完整性','用户定义的完整性','记录完整性','A-B-C','2014-03-20 01:30:14'),(7,2,'关系模型中常用的关系操作包括（）。','查询','插入','删除','修改','A-B-C-D','2014-03-20 01:30:14'),(8,1,'数据管理技术经历了哪些阶段？（）','人工管理','文件系统','网状系统','数据库系统','A-B-D','2014-03-20 01:30:14'),(9,2,'下面哪些是对关系性质的正确描述。（）','列是同质的','行是同质的','元组不重复','分量不可分','A-C-D','2014-03-20 02:24:27'),(10,2,'下面哪些是专门的关系运算。（）','自然连接','半连接','笛卡尔积','除法','A-B-D','2014-03-20 02:24:27'),(11,2,'下面哪些语言是关系演算语言。（）','ALPHAB','QUEL','SQL','QBE','A-B-D','2014-03-20 02:24:27'),(12,2,'下面哪些集合函数是ALPHA的所定义的函数。（）','CNT','SUM','MIND','AVG','C-D','2014-03-20 02:24:27'),(13,2,'哪些数据操纵是QUEL可以完成的。（）','多表检索','排序','除法','修改','A-B-C-D','2014-03-20 02:36:24'),(14,2,'下面哪几项是属于实体完整性检查。（）','检查主码值是否唯一，如果不唯一则拒绝插入或修改','检查主码的各个属性是否为空，只要有一个为空就拒绝插入或修改','检查外码值是否为空','属性上的约束条件检查','A-B','2014-03-20 02:44:09'),(15,5,'数据库的完整性是指数据的（）。','正确性','合法性','不被非法存取','相容性','A-D','2014-03-20 02:44:09'),(16,2,'对于关系模式S（Sno，Sname，Age，Dept）；C（Cno，Cname，Teacher）；\r SC（Sno，Cno，Score）。下列查询结果相同的是（）。','πSname((S)\n▷◁σScore>60(SC)) ','π\r Sname(σScore>60(S\r▷◁SC)) ','σScore>60 (πSname (S▷◁SC)) ','σScore>60 (π\nSname (S)\n▷◁(SC))','A-B','2014-03-20 03:16:47'),(17,2,'某查询语句中有“%田_”语句，则可能的查询结果有（）。','张田','陈力田','田华','刘田耕','C-D','2014-03-20 03:16:47'),(18,3,'对于下列语句TeacherNO INT NOT NULL UNIQUE，正确的描述是（）。','TeacherNO是主码','TeacherNO不能为空','TeacherNO的值可以是“王大力”','每一个TeacherNO必须是唯一的','B-D','2014-03-20 03:16:47'),(19,6,'下面哪几个依赖是平凡函数依赖（）。','(Sno,Cname,Grade) →(Cname,Grade) ','(Sno,Cname) →(Cname,Grade)','(Sno,Cname) →(Sname,Grade)','(Sno,Sname) →Sname ','A-D','2014-03-20 03:16:47'),(20,7,'下面关于数据库模式设计的说法中正确的有（）。','在模式设计的时候，有时候为了保证性能，不得不牺牲规范化的要求','有的情况下，把常用属性和很少使用的属性分成两个关系，可以提高查询的速度','连接运算开销很大，在数据量相似的情况下，参与连接的关系越多开销越大','减小关系的大小可以将关系水平划分，也可以垂直划分','A-B-C-D','2014-03-20 03:16:47'),(21,6,'下面的结论正确的是（）。','任何一个二目关系是属于3NF的。','任何一个二目关系是属于BCNF的。','任何一个二目关系是属于4NF的。','当且仅当函数依赖A→B在R上成立,关系R(A,B,C)等于其投影R1(A,B)和R2(A,C)的连接。','A-B-C','2014-03-20 03:31:32'),(22,6,'下面的结论正确的是（）。','若R.A→R.B, R.B→R.C 则R.A→R.C','若R.A→R.B, R.A→R.C 则R.A→R.(B,C)','若R.B→R.A, R.C→R.A 则R.(B,C)→R.A','若R.(B，C)→R.A 则R.B→R.A， R.C→R.A','A-B-C','2014-03-20 03:31:33'),(23,10,'事务的ACID特性（）。','原子性（Atomicity）','一致性（Consistency）','隔离性（Isolation）','持续性（Durability）','A-B-C-D','2014-03-20 03:31:33'),(24,11,'并发操作带来的数据不一致性包括（）。','丢失修改','不可重复读','读”脏“数据','封锁机制','A-B-C','2014-03-20 03:31:33'),(25,11,'预防死锁的方法包括（）。','一次封锁法','顺序封锁法','事物等待图法','超时法','A-B','2014-03-20 03:31:33'),(26,11,'死锁的诊断方法有（）。','超时法','事务等待图法','一次封锁法','顺利封锁法','A-B','2014-03-20 03:31:33'),(27,10,'关于事务的描述正确的是（）。','事务可以看作是作业或任务，它是完成用户一个特定工作的一组命令 ，是构成 单一逻辑工作单元的。','事务(transaction) 是数据库应用的基本性质之一，是管理数据库运作的一个逻辑单位。','多个用户的应用要同时正确运行，需要用事务来控制并发控制 。','为了保证不丢失数据，也需要事务来进行恢复控制。','A-B-C-D','2014-03-20 03:31:33'),(28,3,'在SELECT语句中，需要对分组情况应满足的条件进行判断时，应使用\r（）。','WHERE','GROUP','ORDER BY','HAVING','B-D','2014-03-20 04:05:02'),(29,3,'对于下列语句，正确的描述是（）。   ATLER TABLE Product \r   Add Year DATETIME DEFAULT ‘1985-01-01’ ','向Product表中增加一个名为“DATETIME”的属性','该属性有一个默认的值是“1985-01-01”','该属性的数据类型是日期时间型 ','该属性可以被指定为码','B-C','2014-03-20 04:05:02'),(30,3,'现有学生关系Student，属性包括学号（Sno），姓名（Sname），所在系（Sdept），\r 系主任姓名（Mname），课程名（Cname）和成绩（Grade）。这些属性之间存在如下联系：一个学号只对应一个学生，一个学生只对应一个系，一个系只对应一个系主任；一个学生的一门课只对应一个成绩；学生名可以重复；系名不重复；课程名不重复。则以下不正确的函数依赖是（）。','Sno→Sdept','Sno→Mname','Sname→Sdept','（Sname，Cname）→Grade','C-D','2014-03-20 04:05:02'),(31,6,'已知关系R具有属性A，B，C，D，E，F。假设该关系有如下函数依赖AB→C，\nBC→AD，D→E，CF→B，则下列依赖蕴含于给定的这些函数依赖的有（）。','AB→C','AB→D','AB→E','AB→F','A-B-C','2014-03-20 04:05:02'),(32,7,'下面关于数据库设计的说法中正确的有（）。','信息需求表示一个组织所需要的数据及其结构','处理需求表示一个组织所需要经常进行的数据处理','信息需求表达了对数据库内容及结构的要求， 是动态需求','处理需求表达了基于数据库的数据处理要求，是静态需求','A-B','2014-03-20 04:05:02'),(33,4,'保护数据安全性的一般方法是：（）。','设置用户标识','存取权限控制','建立机房管理制度','建立完整性约束','A-B','2014-03-20 04:20:15'),(34,4,'安全性控制的一般方法有：（）。','用户标识鉴定','存取控制','审计','数据加密','A-B-C-D','2014-03-20 04:20:15'),(35,5,'数据库的完整性是指数据的（）。','实体完整性','参照完整性','用户定义完整性','安全完整性','A-B-C','2014-03-20 04:20:15'),(36,5,'数据库的完整性是指（）。','数据库的正确性','数据库的安全性','数据库的相容性','数据库的加密性','A-C','2014-03-20 04:20:15'),(37,7,'在设计分E-R图时，由于各个子系统分别有不同的应用，而且往往是由不同的设计人员设计的，所以各个分E-R图之间难免有不一致的地方，这些冲突主要有（）。','属性冲突','命名冲突','结构冲突','语义冲突','A-B-C','2014-03-20 04:20:15'),(38,7,'数据字典包括：（）。','数据项','数据结构','数据流','数据存储和数据加工过程','A-B-C-D','2014-03-20 04:20:15');
/*!40000 ALTER TABLE `multiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_style`
--

DROP TABLE IF EXISTS `question_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_style` (
  `style_name` varchar(45) NOT NULL COMMENT '试题类型',
  `score` int(11) NOT NULL COMMENT '分值',
  PRIMARY KEY (`style_name`),
  UNIQUE KEY `style_name_UNIQUE` (`style_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_style`
--

LOCK TABLES `question_style` WRITE;
/*!40000 ALTER TABLE `question_style` DISABLE KEYS */;
INSERT INTO `question_style` VALUES ('判断题',2),('单选题',2),('填空题',2),('多选题',2),('解答题',10);
/*!40000 ALTER TABLE `question_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single`
--

DROP TABLE IF EXISTS `single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试题id',
  `chapter_id` int(11) NOT NULL COMMENT '所属章节',
  `topic` text NOT NULL COMMENT '题目',
  `optionA` varchar(255) NOT NULL COMMENT '选项A',
  `optionB` varchar(255) NOT NULL COMMENT '选项B',
  `optionC` varchar(255) NOT NULL COMMENT '选项C',
  `optionD` varchar(255) NOT NULL COMMENT '选项D',
  `answer` varchar(45) NOT NULL COMMENT '答案',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`question_id`),
  KEY `chapter_id_idx` (`chapter_id`),
  CONSTRAINT `chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`chapter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='单选题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single`
--

LOCK TABLES `single` WRITE;
/*!40000 ALTER TABLE `single` DISABLE KEYS */;
INSERT INTO `single` VALUES (2,1,'DBS是采用了数据库技术的计算机系统，DBS是一个集合体，包含数据库、计算机硬件、软件和（）。','系统分析员','程序员','数据库管理员','操作员','C','2014-03-19 15:36:02'),(3,1,'数据库（DB），数据库系统（DBS）和数据库管理系统（DBMS）之间的关系是（）。',' DBS包括DB和DBMS','DBMS包括DB和DBS','DB包括DBS和DBMS',' DBS就是DB，也就是DBMS','A','2014-03-19 15:55:54'),(4,1,'下面列出的数据库管理技术发展的三个阶段中，没有专门的软件对数据进行管理的是（）。 ',' I 和 II','只有 II',' II 和 III','只有 I','D','2014-03-19 15:55:54'),(5,1,'下列四项中，不属于数据库系统特点的是（）。','数据共享','数据完整性','数据冗余度高','数据独立性高','C','2014-03-19 15:55:54'),(6,1,'数据库系统的数据独立性体现在（）。','不会因为数据的变化而影响到应用程序','不会因为系统数据存储结构与数据逻辑结构的变化而影响应用程序','不会因为存储策略的变化而影响存储结构','不会因为某些存储结构的变化而影响其他的存储结构','B','2014-03-19 15:55:54'),(7,1,'描述数据库全体数据的全局逻辑结构和特性的是（）。','模式','内模式','外模式','用户模式','A','2014-03-19 15:55:54'),(8,1,'要保证数据库的数据独立性，需要修改的是（）。','模式与外模式','模式与内模式','三层之间的两种映射','三层模式','C','2014-03-19 15:55:54'),(9,1,'要保证数据库的逻辑数据独立性，需要修改的是（）。','模式与外模式的映射','模式与内模式之间的映射','模式','三层模式','A','2014-03-19 15:55:54'),(10,1,'用户或应用程序看到的那部分局部逻辑结构和特征的描述是（），它是模式的逻辑子集。','模式','物理模式','子模式','内模式','C','2014-03-19 15:55:54'),(11,1,'下述（）不是DBA数据库管理员的职责。','完整性约束说明','定义数据库模式','数据库安全','数据库管理系统设计','D','2014-03-19 15:55:54'),(12,2,'常见的数据模型是（）。','层次模型、网状模型、关系模型','概念模型、实体模型、关系模型','对象模型、外部模型、内部模型','逻辑模型、概念模型、关系模型','A','2014-03-19 16:48:07'),(13,2,'一个结点可以有多个双亲，结点之间可以有多种联系的模型是（）。','网状模型','关系模型','层次模型','以上都有','A','2014-03-19 16:48:07'),(14,2,'层次型、网状型和关系型数据库划分原则是（）。','记录长度','文件大小','联系的复杂程度','数据之间的联系','D','2014-03-19 16:48:07'),(15,2,'层次模型不能直接表示（）。','1：1关系','1：m关系','m：n关系','1：1和1：m关系','C','2014-03-19 16:48:07'),(16,2,'层次数据模型的基本数据结构是（）。','树','图','索引','关系','A','2014-03-19 16:48:07'),(17,2,'层次模型实现数据之间联系的方法是（）。','连接','指针','公共属性','关系','B','2014-03-19 16:48:07'),(18,2,'用二维表结构表示实体以及实体间联系的数据模型称为（）。','网状模型','层次模型','关系模型','面向对象模型','C','2014-03-19 16:48:07'),(19,2,'关系数据模型的基本数据结构是（）。','树','图','索引','关系','D','2014-03-19 16:48:07'),(20,2,'下面关于关系性质的说法，错误的是（）。','表中的一行称为一个元组','行与列交叉点不允许有多个值 ','表中的一列称为一个属性','表中任意两行可能相同','D','2014-03-19 16:48:07'),(21,2,'下列所述数据模型概念，不正确的是（）。','不同记录型的集合','各种记录型及其联系的集合','E-R图表示的实体联系模型','数据库的概念模型','A','2014-03-19 16:48:07'),(22,3,'SQL语言是（）的语言，易学习。','过程化','非过程化','格式化','导航式','B','2014-03-20 05:52:43'),(23,4,'保护数据库，防止未经授权的或不合法的使用造成的数据泄漏、更改破坏。这是指数据的（）。','安全性','完整性','并发控制','恢复','A','2014-03-20 05:52:43'),(24,5,'在数据库系统中，保证数据及语义正确和有效的功能是（）。','并发控制','存取控制','安全控制','完整性控制','D','2014-03-20 05:52:43'),(25,6,'设计性能较优的关系模式称为规范化，规范化主要的理论依据是（）。','关系规范化理论','关系运算理论','关系代数理论','数理逻辑','A','2014-03-20 05:52:43'),(26,7,'在数据库设计中，用E-R图来描述信息结构但不涉及信息在计算机中的表示，它是数据库设计的_段。','需求分析','概念设计','逻辑设计','物理设计','B','2014-03-20 05:52:43'),(27,10,'（）是DBMS的基本单位，它是用户定义的一组逻辑一致的程序序列。','程序','命令','事务','文件','C','2014-03-20 05:52:43'),(28,11,'解决并发操作带来的数据不一致性总是普遍采用（）。','封锁','恢复','存取控制','协商','A','2014-03-20 05:52:43');
/*!40000 ALTER TABLE `single` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` varchar(45) NOT NULL COMMENT '学生号',
  `student_name` varchar(45) NOT NULL COMMENT '姓名',
  `password` varchar(45) NOT NULL COMMENT '密码',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('ap1006403','陈洪晶','123456'),('ap1006431','谭苑霞','123456');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacher_id` varchar(45) NOT NULL COMMENT '教师号',
  `teacher_name` varchar(45) NOT NULL COMMENT '姓名',
  `password` varchar(45) NOT NULL COMMENT '密码',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('1001','何国辉','123456');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-04 13:16:49
CREATE DATABASE  IF NOT EXISTS `blueberry` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blueberry`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: blueberry
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `pager_id` varchar(45) DEFAULT NULL,
  `pager_title` varchar(45) DEFAULT NULL,
  `exam_grade` int(11) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  `student_id` varchar(45) DEFAULT NULL,
  `pager_grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'2','试卷一',1,'2014-05-02 21:39:24','ap1006403',50),(2,'2','试卷一',0,'2014-05-03 18:44:14','ap1006403',50);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(45) DEFAULT NULL,
  `msg_title` varchar(45) DEFAULT NULL,
  `msg_body` varchar(500) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'2014-04-27 17:04:36','通知一','请同学们参加考试一','何国辉'),(4,'2014-04-27 23:23:40','通知二','test&test','何国辉'),(5,'2014-05-04 13:09:36','考试2','test test','何国辉');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pager`
--

DROP TABLE IF EXISTS `pager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pager` (
  `pager_id` int(11) NOT NULL AUTO_INCREMENT,
  `singles` varchar(45) DEFAULT NULL,
  `multiples` varchar(45) DEFAULT NULL,
  `judges` varchar(45) DEFAULT NULL,
  `fills` varchar(45) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  `single_grade` int(11) DEFAULT NULL,
  `multiple_grade` int(11) DEFAULT NULL,
  `judge_grade` int(11) DEFAULT NULL,
  `fill_grade` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`pager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pager`
--

LOCK TABLES `pager` WRITE;
/*!40000 ALTER TABLE `pager` DISABLE KEYS */;
INSERT INTO `pager` VALUES (2,'8-2-9-6-5','2-4-8-3-5','5-9-6-2-3','24-14-16-15-13',1,'试卷一','2014-04-27 22:14:55',1,3,1,5,50),(3,'17-15-18-13-21','6-10-14-11-17','10-17-14-15-16','34-31-33-27-28',2,'关系数据库考试','2014-04-27 23:09:28',11,3,1,5,100),(4,'8-11-5-3-4','2-5-3-4-8','5-9-3-4-7','14-22-23-19-20',1,'111','2014-04-27 23:24:25',1,3,1,5,50),(5,'21-15-17-14-18','10-11-13-12-7','11-10-12-17-16','26-34-27-32-30',2,'试卷3','2014-04-29 21:46:42',1,3,1,5,50);
/*!40000 ALTER TABLE `pager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` varchar(20) NOT NULL,
  `test_num` int(11) DEFAULT NULL,
  `exam_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-04 13:16:49
