/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50549
 Source Host           : localhost:3306
 Source Schema         : ssm_hos

 Target Server Type    : MySQL
 Target Server Version : 50549
 File Encoding         : 65001

 Date: 03/05/2020 17:10:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (3, 'admin', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `t_admin` VALUES (4, NULL, NULL);

-- ----------------------------
-- Table structure for t_content
-- ----------------------------
DROP TABLE IF EXISTS `t_content`;
CREATE TABLE `t_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL COMMENT '内容类目ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容标题',
  `sub_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `title_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容描述',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片绝对路径',
  `pic2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片2',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `created` datetime NULL DEFAULT NULL,
  `updated` datetime NULL DEFAULT NULL,
  `sort_order` int(11) NULL DEFAULT NULL COMMENT '排序规则',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `updated`(`updated`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_content
-- ----------------------------
INSERT INTO `t_content` VALUES (1, 5, 'ad1', '', '', '', 'http://localhost:8080/upload/c2e2af50-16a7-43ca-89b6-ad98a95fa7d0ad1.jpg', NULL, '', '2020-05-03 16:31:36', '2020-05-03 16:31:36', 0);
INSERT INTO `t_content` VALUES (2, 5, 'ad2', '', '', '', 'http://localhost:8080/upload/6ea56344-f869-470f-b7e0-6386550b4988ad2.jpg', NULL, '', '2020-05-03 16:31:55', '2020-05-03 16:31:55', 0);
INSERT INTO `t_content` VALUES (3, 9, 'new1', '发布来源：', '', '', 'http://localhost:8080/upload/bfc46378-9320-4a73-8985-1ec526be1310gg.png', NULL, '<p>测试新闻1</p>', '2020-05-03 16:33:13', '2020-05-03 16:33:13', 0);
INSERT INTO `t_content` VALUES (4, 9, 'new2', '发布来源：', '测试', '', 'http://localhost:8080/upload/f8f06b0d-b21c-4c2b-a2d8-e2928765eb66new2.png', NULL, '<p>测试新闻2</p>', '2020-05-03 16:33:39', '2020-05-03 16:33:39', 0);
INSERT INTO `t_content` VALUES (5, 9, 'new3', '发布来源：', '测试', '', 'http://localhost:8080/upload/a6249951-2b2c-41b7-b253-32c772f3fb30new3.jpg', NULL, '<p>测试新闻3</p>', '2020-05-03 16:33:45', '2020-05-03 16:34:12', 0);
INSERT INTO `t_content` VALUES (6, 10, 'news1', '发布来源：', '测试', '', 'http://localhost:8080/upload/6925b825-1179-47fd-a5c3-7425bdb2b4e2u5e93bf3f8d330.jpg', NULL, '<p>测试新闻列表1</p>', '2020-05-03 16:37:01', '2020-05-03 16:37:41', 0);
INSERT INTO `t_content` VALUES (7, 10, 'news2', '发布来源：', '测试', '', 'http://localhost:8080/upload/e0999a32-2561-41c4-b544-e0364d21331eu5e93c898541b9.jpg', NULL, '<p>测试新闻列表2</p>', '2020-05-03 16:37:26', '2020-05-03 16:37:50', 0);
INSERT INTO `t_content` VALUES (8, 10, 'news3', '发布来源：', '测试', '', 'http://localhost:8080/upload/00ac783d-999f-46f4-8c82-3874d471060fu5e965cf4a7a5f.jpg', NULL, '<p>测试新闻列表4</p>', '2020-05-03 16:38:21', '2020-05-03 16:38:21', 0);
INSERT INTO `t_content` VALUES (9, 12, '预约须知', '发布来源：本院', '测试', '', NULL, NULL, '<p>测试预约信息</p>', '2020-05-03 16:38:55', '2020-05-03 16:38:55', 1);
INSERT INTO `t_content` VALUES (10, 12, '五一假期通知', '发布来源：本院', '测试', '', NULL, NULL, '<p>五一放假三天</p>', '2020-05-03 16:39:30', '2020-05-03 16:39:30', 0);

-- ----------------------------
-- Table structure for t_content_category
-- ----------------------------
DROP TABLE IF EXISTS `t_content_category`;
CREATE TABLE `t_content_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) NULL DEFAULT 1 COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`pid`, `status`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_content_category
-- ----------------------------
INSERT INTO `t_content_category` VALUES (1, 0, 'xxx医院', 1, NULL, 1, '2020-05-03 16:24:26', '2020-05-03 16:24:31');
INSERT INTO `t_content_category` VALUES (2, 1, '广告', 1, NULL, 1, '2020-05-03 16:25:12', '2020-05-03 16:25:17');
INSERT INTO `t_content_category` VALUES (3, 1, '新闻', 1, 1, 1, '2020-05-03 16:26:05', '2020-05-03 16:26:05');
INSERT INTO `t_content_category` VALUES (4, 1, '医院信息', 1, 1, 1, '2020-05-03 16:26:40', '2020-05-03 16:26:40');
INSERT INTO `t_content_category` VALUES (5, 2, '轮播图', 1, 1, 0, '2020-05-03 16:26:59', '2020-05-03 16:26:59');
INSERT INTO `t_content_category` VALUES (9, 3, '新闻轮播', 1, 1, 0, '2020-05-03 16:28:08', '2020-05-03 16:28:08');
INSERT INTO `t_content_category` VALUES (10, 3, '新闻列表', 1, 1, 0, '2020-05-03 16:27:45', '2020-05-03 16:27:45');
INSERT INTO `t_content_category` VALUES (12, 4, '医院公告', 1, 1, 0, '2020-05-03 16:27:55', '2020-05-03 16:27:55');

-- ----------------------------
-- Table structure for t_credit
-- ----------------------------
DROP TABLE IF EXISTS `t_credit`;
CREATE TABLE `t_credit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `credit_score` int(11) NULL DEFAULT NULL COMMENT '信誉积分',
  `state` int(1) NOT NULL COMMENT '是否可以预约：1可以预约；0不可预约',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_credit`(`user_id`) USING BTREE,
  CONSTRAINT `user_credit` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_credit
-- ----------------------------
INSERT INTO `t_credit` VALUES (1, 1, 90, 1);
INSERT INTO `t_credit` VALUES (2, 2, 100, 1);

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名',
  `pid` int(11) NOT NULL COMMENT '父节点id',
  `from_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门上班时间',
  `to_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门下班时间',
  `is_parent` tinyint(1) NULL DEFAULT NULL COMMENT '是否为父节点',
  `dep_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '部门简介',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门照片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (1, 'xxx医院', 0, NULL, NULL, 1, NULL, NULL);
INSERT INTO `t_department` VALUES (2, '非手术科室', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `t_department` VALUES (3, '手术科室', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `t_department` VALUES (4, '诊断相关科室', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `t_department` VALUES (5, '内科学科', 2, '09:00', '17:00', 0, '<p>北京协和医院内科学系自1921年建院之初即成立。经过近百年的传承及发展，目前内科学系下属包括了心脏内科、呼吸内科、消化内科、肾脏内科、血液内科、风湿免疫内科、感染内科、普通内科、肿瘤内科、老年医学科、内分泌科、内科重症监护病房共12个科室，成为了全国各种内科疑难危重疾病的诊治中心。协和内科以其严格而规范的住院医师、总住院医师轮转培训以及三级医师查房制度而闻名，由此培养出了一批又一批的内科大家。历代协和人始终在以严谨求精的态度尽力为每一位住院患者解除病痛。</p>', 'http://localhost:8080/upload/c7b051b36aa94bdd8d69eafe028fb8b2fcb1f6298ebe4df3b6a9adfb3110daeakeshi.jpg');
INSERT INTO `t_department` VALUES (6, '外科学科', 3, '09:00', '17:00', 0, '<p>　北京协和医院外科学系成立于协和建校之初，历经90余年，涌现出包括黄家驷、吴英恺、曾宪九等在内的众多医学大家及多位中国现代外科学的领军人物，技术力量雄厚，专科优势突出。外科学系包括基本外科、骨科、泌尿外科、神经外科、胸外科、心外科、血管外科、肝脏外科、乳腺外科、整形美容外科、肠外肠内营养科、麻醉科和重病医学科等13个科室，在职职工总数889人，两院院士2名，教授62名、副教授80名、主治医师132名；总床位数712张，18个病房单元；国家级临床重点专科7个、博士点8个、硕士点8个、博士生导师33名、硕士生导师61名，是国家住院医师规范化培训专业基地。在近5年复旦大学医院管理研究所公布的&ldquo;中国最佳医院排行榜&rdquo;及2015年北京大学国家医疗数据中心首届学科评估排行榜中，普通外科、骨科、泌尿外科、神经外科、胸外科、心外科、整形美容外科、麻醉科等科室名列前茅。</p>', 'http://localhost:8080/upload/6e949abe33784d4a857bffc2965a53bc3435d785e3b1412588fd63d44a180354keshi1.jfif');
INSERT INTO `t_department` VALUES (7, '病理科', 4, '09:00', '17:00', 0, '<p>北京协和医院是一所全国大型综合性医院，是全国疑难重症诊治中心。已有80多年的历史。每天有全国各地8000多患者就诊。床位近2000张。北京协和医院病理科的前身是北京协和医学院（PUMC）病理系，是北京协和医学院建立最早的学系之一。尸检及外检工作在1916年已开始（现有档案资料证实）。八十多年来为我国及世界培养了大批人才，我国著名的病理学家，如胡正详、白希清、刘永、杨简、李铭新、王蘅文等，都出自协和，或曾在协和工作。为我国病理事业的发展作出了巨大贡献。</p>\r\n\r\n<p>　　目前，病理科全科共有工作人员48人，现有院士1名，主任医师4名，研究员1名，副主任医师5名，主治医师9名，住院医师8名，主管技师8名，技师8名及技士1名，其他工作人员3名。其中具有博士学位的有12名。我科陈杰教授现任中华医学会病理分会主任委员。卢朝辉任中华医学会病理分会青年委员会副主任委员。崔全才任北京市病理学分会委员。协和病理科于2003年批准为国家重点学科。2009年被卫生部指定为全国病理质量及评价指导中心。北京市病理学精品课程。北京市优秀教学团队。</p>\r\n\r\n<p>　　北京协和医院病理科多年来在医疗、教学、科研等方面做了大量工作。其中多个方面处于国内领先地位。自建院以来病理病例总数已超过80万例，近年来每年都以10-15%的速度增加，超过35000例/年。随着手术的增加及临床手术医生手术中对快速诊断的需要，术中冰冻明显增加，每年达4000多例。免疫组织化学染色是目前我科常规外检普遍应用的诊断及鉴别诊断技术，可以做上百种抗体的染色检查，每年免疫组化染色片40000余张，并且在持续增加。我们应用先进的细胞学技术开展了包括宫颈及非妇科脱落细胞检查，每年完成&nbsp;3万多例的检查。我科应用FISH，LOH等分子遗传学技术开展了乳腺癌肺癌、软组织肿瘤、内分泌肿瘤等的诊断及鉴别诊断。基因重排技术及EB病毒原位杂交技术的开展为淋巴瘤诊断及鉴别诊断提供更可靠的证据。由于北京协和医院是一所大型综合性医院及全国疑难重症诊治中心，除少数常见病外，每年有很多疑难病理会诊。会诊总数已达55000多例。并且以每年7000多例速度在增加。为全国许多患者明确了诊断，并得到及时的治疗。我科始终坚持以医疗质量为中心，为临床医生及患者提供满意的服务，指导临床医生对患者疾病的判断、治疗及预后。常规病理门诊小标本规定3-4个工作日，大标本5-7天发报告，对特殊及疑难诊断病例发延迟报告通知书，及时通知临床医生。近年来，由于种种原因，尸检率明显下降，造成临床病理讨论的材料明显减少，直接影响了整体医疗水平的提高，有关问题有待立法解决。</p>\r\n\r\n<p>　　刘彤华院士是全国著名病理学家，是卫生部有突出贡献的专家、医院及医科院名医，全国优秀教师（国家教委）。文革之后，在她的领导下，病理科在人胰腺癌的生长因子、癌基因表达及突变等分子病理学研究等方面，在全国处于领先地位。同时在消化、内分泌、呼吸、妇科肿瘤、神经系统疾病及肿瘤等领域做了大量研究工作。病理科的研究工作曾多次获得医科院、卫生部及国家级科技进步奖。尤其是有关胰腺癌的研究工作曾于1985、1993年两次获得卫生部科技进步二等奖，1995年获国家科技进步二等奖。臧旭教授参加的垂体瘤的研究工作于1992年获国家科技进步一等奖。全科近年来发表500余篇高水平科研论文，近三年发表74篇。其中SCI&nbsp;6篇，获得多项科研基金的资助，包括科技部、自然科学基金，博士点基金，卫生部基金等。近三年共获得937万的资助。GSK是全世界著名的制药公司，刘彤院士领导的分子遗传实验室，已被GSK作为全世界三个中心实验室之一（三个中心实验室包括Mayo&nbsp;Clinic，欧洲肿瘤研究所及我科分子遗传实验室），是全国唯一的国外认可实验室，负责全国乳腺癌、肺癌靶向治疗的基因检测，得到了国际认可。主编及参加多部医学专著的编写。如刘彤华主编的&ldquo;诊断病理学&rdquo;等。陈杰教授主编全国统编长学制&ldquo;病理学&rdquo;教材等。</p>\r\n\r\n<p>　　作为协和医大的病理教研室，每年担负繁重的医大八年制本科病理学教学及协和医大研究生院的博士生及硕士生的病理教学工作。在医学本科生的教学过程中不断进行改革，努力提高教学水平及教学质量，建有北京协和医院病理科网站(www.pathology.com.cn),开通了网上教学，已获得北京市精品课程并申报国家精品课程。教学条件有了明显的改善，有明亮宽敞、标本齐全的病理标本博物馆；病理实验室条件完全可以满足同时130位学生的实习。数码互动教室的应用，大大提高了学生实习的效果，为学生提供病理实习的良好条件和技术平台。同时还担负成人继续教育病理课程。作为博士生和硕士生培养单位，自1978年以来已培养博士生&nbsp;31名，硕士生&nbsp;42名，毕业后分布全世界，有的已取得了很大成就，并协助其他科室培养几十名博士及硕士研究生。培养近百名进修医师遍布全国各地，其中很多已成为全国的病理业务骨干。几年来我科与中华医学会病理杂志社举办全国病理诊断新进展学习班，学员近100人，学员大多是市一级以上大医院病理科主任或业务骨干，通过短期培训诊断水平有不同程度的提高。</p>\r\n\r\n<p>　　病理科作为北京市首批住院医师基地的单位，在培养的院外住院医师达10人，在科内接受系统的病理诊断训练。</p>\r\n\r\n<p>　　近年来，在院领导的支持下，病理科有了一定的发展，制定了10年长远规划，人材梯队建设已初见规模，困扰多年的人才断档局面有了一定的改善，病理取材室经过改造，环境及通风得到很大的改善，病理制片质量及诊断水平也有了很大提高。病理科已实现从接收标本开始到病理报告发出全过程计算机管理，全部实现高质量的图文病理报告，受到广大临床医生的欢迎。</p>\r\n\r\n<p>　　目前，病理学科的发展还有很多的困难，如空间的严重不足，科室，人员不足，专科病理发展迟缓，国际交流及合作少等。</p>\r\n\r\n<p>　　病理科致力于提高质量，随着医院现代化进程的加速，希望病理科亦能得到一定得发展，病理科全体工作人员必将为协和医院的发展做出更大贡献！</p>', 'http://localhost:8080/upload/214fdc99a5af4495adf5695c86e29721s5a28f87e864c8.png');

-- ----------------------------
-- Table structure for t_doctor
-- ----------------------------
DROP TABLE IF EXISTS `t_doctor`;
CREATE TABLE `t_doctor`  (
  `id` bigint(20) NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生用户名',
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `work_age` int(11) NULL DEFAULT NULL COMMENT '医龄',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本人照片',
  `dep_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `doctor_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '医生简介',
  `doctor_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生联系方式',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_department`(`dep_id`) USING BTREE,
  CONSTRAINT `doctor_department` FOREIGN KEY (`dep_id`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_doctor
-- ----------------------------
INSERT INTO `t_doctor` VALUES (1588496280272, 'Tom', '670b14728ad9902aecba32e22fa4f6bd', '汤姆', '1', 35, '内科学系主任 主任医师 博士研究生导师', 15, 'http://localhost:8080/upload/f1ff7be1ec4a4f0ca2489f28d5343a69doctor.jpg', 5, '<p>擅长 : 系统性红斑狼疮、干燥综合征、类风湿关节炎、脊柱关节病、系统性血管炎等各种风湿免疫病</p>', '15831853403');
INSERT INTO `t_doctor` VALUES (1588496391404, 'Jeck', '670b14728ad9902aecba32e22fa4f6bd', '杰克', '1', 31, '主任医师，教授，博士研究生导师，心内科主任', 8, 'http://localhost:8080/upload/33d75532fe3e4330b65b5d0c6a3e4310doctor_detail.jpg', 5, '<p>擅长 : 1、急性肺栓塞、深静脉血栓形成、慢性血栓栓塞性肺高血压症等疑难、危重血栓相关疾病的诊治；2、肺动脉瓣、三尖瓣等结构性心脏病诊断与介入治疗；3、各类肺动脉高压、肺血管疾病的诊治，包括遗传性肺血管疾病的分子遗传诊断与干预；4、先天性心脏病、艾森曼格综合征的诊治评估，尤其擅长决策此类疾病外科手术指征；5、心血管系统罕见疾病研究；6、儿童心血管疾病，特别是儿童心肌炎、心肌病、肺动脉高压、先天性心脏病、血栓栓塞性疾病等复杂疑难心血管疾病。</p>', '15864953678');

-- ----------------------------
-- Table structure for t_doctor_desc
-- ----------------------------
DROP TABLE IF EXISTS `t_doctor_desc`;
CREATE TABLE `t_doctor_desc`  (
  `doctor_id` bigint(20) NOT NULL COMMENT '医生id',
  `doctor_details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '医生详情',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`doctor_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_doctor_desc
-- ----------------------------
INSERT INTO `t_doctor_desc` VALUES (1588496280272, '<p>张奉春，1954年10月生，北京协和医院主任医师，教授，博士生/博士后导师，享受国务院特殊津贴。现任中国医学科学院北京协和医院内科学系主任，北京协和医学院内科学系主任，北京医师协会风湿免疫分会及内科分会会长，国家药典委员会委员，全国内科住院医师规培委员会副主任委员。曾任北京协和医院风湿免疫科主任，中华医学会风湿病学分会第六、七届主任委员，中国医师协会风湿免疫专科医师分会第一二届会长。1982年毕业于北京医科大学（现北京大学医学部），1987年始从事风湿免疫病学专业，1993-1995年在美国做博士后研究。 主要研究方向是原发性干燥综合征及原发性胆汁性胆管炎的发病机制。近年来承担十一五、十二五重大新药创制课题、十一五国家科技支撑计划课题、卫生部重点学科基金、卫计委（原卫生部）卫生公益性行业专项首席科学家及多项国家自然基金等项目。主编多部学术专著，包括《风湿免疫病学》、《干燥综合征》、《风湿病诊疗指南》、《北京协和医院内科大查房》、国家重点出版工程《中华医学百科全书》风湿免疫病学卷、国家卫生和计划生育委员会住院医师规范化培训规划教材《内科学：风湿免疫分册》等。2005年获中华医学科技二等奖，2010年获国家教育部科学技术进步二等奖（第一完成人）。2011年获北京市科学技术三等奖（第一完成人）等。2015年与香港大学合作项目《原发性干燥综合征发病机制及临床多器官损伤的研究》获北京市科技进步二等奖（第一完成人），同年原发性胆汁性胆管炎相关研究获得中华科技进步三等奖（第一完成人）。2017年干燥综合征的相关研究获华夏医学科技二等奖（第一完成人）。至今已发表400余篇核心期刊文献，近五年发表SCI论文50余篇，总影响因子200 余分。</p>', '2020-05-03 16:57:59', '2020-05-03 16:57:59');
INSERT INTO `t_doctor_desc` VALUES (1588496391404, '<p>荆志成，男，1971年8月出生于安徽。北京协和医院心内科主任，兼中国医学科学院肺血管医学重点实验室主任。北京协和医学院内科学及遗传学两个专业方向博士研究生导师。中国农工民主党北京市委员会副主任委员，中国农工民主党中央委员，北京政协委员。</p>\r\n\r\n<p>1994年本科毕业于潍坊医学院，1998年获得北京协和医学院（原中国协和医科大学）内科学专业（心血管病方向）医学博士学位。2004年11月-2006年10月在法国巴黎十一大学留学，从事博士后研究。2008年在同济大学晋升为教授、内科学博士生导师，2009年晋升为主任医师。2018年当选北京协和医学院首批&ldquo;长聘教授&rdquo;。</p>\r\n\r\n<p>截至2019年底，已荣获&ldquo;国家杰出青年科学基金&rdquo;、国家&ldquo;万人计划&rdquo;科技创新领军人才、百千万人才工程国家级人选暨有突出贡献的中青年专家、中国医师奖、国务院政府特殊津贴、中国侨界突出贡献一等奖、树兰医学青年奖、科技北京百名领军人才、上海市领军人才、上海市曙光学者、上海市银蛇奖等国家和省部级人才荣誉和奖项。</p>\r\n\r\n<p>目前担任《中华心血管病杂志》副总编辑、《中华医学杂志（英文版）》副总编辑、北京医学会血栓与止血分会主任委员，中华医学会心血管病分会结构性心脏病学组副组长，意大利内科学会官方杂志Internal and Emergency Medicine以及欧洲呼吸学会官方杂志European Respiratory Review杂志副主编等学术职务。2018年作为发起人与东亚地区专家联合发起创办东亚肺高血压学会（EASOPH）。</p>\r\n\r\n<p>2019年当选世界肺高血压协会（WSPHA）首届科学委员会委员。2020年1月起，正式出任国际血栓与凝血学会（International Society of Thrombosis and Haemostasis, ISTH）官方旗舰杂志 Journal of Thrombosis and Haemostasis 副主编，主要负责静脉血栓形成与肺栓塞领域方向。</p>\r\n\r\n<p>截至2019年底，发表经同行评议SCI论文103篇，总影响因子954.095，总计被引次数10336次，H指数36，i10指数72。作为课题负责人承担&ldquo;十三.五&rdquo;国家重点研发项目、国家自然科学基金重点项目暨重大国际合作项目、北京市自然科学基金重点项目等国家和省部级纵向科研项目多项。作为Global steering committee member 和national leading PI or coordinator 等领导多项国际、国内多中心新药、注册登记等临床试验。2019年12月国际权威学术期刊-欧洲心脏杂志（Eur&nbsp;Heart J.2019,40:3881-3885）在世界优秀心血管中心专栏长篇报道了荆志成教授领导的团队二十年来在中国为肺血管科学以及肺血管疾病患者所付出的努力和取得的成就。</p>', '2020-05-03 16:59:50', '2020-05-03 16:59:50');

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  `created` datetime NULL DEFAULT NULL COMMENT '反馈日期',
  `name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈人',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES (1, '我的预约日期还没到，杰克医生就给我设置为爽约是怎么回事？', '2020-05-03 17:09:02', '张三', '13765486354');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint(20) NOT NULL,
  `doctor_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医师姓名',
  `user_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `order_date` datetime NULL DEFAULT NULL COMMENT '预约日期',
  `user_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者电话',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '患者id',
  `doctor_id` bigint(20) NULL DEFAULT NULL COMMENT '医生id',
  `state` int(10) NULL DEFAULT NULL COMMENT '预约状态：\r\n0为预约中；1为预约成功；2为预约失败；3取消预约',
  `created` datetime NULL DEFAULT NULL COMMENT '申请预约日期',
  `illness_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '病情描述',
  `doctor_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医师电话',
  `visit_state` int(2) NULL DEFAULT NULL COMMENT '就诊状态: 0为未就诊；1为已就诊；2为已过期',
  `doctor_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生回复信息',
  `history_state` tinyint(1) NULL DEFAULT NULL COMMENT '是否为历史订单：0为不是；1为是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_to_user`(`user_id`) USING BTREE,
  INDEX `order_to_doctor`(`doctor_id`) USING BTREE,
  CONSTRAINT `order_to_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `t_doctor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_to_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1588496814987, '杰克', '李四', '2020-05-04 14:20:00', '15763489562', 2, 1588496391404, 3, '2020-05-03 17:06:54', '肚子痛', '15864953678', 0, '喝点热水，记得及时就诊！', 1);

-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) NOT NULL COMMENT '医生id',
  `work_date` datetime NULL DEFAULT NULL COMMENT '工作日期',
  `work_time` tinyint(1) NULL DEFAULT NULL COMMENT '工作时间段：0上午，1下午',
  `time_interval` int(11) NULL DEFAULT NULL COMMENT '时间间隔/分钟',
  `doctor_realname` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_Schedule`(`doctor_id`) USING BTREE,
  CONSTRAINT `doctor_Schedule` FOREIGN KEY (`doctor_id`) REFERENCES `t_doctor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES (1, 1588496280272, '2020-05-04 00:00:00', 0, 1200000, '汤姆');
INSERT INTO `t_schedule` VALUES (2, 1588496391404, '2020-05-04 00:00:00', 1, 1200000, '杰克');
INSERT INTO `t_schedule` VALUES (3, 1588496391404, '2020-05-05 00:00:00', 0, 1200000, '杰克');
INSERT INTO `t_schedule` VALUES (4, 1588496391404, '2020-05-06 00:00:00', 0, 1200000, '杰克');
INSERT INTO `t_schedule` VALUES (5, 1588496391404, '2020-05-07 00:00:00', 1, 1200000, '杰克');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `user_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', '13765486354');
INSERT INTO `t_user` VALUES (2, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '李四', '15763489562');

SET FOREIGN_KEY_CHECKS = 1;
