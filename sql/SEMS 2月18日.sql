/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : SQL Server
 Source Server Version : 15002000
 Source Host           : localhost\LUODENG:1433
 Source Catalog        : sems
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002000
 File Encoding         : 65001

 Date: 18/02/2025 10:44:03
*/


-- ----------------------------
-- Table structure for BJDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[BJDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[BJDMK]
GO

CREATE TABLE [dbo].[BJDMK] (
  [ID] int IDENTITY(1000,1) NOT NULL,
  [BJMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [BZRDM] int NULL,
  [ZYDM] int NULL,
  [DYZY] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[BJDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'班级代码',
'SCHEMA', N'dbo',
'TABLE', N'BJDMK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'班主任代码',
'SCHEMA', N'dbo',
'TABLE', N'BJDMK',
'COLUMN', N'BZRDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'对应专业',
'SCHEMA', N'dbo',
'TABLE', N'BJDMK',
'COLUMN', N'DYZY'
GO

EXEC sp_addextendedproperty
'MS_Description', N'班级代码库',
'SCHEMA', N'dbo',
'TABLE', N'BJDMK'
GO


-- ----------------------------
-- Records of [BJDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[BJDMK] ON
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1411', N'2020医药卫生事业管理班', NULL, N'1100', N'健康服务与管理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1412', N'2022壮医学', NULL, N'1102', N'壮医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1413', N'2020药学1班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1414', N'2022中药学4班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1415', N'2021级中医学一体化1班', NULL, N'1131', N'中医学一体化')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1416', N'2020中医康复学', NULL, N'1113', N'中医康复学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1417', N'2019药学1班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1418', N'2021级中药学1班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1419', N'2021级药学1班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1420', N'2022口腔医学', NULL, N'1115', N'口腔医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1421', N'2020药学4班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1422', N'2019药学2班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1423', N'2019临床医学3班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1424', N'2019护理学4班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1425', N'2020药学2班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1426', N'2019制药工程', NULL, N'1103', N'制药工程')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1427', N'2018级壮医学', NULL, N'1102', N'壮医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1428', N'2021级中医康复学1班', NULL, N'1113', N'中医康复学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1429', N'2021级预防医学2班', NULL, N'1116', N'预防医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1430', N'2022中药学高职校企合作班1班', NULL, N'1122', N'中药学校企合作班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1431', N'2022中医康复学', NULL, N'1113', N'中医康复学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1432', N'2020中药3班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1433', N'2022中西医临床医学3班', NULL, N'1087', N'中西医临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1434', N'2022中医养生学', NULL, N'1086', N'中医养生学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1435', N'2018中医3班', NULL, N'1108', N'中医')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1436', N'2020级针灸推拿高职普通1班', NULL, N'1074', N'针灸推拿高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1437', N'2022级助产学', NULL, N'1117', N'助产学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1438', N'2022制药工程', NULL, N'1103', N'制药工程')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1439', N'2021级制药工程1班', NULL, N'1103', N'制药工程')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1440', N'2021级助产学1班', NULL, N'1117', N'助产学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1441', N'2018口腔医学1班', NULL, N'1115', N'口腔医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1442', N'2020级壮医学', NULL, N'1102', N'壮医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1443', N'2021级健康服务与管理2班', NULL, N'1100', N'健康服务与管理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1444', N'2019中药学', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1445', N'2020中药2班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1446', N'2021口腔医学高职', NULL, N'1077', N'口腔医学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1447', N'2018临床医学2班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1448', N'2021药学2班高职校企合作班', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1449', N'2020级药学专升本班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1450', N'2021级药学产教融合应用型本科', NULL, N'1123', N'药学产教融合应用型本科')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1451', N'2019中医学桂派杏林师承班', NULL, N'1072', N'中医学桂派杏林师承班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1452', N'2020中药4班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1453', N'2019级中医学', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1454', N'2019级中药学', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1455', N'None', NULL, N'1095', N'药学（订单班）')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1456', N'2021级壮医学', NULL, N'1102', N'壮医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1457', N'2022中药学高职校企合作班3班', NULL, N'1122', N'中药学校企合作班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1458', N'2020级中药学校企合作班1班', NULL, N'1092', N'中药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1459', N'2020级健康服务与管理专升本班', NULL, N'1100', N'健康服务与管理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1460', N'2020级药学校企合作班1班', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1461', N'2020助产学1班', NULL, N'1117', N'助产学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1462', N'2021针灸推拿2班高职免费医学定向', NULL, N'1070', N'针灸推拿免费医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1463', N'2020护理高职1班', NULL, N'1066', N'护理高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1464', N'2020护理高职4班', NULL, N'1066', N'护理高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1465', N'2021针灸推拿高职普通', NULL, N'1074', N'针灸推拿高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1466', N'2019助产学1班', NULL, N'1117', N'助产学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1467', N'2022中药学高职校企合作班4班', NULL, N'1122', N'中药学校企合作班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1468', N'2019级护理学专升本班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1469', N'2020级中药学专升本1班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1470', N'2020护理高职2班', NULL, N'1066', N'护理高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1471', N'2021医学美容技术高职校企合作班', NULL, N'1075', N'医学美容技术高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1472', N'2021中医学免费医学定向', NULL, N'1088', N'中医学免费医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1473', N'2018中医学定向2班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1474', N'2020药学高职', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1475', N'2021中药学2班高职校企合作班', NULL, N'1092', N'中药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1476', N'2020级护理学专升本康养班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1477', N'2021护理2班高职', NULL, N'1066', N'护理高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1478', N'2022护理高职1班', NULL, N'1129', N'护理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1479', N'2022针灸推拿高职1班', NULL, N'1083', N'针灸推拿')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1480', N'2021药学高职', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1481', N'2021护理高职', NULL, N'1066', N'护理高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1482', N'2022级针灸推拿班', NULL, N'1083', N'针灸推拿')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1483', N'2022级药学班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1484', N'2020针灸推拿高职', NULL, N'1074', N'针灸推拿高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1485', N'2022公共事业管理', NULL, N'1099', N'公共事业管理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1486', N'2022级护理班', NULL, N'1129', N'护理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1487', N'2020口腔医学高职', NULL, N'1077', N'口腔医学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1488', N'2020级医学美容技术校企合作班', NULL, N'1075', N'医学美容技术高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1489', N'2020护理高职', NULL, N'1066', N'护理高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1490', N'2021药学1班高职校企合作班', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1491', N'2021护理1班高职', NULL, N'1066', N'护理高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1492', N'2022口腔医学高职', NULL, N'1115', N'口腔医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1493', N'2022中医学免费医学定向1班', NULL, N'1078', N'中医学农村订单定向医学生')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1494', N'2020级中药学专升本2班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1495', N'2021中药高职', NULL, N'1096', N'中药高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1496', N'2022级中药学', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1497', N'2019级药学', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1498', N'2021中药学1班高职校企合作班', NULL, N'1092', N'中药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1499', N'2020中药高职', NULL, N'1096', N'中药高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1500', N'2020级药学校企合作班2班', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1501', N'2020级中药学校企合作班2班', NULL, N'1092', N'中药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1502', N'2020中医学定向2班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1503', N'2020护理高职3班', NULL, N'1066', N'护理高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1504', N'2021针灸推拿1班高职免费医学定向', NULL, N'1070', N'针灸推拿免费医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1505', N'2021级中医学定向1班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1506', N'2022中药学高职校企合作班2班', NULL, N'1122', N'中药学校企合作班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1507', N'2021针灸推拿高职', NULL, N'1074', N'针灸推拿高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1508', N'2021中药学3班高职校企合作班', NULL, N'1092', N'中药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1509', N'2022针灸推拿高职免费医学定向2班', NULL, N'1082', N'针灸推拿农村订单定向医学生')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1510', N'2020级针灸推拿免费医学定向1班', NULL, N'1070', N'针灸推拿免费医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1511', N'2018中医学定向1班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1512', N'2019中医学定向1班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1513', N'2021中药学4班高职校企合作班', NULL, N'1092', N'中药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1514', N'2022针灸推拿高职免费医学定向1班', NULL, N'1082', N'针灸推拿农村订单定向医学生')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1515', N'2019中医学定向2班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1516', N'2020级中药学校企合作班3班', NULL, N'1092', N'中药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1517', N'2022护理高职2班', NULL, N'1129', N'护理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1518', N'2020级口腔医学1班', NULL, N'1115', N'口腔医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1519', N'2019中医学定向柳州班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1520', N'2020中医学定向1班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1521', N'2018中医学定向柳州班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1522', N'2021级中医学定向2班', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1523', N'2020级针灸推拿免费医学定向2班', NULL, N'1070', N'针灸推拿免费医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1524', N'2021中药学', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1525', N'2020针灸推拿高职免费医学定向', NULL, N'1070', N'针灸推拿免费医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1526', N'2020医学美容技术高职校企合作班', NULL, N'1075', N'医学美容技术高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1527', N'2022针灸推拿高职班', NULL, N'1074', N'针灸推拿高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1528', N'2020级针灸推拿高职普通', NULL, N'1074', N'针灸推拿高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1529', N'2019级中药学专升本班', NULL, N'1125', N'中药学专升本班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1530', N'2022级中药学班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1531', N'2021级药学校企合作班', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1532', N'2020级药学校企合作班', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1533', N'2020级中药学校企合作班', NULL, N'1092', N'中药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1534', N'2018临床医学', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1535', N'2021针灸推拿高职班', NULL, N'1074', N'针灸推拿高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1536', N'2022药学高职班', NULL, N'1127', N'药学高职')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1537', N'2021级中医学一体化', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1538', N'2020级康复治疗1班', NULL, N'1089', N'康复治疗学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1539', N'2018中医学定向', NULL, N'1081', N'中医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1540', N'2022针灸推拿2班高职免费医学定向', NULL, N'1070', N'针灸推拿免费医学定向')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1541', N'2020口腔医学', NULL, N'1115', N'口腔医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1271', N'2021级针灸推拿学1班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1272', N'2020护理学中外合作办学', NULL, N'1121', N'护理学中外合作办学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1273', N'2021级护理学中外合作班1班', NULL, N'1090', N'护理学中外合作班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1274', N'2022护理学3班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1275', N'2019级口腔医学', NULL, N'1115', N'口腔医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1276', N'2018级针灸推拿学2班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1277', N'2022中医学2班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1278', N'2018中医学桂派杏林师承班', NULL, N'1072', N'中医学桂派杏林师承班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1279', N'2018临床医学1班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1280', N'2020中医学一体化1班', NULL, N'1131', N'中医学一体化')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1281', N'2020临床医学1班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1282', N'2019中医学一体化1班', NULL, N'1131', N'中医学一体化')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1283', N'2018中医4班', NULL, N'1108', N'中医')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1284', N'2019信息管理与信息系统', NULL, N'1085', N'信息管理与信息系统')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1285', N'2022中医学一体化', NULL, N'1131', N'中医学一体化')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1286', N'2020信息管理与信息系统', NULL, N'1085', N'信息管理与信息系统')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1287', N'2020口腔医学1班', NULL, N'1115', N'口腔医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1288', N'2021级中医学4班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1289', N'2022针灸推拿学2班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1290', N'2019级针灸推拿学2班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1291', N'2021级医学检验技术1班', NULL, N'1097', N'医学检验技术')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1292', N'2021级信息管理与信息系统', NULL, N'1085', N'信息管理与信息系统')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1293', N'2022临床医学2班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1294', N'2021级临床医学1班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1295', N'2019护理学中外合作办学', NULL, N'1121', N'护理学中外合作办学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1296', N'2022护理学2班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1297', N'2019中医3班', NULL, N'1108', N'中医')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1298', N'2021级中医学3班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1299', N'2019临床医学1班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1300', N'2020中医1班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1301', N'2019中医学骨伤班', NULL, N'1101', N'中医学骨伤班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1302', N'2019级针灸推拿学1班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1303', N'2022医学检验技术', NULL, N'1097', N'医学检验技术')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1304', N'2018中医学一体化1班', NULL, N'1131', N'中医学一体化')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1305', N'2021级护理学3班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1306', N'2022护理学4班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1307', N'2022信息管理与信息系统', NULL, N'1085', N'信息管理与信息系统')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1308', N'2019护理学2班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1309', N'2019中医2班', NULL, N'1108', N'中医')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1310', N'2021级中西医临床医学1班', NULL, N'1087', N'中西医临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1311', N'2021级中西医临床医学2班', NULL, N'1087', N'中西医临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1312', N'2022中医儿科学', NULL, N'1128', N'中医儿科学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1313', N'2020护理学1班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1314', N'2019预防医学', NULL, N'1116', N'预防医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1315', N'2020中医儿科学1班', NULL, N'1128', N'中医儿科学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1316', N'2020中医3班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1317', N'2020护理学3班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1318', N'2021级中医学2班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1319', N'2022临床医学1班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1320', N'2020级中医学师承班', NULL, N'1084', N'中医学师承班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1321', N'2019中药学2班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1322', N'2019中西医临床医学1班', NULL, N'1087', N'中西医临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1323', N'2022中医学1班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1324', N'2020中医2班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1325', N'2021级护理学4班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1326', N'2020中医骨伤科学', NULL, N'1073', N'中医骨伤科学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1327', N'2019公共事业管理', NULL, N'1099', N'公共事业管理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1328', N'2019级康复治疗学一班', NULL, N'1089', N'康复治疗学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1329', N'2018临床医学4班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1330', N'2022中药学3班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1331', N'2021级护理学2班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1332', N'2021级预防医学1班', NULL, N'1116', N'预防医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1333', N'2019中医1班', NULL, N'1108', N'中医')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1334', N'2022中西医临床医学2班', NULL, N'1087', N'中西医临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1335', N'2020中西医临床医学1班', NULL, N'1087', N'中西医临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1336', N'2022针灸推拿学1班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1337', N'2022中医学4班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1338', N'2019临床医学2班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1339', N'2021级中药学2班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1340', N'2018级临床医学整合课程教改班', NULL, N'1118', N'临床医学整合课程教改班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1341', N'2019级医学检验技术', NULL, N'1097', N'医学检验技术')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1342', N'2020级针灸推拿学2班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1343', N'2021康复治疗学', NULL, N'1089', N'康复治疗学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1344', N'2020中西医临床医学2班', NULL, N'1087', N'中西医临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1345', N'2019中医养生学', NULL, N'1086', N'中医养生学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1346', N'2019中医儿科学1班', NULL, N'1128', N'中医儿科学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1347', N'2020康复治疗学', NULL, N'1089', N'康复治疗学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1348', N'2021级临床医学2班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1349', N'2019中医学1班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1350', N'2022预防医学1班', NULL, N'1116', N'预防医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1351', N'2021级中医儿科学1班', NULL, N'1128', N'中医儿科学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1352', N'2021级中医养生学1班', NULL, N'1086', N'中医养生学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1353', N'2020中药1班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1354', N'2020康复治疗学1班', NULL, N'1089', N'康复治疗学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1355', N'2018中医2班', NULL, N'1108', N'中医')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1356', N'2021级药学2班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1357', N'2022中药学2班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1358', N'2020护理学4班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1359', N'2019医学影像技术', NULL, N'1109', N'医学影像技术')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1360', N'2020医学影像技术', NULL, N'1109', N'医学影像技术')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1361', N'2021级中药学3班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1362', N'2022中医骨伤科学', NULL, N'1073', N'中医骨伤科学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1363', N'2018级针灸推拿学1班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1364', N'2022护理学1班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1365', N'2022医学影像技术', NULL, N'1109', N'医学影像技术')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1366', N'2020医学检验技术1班', NULL, N'1097', N'医学检验技术')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1367', N'2021级口腔医学1班', NULL, N'1115', N'口腔医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1368', N'2022药学1班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1369', N'2020药学3班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1370', N'2018中医学骨伤班', NULL, N'1101', N'中医学骨伤班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1371', N'2020级针灸推拿学1班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1372', N'2022针灸推拿高职2班', NULL, N'1083', N'针灸推拿')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1373', N'2019级康复治疗学', NULL, N'1089', N'康复治疗学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1374', N'2021级医学影像技术1班', NULL, N'1109', N'医学影像技术')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1375', N'2021级中医骨伤科学1班', NULL, N'1073', N'中医骨伤科学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1376', N'2020临床医学2班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1377', N'2022中医学免费医学定向2班', NULL, N'1078', N'中医学农村订单定向医学生')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1378', N'2018中医1班', NULL, N'1108', N'中医')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1379', N'2020食品质量与安全', NULL, N'1120', N'食品质量与安全')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1380', N'2022食品质量与安全', NULL, N'1120', N'食品质量与安全')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1381', N'2018预防医学', NULL, N'1116', N'预防医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1382', N'2021级针灸推拿学2班', NULL, N'1094', N'针灸推拿学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1383', N'2021级中医学1班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1384', N'2022健康服务与管理', NULL, N'1100', N'健康服务与管理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1385', N'2019中药学1班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1386', N'2019中医4班', NULL, N'1108', N'中医')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1387', N'2020中医4班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1388', N'2020级护理专升本1班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1389', N'2019级壮医学', NULL, N'1102', N'壮医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1390', N'2021级健康服务与管理1班', NULL, N'1100', N'健康服务与管理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1391', N'2022中西医临床医学1班', NULL, N'1087', N'中西医临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1392', N'2020健康服务与管理', NULL, N'1100', N'健康服务与管理')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1393', N'2019护理学1班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1394', N'2019护理学3班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1395', N'2020中医养生学', NULL, N'1086', N'中医养生学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1396', N'2021级食品质量与安全1班', NULL, N'1120', N'食品质量与安全')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1397', N'2020护理学2班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1398', N'2021级护理学1班', NULL, N'1112', N'护理学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1399', N'2022药学高职校企合作2班', NULL, N'1107', N'药学校企合作班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1400', N'2022中医学3班', NULL, N'1130', N'中医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1401', N'2022药学高职校企合作1班', NULL, N'1107', N'药学校企合作班')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1402', N'2020预防医学2班', NULL, N'1116', N'预防医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1403', N'2021级中药学4班', NULL, N'1104', N'中药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1404', N'2022预防医学2班', NULL, N'1116', N'预防医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1405', N'2020预防医学1班', NULL, N'1116', N'预防医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1406', N'2019食品质量与安全', NULL, N'1120', N'食品质量与安全')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1407', N'2022康复治疗学', NULL, N'1089', N'康复治疗学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1408', N'2018临床医学3班', NULL, N'1098', N'临床医学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1409', N'2022药学2班', NULL, N'1119', N'药学')
GO

INSERT INTO [dbo].[BJDMK] ([ID], [BJMC], [BZRDM], [ZYDM], [DYZY]) VALUES (N'1410', N'2022中药学1班', NULL, N'1104', N'中药学')
GO

SET IDENTITY_INSERT [dbo].[BJDMK] OFF
GO


-- ----------------------------
-- Table structure for DATA_DWDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DATA_DWDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[DATA_DWDMK]
GO

CREATE TABLE [dbo].[DATA_DWDMK] (
  [DWDM] int IDENTITY(1,1) NOT NULL,
  [DWMC] nvarchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [DWXZ] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [DWXZDM] int NOT NULL,
  [DWGMDM] int NOT NULL,
  [DWGM] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [DWHYDM] int NULL,
  [DWHY] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [GSMC] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [GSJJ] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [GSJJHTML] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [QYDM] int DEFAULT ((1)) NOT NULL,
  [SZDQ] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[DATA_DWDMK] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of [DATA_DWDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DATA_DWDMK] ON
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'1', N'卫宁', N'机关', N'1', N'14', N'10000人以上', N'20', N'国际组织', N'卫宁健康科技集团有限公司', N'卫宁健康科技集团有限公司（Weining Health Technology Group Co., Ltd.）是一家致力于提供医疗健康信息化解决方案的公司，成立于2000年，总部位于中国。以下是关于卫宁公司的详细简介：

1. 公司的宗旨和愿景
卫宁公司致力于通过科技创新推动医疗行业的信息化发展，提升医疗服务的质量和效率。其愿景是成为全球领先的健康科技解决方案提供商。

2. 主要业务领域
卫宁的业务覆盖多个领域，包括但不限于：

医疗信息化解决方案：提供医院管理系统（HIS）、电子病历（EMR）、影像存档与传输系统（PACS）、检验信息系统等，帮助医院实现信息化管理。
智能医疗：运用人工智能、大数据分析和云计算技术，为医疗行业提供智能化服务，如智能诊断、健康管理等。
数据服务：为医疗机构提供数据采集、分析和应用服务，提升管理水平和医疗服务能力。
3. 技术与创新
卫宁公司在技术创新方面不断投入，结合行业需求，推出了一系列领先的产品和服务。公司注重研发，拥有多项专利技术及软件著作权，致力于为医疗行业提供先进的解决方案。

4. 客户群体
卫宁的客户主要包括各类医疗机构，如综合医院、专科医院、社区医疗中心等，以及医药公司、健康管理机构等。其解决方案已在全国多个省市的医疗机构中得到广泛应用。

5. 社会责任
卫宁公司积极参与社会公益事业，通过推动医疗信息化、促进健康管理等方式，为改善公共健康水平和提升医疗服务质量作出贡献。

6. 国际化发展
近年来，卫宁公司致力于拓展国际市场，积极参加国际医疗健康相关展会，与多国企业和机构进行合作，探索全球业务发展机会。

卫宁健康科技在中国医疗信息化领域中具有一定的影响力，其产品和服务已帮助许多医疗机构实现了管理现代化，提高了医疗服务的效率与质量。', N'  <div class="container mx-auto px-4 py-8 max-w-4xl">  
        <header class="text-center mb-12">  
            <h1 class="text-4xl font-extrabold text-blue-700 mb-4">卫宁健康科技股份有限公司</h1>  
            <p class="text-xl text-gray-600">医疗信息化转型的引领者，健康科技创新的推动者</p>  
        </header>  

        <section class="bg-white shadow-lg rounded-lg p-8 mb-8">  
            <h2 class="text-2xl font-bold text-blue-600 border-b-2 border-blue-500 pb-3 mb-6">公司简介</h2>  
            <p class="text-gray-700">  
                卫宁健康成立于1998年，总部位于杭州，是中国医疗健康信息化领域的领先企业。公司致力于为医疗机构提供全面的数字化转型解决方案，以科技创新推动医疗行业的智能化发展。  
            </p>  
        </section>  

        <div class="grid md:grid-cols-2 gap-6">  
            <section class="bg-white shadow-md rounded-lg p-6">  
                <h3 class="text-xl font-semibold text-blue-600 mb-4">核心产品</h3>  
                <ul class="space-y-3">  
                    <li class="flex items-center">  
                        <svg class="w-6 h-6 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>  
                        </svg>  
                        医院信息管理系统(HIS)  
                    </li>  
                    <li class="flex items-center">  
                        <svg class="w-6 h-6 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>  
                        </svg>  
                        电子病历系统(EMR)  
                    </li>  
                    <li class="flex items-center">  
                        <svg class="w-6 h-6 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>  
                        </svg>  
                        实验室信息系统(LIS)  
                    </li>  
                </ul>  
            </section>  

            <section class="bg-white shadow-md rounded-lg p-6">  
                <h3 class="text-xl font-semibold text-blue-600 mb-4">技术优势</h3>  
                <div class="space-y-3">  
                    <div class="flex items-center">  
                        <span class="text-blue-500 mr-2">✓</span>  
                        大数据智能分析技术  
                    </div>  
                    <div class="flex items-center">  
                        <span class="text-blue-500 mr-2">✓</span>  
                        云计算医疗解决方案  
                    </div>  
                    <div class="flex items-center">  
                        <span class="text-blue-500 mr-2">✓</span>  
                        人工智能辅助诊断  
                    </div>  
                </div>  
            </section>  
        </div>  

        <section class="bg-white shadow-lg rounded-lg p-8 mt-8">  
            <h2 class="text-2xl font-bold text-blue-600 border-b-2 border-blue-500 pb-3 mb-6">社会价值</h2>  
            <p class="text-gray-700">  
                卫宁健康不仅是技术的提供者，更是医疗健康事业的推动者。我们通过持续的技术创新，助力医疗机构提高服务效率，为患者提供更优质、更便捷的医疗服务。  
            </p>  
        </section>  

        <footer class="text-center mt-8 text-gray-600">  
            <p>© 2024 卫宁健康科技股份有限公司 | 专注医疗信息化，服务健康美国！！！</p>  
        </footer>  
    </div>  ', N'1', N'上海市浦东区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'2', N'销售部', N'民营企业', N'8', N'13', N'5000-10000人', N'9', N'信息传输、软件和信息技术服务业', N'阿里巴巴集团', N'阿里巴巴集团成立于1999年，是一家全球领先的互联网和科技公司，致力于为消费者和企业提供全面的数字经济服务。', N'阿里巴巴集团成立于1999年，是一家全球领先的互联网和科技公司，致力于为消费者和企业提供全面的数字经济服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'3', N'开发部', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'腾讯控股有限公司', N'腾讯是一家中国领先的互联网增值服务提供商，旗下拥有社交、游戏、金融等多个业务板块。', N'腾讯是一家中国领先的互联网增值服务提供商，旗下拥有社交、游戏、金融等多个业务板块。', N'1', N'广东深圳市')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'4', N'百度', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'百度公司', N'百度是中国最大的搜索引擎公司，致力于通过技术创新推动人工智能的发展。', N'百度是中国最大的搜索引擎公司，致力于通过技术创新推动人工智能的发展。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'5', N'华为', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'华为技术有限公司', N'华为是一家全球领先的信息与通信技术（ICT）解决方案供应商，致力于为客户提供创新的技术和服务。', N'华为是一家全球领先的信息与通信技术（ICT）解决方案供应商，致力于为客户提供创新的技术和服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'6', N'中国移动', N'国有企业', N'7', N'12', N'1000-5000人', N'7', N'交通运输、仓储和邮政业', N'中国移动通信集团公司', N'中国移动是全球最大的移动通信运营商，提供全面的移动通信服务。', N'中国移动是全球最大的移动通信运营商，提供全面的移动通信服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'7', N'中国电信', N'国有企业', N'7', N'12', N'1000-5000人', N'7', N'交通运输、仓储和邮政业', N'中国电信集团公司', N'中国电信是中国主要的电信运营商之一，提供固定电话、移动电话和宽带等服务。', N'中国电信是中国主要的电信运营商之一，提供固定电话、移动电话和宽带等服务。', N'1', N'北京市朝阳区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'8', N'中国联通', N'国有企业', N'7', N'12', N'1000-5000人', N'7', N'交通运输、仓储和邮政业', N'中国联合网络通信有限公司', N'中国联通是中国主要的电信运营商之一，提供多种通信服务。', N'中国联通是中国主要的电信运营商之一，提供多种通信服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'9', N'京东', N'民营企业', N'8', N'12', N'1000-5000人', N'6', N'批发和零售业', N'京东集团', N'京东是中国最大的自营式电商企业，提供丰富的商品和优质的服务。', N'京东是中国最大的自营式电商企业，提供丰富的商品和优质的服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'10', N'美团', N'民营企业', N'8', N'12', N'1000-5000人', N'8', N'住店和餐饮业', N'美团点评', N'美团是一家综合性互联网服务平台，提供外卖、酒店、旅游等多种服务。', N'美团是一家综合性互联网服务平台，提供外卖、酒店、旅游等多种服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'11', N'字节跳动', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'字节跳动有限公司', N'字节跳动是一家全球领先的科技公司，旗下拥有抖音、今日头条等多个知名产品。', N'字节跳动是一家全球领先的科技公司，旗下拥有抖音、今日头条等多个知名产品。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'13', N'广西实施部', N'民营企业', N'8', N'14', N'10000人以上', N'9', N'信息传输、软件和信息技术服务业', N'罗式科技集团股份有限公司', N'123', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'15', N'信息科', N'医疗卫生单位', N'5', N'11', N'500-1000人', N'17', N'卫生和社会工作', N'麻栗坡县中医院', N'### 罗式科技集团有限公司简介

**公司概况**

罗式科技集团有限公司（LuoShi Technology Group Co., Ltd.）成立于2005年，总部位于中国深圳，是一家专注于高科技产品研发、生产和销售的综合性企业。公司致力于为全球客户提供创新的科技解决方案，涵盖智能硬件、软件开发、物联网（IoT）、人工智能（AI）等多个领域。经过多年的发展，罗式科技已成为行业内的领先企业，拥有一支高素质的研发团队和完善的销售网络。

**发展历程**

罗式科技自成立以来，始终坚持“创新、质量、服务”的发展理念。2006年，公司推出了第一款智能家居产品，迅速在市场上获得了良好的反响。2008年，罗式科技开始进军国际市场，产品远销欧美、东南亚等地区，逐步建立起全球销售网络。

2012年，公司在深圳证券交易所成功上市，成为公众公司，进一步增强了资金实力和市场竞争力。2015年，罗式科技加大了对研发的投入，成立了多个研发中心，专注于人工智能和物联网技术的研究与应用。2018年，公司推出了基于AI技术的智能家居系统，受到了市场的广泛欢迎。

**核心业务**

罗式科技的核心业务包括以下几个方面：

1. **智能硬件**：公司研发和生产各类智能硬件产品，包括智能家居设备、智能穿戴设备、智能安防系统等。通过先进的技术和设计，罗式科技的产品在市场上具有较高的竞争力。

2. **软件开发**：罗式科技拥有一支专业的软件开发团队，提供定制化的软件解决方案，包括移动应用、云计算平台和大数据分析等。公司致力于为客户提供高效、稳定的软件产品。

3. **物联网解决方案**：罗式科技在物联网领域具有丰富的经验，提供从设备连接到数据分析的全套解决方案。公司帮助客户实现智能化管理，提高生产效率和资源利用率。

4. **人工智能应用**：公司积极探索人工智能技术在各行业的应用，开发了多款基于AI的产品和服务，包括智能客服、智能监控和智能推荐系统等。

**技术创新**

罗式科技始终将技术创新作为企业发展的核心动力。公司与多所高校和科研机构建立了紧密的合作关系，积极参与国家和地方的科技项目。通过不断的技术积累和创新，罗式科技在智能硬件、软件开发和物联网等领域取得了多项专利和技术认证。

**市场与客户**

罗式科技的客户涵盖了家居、安防、医疗、教育、交通等多个行业。公司通过不断优化产品和服务，赢得了客户的信赖和支持。罗式科技注重客户体验，建立了完善的售后服务体系，确保客户在使用产品过程中能够获得及时的支持和帮助。

**企业文化**

罗式科技倡导“以人为本、创新驱动”的企业文化，注重员工的培训和发展。公司定期组织各类培训和团队建设活动，鼓励员工积极参与创新和改进。通过营造良好的工作氛围，罗式科技吸引和留住了大量优秀人才，为公司的持续发展提供了强有力的支持。

**社会责任**

作为一家负责任的企业，罗式科技积极参与社会公益活动，关注环境保护和可持续发展。公司在生产过程中严格遵循环保标准，努力减少对环境的影响。同时，罗式科技还积极参与教育、扶贫等公益项目，回馈社会，推动社会的进步与发展。

**未来展望**

展望未来，罗式科技将继续秉持“创新、质量、服务”的理念，致力于成为全球领先的科技企业。公司将加大对研发的投入，拓展国际市场，推动产品的智能化和数字化转型。通过不断的创新和努力，罗式科技希望为客户创造更大的价值，为社会的发展贡献更多的力量。

### 结语

罗式科技集团有限公司凭借其卓越的技术实力和市场敏锐度，在激烈的市场竞争中脱颖而出。未来，罗式科技将继续以科技创新为驱动力，推动行业的发展与变革，努力实现更高的目标。
', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'16', N'麻栗坡县人民医院 信息科', N'医疗卫生单位', N'5', N'11', N'500-1000人', N'19', N'公共管理、社会保障和社会组织', N'云南医药器械有限公司', N'无', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'17', N'东软运维部', N'民营企业', N'8', N'11', N'500-1000人', N'9', N'信息传输、软件和信息技术服务业', N'东软集团股份有限公司', N'东软是个大公司！', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'18', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'中大恒润', N'湖北中大恒润能源工程有限公司位于湖北武汉东湖高新技术开发区，是一家较早专注和开展新能源电动汽车充电设施、电网输变电工程、城农网工程和新能源（风电、光伏等）设计、施工的高新技术企业。公司拥有一批专业种类完整的高素质技术和管理团队，为客户涉电工程提供科学、精准、及时的全程服务，以服务赢得客户信赖。 


	  公司具有电力行业送变电工程设计乙级资质、新能源工程咨询丙级资质和工程测绘乙级资质证书。并通过ISO9001质量、ISO14001环境和OHSAS18001职业健康安全三体系认证。2015年至今，我公司设计电动汽车充电站186座、110千伏变电站20多座、110千伏线路工程30多条、10～35千伏配网线路工程800多条、住宅配套工程180多项、新能源光伏项目30多项。', NULL, N'1', N'湖北-武汉市-洪山区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'57', N'研发部', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'杭州深度求索人工智能基础技术研究有限公司', N'DeepSeek，全称杭州深度求索人工智能基础技术研究有限公司，是一家创新型科技公司，成立于2023年7月17日，专注于使用数据蒸馏技术以获取更为精炼的数据。公司由知名私募巨头幻方量化孕育而生，致力于开发先进的大语言模型（LLM）和相关技术。注册地址位于浙江省杭州市拱墅区环城北路169号汇金国际大厦西1幢1201室，法定代表人为裴湉，经营范围包括技术服务、技术开发、软件开发等。

2024年1月5日，发布DeepSeek LLM（深度求索的第一个大模型）；1月25日，发布DeepSeek-Coder；2月5日，发布DeepSeekMath；3月11日，发布DeepSeek-VL；5月7日，发布DeepSeek-V2；6月17日，发布DeepSeek-Coder-V2；9月5日，更新API支持文档，宣布合并DeepSeek Coder V2和DeepSeek V2 Chat，推出DeepSeek V2.5；12月13日，发布DeepSeek-VL2；12月26日晚，正式上线DeepSeek-V3首个版本并同步开源。2025年1月31日，英伟达宣布DeepSeek-R1模型登陆NVIDIA NIM，同时亚马逊和微软也接入该模型。英伟达称DeepSeek-R1是最先进的大语言模型。2月5日消息，DeepSeek-R1、V3、Coder等系列模型已陆续上线国家超算互联网平台。2月6日，澳大利亚政府以“担心安全风险”为由，禁止在所有政府设备中使用DeepSeek。2月8日，DeepSeek正式登陆苏州，并在苏州市公共算力服务平台上完成部署上线，为用户提供开箱即用的软硬件一体服务。
', NULL, N'1', N'浙江杭州市')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'20', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'鑫邦电气', N'<br />
	<br />
		江西鑫邦电气有限公司拥有雄厚的资本，现有在册员工232人，工厂占地面积30亩地，厂房、办公室楼建筑面积1.8万平方米，注册基本2000万。公司具有大专以上学历的占37.9%，其中高级工程师8人，工程师及经济师10人。公司产品获得国家CCC认证，被评为国家名辉产品，有中国人民保险公司承保，企业通过ISO9001：2000质量体系认证，并被评为“AAA”级资格企业。<br />
鑫邦电气主要从事高/低成套设备，防窃电产品生产与销售，主要产品有：JP户外配变补偿控制柜、GGJ低压无功补偿控制柜、MNS低压抽出式开关柜、XB-FDCP低压电能计量箱、DFW低压电缆分支箱、GGD交流低压配电柜、KYN28-12铠装移开式交流金属封闭开关柜、SH15非晶合金电力变压器、XB.FDCPX防窃电电表箱等一系列产品。<br />
	<br />
<br />
<br />
	展开<br />', NULL, N'1', N'未知')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'21', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'一览新能源猎头', N'未找到公司信息', NULL, N'1', N'未知')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'22', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'正运动技术', N'深圳市正运动技术有限公司成立于2013年，专注于纯国产运动控制技术研究和通用运动控制软硬件平台和产品
的研发，是国家级高新技术和专精特新“小巨人”企业。
正运动技术汇集了来自华为、中兴等公司的优秀人才。力求创新，目前公司拥有专利、著作权等知识产权五十
余项。在坚持自主创新的同时，积极联合各大高校和科研院所协同运动控制基础技术的研究，是国内工控领域发展
最快的企业之一，也是国内少有完整掌握运动控制核心技术和实时工控软件平台技术的企业。
正运动技术除本部研发中心外，设有中山、武汉、上海三个研发分部。为更好地服务客户，本部之外设有苏
州、东莞两个区域性服务中心，设有佛山、厦门、青岛、西安、武汉、成都、天津、郑州等销售和技术服务机构。
经过众多合作伙伴多年的开发应用，正运动技术的产品广泛地应用于3C电子、半导体、新能源、机器人、包装
印刷、纺织服装、激光加工、医疗制药、数控机床、传统加工等领域。', NULL, N'1', N'广东-深圳市-宝安区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'23', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'深圳市泰永电气科技有限..', N'深圳市泰永电气科技有限公司以下简称泰永电气创立于1994年公司总部位于深圳国内专业电气及控制系统研究及整体解决方案供应商高新技术企业泰永科技斥资建设的长九工业园是中国规模的低压电器现代化生产基地之一_x000d__x000d_        泰永电气在全国主要城市建立四十多个分支机构经销商网络遍及全国各省市2008年泰永重组贵州长征电气低压电器事业部(原长征电气九厂和一厂低压)成立贵州长征开关制造有限公司将泰永的管理理念营销优势与长九四十多年制造工艺研发实力及行业影响力进行充分整合赋予长九品牌发展新使命旗下TYT泰永及长九两个品牌现为中国电器工业影响力品牌', NULL, N'1', N'广东-深圳市-南山区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'25', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'国新能源', N'该企业暂未填写公司简介', NULL, N'1', N'河南-郑州市')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'26', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'东方电子', N'东方电子股份有限公司为深交所上市公司（股票代码：000682，A股 简称：东方电子），是国家重点扶持企业、火炬计划重点高新技术企业和山东省重点企业。历经半个世纪的发展与变迁，东方电子传承电力行业的领先优势，追随技术的不断进步与创新，拓展更加广泛的业务领域。
 作为奥运电力设备及国家智能电网的设备供应商，东方电子已发展成为集科研开发、生产经营、技术服务、系统集成于一体的大型高新技术企业，是中国能源管理系统解决方案的主要供应商之一，参加IEC（国际电工委员会）国际标准制定，是EMCA（中国节能协会节能服务产业委员会）主要成员。
 公司拥有计算机信息系统集成一级资质，国内市场占有率始终在中国电力自动化行业名列前茅。产品遍及东南亚、南亚、中东、非洲及欧洲等多个国家和地区，在国内同行业厂家中出口数量居首；顺利入围印度国家“十二?五”配电网改造计划，成为唯一一家印度国家电网指定的中国电网设备供应商。
 公司以“珍爱环境，节约资源”为愿景，把环保、节能、安全、智能融入业务流程中，在智能电网、环保节能等领域为电力、大型厂矿企业、政府部门、居民小区等提供能源管理和节能服务系统解决方案。', NULL, N'1', N'山东-烟台市-芝罘区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'27', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'天合光能', N'未找到公司信息', NULL, N'1', N'江苏-常州市-新北区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'28', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'浙江奔一', N'未找到公司信息', NULL, N'1', N'浙江-温州市-乐清市')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'29', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'特变电工衡阳变压器有限..', N'未找到公司信息', NULL, N'1', N'湖南-衡阳市-雁峰区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'30', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'天顺智能', N'未找到公司信息', NULL, N'1', N'广东-深圳市')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'31', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'神马电力', N'未找到公司信息', NULL, N'1', N'江苏-南通市-如皋市')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'33', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'湖北方源东力', N'未找到公司信息', NULL, N'1', N'湖北-武汉市-洪山区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'34', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'杭州品联科技有限公司', N'未找到公司信息', NULL, N'1', N'未知')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'46', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'长园深瑞继保自动化有限..', N'未找到公司信息', NULL, N'1', N'未知')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'32', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'沃瑞电力', N'杭州沃瑞电力科技有限公司，是一家以浙江大学产学研为基础的规范化、创新化、工程化的高新技术企业，公司的核心人员以浙江大学的教授、博士、硕士毕业生、海外归国留学人员与电力行业的专家为主，依托浙江大学的研发优势，以“无限创新、永恒服务”的企业精神和“科技体现价值，真诚追求卓越”的企业文化，专业研发、生产、销售电网高级应用系统，为坚强智能电网提供相关产品和技术支持、工程实施、系统集成以及售后服务等工作。
     公司在电力系统领域曾获得的奖项有：2004年浙江省电力公司科技进步二等奖、2005年浙江省电力公司科技进步二等奖、2006年河南省电力公司科技进步一等奖、2007年国家电网公司科技进步二等奖、2007年福建省科技进步二等奖、2007年福建省科技进步二等奖、2007年、2008年福建省电力公司科技进步一等奖、2008年浙江省电力公司科技进步二等奖、2009年浙江省电力公司科技进步一等奖、2009年浙江省科技进步二等奖、2010年浙江省电力公司科技进步二等奖、、2010年浙江省电力公司科技进步三等奖。
     一个人能走多远，取决于与谁同行，企业也是如此。杭州沃瑞电力科技有限公司在与著名院校浙江大学以及世界知名企业一路同行的日子里，企业态势蒸蒸日上，发展成熟稳健。
    “鸿鹄之志，合力进取”，展望未来，公司将秉持“与广大用户共赢，与合作伙伴共赢”的经营理念，聚合精英力量，整合行业资源，不断提升企业的核心竞争能力，提升企业的经济效益，并竭诚为电力行业提供更加完善优质的综合服务。
     沃瑞电力更是您个人发展的合作伙伴，我们不仅为您提供具有行业竞争力的薪酬，富有挑战性的工作，优秀的发展平台、广阔的晋升空间，更有丰厚的福利待遇等着您！
     每年一次的高额健康体检，全方位为您的健康保驾护航；
     完善的社会保障体系，大额的意外保险为您解除后顾之忧；
     多层次的培训体系，帮您打造全方位的职业发展平台；
     丰富多彩的团队活动，年度旅游、季度生日会、登山郊游……最大程度为您丰富业余生活；
     再加上民主、平等、自由、开放的企业文化，会让您在“家”的氛围中，融洽工作，快乐生活！
     我们期待更多优秀人才带着智慧、热情和创造力加入沃瑞，和我们一起迎接机遇和挑战，期待您的加入！', NULL, N'1', N'浙江-杭州市-西湖区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'35', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'38', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'金风慧能', N'金风慧能2023届校园招聘简章 


	  


	金风科技介绍 


	       金风科技是全球可信赖的清洁能源战略合作伙伴，致力于推动能源变革，让人人可负担、可靠、可持续的能源惠及全球，构建“可持续更美好”的未来。金风科技深度聚焦能源开发、能源装备、能源服务、能源应用四大领域，以强大科研创新和最佳业务实践，将可再生能源的效率提升至新高度。作为在深交所、港交所两地上市的公司，金风科技多次入选“气候领袖企业”、“亚洲地区最受尊敬公司”、“最佳投资者关系公司”，并荣登“全球最具创新能力企业50强”、“全球最环保企业200强”、“全球新能源企业500 强”、“新财富最佳上市公司”、"《财富》中国500强"等多个影响力榜单。 


	  


	金风慧能介绍 


	      北京金风慧能技术有限公司（以下简称“金风慧能”），是新疆金风科技设份有限公司全资子公司，是全国领先的新能源数字化、智能化专业服务提供商，致力于帮助新能源发电企业优化资产性能，提高运营效率，提升发电收益。 


	      金风慧能在全国共设10个区域公司，5个新能源共享服务中心，150个常规备件库（包括15个中心库、135个区城库）和12个大部件储备库，目前拥有超过400名高级项目管理人员，650+名的技术专家，以及3000余名服务工程师。 


	      面向“双碳”新时代新匮景，金风慧能将秉承精诚合作、互惠共赢的发展理念、引领行业培育培养“创新服务、数字服务、人文服务、生态服务”，为全国新能源规模化资产管理及优化服务保驾护航。 


	
 


	2023届校园招聘岗位需求', NULL, N'1', N'北京-大兴区')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'58', N'特斯拉（Tesla）', N'民营企业', N'8', N'14', N'10000人以上', N'3', N'制造业', N'特斯拉（Tesla）', N'特斯拉（Tesla）是一家电动汽车及清洁能源行业跨国公司，总部位于美国得克萨斯州 [1] [175-176]，产销电动汽车、太阳能板、及储能设备与系统解决方案 [176]。现任CEO为埃隆·马斯克。 [178]
2003年7月1日 [179]，马丁·艾伯哈德和马克·塔彭宁联合创立“特斯拉汽车公司”。2004年，马斯克投资后任公司董事长。创立之初，因成本失控，公司一度陷入危机。2008年，艾伯哈德和塔彭宁先后离开公司 [177] [179]，马斯克出任CEO，着力进行改革、对外融资 [181]，同年，首款车型跑车Roadster问世 [2] [180]。2010年，特斯拉获得美国政府4.65亿美元低息贷款，并在纳斯达克上市后，开始稳定发展 [181-182]。2012年，第二款车型轿车Model S发布后，在世界范围刮起纯电动车热潮，公司首次扭亏为盈 [3] [182]。2014年，特斯拉宣布共享专利技术 [183]。此后，于2015年发布第三款车型SUV Model X [4-5] [152] [180]，于2017年推出电动车Model 3、电动卡车Tesla Semi，于2019年推出电动皮卡Cybertruck，以及SUV Model Y等产品，除电动车外，还推出了Powerwall、Powerpack、Megapack等电池产品 [180]，并逐步在中国、德国、韩国等地开办工厂 [1] [185]。2020年，特斯拉市值突破2100亿美元，成为全球市值最高车企 [184]，2021年，市值达到1.3万亿美元峰值后逐渐下降 [186]，截至2024年6月，特斯拉已累计生产超过600万辆电动车。 [315]2025年1月3日消息，特斯拉2024年中国市场的累计销量增长8.8%。', NULL, N'1', N'美国洛杉矶')
GO

INSERT INTO [dbo].[DATA_DWDMK] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'59', N'芯片研发部', N'民营企业', N'8', N'14', N'10000人以上', N'9', N'信息传输、软件和信息技术服务业', N'英伟达（NVIDIA）', N'英伟达（NVIDIA）是一家总部位于美国加利福尼亚州圣克拉拉的科技公司，成立于1993年。它以设计和制造图形处理单元（GPU）而闻名，尤其是在视频游戏、专业视觉化、数据中心和人工智能等领域。

### 主要业务领域

1. **图形处理单元（GPU）**：
   - 英伟达的GPU广泛应用于游戏、专业图形设计、科学计算和深度学习等领域。其GeForce系列显卡是游戏玩家的热门选择。

2. **人工智能（AI）**：
   - 英伟达在AI领域的贡献显著，推出了多款专为深度学习和机器学习优化的GPU，如Tesla和A100系列。其CUDA编程模型使得开发者能够高效利用GPU进行并行计算。

3. **数据中心**：
   - 英伟达提供用于数据中心的高性能计算解决方案，支持云计算和大数据分析。其DGX系统被广泛用于AI训练和推理。

4. **自动驾驶**：
   - 英伟达的Drive平台为自动驾驶汽车提供硬件和软件解决方案，支持感知、定位和决策等功能。

5. **游戏和虚拟现实**：
   - 除了硬件，英伟达还开发了多种软件技术，如NVIDIA G-SYNC和DLSS（深度学习超采样），提升游戏体验和画面质量。

### 发展历程

- **1993年**：公司成立，最初专注于图形加速卡的开发。
- **1999年**：推出GeForce 256，标志着GPU的诞生。
- **2006年**：推出CUDA，开启了GPU计算的新纪元。
- **2016年**：收购了深度学习公司Mellanox，进一步增强了在数据中心的实力。
- **2020年**：宣布收购ARM Holdings，尽管该交易在后续面临监管挑战。

### 未来展望

英伟达致力于推动计算技术的前沿，尤其是在AI、机器学习和自动驾驶等领域。随着这些技术的不断发展，英伟达在全球科技行业中的影响力也在不断增强。
', NULL, N'1', N'美国旧金山')
GO

SET IDENTITY_INSERT [dbo].[DATA_DWDMK] OFF
GO


-- ----------------------------
-- Table structure for DATA_DWDMK_luodeng
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DATA_DWDMK_luodeng]') AND type IN ('U'))
	DROP TABLE [dbo].[DATA_DWDMK_luodeng]
GO

CREATE TABLE [dbo].[DATA_DWDMK_luodeng] (
  [DWDM] int IDENTITY(1,1) NOT NULL,
  [DWMC] nvarchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [DWXZ] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [DWXZDM] int NOT NULL,
  [DWGMDM] int NOT NULL,
  [DWGM] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [DWHYDM] int NULL,
  [DWHY] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [GSMC] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [GSJJ] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [GSJJHTML] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [QYDM] int DEFAULT ((1)) NOT NULL,
  [SZDQ] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[DATA_DWDMK_luodeng] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位代码  ，单位代码库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'DWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位名称',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'DWMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位性质',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'DWXZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位性质代码，对应DWXZK 单位性质库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'DWXZDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位规模代码，对应DWGMK 单位规模库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'DWGMDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位规模，文本，存储',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'DWGM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位行业代码,对应DWHYDMK 单位行业代码库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'DWHYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位行业',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'DWHY'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公司名称',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'GSMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公司简介',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'GSJJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'公司（单位）简介Html内容',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'GSJJHTML'
GO

EXEC sp_addextendedproperty
'MS_Description', N'启用代码',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所在地区，不匹配其他表，即可以自由编辑',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng',
'COLUMN', N'SZDQ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位代码库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_DWDMK_luodeng'
GO


-- ----------------------------
-- Records of [DATA_DWDMK_luodeng]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DATA_DWDMK_luodeng] ON
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'1', N'卫宁', N'机关', N'1', N'14', N'10000人以上', N'20', N'国际组织', N'卫宁健康科技集团有限公司', N'卫宁', N'  <div class="container mx-auto px-4 py-8 max-w-4xl">  
        <header class="text-center mb-12">  
            <h1 class="text-4xl font-extrabold text-blue-700 mb-4">卫宁健康科技股份有限公司</h1>  
            <p class="text-xl text-gray-600">医疗信息化转型的引领者，健康科技创新的推动者</p>  
        </header>  

        <section class="bg-white shadow-lg rounded-lg p-8 mb-8">  
            <h2 class="text-2xl font-bold text-blue-600 border-b-2 border-blue-500 pb-3 mb-6">公司简介</h2>  
            <p class="text-gray-700">  
                卫宁健康成立于1998年，总部位于杭州，是中国医疗健康信息化领域的领先企业。公司致力于为医疗机构提供全面的数字化转型解决方案，以科技创新推动医疗行业的智能化发展。  
            </p>  
        </section>  

        <div class="grid md:grid-cols-2 gap-6">  
            <section class="bg-white shadow-md rounded-lg p-6">  
                <h3 class="text-xl font-semibold text-blue-600 mb-4">核心产品</h3>  
                <ul class="space-y-3">  
                    <li class="flex items-center">  
                        <svg class="w-6 h-6 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>  
                        </svg>  
                        医院信息管理系统(HIS)  
                    </li>  
                    <li class="flex items-center">  
                        <svg class="w-6 h-6 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>  
                        </svg>  
                        电子病历系统(EMR)  
                    </li>  
                    <li class="flex items-center">  
                        <svg class="w-6 h-6 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>  
                        </svg>  
                        实验室信息系统(LIS)  
                    </li>  
                </ul>  
            </section>  

            <section class="bg-white shadow-md rounded-lg p-6">  
                <h3 class="text-xl font-semibold text-blue-600 mb-4">技术优势</h3>  
                <div class="space-y-3">  
                    <div class="flex items-center">  
                        <span class="text-blue-500 mr-2">✓</span>  
                        大数据智能分析技术  
                    </div>  
                    <div class="flex items-center">  
                        <span class="text-blue-500 mr-2">✓</span>  
                        云计算医疗解决方案  
                    </div>  
                    <div class="flex items-center">  
                        <span class="text-blue-500 mr-2">✓</span>  
                        人工智能辅助诊断  
                    </div>  
                </div>  
            </section>  
        </div>  

        <section class="bg-white shadow-lg rounded-lg p-8 mt-8">  
            <h2 class="text-2xl font-bold text-blue-600 border-b-2 border-blue-500 pb-3 mb-6">社会价值</h2>  
            <p class="text-gray-700">  
                卫宁健康不仅是技术的提供者，更是医疗健康事业的推动者。我们通过持续的技术创新，助力医疗机构提高服务效率，为患者提供更优质、更便捷的医疗服务。  
            </p>  
        </section>  

        <footer class="text-center mt-8 text-gray-600">  
            <p>© 2024 卫宁健康科技股份有限公司 | 专注医疗信息化，服务健康美国！！！</p>  
        </footer>  
    </div>  ', N'1', N'上海市浦东区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'2', N'销售部', N'民营企业', N'8', N'13', N'5000-10000人', N'9', N'信息传输、软件和信息技术服务业', N'阿里巴巴集团', N'阿里巴巴集团成立于1999年，是一家全球领先的互联网和科技公司，致力于为消费者和企业提供全面的数字经济服务。', N'阿里巴巴集团成立于1999年，是一家全球领先的互联网和科技公司，致力于为消费者和企业提供全面的数字经济服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'3', N'开发部', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'腾讯控股有限公司', N'腾讯是一家中国领先的互联网增值服务提供商，旗下拥有社交、游戏、金融等多个业务板块。', N'腾讯是一家中国领先的互联网增值服务提供商，旗下拥有社交、游戏、金融等多个业务板块。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'4', N'百度', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'百度公司', N'百度是中国最大的搜索引擎公司，致力于通过技术创新推动人工智能的发展。', N'百度是中国最大的搜索引擎公司，致力于通过技术创新推动人工智能的发展。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'5', N'华为', N'民营企业', N'8', N'12', N'1000-5000人', N'4', N'电力、热力、燃气及水生产和供应业', N'华为技术有限公司', N'华为是一家全球领先的信息与通信技术（ICT）解决方案供应商，致力于为客户提供创新的技术和服务。', N'华为是一家全球领先的信息与通信技术（ICT）解决方案供应商，致力于为客户提供创新的技术和服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'6', N'中国移动', N'国有企业', N'7', N'12', N'1000-5000人', N'7', N'交通运输、仓储和邮政业', N'中国移动通信集团公司', N'中国移动是全球最大的移动通信运营商，提供全面的移动通信服务。', N'中国移动是全球最大的移动通信运营商，提供全面的移动通信服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'7', N'中国电信', N'国有企业', N'7', N'12', N'1000-5000人', N'7', N'交通运输、仓储和邮政业', N'中国电信集团公司', N'中国电信是中国主要的电信运营商之一，提供固定电话、移动电话和宽带等服务。', N'中国电信是中国主要的电信运营商之一，提供固定电话、移动电话和宽带等服务。', N'1', N'北京市朝阳区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'8', N'中国联通', N'国有企业', N'7', N'12', N'1000-5000人', N'7', N'交通运输、仓储和邮政业', N'中国联合网络通信有限公司', N'中国联通是中国主要的电信运营商之一，提供多种通信服务。', N'中国联通是中国主要的电信运营商之一，提供多种通信服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'9', N'京东', N'民营企业', N'8', N'12', N'1000-5000人', N'6', N'批发和零售业', N'京东集团', N'京东是中国最大的自营式电商企业，提供丰富的商品和优质的服务。', N'京东是中国最大的自营式电商企业，提供丰富的商品和优质的服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'10', N'美团', N'民营企业', N'8', N'12', N'1000-5000人', N'8', N'住店和餐饮业', N'美团点评', N'美团是一家综合性互联网服务平台，提供外卖、酒店、旅游等多种服务。', N'美团是一家综合性互联网服务平台，提供外卖、酒店、旅游等多种服务。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'11', N'字节跳动', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'字节跳动有限公司', N'字节跳动是一家全球领先的科技公司，旗下拥有抖音、今日头条等多个知名产品。', N'字节跳动是一家全球领先的科技公司，旗下拥有抖音、今日头条等多个知名产品。', N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'13', N'广西实施部', N'民营企业', N'8', N'14', N'10000人以上', N'9', N'信息传输、软件和信息技术服务业', N'罗式科技集团股份有限公司', N'123', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'15', N'信息科', N'医疗卫生单位', N'5', N'11', N'500-1000人', N'17', N'卫生和社会工作', N'麻栗坡县中医院', N'### 罗式科技集团有限公司简介

**公司概况**

罗式科技集团有限公司（LuoShi Technology Group Co., Ltd.）成立于2005年，总部位于中国深圳，是一家专注于高科技产品研发、生产和销售的综合性企业。公司致力于为全球客户提供创新的科技解决方案，涵盖智能硬件、软件开发、物联网（IoT）、人工智能（AI）等多个领域。经过多年的发展，罗式科技已成为行业内的领先企业，拥有一支高素质的研发团队和完善的销售网络。

**发展历程**

罗式科技自成立以来，始终坚持“创新、质量、服务”的发展理念。2006年，公司推出了第一款智能家居产品，迅速在市场上获得了良好的反响。2008年，罗式科技开始进军国际市场，产品远销欧美、东南亚等地区，逐步建立起全球销售网络。

2012年，公司在深圳证券交易所成功上市，成为公众公司，进一步增强了资金实力和市场竞争力。2015年，罗式科技加大了对研发的投入，成立了多个研发中心，专注于人工智能和物联网技术的研究与应用。2018年，公司推出了基于AI技术的智能家居系统，受到了市场的广泛欢迎。

**核心业务**

罗式科技的核心业务包括以下几个方面：

1. **智能硬件**：公司研发和生产各类智能硬件产品，包括智能家居设备、智能穿戴设备、智能安防系统等。通过先进的技术和设计，罗式科技的产品在市场上具有较高的竞争力。

2. **软件开发**：罗式科技拥有一支专业的软件开发团队，提供定制化的软件解决方案，包括移动应用、云计算平台和大数据分析等。公司致力于为客户提供高效、稳定的软件产品。

3. **物联网解决方案**：罗式科技在物联网领域具有丰富的经验，提供从设备连接到数据分析的全套解决方案。公司帮助客户实现智能化管理，提高生产效率和资源利用率。

4. **人工智能应用**：公司积极探索人工智能技术在各行业的应用，开发了多款基于AI的产品和服务，包括智能客服、智能监控和智能推荐系统等。

**技术创新**

罗式科技始终将技术创新作为企业发展的核心动力。公司与多所高校和科研机构建立了紧密的合作关系，积极参与国家和地方的科技项目。通过不断的技术积累和创新，罗式科技在智能硬件、软件开发和物联网等领域取得了多项专利和技术认证。

**市场与客户**

罗式科技的客户涵盖了家居、安防、医疗、教育、交通等多个行业。公司通过不断优化产品和服务，赢得了客户的信赖和支持。罗式科技注重客户体验，建立了完善的售后服务体系，确保客户在使用产品过程中能够获得及时的支持和帮助。

**企业文化**

罗式科技倡导“以人为本、创新驱动”的企业文化，注重员工的培训和发展。公司定期组织各类培训和团队建设活动，鼓励员工积极参与创新和改进。通过营造良好的工作氛围，罗式科技吸引和留住了大量优秀人才，为公司的持续发展提供了强有力的支持。

**社会责任**

作为一家负责任的企业，罗式科技积极参与社会公益活动，关注环境保护和可持续发展。公司在生产过程中严格遵循环保标准，努力减少对环境的影响。同时，罗式科技还积极参与教育、扶贫等公益项目，回馈社会，推动社会的进步与发展。

**未来展望**

展望未来，罗式科技将继续秉持“创新、质量、服务”的理念，致力于成为全球领先的科技企业。公司将加大对研发的投入，拓展国际市场，推动产品的智能化和数字化转型。通过不断的创新和努力，罗式科技希望为客户创造更大的价值，为社会的发展贡献更多的力量。

### 结语

罗式科技集团有限公司凭借其卓越的技术实力和市场敏锐度，在激烈的市场竞争中脱颖而出。未来，罗式科技将继续以科技创新为驱动力，推动行业的发展与变革，努力实现更高的目标。
', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'16', N'麻栗坡县人民医院 信息科', N'医疗卫生单位', N'5', N'11', N'500-1000人', N'19', N'公共管理、社会保障和社会组织', N'云南医药器械有限公司', N'无', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'17', N'东软运维部', N'民营企业', N'8', N'11', N'500-1000人', N'9', N'信息传输、软件和信息技术服务业', N'东软集团股份有限公司', N'东软是个大公司！', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'18', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'中大恒润', N'湖北中大恒润能源工程有限公司位于湖北武汉东湖高新技术开发区，是一家较早专注和开展新能源电动汽车充电设施、电网输变电工程、城农网工程和新能源（风电、光伏等）设计、施工的高新技术企业。公司拥有一批专业种类完整的高素质技术和管理团队，为客户涉电工程提供科学、精准、及时的全程服务，以服务赢得客户信赖。 


	  公司具有电力行业送变电工程设计乙级资质、新能源工程咨询丙级资质和工程测绘乙级资质证书。并通过ISO9001质量、ISO14001环境和OHSAS18001职业健康安全三体系认证。2015年至今，我公司设计电动汽车充电站186座、110千伏变电站20多座、110千伏线路工程30多条、10～35千伏配网线路工程800多条、住宅配套工程180多项、新能源光伏项目30多项。', NULL, N'1', N'湖北-武汉市-洪山区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'19', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'中大恒润', N'湖北中大恒润能源工程有限公司位于湖北武汉东湖高新技术开发区，是一家较早专注和开展新能源电动汽车充电设施、电网输变电工程、城农网工程和新能源（风电、光伏等）设计、施工的高新技术企业。公司拥有一批专业种类完整的高素质技术和管理团队，为客户涉电工程提供科学、精准、及时的全程服务，以服务赢得客户信赖。 


	  公司具有电力行业送变电工程设计乙级资质、新能源工程咨询丙级资质和工程测绘乙级资质证书。并通过ISO9001质量、ISO14001环境和OHSAS18001职业健康安全三体系认证。2015年至今，我公司设计电动汽车充电站186座、110千伏变电站20多座、110千伏线路工程30多条、10～35千伏配网线路工程800多条、住宅配套工程180多项、新能源光伏项目30多项。', NULL, N'1', N'湖北-武汉市-洪山区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'20', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'鑫邦电气', N'<br />
	<br />
		江西鑫邦电气有限公司拥有雄厚的资本，现有在册员工232人，工厂占地面积30亩地，厂房、办公室楼建筑面积1.8万平方米，注册基本2000万。公司具有大专以上学历的占37.9%，其中高级工程师8人，工程师及经济师10人。公司产品获得国家CCC认证，被评为国家名辉产品，有中国人民保险公司承保，企业通过ISO9001：2000质量体系认证，并被评为“AAA”级资格企业。<br />
鑫邦电气主要从事高/低成套设备，防窃电产品生产与销售，主要产品有：JP户外配变补偿控制柜、GGJ低压无功补偿控制柜、MNS低压抽出式开关柜、XB-FDCP低压电能计量箱、DFW低压电缆分支箱、GGD交流低压配电柜、KYN28-12铠装移开式交流金属封闭开关柜、SH15非晶合金电力变压器、XB.FDCPX防窃电电表箱等一系列产品。<br />
	<br />
<br />
<br />
	展开<br />', NULL, N'1', N'未知')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'21', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'一览新能源猎头', N'未找到公司信息', NULL, N'1', N'未知')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'22', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'正运动技术', N'深圳市正运动技术有限公司成立于2013年，专注于纯国产运动控制技术研究和通用运动控制软硬件平台和产品
的研发，是国家级高新技术和专精特新“小巨人”企业。
正运动技术汇集了来自华为、中兴等公司的优秀人才。力求创新，目前公司拥有专利、著作权等知识产权五十
余项。在坚持自主创新的同时，积极联合各大高校和科研院所协同运动控制基础技术的研究，是国内工控领域发展
最快的企业之一，也是国内少有完整掌握运动控制核心技术和实时工控软件平台技术的企业。
正运动技术除本部研发中心外，设有中山、武汉、上海三个研发分部。为更好地服务客户，本部之外设有苏
州、东莞两个区域性服务中心，设有佛山、厦门、青岛、西安、武汉、成都、天津、郑州等销售和技术服务机构。
经过众多合作伙伴多年的开发应用，正运动技术的产品广泛地应用于3C电子、半导体、新能源、机器人、包装
印刷、纺织服装、激光加工、医疗制药、数控机床、传统加工等领域。', NULL, N'1', N'广东-深圳市-宝安区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'23', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'深圳市泰永电气科技有限..', N'深圳市泰永电气科技有限公司以下简称泰永电气创立于1994年公司总部位于深圳国内专业电气及控制系统研究及整体解决方案供应商高新技术企业泰永科技斥资建设的长九工业园是中国规模的低压电器现代化生产基地之一_x000d__x000d_        泰永电气在全国主要城市建立四十多个分支机构经销商网络遍及全国各省市2008年泰永重组贵州长征电气低压电器事业部(原长征电气九厂和一厂低压)成立贵州长征开关制造有限公司将泰永的管理理念营销优势与长九四十多年制造工艺研发实力及行业影响力进行充分整合赋予长九品牌发展新使命旗下TYT泰永及长九两个品牌现为中国电器工业影响力品牌', NULL, N'1', N'广东-深圳市-南山区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'24', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'深圳市泰永电气科技有限..', N'深圳市泰永电气科技有限公司以下简称泰永电气创立于1994年公司总部位于深圳国内专业电气及控制系统研究及整体解决方案供应商高新技术企业泰永科技斥资建设的长九工业园是中国规模的低压电器现代化生产基地之一_x000d__x000d_        泰永电气在全国主要城市建立四十多个分支机构经销商网络遍及全国各省市2008年泰永重组贵州长征电气低压电器事业部(原长征电气九厂和一厂低压)成立贵州长征开关制造有限公司将泰永的管理理念营销优势与长九四十多年制造工艺研发实力及行业影响力进行充分整合赋予长九品牌发展新使命旗下TYT泰永及长九两个品牌现为中国电器工业影响力品牌', NULL, N'1', N'广东-深圳市-南山区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'25', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'国新能源', N'该企业暂未填写公司简介', NULL, N'1', N'河南-郑州市')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'26', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'东方电子', N'东方电子股份有限公司为深交所上市公司（股票代码：000682，A股 简称：东方电子），是国家重点扶持企业、火炬计划重点高新技术企业和山东省重点企业。历经半个世纪的发展与变迁，东方电子传承电力行业的领先优势，追随技术的不断进步与创新，拓展更加广泛的业务领域。
 作为奥运电力设备及国家智能电网的设备供应商，东方电子已发展成为集科研开发、生产经营、技术服务、系统集成于一体的大型高新技术企业，是中国能源管理系统解决方案的主要供应商之一，参加IEC（国际电工委员会）国际标准制定，是EMCA（中国节能协会节能服务产业委员会）主要成员。
 公司拥有计算机信息系统集成一级资质，国内市场占有率始终在中国电力自动化行业名列前茅。产品遍及东南亚、南亚、中东、非洲及欧洲等多个国家和地区，在国内同行业厂家中出口数量居首；顺利入围印度国家“十二?五”配电网改造计划，成为唯一一家印度国家电网指定的中国电网设备供应商。
 公司以“珍爱环境，节约资源”为愿景，把环保、节能、安全、智能融入业务流程中，在智能电网、环保节能等领域为电力、大型厂矿企业、政府部门、居民小区等提供能源管理和节能服务系统解决方案。', NULL, N'1', N'山东-烟台市-芝罘区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'27', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'天合光能', N'未找到公司信息', NULL, N'1', N'江苏-常州市-新北区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'28', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'浙江奔一', N'未找到公司信息', NULL, N'1', N'浙江-温州市-乐清市')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'29', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'特变电工衡阳变压器有限..', N'未找到公司信息', NULL, N'1', N'湖南-衡阳市-雁峰区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'30', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'天顺智能', N'未找到公司信息', NULL, N'1', N'广东-深圳市')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'31', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'神马电力', N'未找到公司信息', NULL, N'1', N'江苏-南通市-如皋市')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'32', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'沃瑞电力', N'杭州沃瑞电力科技有限公司，是一家以浙江大学产学研为基础的规范化、创新化、工程化的高新技术企业，公司的核心人员以浙江大学的教授、博士、硕士毕业生、海外归国留学人员与电力行业的专家为主，依托浙江大学的研发优势，以“无限创新、永恒服务”的企业精神和“科技体现价值，真诚追求卓越”的企业文化，专业研发、生产、销售电网高级应用系统，为坚强智能电网提供相关产品和技术支持、工程实施、系统集成以及售后服务等工作。
     公司在电力系统领域曾获得的奖项有：2004年浙江省电力公司科技进步二等奖、2005年浙江省电力公司科技进步二等奖、2006年河南省电力公司科技进步一等奖、2007年国家电网公司科技进步二等奖、2007年福建省科技进步二等奖、2007年福建省科技进步二等奖、2007年、2008年福建省电力公司科技进步一等奖、2008年浙江省电力公司科技进步二等奖、2009年浙江省电力公司科技进步一等奖、2009年浙江省科技进步二等奖、2010年浙江省电力公司科技进步二等奖、、2010年浙江省电力公司科技进步三等奖。
     一个人能走多远，取决于与谁同行，企业也是如此。杭州沃瑞电力科技有限公司在与著名院校浙江大学以及世界知名企业一路同行的日子里，企业态势蒸蒸日上，发展成熟稳健。
    “鸿鹄之志，合力进取”，展望未来，公司将秉持“与广大用户共赢，与合作伙伴共赢”的经营理念，聚合精英力量，整合行业资源，不断提升企业的核心竞争能力，提升企业的经济效益，并竭诚为电力行业提供更加完善优质的综合服务。
     沃瑞电力更是您个人发展的合作伙伴，我们不仅为您提供具有行业竞争力的薪酬，富有挑战性的工作，优秀的发展平台、广阔的晋升空间，更有丰厚的福利待遇等着您！
     每年一次的高额健康体检，全方位为您的健康保驾护航；
     完善的社会保障体系，大额的意外保险为您解除后顾之忧；
     多层次的培训体系，帮您打造全方位的职业发展平台；
     丰富多彩的团队活动，年度旅游、季度生日会、登山郊游……最大程度为您丰富业余生活；
     再加上民主、平等、自由、开放的企业文化，会让您在“家”的氛围中，融洽工作，快乐生活！
     我们期待更多优秀人才带着智慧、热情和创造力加入沃瑞，和我们一起迎接机遇和挑战，期待您的加入！', NULL, N'1', N'浙江-杭州市-西湖区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'33', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'湖北方源东力', N'未找到公司信息', NULL, N'1', N'湖北-武汉市-洪山区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'34', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'杭州品联科技有限公司', N'未找到公司信息', NULL, N'1', N'未知')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'35', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'36', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'37', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'38', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'金风慧能', N'金风慧能2023届校园招聘简章 


	  


	金风科技介绍 


	       金风科技是全球可信赖的清洁能源战略合作伙伴，致力于推动能源变革，让人人可负担、可靠、可持续的能源惠及全球，构建“可持续更美好”的未来。金风科技深度聚焦能源开发、能源装备、能源服务、能源应用四大领域，以强大科研创新和最佳业务实践，将可再生能源的效率提升至新高度。作为在深交所、港交所两地上市的公司，金风科技多次入选“气候领袖企业”、“亚洲地区最受尊敬公司”、“最佳投资者关系公司”，并荣登“全球最具创新能力企业50强”、“全球最环保企业200强”、“全球新能源企业500 强”、“新财富最佳上市公司”、"《财富》中国500强"等多个影响力榜单。 


	  


	金风慧能介绍 


	      北京金风慧能技术有限公司（以下简称“金风慧能”），是新疆金风科技设份有限公司全资子公司，是全国领先的新能源数字化、智能化专业服务提供商，致力于帮助新能源发电企业优化资产性能，提高运营效率，提升发电收益。 


	      金风慧能在全国共设10个区域公司，5个新能源共享服务中心，150个常规备件库（包括15个中心库、135个区城库）和12个大部件储备库，目前拥有超过400名高级项目管理人员，650+名的技术专家，以及3000余名服务工程师。 


	      面向“双碳”新时代新匮景，金风慧能将秉承精诚合作、互惠共赢的发展理念、引领行业培育培养“创新服务、数字服务、人文服务、生态服务”，为全国新能源规模化资产管理及优化服务保驾护航。 


	
 


	2023届校园招聘岗位需求', NULL, N'1', N'北京-大兴区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'39', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'40', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'41', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'42', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'43', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'44', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'金风慧能', N'金风慧能2023届校园招聘简章 


	  


	金风科技介绍 


	       金风科技是全球可信赖的清洁能源战略合作伙伴，致力于推动能源变革，让人人可负担、可靠、可持续的能源惠及全球，构建“可持续更美好”的未来。金风科技深度聚焦能源开发、能源装备、能源服务、能源应用四大领域，以强大科研创新和最佳业务实践，将可再生能源的效率提升至新高度。作为在深交所、港交所两地上市的公司，金风科技多次入选“气候领袖企业”、“亚洲地区最受尊敬公司”、“最佳投资者关系公司”，并荣登“全球最具创新能力企业50强”、“全球最环保企业200强”、“全球新能源企业500 强”、“新财富最佳上市公司”、"《财富》中国500强"等多个影响力榜单。 


	  


	金风慧能介绍 


	      北京金风慧能技术有限公司（以下简称“金风慧能”），是新疆金风科技设份有限公司全资子公司，是全国领先的新能源数字化、智能化专业服务提供商，致力于帮助新能源发电企业优化资产性能，提高运营效率，提升发电收益。 


	      金风慧能在全国共设10个区域公司，5个新能源共享服务中心，150个常规备件库（包括15个中心库、135个区城库）和12个大部件储备库，目前拥有超过400名高级项目管理人员，650+名的技术专家，以及3000余名服务工程师。 


	      面向“双碳”新时代新匮景，金风慧能将秉承精诚合作、互惠共赢的发展理念、引领行业培育培养“创新服务、数字服务、人文服务、生态服务”，为全国新能源规模化资产管理及优化服务保驾护航。 


	
 


	2023届校园招聘岗位需求', NULL, N'1', N'北京-大兴区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'45', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'三一重能2023校招', N'三一重能2023届校园招聘-招聘简章


	 


	一、公司简介


	三一集团成立于1989年，主业是以“工程”为主题的装备制造业。目前，三一混凝土机械稳居世界第一品牌；挖掘机械在2020年首夺全球销量冠军，在国内市场已连续十一年全面蝉联销量冠军；大吨位起重机械、履带起重机械、桩工机械、煤炭掘进机械、港口机械稳居中国第一。


	在财富杂志“最受赞赏的中国公司”名单中，三一集团连续十一次上榜，并连续三年高居制造业榜首。


	三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者。2022年6月22日，在上交所科创板成功上市，股票代码：688349。近年来，三一重能市场占有率持续提升，成为全球综合排名前十、中国陆上前五的风电整机商（数据来源：BNEF）。


	三一重能主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理以及光伏电站建设运营管理业务。三一重能通过整合全球顶级研发资源，持续打造具有竞争优势的风机产品;具备独立进行风电场设计、建设和运营的能力;形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。


	三一重能秉承“智造创领未来”的理念，以“推动人类高效使用清洁能源”为愿景，致力于将三一重能打造成风电行业的“三一重工”，为中国实现“碳达峰、碳中和”和世界清洁能源转型贡献力量。


	二、岗位需求


	招聘对象：2023届本科、硕士、博士毕业生，毕业时间为2022年9月-2023年8月；


	工作地点：北京、长沙、韶山、张家口、通榆、西安、巴彦淖尔、海外；


	招聘职位：


	研发技术类


	机械设计、CAE仿真、载荷计算、验证分析、水冷设计、电机结构、电磁设计、电气设计、并网仿真、控制软件、控制算法、产品规划、叶片结构、叶片工艺、叶片材料、海外研发工程师


	数字化IT类


	数据挖掘、软件开发、IT业务需求分析、电气控制、数字化工艺、工装设计、复合材料工艺工程师


	营销服务类


	国内营销经理、国际营销经理、营销技术专员、品牌宣传专员、营销管理专员、投标专员、服务工程师、调试工程师


	智能制造类


	制造管理专员、交付专员、国内物流专员、供应商质量工程师、过程质量工程师、研发质量工程师、计量理化工程师、售后质量工程师、质量体系工程师


	经营管理类


	总账专员、成本管控专员、费用管控专员、品类管理专员、采购执行专员、供应商管理专员、督办专员、人力资源专员、行政专员


	三、薪资福利


	薪资结构：基本工资+年终奖金+其他奖金；


	基本工资+年终奖：


	软件算法类——本科19W-41W；硕士29W-57W；博士个性化定制；


	研发技术类——本科16W-36W；硕士22W-52W；博士个性化定制； 


	经营管理类——本科11W-22W；硕士14W-25W；博士个性化定制；


	年终奖金：经营管理岗1-4个月；研发岗2-6个月（根据绩效等级评定）；


	其他奖金：利润分享、增量毛利奖、股权激励、项目提奖等；


	福利待遇：永久食宿、北京户口指标、单列计划、长沙人才补贴、足额五险一金、带薪年假、节日物资、服装福利、三一节假期等；


	四、校招流程


	1、进行网申——线上测评——专业笔试（部分岗位）——专业面试（以远程面试为主，请同学们关注短信邮件及AI电话面试邀约通知）——终面——offer发放', NULL, N'1', N'北京-昌平区')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'46', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'长园深瑞继保自动化有限..', N'未找到公司信息', NULL, N'1', N'未知')
GO

INSERT INTO [dbo].[DATA_DWDMK_luodeng] ([DWDM], [DWMC], [DWXZ], [DWXZDM], [DWGMDM], [DWGM], [DWHYDM], [DWHY], [GSMC], [GSJJ], [GSJJHTML], [QYDM], [SZDQ]) VALUES (N'47', N'', N'民营企业', N'8', N'12', N'1000-5000人', N'9', N'信息传输、软件和信息技术服务业', N'长园深瑞继保自动化有限..', N'未找到公司信息', NULL, N'1', N'未知')
GO

SET IDENTITY_INSERT [dbo].[DATA_DWDMK_luodeng] OFF
GO


-- ----------------------------
-- Table structure for DATA_GWDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DATA_GWDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[DATA_GWDMK]
GO

CREATE TABLE [dbo].[DATA_GWDMK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [GWMC] nvarchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [GWMS] nvarchar(1000) COLLATE Chinese_PRC_CI_AS NULL,
  [GWYQ] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [FBSJ] datetime NULL,
  [TDSM] nvarchar(1000) COLLATE Chinese_PRC_CI_AS NULL,
  [ZGXZ] float(53) NULL,
  [ZDXZ] float(53) NULL,
  [ZDXLYQ] int NULL,
  [GZDD] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [GZSF] int NULL,
  [SXBZ] int NULL,
  [ZYXZ] nvarchar(100) COLLATE Chinese_PRC_CI_AS DEFAULT ('无限制') NULL,
  [DWMC] nvarchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [DWDM] int NOT NULL,
  [TDCS] int DEFAULT ((0)) NOT NULL,
  [TDXZBZ] int DEFAULT ((0)) NULL,
  [TDXZCS] int NULL,
  [QYDM] int DEFAULT ((1)) NOT NULL,
  [ZPRS] int NULL,
  [JYHJ] int NULL,
  [JYHJMS] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [GZZZ] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [GWFL] int NULL,
  [FBZ] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [FBZYHSFDM] int NULL
)
GO

ALTER TABLE [dbo].[DATA_GWDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位id',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位名称',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'GWMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位描述',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'GWMS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位要求',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'GWYQ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位发布时间',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'FBSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'投递说明',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'TDSM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'最高薪资',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'ZGXZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'最低薪资',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'ZDXZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'最低学历要求',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'ZDXLYQ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'工作地点',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'GZDD'
GO

EXEC sp_addextendedproperty
'MS_Description', N'工作省份，对应SFDMK 省份代码库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'GZSF'
GO

EXEC sp_addextendedproperty
'MS_Description', N'实习标志,1为实习岗位，2为正式岗位',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'SXBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'专业限制',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'ZYXZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位名称',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'DWMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位代码,对应DWDMK',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'DWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'投递次数',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'TDCS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'投递限制标志，默认0',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'TDXZBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'投递限制次数，若TDXZBZ为0则设置为空',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'TDXZCS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'启用代码',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'招聘人数',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'ZPRS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'就业环境(图)',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'JYHJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'就业环境吗描述',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'JYHJMS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'工作职责',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'GZZZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位分类，对应GWFLK id',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'GWFL'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布者用户名',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'FBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布者用户身份代码，对应YHSFDMK',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK',
'COLUMN', N'FBZYHSFDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位代码库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_GWDMK'
GO


-- ----------------------------
-- Records of [DATA_GWDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DATA_GWDMK] ON
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'4', N'数据科学家', N'数据科学家岗位描述：

1. 负责数据建模：利用统计学和机器学习知识，构建和优化数据模型，以解决具体业务问题，提升决策支持能力。

2. 算法优化：针对现有算法进行性能分析和改进，提升算法的准确性和效率，确保能够高效处理大规模数据集。

3. 数据分析：深入分析数据，挖掘潜在趋势和模式，支持业务战略制定和执行。

4. 跨部门协作：与产品经理、工程师和其他团队紧密合作，确保数据模型与业务目标相一致，推动项目落地。

5. 数据可视化：对分析结果进行可视化展示，帮助团队理解数据洞见，支持数据驱动决策。

6. 持续学习：关注行业动态和新技术，持续提升自身技能，以保持在数据科学领域的竞争力。 

职位要求：
- 计算机科学、数学、统计学等相关专业硕士或博士学位。
- 熟练掌握Python、R等编程语言，了解常用的数据科学工具和框架。
- 具有扎实的数学和统计基础，熟悉机器学习算法及其应用。
- 具备良好的沟通能力，能够清晰阐述技术问题和解决方案。', N'计算机、数学或相关专业，熟悉机器学习', N'2024-03-30 08:00:00.000', N'请发送简历至hr@example.com', N'30000.000000000000000', N'15000.000000000000000', N'6', N'北京市海淀区', N'21', N'2', N'计算机科学', N'销售部', N'2', N'5', N'0', N'-1', N'1', N'3', N'0', N'null', N'数据科学家的主要工作职责通常包括以下几个方面：

1. **数据收集与清洗**：从各种数据源（如数据库、API、爬虫等）收集数据，并对数据进行清洗和预处理，以确保数据的质量和可用性。

2. **数据分析**：使用统计分析、探索性数据分析等方法，从数据中提取有意义的洞察和信息。

3. **建模与预测**：运用机器学习和统计模型建立预测模型，解决具体业务问题，如分类、回归、聚类等。

4. **数据可视化**：将分析结果通过图表和报告等形式可视化，以便于向非技术人员传达信息，帮助决策。

5. **算法优化**：不断调整和优化模型和算法，以提高预测的准确性和效率。

6. **多部门协作**：与产品经理、工程师、业务团队等协调合作，了解业务需求，并将数据分析的结果转化为实际应用。

7. **文档与报告**：撰写技术文档和项目报告，记录分析过程、结果和业务建议。

8. **技术更新与学习**：保持对新技术、新方法的学习和研究，持续改进数据处理和分析的能力。

9. **数据治理与合规**：确保数据使用符合相关法律法规，并关注数据隐私和安全问题。

以上职责可能因公司、行业和项目的不同而有所差异，但总体上，数据科学家的工作旨在利用数据推动业务决策和战略发展。', N'7', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'5', N'市场分析师', N'进行市场趋势分析与报告撰写', N'市场营销或相关专业，具备良好的分析能力', N'2024-04-01 16:00:00.000', N'投递简历请附上个人作品', N'20000.000000000000000', N'10000.000000000000000', N'5', N'上海市浦东新区', N'21', N'2', N'市场营销', N'开发部', N'3', N'10', N'0', N'-1', N'1', N'2', N'0', N'null', N'null', N'2', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'6', N'产品设计师', N'负责产品设计与用户体验优化', N'设计专业，熟练使用设计软件', N'2024-04-02 08:00:00.000', N'请附上作品集', N'25000.000000000000000', N'12000.000000000000000', N'6', N'广州市天河区', N'21', N'2', N'视觉传达', N'百度', N'4', N'8', N'1', N'90', N'1', N'4', N'0', N'null', N'null', N'0', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'7', N'后端开发工程师', N'负责服务器端开发与维护', N'熟悉Python或Java', N'2024-04-03 16:00:00.000', N'请附上项目经验', N'22000.000000000000000', N'11000.000000000000000', N'7', N'深圳市南山区', N'21', N'2', N'计算机科学', N'华为', N'5', N'6', N'0', N'-1', N'1', N'3', N'0', N'null', N'null', N'1', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'8', N'数据运营专员', N'负责数据的日常维护与分析', N'统计学或相关专业，熟悉Excel', N'2024-04-05 00:00:00.000', N'请发送简历至hr@example.com', N'18000.000000000000000', N'9000.000000000000000', N'5', N'杭州市西湖区！！', N'21', N'2', N'统计学', N'京东', N'9', N'4', N'0', N'-1', N'1', N'2', N'0', N'null', N'null', NULL, N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'9', N'前端开发工程师', N'负责网站前端开发与维护', N'熟悉HTML、CSS、JavaScript', N'2024-04-05 00:00:00.000', N'简历请发送至hr@example.com', N'21000.000000000000000', N'9500.000000000000000', N'6', N'南京市鼓楼区', N'21', N'2', N'计算机科学', N'京东', N'9', N'7', N'0', N'-1', N'1', N'5', N'0', N'null', N'null', N'1', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'10', N'法律顾问', N'提供法律咨询与支持', N'法学专业，具备律师资格证', N'2024-04-07 00:00:00.000', N'请附上相关证书', N'25000.000000000000000', N'13000.000000000000000', N'7', N'成都市武侯区', N'21', N'2', N'法学', N'字节跳动', N'11', N'5', N'0', NULL, N'1', N'3', NULL, NULL, NULL, NULL, N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'11', N'系统测试工程师', N'负责软件系统的测试与质量保证', N'计算机相关专业，熟悉测试流程', N'2024-04-08 00:00:00.000', N'请发送简历至hr@example.com', N'19000.000000000000000', N'8500.000000000000000', N'5', N'武汉市洪山区', N'21', N'2', N'计算机科学', N'中国移动', N'6', N'3', N'0', NULL, N'1', N'2', NULL, NULL, NULL, NULL, N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'12', N'项目经理', N'负责项目的整体规划与管理', N'具备项目管理经验，PMP证书优先', N'2024-04-08 16:00:00.000', N'请附上项目经验！！！', N'30000.000000000000000', N'15000.000000000000000', N'8', N'西安市雁塔区', N'21', N'2', N'项目管理', N'中国电信', N'7', N'10', N'0', N'-1', N'1', N'4', N'0', N'null', N'null', NULL, N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'13', N'人力资源专员', N'负责招聘与员工关系管理', N'人力资源管理专业，要会讨好领导！', N'2024-04-09 16:00:00.000', N'请附上相关证书', N'18000.000000000000000', N'9000.000000000000000', N'5', N'重庆市渝中区', N'21', N'1', N'人力资源', N'中国联通', N'8', N'4', N'0', N'-1', N'1', N'3', N'4', N'没啥可以描述的', N'陪领导喝酒', N'0', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'15', N'实施工程师', N'卫宁软件实施工程师负责医疗信息系统的实施、配置和优化，确保软件解决方案能够满足医疗机构的需求。该职位需要与客户、开发团队和其他相关方密切合作，以确保系统的顺利部署和有效运行', N'学历要求：
本科及以上学历，计算机科学、信息技术、医疗信息学等相关专业。
工作经验：

具有医疗软件实施或相关领域的工作经验者优先。
熟悉医疗行业的相关法规和标准。
技能要求：

熟悉医疗信息系统（如电子病历、医院管理系统等）的实施和配置。
具备良好的沟通能力和团队合作精神。
具备项目管理能力，能够有效协调各方资源。
技术能力：

熟悉数据库管理（如SQL）和基本的编程知识（如Java、Python等）。
了解网络和系统架构，能够进行基本的故障排除。', N'2024-12-12 00:00:00.000', N'请按照以下说明提交您的申请材料：
1. 申请材料 请准备以下文件并一并提交： 个人简历：请确保简历中包含您的联系方式、教育背景、工作经历、技能和相关证书。 求职信：简要说明您对该职位的兴趣、相关经验以及您能为公司带来的价值。 相关证书（如有）：如项目管理专业人士（PMP）、医疗信息技术认证（CPHIMS）等。
2. 投递方式 电子邮件投递：
请将申请材料发送至以下邮箱：hr@yourcompany.com 邮件主题格式：医疗软件实施工程师申请 - 姓名 附件格式：请将简历和求职信以PDF格式附加在邮件中。 
在线申请： 访问我们的网站：www.yourcompany.com/careers 找到医疗软件实施工程师职位，点击“申请”按钮，按照提示填写申请表并上传相关材料。 3. 申请截止日期 请在2025年2月28日之前提交您的申请。我们将尽快对所有申请进行审核，并与符合条件的候选人联系安排面试。
4. 面试流程 初步筛选后，我们将通过电子邮件或电话与您联系，安排面试时间。 面试将包括技术面试和行为面试，旨在评估您的专业技能和团队合作能力。
5. 联系方式 如有任何疑问，请随时联系： 人力资源部 电话：123-456-7890 邮箱：hr@yourcompany.com 感谢您对我们公司的兴趣，期待您的申请！', N'90005.000000000000000', N'5000.000000000000000', N'6', N'广西河池', N'21', N'1', N'信息管理与信息系统', N'卫宁', N'1', N'11', N'1', N'800', N'1', N'9000', N'1', N'工作地点：通常在医疗机构（如医院、诊所）或软件公司的办公室工作，可能需要到客户现场进行实施和培训。
工作时间：一般为标准工作时间，但在项目实施期间可能需要加班或出差。
团队合作：与项目经理、开发人员、客户支持团队和医疗机构的工作人员密切合作，形成跨职能团队。', N'需求分析：

1、与客户沟通，了解其业务需求和流程，进行需求收集和分析。
撰写需求文档，确保所有需求得到准确记录。
系统配置与实施：

2、根据客户需求配置医疗软件系统，包括用户权限、数据输入和输出设置等。
负责软件的安装、配置和调试，确保系统正常运行。
培训与支持：

3、为客户提供系统使用培训，确保用户能够熟练操作软件。
提供技术支持，解决客户在使用过程中遇到的问题。
项目管理：

4、参与项目计划的制定，跟踪项目进度，确保按时交付。
协调各方资源，确保项目顺利进行。
系统优化与维护：

5、定期评估系统性能，提出优化建议。
负责系统的日常维护和更新，确保软件的安全性和稳定性。', N'1', N'luo', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'16', N'全栈开发工程师', N'全栈开发工程师负责设计、开发和维护完整的应用程序，涵盖前端和后端技术。该职位要求具备广泛的技术知识，能够独立完成项目的各个阶段，从需求分析到系统部署和维护。全栈开发工程师通常需要与产品经理、设计师和其他开发人员密切合作，以确保项目的成功交付。', N'学历要求：本科及以上学历，计算机科学、软件工程或相关专业。
工作经验：具有 2 年及以上全栈开发经验，熟悉前端和后端技术栈。
技能要求：熟练掌握 HTML、CSS 和 JavaScript，了解前端框架（如 React、Vue.js 或 Angular）。
熟悉后端开发语言（如 Node.js、Python、Java 或 PHP）及相关框架（如 Express、Django、Spring）。
了解数据库设计和管理，熟悉 SQL 和 NoSQL 数据库。
技术能力：熟悉版本控制工具（如 Git）和项目管理工具（如 Jira、Trello）。 具备良好的问题解决能力和团队合作精神。
其他要求：具备良好的沟通能力，能够与团队成员和客户有效交流。', N'2024-12-30 16:00:00.000', N'感谢您对全栈开发工程师职位的关注！请按照以下说明提交您的申请材料： 
 1. 申请材料 请准备以下文件并一并提交：  个人简历：请确保简历中包含您的联系方式、教育背景、工作经历、技能和相关证书。 求职信：简要说明您对该职位的兴趣、相关经验以及您能为公司带来的价值。 作品集（如有）：提供您参与的项目或代码示例，展示您的技术能力。
 2. 投递方式 电子邮件投递：  请将申请材料发送至以下邮箱：hr@yourcompany.com 
    邮件主题格式：全栈开发工程师申请 - 姓名 
    附件格式：请将简历和求职信以 PDF 格式附加在邮件中。 
   在线申请：  访问我们的网站：www.yourcompany.com/careers 找到全栈开发工程师职位，点击“申请”按钮， 
   按照提示填写申请表并上传相关材料。
 3. 申请截止日期 请在2025年2月28日之前提交您的申请。我们将尽快对所有申请进行审核，并与符合条件的候选人联系安排面试。如有任何疑问，
请随时联系：  人力资源部 电话：123-456-7890 邮箱：hr@yourcompany.com', N'30000.000000000000000', N'20000.000000000000000', N'7', N'云南文山', N'26', N'2', N'无', N'字节跳动', N'11', N'0', N'1', N'15', N'1', N'800', N'2', N'很美观！', N'需求分析：
      与产品经理和客户沟通，理解业务需求，参与需求分析和设计。
前端开发：
      使用 HTML、CSS 和 JavaScript 等技术开发用户界面，确保良好的用户体验。
      熟悉前端框架（如 React、Vue.js 或 Angular）进行组件化开发。
后端开发：
      使用服务器端语言（如 Node.js、Python、Java 或 PHP）开发和维护后端服务。
      设计和管理数据库（如 MySQL、MongoDB 或 PostgreSQL），确保数据的安全性和完整性。
API 设计与集成：
      设计和实现 RESTful 或 GraphQL API，确保前后端的有效通信。
      集成第三方服务和 API，扩展应用功能。
测试与调试：
      编写单元测试和集成测试，确保代码质量和系统稳定性。
       进行代码审查和调试，优化性能。
部署与维护：
     负责应用的部署和维护，使用 CI/CD 工具自动化部署流程。
      监控应用性能，及时处理故障和问题。', N'1', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'17', N'人事专员', N'人事专员（HR Specialist）是企业人力资源管理团队中的重要角色，负责处理与员工相关的各项事务。以下是人事专员岗位的详细描述，包括主要职责、任职要求和技能要求。', N'学历：人力资源管理、心理学、工商管理或相关专业本科及以上学历。
工作经验：1-3年人力资源相关工作经验，有招聘或员工关系管理经验者优先。
知识：了解劳动法、劳动合同法及相关人力资源管理知识。
技能要求
沟通能力：良好的口头和书面沟通能力，能够有效与员工和管理层沟通。
组织能力：具备良好的组织和协调能力，能够处理多项任务。
分析能力：具备一定的数据分析能力，能够进行人力资源数据的统计和分析。
计算机技能：熟练使用办公软件（如 Word、Excel、PowerPoint）和人力资源管理系统（HRIS）。
团队合作：具备团队合作精神，能够与不同部门协作。', N'2025-01-02 08:00:00.000', N'带上人就行了', N'8200.000000000000000', N'5822.000000000000000', N'6', N'成都市罗邓区域', N'24', N'2', N'是个专业就行', N'卫宁', N'1', N'0', N'1', N'45', N'1', N'45', N'5', N'公司就是一坨大便', N'主要职责
招聘与选拔：

制定招聘计划，发布招聘信息，筛选简历，组织面试。
进行候选人背景调查，协助部门经理进行面试和选拔。
员工入职与离职管理：

负责新员工的入职培训和手续办理，确保员工顺利融入公司。
处理员工离职手续，包括离职面谈、清算和档案管理。
员工关系管理：

维护良好的员工关系，处理员工投诉和纠纷。
组织员工活动，增强团队凝聚力。
薪酬与福利管理：

协助制定和实施薪酬政策，确保薪酬的公平性和竞争力。
管理员工福利计划，包括保险、假期和其他福利。
绩效管理：

协助制定绩效考核标准，组织绩效评估。
提供绩效反馈，协助员工职业发展规划。
人事档案管理：

维护员工人事档案，确保信息的准确性和保密性。
定期更新和审核人事数据，确保合规性。
培训与发展：

识别员工培训需求，组织内部和外部培训。
评估培训效果，推动员工职业发展。
政策与流程优化：

协助制定和完善人力资源管理制度和流程。
参与人力资源相关项目的实施和评估', N'4', N'luo', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'18', N'数据运营专员', N'负责数据的日常维护与分析', N'统计学或相关专业，熟悉Excel', N'2024-04-05 00:00:00.000', N'请发送简历至hr@example.com', N'18000.000000000000000', N'9000.000000000000000', N'5', N'杭州市西湖区！！', N'21', N'2', N'统计学', N'京东', N'9', N'0', N'0', N'-1', N'1', N'2', N'0', N'null', N'null', NULL, N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'19', N'测试工程师', N'华为测试工程师负责医疗信息系统的实施、配置和优化，确保软件解决方案能够满足医疗机构的需求。该职位需要与客户、开发团队和其他相关方密切合作，以确保系统的顺利部署和有效运行', N'学历要求：

本科及以上学历，计算机科学、信息技术、医疗信息学等相关专业。
工作经验：

具有医疗软件实施或相关领域的工作经验者优先。
熟悉医疗行业的相关法规和标准。
技能要求：

熟悉医疗信息系统（如电子病历、医院管理系统等）的实施和配置。
具备良好的沟通能力和团队合作精神。
具备项目管理能力，能够有效协调各方资源。
技术能力：

熟悉数据库管理（如SQL）和基本的编程知识（如Java、Python等）。
了解网络和系统架构，能够进行基本的故障排除。', N'2024-12-12 00:00:00.000', N'请按照以下说明提交您的申请材料：
1. 申请材料 请准备以下文件并一并提交： 个人简历：请确保简历中包含您的联系方式、教育背景、工作经历、技能和相关证书。 求职信：简要说明您对该职位的兴趣、相关经验以及您能为公司带来的价值。 相关证书（如有）：如项目管理专业人士（PMP）、医疗信息技术认证（CPHIMS）等。
2. 投递方式 电子邮件投递：
请将申请材料发送至以下邮箱：hr@yourcompany.com 邮件主题格式：医疗软件实施工程师申请 - 姓名 附件格式：请将简历和求职信以PDF格式附加在邮件中。 
在线申请： 访问我们的网站：www.yourcompany.com/careers 找到医疗软件实施工程师职位，点击“申请”按钮，按照提示填写申请表并上传相关材料。 3. 申请截止日期 请在2025年2月28日之前提交您的申请。我们将尽快对所有申请进行审核，并与符合条件的候选人联系安排面试。
4. 面试流程 初步筛选后，我们将通过电子邮件或电话与您联系，安排面试时间。 面试将包括技术面试和行为面试，旨在评估您的专业技能和团队合作能力。
5. 联系方式 如有任何疑问，请随时联系： 人力资源部 电话：123-456-7890 邮箱：hr@yourcompany.com 感谢您对我们公司的兴趣，期待您的申请！', N'90000.000000000000000', N'50000.000000000000000', N'1', N'北京', N'1', N'1', N'无限制！', N'华为', N'5', N'0', N'1', N'800', N'0', N'9000', N'1', N'工作地点：通常在医疗机构（如医院、诊所）或软件公司的办公室工作，可能需要到客户现场进行实施和培训。
工作时间：一般为标准工作时间，但在项目实施期间可能需要加班或出差。
团队合作：与项目经理、开发人员、客户支持团队和医疗机构的工作人员密切合作，形成跨职能团队。', N'需求分析：

1、与客户沟通，了解其业务需求和流程，进行需求收集和分析。
撰写需求文档，确保所有需求得到准确记录。
系统配置与实施：

2、根据客户需求配置医疗软件系统，包括用户权限、数据输入和输出设置等。
负责软件的安装、配置和调试，确保系统正常运行。
培训与支持：

3、为客户提供系统使用培训，确保用户能够熟练操作软件。
提供技术支持，解决客户在使用过程中遇到的问题。
项目管理：

4、参与项目计划的制定，跟踪项目进度，确保按时交付。
协调各方资源，确保项目顺利进行。
系统优化与维护：

5、定期评估系统性能，提出优化建议。
负责系统的日常维护和更新，确保软件的安全性和稳定性。', N'1', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'22', N'网络工程师', N'职位名称：网络工程师

工作地点：根据公司需求

职位类型：全职

岗位职责：

网络设计与实施：

负责公司网络架构的设计与优化，确保网络的高可用性和高性能。
参与网络设备（如路由器、交换机、防火墙等）的选型、配置和部署。
网络维护与管理：

监控网络性能，及时发现并解决网络故障，确保网络的稳定运行。
定期进行网络设备的维护和升级，确保设备的安全性和可靠性。
安全管理：

负责网络安全策略的制定与实施，确保公司网络环境的安全。
监测网络安全事件，及时响应和处理安全威胁，进行安全漏洞评估和修复。
技术支持与培训：

为公司内部员工提供网络相关的技术支持和培训，解答网络使用中的问题。
撰写网络相关的技术文档和操作手册，确保知识的传承和共享。
项目管理：

参与网络相关项目的规划与实施，协调各方资源，确保项目按时完成。
定期向管理层汇报网络项目的进展和成果，提出改进建议。
技术研究与创新：

关注网络技术的发展趋势，进行新技术的研究与评估，推动技术的创新与应用。
参与公司网络技术标准的制定，提升网络技术的整体水平。
任职要求：

学历要求：

计算机科学、网络工程、信息技术等相关专业本科及以上学历。
工作经验：

2年以上网络工程相关工作经验，有大型企业网络管理经验者优先。
专业技能：

熟悉TCP/IP协议、路由协议（如OSPF、BGP）、交换技术及网络安全技术。
熟练掌握网络设备的配置与管理，具备Cisco、Juniper等厂商设备的操作经验。
了解网络监控工具（如Wireshark、Nagios等）和网络安全设备（如防火墙、入侵检测系统等）。
证书要求：

具备CCNA、CCNP、CISSP等相关网络或安全认证者优先。
个人素质：

具备良好的沟通能力和团队合作精神，能够承受一定的工作压力。
具备较强的问题分析与解决能力，能够独立处理复杂的网络问题。
薪资待遇：

根据个人能力和经验面议，提供具有竞争力的薪资和福利待遇。
职业发展：

提供良好的职业发展空间和培训机会，鼓励员工不断学习和提升专业技能', N'网络工程师的岗位要求通常包括以下几个方面：

1. **学历要求**：
   - 大学本科及以上学历，计算机科学、网络工程、通信工程等相关专业。

2. **专业知识**：
   - 熟悉计算机网络的基本原理和协议（如TCP/IP、HTTP、DNS等）。
   - 了解不同网络设备的工作原理，例如路由器、交换机、防火墙等。
   - 具有网络设计和实施的能力，能够进行网络拓扑设计、设备配置与调试。

3. **技能要求**：
   - 熟练掌握网络设备的配置和管理，尤其是思科（Cisco）、华为等品牌的设备。
   - 具备网络故障排查和问题解决的能力。
   - 了解网络安全相关知识，能够设计和实施安全策略。

4. **证书要求**：
   - 持有相关的职业资格证书（如CCNA、CCNP、HCNA、HCNP等）是加分项。

5. **工作经验**：
   - 具备相关网络工程工作经验者优先，特别是在大中型企业或ISP工作的经历。
   - 参与过大型网络项目或有项目管理经验者优先考虑。

6. **软技能**：
   - 良好的沟通能力与团队合作精神。
   - 具备一定的项目管理能力，能够处理多任务和压力。
   - 需要具备持续学习的意愿，跟踪最新的网络技术和行业动态。

7. **英语能力**：
   - 具备一定的英语读写能力，能够阅读技术文档和资料。

上述要求可能因公司和岗位的不同有所变化，但总体上反映了网络工程师的基本素质和能力要求。', N'2025-01-04 08:00:00.000', N'当你准备投递网络工程师的职位时，以下是一些建议和说明，可以帮助你提高申请的成功率：

### 1. 更新你的简历
- **技能概述**：在简历的顶部列出你的技能，例如网络配置、故障排除、VPN、路由和交换、网络安全等。
- **相关经验**：详细说明你在网络工程方面的工作经历，包括使用的技术和工具（如Cisco、Juniper、Linux等）。
- **项目经历**：突出显示你参与的网络项目，描述你的角色和贡献，尤其是解决过的具体问题。
- **认证与教育**：列出相关的认证（如CCNA、CCNP、CompTIA Network+等）和学历背景。

### 2. 定制求职信
- **针对性**：根据每个职位的要求和公司背景，定制你的求职信。
- **表达热情**：阐述你对网络工程的热情，以及你为何对该公司特别感兴趣。
- **突出成就**：提及你过去的成就，说明你如何为前公司创造价值。

### 3. 准备面试
- **技术知识**：复习与网络相关的技术知识，包括 TCP/IP、DNS、DHCP、路由协议（如OSPF、BGP）等。
- **解决问题的能力**：准备一些案例，展示你是如何在过去的工作中有效解决网络问题的。
- **软技能**： 网络工程师不仅需要技术能力，沟通能力和团队协作能力同样重要，准备相应的例子来展示这些技能。

### 4. 在线资料准备
- **LinkedIn**：更新你的LinkedIn个人资料，确保它与简历一致，并增加关键词以提高可见度。
- **项目展示**：如果你有相关的项目或代码，可以考虑在GitHub等平台上展示，增加你的竞争力。

### 5. 网络和推荐
- **扩展人脉**：通过网络活动、社交媒体建立与行业内人士的联系，了解行业动态和潜在职位。
- **请求推荐**：如果可能，向之前的同事或上司请求推荐信，以增加你的申请可信度。

### 6. 关注招聘信息
- **求职网站**：定期查看求职网站、公司官网以及行业相关的论坛和社群，及时获取最新的招聘信息。
- **企业定向**：如果有特别感兴趣的公司，可以主动申请，哪怕暂时没有发布相关职位。

通过以上这些准备，可以增加你在网络工程师职位申请中的优势。祝你好运！', N'10000.000000000000000', N'7000.000000000000000', N'7', N'麻栗坡县中医院', N'21', N'2', N'计算机类专业', N'信息科', N'15', N'0', N'0', N'-1', N'1', N'26', N'55', N'关于麻栗坡县中医院的网络工程师就业环境，可以从以下几个方面进行分析：

1. **行业需求**：随着信息技术的发展，医疗行业对网络工程师的需求逐步增加。医疗机构需要稳定的网络设施来支撑电子病历、远程医疗等现代化服务。

2. **工作职责**：网络工程师在中医院的主要工作包括网络布局设计、设备配置、网络安全管理、故障排查等。他们负责保障医院内部和外部网络的稳定与安全。

3. **发展前景**：对于网络工程师来说，随着医疗信息化的推进，职业发展前景良好。掌握新的技术（如云计算、物联网等）将有助于提升职业竞争力。

4. **工作环境**：麻栗坡县作为一个县级城市，医院的工作环境相对稳定，但可能面临资源不足、人才短缺等挑战。在较小的环境中，工程师可能需要承担更多的职责。

5. **薪资水平**：薪资水平可能会受到区域经济发展水平和医院规模的影响。一般来说，大城市的薪资水平会相对较高，但在县级医院也有一定的发展机会。

6. **培训与学习机会**：医疗行业的变化迅速，网络工程师需不断学习新技术与新知识。医院可能会提供一定的培训机会，或者可以通过自学获取相关证书提升专业能力。

总的来说，麻栗坡县中医院的网络工程师就业环境具备一定发展潜力，但也伴随挑战。适应能力强，愿意学习与提升的网络工程师将会有良好的发展前景。', N'网络工程师的工作职责通常包括以下几个方面：

1. **网络设计与规划**：参与网络架构的设计，包括制定网络拓扑结构、选择合适的网络设备和技术，确保网络的可扩展性和可靠性。

2. **网络实施与配置**：负责网络设备（如路由器、交换机、Firewall等）的安装与配置，确保网络按照设计要求正常运行。

3. **网络监控与维护**：使用网络监控工具监测网络的性能，及时发现并解决网络故障，进行定期的网络健康检查，以保证网络的稳定性和安全性。

4. **网络安全管理**：实施网络安全措施，包括防火墙配置、入侵检测系统（IDS）的部署、VPN的设置等，保护网络环境免受潜在威胁。

5. **技术支持与故障排除**：提供技术支持，协助用户解决网络相关的问题，进行故障排除和技术咨询。

6. **文档编写与管理**：记录网络设备的配置、网络拓扑图及其他相关文档，确保信息的准确性和可追溯性。

7. **培训与支持**：为内部员工或客户提供网络使用培训，提升他们对网络的理解与使用效率。

8. **跟踪技术发展**：保持对网络技术新发展的关注，参与相关的培训和学习，不断提升自己的专业知识和技能。

9. **协作与沟通**：与其他IT团队合作，确保网络与其他系统的无缝集成和兼容性。

这些职责可能因公司规模、网络规模和行业特性而有所不同，但大致框架是相似的。', N'0', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'23', N'广西实施工程师 ', N'卫宁软件实施工程师负责医疗信息系统的实施、配置和优化，确保软件解决方案能够满足医疗机构的需求。该职位需要与客户、开发团队和其他相关方密切合作，以确保系统的顺利部署和有效运行', N'学历要求：
本科及以上学历，计算机科学、信息技术、医疗信息学等相关专业。
工作经验：

具有医疗软件实施或相关领域的工作经验者优先。
熟悉医疗行业的相关法规和标准。
技能要求：

熟悉医疗信息系统（如电子病历、医院管理系统等）的实施和配置。
具备良好的沟通能力和团队合作精神。
具备项目管理能力，能够有效协调各方资源。
技术能力：

熟悉数据库管理（如SQL）和基本的编程知识（如Java、Python等）。
了解网络和系统架构，能够进行基本的故障排除。', N'2024-12-12 08:00:00.000', N'请按照以下说明提交您的申请材料：
1. 申请材料 请准备以下文件并一并提交： 个人简历：请确保简历中包含您的联系方式、教育背景、工作经历、技能和相关证书。 求职信：简要说明您对该职位的兴趣、相关经验以及您能为公司带来的价值。 相关证书（如有）：如项目管理专业人士（PMP）、医疗信息技术认证（CPHIMS）等。
2. 投递方式 电子邮件投递：
请将申请材料发送至以下邮箱：hr@yourcompany.com 邮件主题格式：医疗软件实施工程师申请 - 姓名 附件格式：请将简历和求职信以PDF格式附加在邮件中。 
在线申请： 访问我们的网站：www.yourcompany.com/careers 找到医疗软件实施工程师职位，点击“申请”按钮，按照提示填写申请表并上传相关材料。 3. 申请截止日期 请在2025年2月28日之前提交您的申请。我们将尽快对所有申请进行审核，并与符合条件的候选人联系安排面试。
4. 面试流程 初步筛选后，我们将通过电子邮件或电话与您联系，安排面试时间。 面试将包括技术面试和行为面试，旨在评估您的专业技能和团队合作能力。
5. 联系方式 如有任何疑问，请随时联系： 人力资源部 电话：123-456-7890 邮箱：hr@yourcompany.com 感谢您对我们公司的兴趣，期待您的申请！', N'90005.000000000000000', N'5000.000000000000000', N'6', N'广西南宁', N'21', N'1', N'信息管理与信息系统', N'广西实施部', N'13', N'0', N'1', N'800', N'1', N'900', N'1', N'工作地点：通常在医疗机构（如医院、诊所）或软件公司的办公室工作，可能需要到客户现场进行实施和培训。
工作时间：一般为标准工作时间，但在项目实施期间可能需要加班或出差。
团队合作：与项目经理、开发人员、客户支持团队和医疗机构的工作人员密切合作，形成跨职能团队。', N'需求分析：

1、与客户沟通，了解其业务需求和流程，进行需求收集和分析。
撰写需求文档，确保所有需求得到准确记录。
系统配置与实施：

2、根据客户需求配置医疗软件系统，包括用户权限、数据输入和输出设置等。
负责软件的安装、配置和调试，确保系统正常运行。
培训与支持：

3、为客户提供系统使用培训，确保用户能够熟练操作软件。
提供技术支持，解决客户在使用过程中遇到的问题。
项目管理：

4、参与项目计划的制定，跟踪项目进度，确保按时交付。
协调各方资源，确保项目顺利进行。
系统优化与维护：

5、定期评估系统性能，提出优化建议。
负责系统的日常维护和更新，确保软件的安全性和稳定性。', N'0', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'26', N'实施', N'无', N'无', N'2025-02-02 00:00:00.000', N'无', N'90900.000000000000000', N'0.000000000000000', N'6', N'麻栗坡', N'1', N'1', N'无', N'卫宁', N'1', N'0', N'1', N'12', N'0', N'7', NULL, N'无', N'无', N'1', N'luo', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'27', N'开发', N'无', N'无', N'2025-02-02 00:00:00.000', N'无', N'12.000000000000000', N'12.000000000000000', N'7', N'麻栗坡', N'6', N'1', N'信管', N'卫宁', N'1', N'0', N'1', N'12', N'1', N'90', NULL, N'无', N'无', N'1', N'luo', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'28', N'开发', N'无', N'无', N'2025-02-02 00:00:00.000', N'无', N'12.000000000000000', N'12.000000000000000', N'7', N'麻栗坡', N'6', N'1', N'信管', N'卫宁', N'1', N'0', N'1', N'12', N'0', N'90', NULL, N'无', N'无', N'1', N'luo', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'29', N'实施工程师2测试版本', N'卫宁软件实施工程师负责医疗信息系统的实施、配置和优化，确保软件解决方案能够满足医疗机构的需求。该职位需要与客户、开发团队和其他相关方密切合作，以确保系统的顺利部署和有效运行', N'学历要求：
本科及以上学历，计算机科学、信息技术、医疗信息学等相关专业。
工作经验：

具有医疗软件实施或相关领域的工作经验者优先。
熟悉医疗行业的相关法规和标准。
技能要求：

熟悉医疗信息系统（如电子病历、医院管理系统等）的实施和配置。
具备良好的沟通能力和团队合作精神。
具备项目管理能力，能够有效协调各方资源。
技术能力：

熟悉数据库管理（如SQL）和基本的编程知识（如Java、Python等）。
了解网络和系统架构，能够进行基本的故障排除。', N'2024-12-11 16:00:00.000', N'请按照以下说明提交您的申请材料：
1. 申请材料 请准备以下文件并一并提交： 个人简历：请确保简历中包含您的联系方式、教育背景、工作经历、技能和相关证书。 求职信：简要说明您对该职位的兴趣、相关经验以及您能为公司带来的价值。 相关证书（如有）：如项目管理专业人士（PMP）、医疗信息技术认证（CPHIMS）等。
2. 投递方式 电子邮件投递：
请将申请材料发送至以下邮箱：hr@yourcompany.com 邮件主题格式：医疗软件实施工程师申请 - 姓名 附件格式：请将简历和求职信以PDF格式附加在邮件中。 
在线申请： 访问我们的网站：www.yourcompany.com/careers 找到医疗软件实施工程师职位，点击“申请”按钮，按照提示填写申请表并上传相关材料。 3. 申请截止日期 请在2025年2月28日之前提交您的申请。我们将尽快对所有申请进行审核，并与符合条件的候选人联系安排面试。
4. 面试流程 初步筛选后，我们将通过电子邮件或电话与您联系，安排面试时间。 面试将包括技术面试和行为面试，旨在评估您的专业技能和团队合作能力。
5. 联系方式 如有任何疑问，请随时联系： 人力资源部 电话：123-456-7890 邮箱：hr@yourcompany.com 感谢您对我们公司的兴趣，期待您的申请！', N'90005.000000000000000', N'5000.000000000000000', N'6', N'广西河池', N'21', N'1', N'信息管理与信息系统', N'卫宁', N'1', N'0', N'1', N'800', N'1', N'9000', N'1', N'工作地点：通常在医疗机构（如医院、诊所）或软件公司的办公室工作，可能需要到客户现场进行实施和培训。
工作时间：一般为标准工作时间，但在项目实施期间可能需要加班或出差。
团队合作：与项目经理、开发人员、客户支持团队和医疗机构的工作人员密切合作，形成跨职能团队。', N'需求分析：

1、与客户沟通，了解其业务需求和流程，进行需求收集和分析。
撰写需求文档，确保所有需求得到准确记录。
系统配置与实施：

2、根据客户需求配置医疗软件系统，包括用户权限、数据输入和输出设置等。
负责软件的安装、配置和调试，确保系统正常运行。
培训与支持：

3、为客户提供系统使用培训，确保用户能够熟练操作软件。
提供技术支持，解决客户在使用过程中遇到的问题。
项目管理：

4、参与项目计划的制定，跟踪项目进度，确保按时交付。
协调各方资源，确保项目顺利进行。
系统优化与维护：

5、定期评估系统性能，提出优化建议。
负责系统的日常维护和更新，确保软件的安全性和稳定性。', N'1', N'luo', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'30', N'AI算法工程师', N'AI算法工程师是专注于人工智能领域的专业人才，主要负责设计、开发和优化各种机器学习和深度学习算法，以解决实际问题。以下是一些AI算法工程师的主要职责和技能要求：

### 主要职责：

1. **算法设计**：根据项目需求设计和实现机器学习及深度学习算法。
2. **数据处理**：收集、预处理和分析数据，为模型训练提供高质量的数据集。
3. **模型训练**：使用训练集和验证集对模型进行训练和调优，选择合适的模型架构和超参数。
4. **性能评估**：使用各种评价指标评估模型的性能，确保其准确性和鲁棒性。
5. **代码实现**：编写高效、可维护的代码，并进行算法的优化以提高性能。
6. **跨部门协作**：与数据科学家、软件工程师、产品经理等协作，将算法应用于实际产品中。
7. **文档撰写**：记录算法的设计思路、实验结果和性能评估，撰写相关文档。

### 技能要求：

1. **编程能力**：熟练掌握Python、R、Java等编程语言，具备良好的编码能力。
2. **数学基础**：扎实的线性代数、概率论与统计等数学知识，能够理解算法背后的理论基础。', N'AI算法工程师的岗位要求通常包括以下几个方面：

1. **教育背景**:
   - 计算机科学、人工智能、数学、统计学、电气工程等相关专业的本科及以上学历。

2. **编程能力**:
   - 熟练掌握至少一种编程语言，如 Python、C++、Java 或 R，尤其是 Python 在机器学习中的应用较为广泛。

3. **算法与模型**:
   - 理解常见的机器学习和深度学习算法（如回归、决策树、支持向量机、神经网络等）。
   - 有运用这些算法解决实际问题的经验。

4. **数理基础**:
   - 扎实的数学基础，包括线性代数、概率论与数理统计、优化理论等。

5. **工具与框架**:
   - 熟悉常用的数据处理和机器学习框架，如 TensorFlow、PyTorch、Scikit-learn、Keras 等。

6. **数据处理能力**:
   - 掌握数据预处理、特征工程和数据清洗的技能。
   - 能够处理和分析大规模数据集。

7. **项目经验**:
   - 有相关项目经验，能够展示自己在机器学习、深度学习等领域的实际应用案例。

8. **科研和创新能力**:
   - 对前沿技术有一定的了解，能够进行技术研究和创新。

9. **沟通能力**:
   - 具备良好的团队合作精神和沟通能力，能够向跨部门的团队成员解释复杂的算法和模型。

10. **持续学习能力**:
    - 具备自我驱动的学习能力，关注AI领域的发展动态，愿意不断提升自己的技能和知识。

不同公司和行业的具体岗位要求可能会有所不同，求职者可以根据自己所申请的职位进行相应的准备。', N'2025-02-09 10:08:05.877', N'投递AI算法工程师职位时，准备一个全面且有针对性的申请材料是非常重要的。以下是一个投递说明的结构和内容建议：

### 1. 简历 (Resume)
- **个人信息**：姓名、联系电话、电子邮箱、LinkedIn链接等。
- **职业目标**：简短的职业目标或个人简介，突出你的专业方向和职业愿望，比如“希望在AI领域进一步发展，专注于深度学习和自然语言处理。”
- **教育背景**：列出你的学历，包括学校名称、专业、学位和毕业年份。若有相关课程或研究项目可提及。
- **工作经验**：
  - 列出相关的实习或工作经历，使用项目式描述，强调具体的贡献和成就。
  - 重点突出你在机器学习、深度学习或相关领域的项目经历，包括使用的技术栈（如TensorFlow、PyTorch等）。
- **技能与证书**：
  - AI/ML相关技能（编程语言如Python、R，工具如Keras、Scikit-learn等）。
  - 数据处理与分析技能（如SQL、Pandas）。
  - 相关证书（如Coursera、edX等平台的AI课程证书）。
- **项目经历**：简要描述几个与AI算法相关的项目，包括你的角色、使用的技术和取得的成果。

### 2. 求职信 (Cover Letter)
- **自我介绍**：简要介绍你的背景和为什么对这个职位感兴趣。
- **匹配度**：具体说明你如何符合职位要求，可以提及你的项目经历和技能。
- **展望**：表达你对公司的兴趣，以及你希望在这个岗位上带来的贡献。
- **结束语**：礼貌地表示希望有机会进一步讨论，表示期待面试的机会。

### 3. 作品集 (Portfolio)
- 如有必要，准备一个作品集，展示你在AI或算法方面的实际作品和项目（如GitHub链接、Kaggle竞赛成绩等）。

### 4. 其他材料
- 可能需要提供推荐信或者是以前的工作主管的联系方式。
- 准备一份清晰的相关项目的简述，以便在面试中使用。

### 5. 个性化投递
- 针对不同公司的文化、产品，调整你的简历和求职信，突出与该公司最相关的经验和技能。

### 6. 跟进
- 投递后，可以适当时间（约一周后）通过邮件进行跟进，表达对岗位的持续兴趣。', N'90000.000000000000000', N'10000.000000000000000', N'7', N'北京朝阳区', N'2', N'2', N'无', N'百度', N'4', N'0', N'0', N'-1', N'1', N'3', NULL, N'工作场所：他们一般在科技公司、研究机构或大学的实验室中工作，配备有先进的计算设备和软件工具，以支持复杂的算法开发和数据分析。

协作氛围：工作环境通常是开放式的，鼓励团队成员之间的沟通与合作。AI算法工程师需要与数据科学家、软件工程师和产品经理等密切合作。

学习与创新：由于AI领域的快速发展，工程师们需要不断学习新技术和工具。工作环境通常鼓励创新，可能会定期举行技术分享会或研讨会。

灵活性：许多AI算法工程师享有灵活的工作时间和远程工作的选择，这有助于他们更好地平衡工作与生活，提高工作效率。

计算资源：良好的计算资源和数据存储设施是必不可少的，包括高性能计算机、云计算平台和大数据存储解决方案，以支持他们处理大量数据和复杂模型的需求。', N'AI算法工程师的工作职责通常包括以下几个方面：

1. **算法研发**：设计、开发和优化机器学习、深度学习、自然语言处理等算法，以解决具体的业务问题。

2. **数据处理**：负责收集、清理和处理数据，确保数据的质量和适用性，为模型训练提供高质量的数据集。

3. **模型训练**：使用选定的算法和数据集对模型进行训练，不断调整模型参数以提高模型的性能。

4. **模型评估**：对已训练的模型进行测试和评估，使用指标如准确率、召回率、F1-score等对模型进行性能分析。

5. **技术文档撰写**：编写技术文档，记录算法实现过程、模型评估结果及后续改进建议，以便于团队其他成员的参考和使用。

6. **跨部门协作**：与产品经理、软件工程师和数据科学家等团队成员紧密合作，确保算法产品能够有效地集成到整体系统中。

7. **持续学习与研究**：关注AI领域的最新研究动态，学习新兴技术和工具，及时更新和迭代自身的技术能力。

8. **产品化落地**：将算法模型转化为可用的产品，参与算法在实际应用中的部署和维护，确保其在生产环境中的稳定性和效率。

9. **故障排查与优化**：对实际应用中的算法进行监控，及时发现并解决问题，持续优化算法性能。

10. **参与团队会议**：定期参与团队会议，分享技术经验和进展，讨论项目中的挑战和解决方案。', N'1', N'billie', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'31', N'中级前端开发工程师', N'1. 负责公司 AI 标注和建模 SaaS 产品前端开发，主要负责点云、图片、视频、音频、文本等标注工具开发，技术挑战性高；
2. 参与应用架构、难点攻坚、新技术落地和页面性能优化，开发业务公共组件；
3. 指导、培训初级开发工程师，把关代码质量；', N'1. 计算机相关专业，本科或以上学历，三年以上前端开发经验；
2. 熟悉 JavaScript / TypeScript，以及 Vue 或 React 开发框架，具备一定的前端工程化思维和实践能力;
3. 熟悉 Canvas / SVG / WebGL 等 Web 图形技术，有 Three.js等 Web 2D/3D 图形引擎和库的使用经验；
4. 具备良好的沟通、协作、计划和思考能力，工作积极主动，有很强的责任心；', N'2025-02-09 11:06:31.357', N'能者就来', N'28000.000000000000000', N'0.000000000000000', N'6', N'成都锦江区新华之星B座2309', N'24', N'2', N'计算机科学与技术', N'研发部', N'57', N'0', N'0', N'-1', N'1', N'4', NULL, N'美观大气', N'前端日常', N'1', N'deepseek', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'32', N'电气工程师', N'负责电气系统的设计、开发和测试，确保产品符合安全和性能标准。', N'电气工程或相关专业学士学位，3年以上相关工作经验，熟悉电气设计软件（如AutoCAD），具备良好的团队合作能力。', N'2025-02-09 15:12:47.797', N'请通过特斯拉官网提交简历和求职信，申请截止日期为每年的6月30日。', N'30000.000000000000000', N'0.000000000000000', N'7', N'北京朝阳区', N'2', N'2', N'无', N'特斯拉（Tesla）', N'58', N'0', N'0', N'-1', N'1', N'100', NULL, N'特斯拉提供一个创新和快速发展的工作环境，鼓励员工提出新想法并参与项目的各个阶段。公司注重团队合作，员工之间的沟通非常顺畅，定期举办技术分享会。', N'负责电气系统的设计、开发和测试，确保产品符合安全和性能标准。', N'63', N'msk', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'33', N'生产线操作员', N'在生产线上执行组装和测试任务，确保产品质量和生产效率。', N' 高中及以上学历，具备一定的机械操作经验，能够适应轮班工作，良好的身体素质和团队合作精神。', N'2025-02-09 07:15:27.877', N'请将简历发送至人力资源部邮箱，面试将根据申请顺序安排。', N'10000.000000000000000', N'0.000000000000000', N'6', N'广西南丹县', N'21', N'2', N'无', N'特斯拉（Tesla）', N'58', N'0', N'0', N'-1', N'1', N'1001', N'0', N'特斯拉提供一个创新和快速发展的工作环境，鼓励员工提出新想法并参与项目的各个阶段。公司注重团队合作，员工之间的沟通非常顺畅，定期举办技术分享会。 生产线操作员在一个动态的环境中工作，团队氛围友好，员工之间互相支持。公司提供必要的培训和职业发展机会，确保员工能够不断提升技能。', N'操作生产设备，进行产品组装，执行质量检查，记录生产数据。', N'5', N'msk', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'34', N'特斯拉销售代表', N'负责与客户沟通，了解客户需求，推动特斯拉产品的销售，维护客户关系。', N'市场营销或相关专业学士学位，2年以上销售经验，优秀的沟通和谈判能力，能够适应快节奏的工作环境。', N'2025-02-09 15:19:50.993', N'请通过特斯拉官网的招聘页面提交申请，面试将通过电话和面对面两种方式进行。', N'10000.000000000000000', N'0.000000000000000', N'5', N'香港', N'33', N'2', N'无，能当牛马就行', N'特斯拉（Tesla）', N'58', N'0', N'0', N'-1', N'1', N'1000', NULL, N'销售团队充满活力，鼓励创新和积极的销售策略。公司提供丰厚的佣金和奖金制度，支持员工的职业发展和培训。', N'开发新客户，维护现有客户关系，制定销售计划，完成销售目标', N'3', N'msk', N'3')
GO

INSERT INTO [dbo].[DATA_GWDMK] ([ID], [GWMC], [GWMS], [GWYQ], [FBSJ], [TDSM], [ZGXZ], [ZDXZ], [ZDXLYQ], [GZDD], [GZSF], [SXBZ], [ZYXZ], [DWMC], [DWDM], [TDCS], [TDXZBZ], [TDXZCS], [QYDM], [ZPRS], [JYHJ], [JYHJMS], [GZZZ], [GWFL], [FBZ], [FBZYHSFDM]) VALUES (N'35', N'大数据工程师', N'百度的大数据工程师岗位通常包括以下几个方面的描述：

1. **数据处理与分析**：
   - 负责海量数据的收集、存储、处理和分析，使用 Hadoop、Spark 等大数据技术进行数据处理。
   - 开发数据处理流水线，确保数据的质量和可靠性。

2. **数据架构设计**：
   - 参与大数据平台的架构设计和优化，确保数据系统的高性能与可扩展性。
   - 设计和建设数据仓库，负责数据建模、ETL 过程的设计与实施。

3. **数据挖掘与机器学习**：
   - 结合公司业务需求，运用数据挖掘和机器学习算法进行数据分析，为产品和业务决策提供支持。
   - 开发和维护机器学习模型，持续优化模型性能。

4. **跨部门协作**：
   - 与产品经理、数据分析师及其他技术团队紧密合作，理解业务需求，将需求转化为技术解决方案。
   - 参与产品需求讨论，提供数据方案支持。

5. **技术研究与创新**：
   - 持续关注大数据技术的发展，研究新技术、新工具，并积极应用于实际工作中。
   - 主动寻找数据处理和分析中的瓶颈，提出创新性解决方案。', N'百度大数据工程师的岗位要求通常包括以下几个方面：

### 1. 学历与专业背景
- **学历**：本科及以上学历，计算机科学、数据科学、统计学、人工智能等相关专业优先。
  
### 2. 技术技能
- **编程语言**：熟悉至少一种编程语言，如 Python、Java 或 Scala，能够编写高效的代码。
- **数据库技术**：熟练掌握 SQL，了解关系型和非关系型数据库（如 MySQL、PostgreSQL、MongoDB 等）。
- **大数据技术**：熟悉大数据技术栈，包括 Hadoop、Spark、Flink、Kafka 等，具备相关项目经验者优先。
  
### 3. 数据处理与分析
- **数据处理能力**：具备数据清洗、数据处理和分析的能力，能够熟练使用数据分析工具（如 Pandas、NumPy 等）进行分析。
- **机器学习**：了解基本的机器学习算法，具备使用机器学习框架（如 TensorFlow、PyTorch、Scikit-learn）的能力。

### 4. 软技能
- **分析与解决问题**：优秀的逻辑思维能力和数据分析能力，能够独立解决复杂问题。
- **沟通能力**：良好的沟通能力，能够与不同部门（如产品、业务等）进行有效沟通，理解和转化业务需求。
- **团队合作精神**：具有团队合作精神，能够在多变的环境中迅速适应和协同工作。

### 5. 项目经验
- **相关工作经验**：具有大数据相关项目的实习或工作经验，能展示对大数据技术的实际应用能力。
- **项目管理**：有一定的项目管理经验或者参与过大型数据处理项目者优先。

### 6. 持续学习
- **自我驱动**：对新技术保持持续学习的意愿，能够自主研究和掌握前沿的大数据技术。

', N'2025-02-17 11:02:17.000', N'请按照以下说明提交您的申请材料：
1. 申请材料 请准备以下文件并一并提交： 个人简历：请确保简历中包含您的联系方式、教育背景、工作经历、技能和相关证书。 求职信：简要说明您对该职位的兴趣、相关经验以及您能为公司带来的价值。 相关证书（如有）：如项目管理专业人士（PMP）、医疗信息技术认证（CPHIMS）等。
2. 投递方式 电子邮件投递：
请将申请材料发送至以下邮箱：hr@yourcompany.com 邮件主题格式：医疗软件实施工程师申请 - 姓名 附件格式：请将简历和求职信以PDF格式附加在邮件中。 
在线申请： 访问我们的网站：www.yourcompany.com/careers 找到医疗软件实施工程师职位，点击“申请”按钮，按照提示填写申请表并上传相关材料。 3. 申请截止日期 请在2025年2月28日之前提交您的申请。我们将尽快对所有申请进行审核，并与符合条件的候选人联系安排面试。
4. 面试流程 初步筛选后，我们将通过电子邮件或电话与您联系，安排面试时间。 面试将包括技术面试和行为面试，旨在评估您的专业技能和团队合作能力。
5. 联系方式 如有任何疑问，请随时联系： 人力资源部 电话：123-456-7890 邮箱：hr@yourcompany.com 感谢您对我们公司的兴趣，期待您的申请！', N'9000.000000000000000', N'5000.000000000000000', N'7', N'浙江杭州市百度总部', N'12', N'2', N'计算机类专业', N'百度', N'4', N'0', N'0', N'-1', N'1', N'8', N'1', N'### 1. **工作氛围**
- **创新与开放**：百度注重创新文化，鼓励员工提出新想法与方案，形成开放的讨论氛围。
- **团队合作**：大数据团队通常由跨学科的专业人士组成，强调团队合作，共同解决复杂的数据问题。

### 2. **团队文化**
- **多样性与包容性**：重视多元文化，团队中汇聚了来自不同背景的人才，促进知识共享与创意碰撞。
- **共同成长**：团队成员彼此支持，鼓励个人发展与学习，定期举行技术分享和交流会。

### 3. **职业发展**
- **培训与发展机会**：提供丰富的培训课程，包括新技术培训、专业技能提升、管理类培训等，支持员工的职业发展。
- **项目经验**：参与前沿项目和技术实践，有机会接触到大数据处理、分析、机器学习等最新技术。

### 4. **科技驱动与行业前景**
- **行业领先**：百度在人工智能和大数据领域处于行业领先地位，有大量资源进行技术研发和创新。
- **技术应用广泛**：大数据工程师可以参与到搜索引擎、智能推荐、广告投放等多个业务线的项目中，应用场景丰富。

### 5. **福利与保障**
- **行业竞争力的薪酬**：作为一家知名科技企业，百度提供具有市场竞争力的薪资和福利待遇。
- **员工关怀**：包括健康保险、带薪假期、员工活动、心理健康支持等，关注员工的生活质量。

### 6. **工作地点与方式**
- **现代化办公环境**：百度的办公环境现代、舒适，配备了先进的办公设施。
- **灵活工作安排**：在工作方式上，部分团队可以选择远程办公或灵活的工作时间，提升工作与生活的平衡。
', N'根据百度大数据工程师的岗位描述，工作职责通常包括以下几个方面：

### 1. 数据处理与分析
- **数据收集与清洗**：从各种数据源收集数据，并进行预处理和清洗，确保数据的完整性和准确性。
- **数据分析**：使用统计分析和数据可视化工具，分析数据，以发现潜在的业务机会和问题。

### 2. 数据仓库与 ETL 管道
- **设计和维护数据仓库**：参与数据仓库的设计，确保数据能够高效存储与访问。
- **ETL 开发**：开发和维护 ETL（提取、转换、加载）流程，确保数据能够在不同系统间有效流动。

### 3. 数据架构与平台建设
- **平台架构设计**：参与大数据平台的架构设计与优化，提升系统性能和可扩展性。
- **技术选型与实施**：评估和选择合适的技术工具和平台，进行实际的系统部署和实施。

### 4. 数据挖掘与机器学习
- **模型开发**：结合业务需求，应用数据挖掘和机器学习算法，开发预测模型和推荐系统。
- **模型评估与优化**：监控模型性能，并根据反馈进行迭代优化。

### 5. 跨团队协作
- **与产品与业务团队合作**：理解业务需求，转化为技术解决方案，确保技术与业务目标一致。
- **技术支持**：为其他团队提供数据相关的支持与帮助，解答技术问题。

### 6. 文档与知识管理
- **编写技术文档**：记录数据处理流程、建模过程和系统架构，确保团队间的知识共享。
- **培训与指导**：对团队成员进行新工具和技术的培训，帮助他们提升技能。

### 7. 持续学习与技术研究
- **关注新技术发展**：保持对大数据领域新技术和最佳实践的关注，积极学习并在工作中应用。
- **优化现有流程**：分析现有数据处理和分析流程，寻找改进机会，提高工作效率。

这些职责概括了大数据工程师在日常工作中的主要任务。具体的职责可能因团队和项目的不同而有所变化。如果你有进一步的具体问题，欢迎提问！
', N'1', N'billie', N'3')
GO

SET IDENTITY_INSERT [dbo].[DATA_GWDMK] OFF
GO


-- ----------------------------
-- Table structure for DATA_STUDENT
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DATA_STUDENT]') AND type IN ('U'))
	DROP TABLE [dbo].[DATA_STUDENT]
GO

CREATE TABLE [dbo].[DATA_STUDENT] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [XSXM] nvarchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [XSXB] nvarchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [BIRTH] date NULL,
  [YHM] nvarchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [MM] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [SSBJ] int NULL,
  [ZYDM] int NULL,
  [SFZH] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [ZZMM] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [SSNJ] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [XZ] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [MZ] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [XSXH] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [BJMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [XLDM] int NULL,
  [JYZT] int DEFAULT ((1000)) NOT NULL,
  [XSZP] nvarchar(1000) COLLATE Chinese_PRC_CI_AS NULL,
  [QYDM] int DEFAULT ((1)) NULL,
  [FZJS] int NULL
)
GO

ALTER TABLE [dbo].[DATA_STUDENT] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'学号',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生姓名',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'XSXM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生性别',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'XSXB'
GO

EXEC sp_addextendedproperty
'MS_Description', N'出生日期',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'BIRTH'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'YHM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'MM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属班级',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'SSBJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'专业代码 对应ZYDMK',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'ZYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'身份证号',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'SFZH'
GO

EXEC sp_addextendedproperty
'MS_Description', N'政治面貌',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'ZZMM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属年级',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'SSNJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学制',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'XZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'民族',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'MZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生学号',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'XSXH'
GO

EXEC sp_addextendedproperty
'MS_Description', N'班级名称',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'BJMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学历代码,对应XLTTK',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'XLDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'就业状态，',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'JYZT'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生照片',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'XSZP'
GO

EXEC sp_addextendedproperty
'MS_Description', N'启用代码',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'负责教师',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT',
'COLUMN', N'FZJS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生信息库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_STUDENT'
GO


-- ----------------------------
-- Records of [DATA_STUDENT]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DATA_STUDENT] ON
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1205', N'韦骅骏', N'男', N'2002-09-14', N'20213260004', N'123', N'1292', N'1085', N'450102200209140513', N'共青团员', N'2021', N'4', N'壮族', N'20213260004', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1206', N'磨姜良', N'男', N'2002-07-20', N'20213260037', N'123', N'1292', N'1085', N'450122200207207716', N'共青团员', N'2021', N'4', N'壮族', N'20213260037', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1207', N'姜雪莹', N'女', N'2002-06-21', N'20213260001', N'123', N'1292', N'1085', N'450204200206221025', N'群众', N'2021', N'4', N'汉族', N'20213260001', N'2021级信息管理与信息系统', N'6', N'1000', N'/img/upload/Userpofile/20213260001_1739772458203_.jpg', N'1', N'0')
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1208', N'陈信誉', N'女', N'2002-08-07', N'20213260013', N'123', N'1292', N'1085', N'450204200208070021', N'共青团员', N'2021', N'4', N'汉族', N'20213260013', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1209', N'韦覃勇', N'男', N'2000-10-19', N'20213260047', N'123', N'1292', N'1085', N'450222200010191111', N'群众', N'2021', N'4', N'汉族', N'20213260047', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1210', N'梁蕴仪', N'女', N'2002-12-25', N'20213260003', N'123', N'1292', N'1085', N'450421200212257048', N'共青团员', N'2021', N'4', N'汉族', N'20213260003', N'2021级信息管理与信息系统', N'6', N'1001', NULL, N'1', N'1006')
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1211', N'苏晨聪', N'0', N'2001-09-14', N'20213260035', N'123', N'1292', N'1085', N'450621200109150817', N'群众', N'2021', N'4', N'汉族', N'20213260035', N'2021级信息管理与信息系统', N'6', N'0', N'/img/upload/Userpofile/20213260035_1739772105251_.webp', N'1', N'0')
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1212', N'梁冬英', N'女', N'2000-11-19', N'20213260007', N'123', N'1292', N'1085', N'450703200011197249', N'共青团员', N'2021', N'4', N'汉族', N'20213260007', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1213', N'石青盈', N'女', N'2002-09-28', N'20213260008', N'123', N'1292', N'1085', N'450703200209282721', N'共青团员', N'2021', N'4', N'壮族', N'20213260008', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1214', N'李家辉', N'男', N'2003-02-20', N'20213260030', N'123', N'1292', N'1085', N'450703200302201551', N'共青团员', N'2021', N'4', N'壮族', N'20213260030', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1215', N'刘新贵', N'男', N'2001-11-18', N'20213260023', N'123', N'1292', N'1085', N'450721200111183939', N'群众', N'2021', N'4', N'汉族', N'20213260023', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1216', N'黄栢盛', N'男', N'2003-05-12', N'20213260016', N'123', N'1292', N'1085', N'45080220030512081X', N'共青团员', N'2021', N'4', N'壮族', N'20213260016', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1217', N'李杏双', N'女', N'1999-12-31', N'20213260006', N'123', N'1292', N'1085', N'450804199912314146', N'共青团员', N'2021', N'4', N'汉族', N'20213260006', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1218', N'蒙思敏', N'女', N'2002-02-15', N'20213260026', N'123', N'1292', N'1085', N'450821200202151460', N'群众', N'2021', N'4', N'汉族', N'20213260026', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1219', N'黄丹连', N'女', N'2002-08-28', N'20213260018', N'123', N'1292', N'1085', N'450821200208284926', N'共青团员', N'2021', N'4', N'瑶族', N'20213260018', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1220', N'李锶燕', N'女', N'2003-03-28', N'20213260010', N'123', N'1292', N'1085', N'450821200303283024', N'共青团员', N'2021', N'4', N'汉族', N'20213260010', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1221', N'黄敏婷', N'女', N'2002-04-11', N'20213260020', N'123', N'1292', N'1085', N'450881200204114723', N'共青团员', N'2021', N'4', N'汉族', N'20213260020', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1222', N'梁琪', N'女', N'2003-02-26', N'20213260002', N'123', N'1292', N'1085', N'450922200303011549', N'共青团员', N'2021', N'4', N'汉族', N'20213260002', N'2021级信息管理与信息系统', N'6', N'1000', N'/img/upload/Userpofile/20213260002_1739773946344_.jpg', N'1', N'0')
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1223', N'黄凯', N'男', N'2003-09-16', N'20213260039', N'123', N'1292', N'1085', N'450923200309164630', N'共青团员', N'2021', N'4', N'汉族', N'20213260039', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1224', N'陈洁梅', N'女', N'2001-10-06', N'20213260021', N'123', N'1292', N'1085', N'450981200110065049', N'共青团员', N'2021', N'4', N'汉族', N'20213260021', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1225', N'蒙东林', N'男', N'2003-01-28', N'20213260014', N'123', N'1292', N'1085', N'451024200301284695', N'共青团员', N'2021', N'4', N'壮族', N'20213260014', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1226', N'罗邓', N'1', N'2002-07-06', N'1', N'1', N'1292', N'1085', N'451221200207130413', N'群众', N'2021', N'4', N'壮族', N'20213260031', N'2021级信息管理与信息系统', N'6', N'0', N'/img/upload/Userpofile/1_1739720921987_.jpg', N'1', N'0')
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1227', N'韦国正', N'男', N'2001-10-16', N'20213260044', N'123', N'1292', N'1085', N'452123200110193117', N'群众', N'2021', N'4', N'汉族', N'20213260044', N'2021级信息管理与信息系统', N'6', N'1000', N'/img/upload/Userpofile/20213260044_1739797000506_.jpg', N'1', N'0')
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1228', N'刘祖威', N'男', N'2003-02-23', N'20213260022', N'123', N'1292', N'1085', N'452123200302233136', N'共青团员', N'2021', N'4', N'汉族', N'20213260022', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1229', N'卢子薇', N'女', N'2002-04-22', N'20213260045', N'123', N'1292', N'1085', N'452126200204220920', N'群众', N'2021', N'4', N'汉族', N'20213260045', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1230', N'陆月娥', N'女', N'2002-10-16', N'20213260017', N'123', N'1292', N'1085', N'452126200210160629', N'共青团员', N'2021', N'4', N'壮族', N'20213260017', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1231', N'莫浩', N'男', N'2001-10-28', N'20213260005', N'123', N'1292', N'1085', N'452127200110280013', N'共青团员', N'2021', N'4', N'壮族', N'20213260005', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1232', N'黄俊强', N'男', N'2004-04-21', N'20213260015', N'123', N'1292', N'1085', N'452225200404214815', N'群众', N'2021', N'4', N'壮族', N'20213260015', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1233', N'杨世杰', N'男', N'2001-04-21', N'20213260046', N'123', N'1292', N'1085', N'452228200104211515', N'群众', N'2021', N'4', N'汉族', N'20213260046', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1234', N'廖倩', N'女', N'2002-10-23', N'20213260032', N'123', N'1292', N'1085', N'452424200210240024', N'共青团员', N'2021', N'4', N'汉族', N'20213260032', N'2021级信息管理与信息系统', N'6', N'1000', N'/img/upload/Userpofile/20213260032_1739772297727_.jpg', N'1', N'0')
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1235', N'程星洪', N'男', N'2003-07-14', N'20213260038', N'123', N'1292', N'1085', N'452428200307141212', N'共青团员', N'2021', N'4', N'瑶族', N'20213260038', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1236', N'谢培玲', N'女', N'2002-08-23', N'20213260012', N'123', N'1292', N'1085', N'452723200208231225', N'群众', N'2021', N'4', N'仫佬族', N'20213260012', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1237', N'陈兴远', N'男', N'2002-07-14', N'20213260024', N'123', N'1292', N'1085', N'452725200207140594', N'共青团员', N'2021', N'4', N'壮族', N'20213260024', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1238', N'覃如寒', N'女', N'2003-05-10', N'20213260019', N'123', N'1292', N'1085', N'452730200305101127', N'共青团员', N'2021', N'4', N'壮族', N'20213260019', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1239', N'李思思', N'女', N'2003-03-25', N'20213260027', N'123', N'1292', N'1085', N'452731200303253924', N'中共党员', N'2021', N'4', N'汉族', N'20213260027', N'2021级信息管理与信息系统', N'6', N'0', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1240', N'姚茂杰', N'男', N'2003-07-03', N'20213260028', N'123', N'1292', N'1085', N'452731200307030031', N'群众', N'2021', N'4', N'侗族', N'20213260028', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1241', N'王康任', N'男', N'2003-01-23', N'20213260041', N'123', N'1292', N'1085', N'460105200301234214', N'群众', N'2021', N'4', N'汉族', N'20213260041', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1242', N'王旭妍', N'女', N'2002-09-24', N'20213260049', N'123', N'1292', N'1085', N'610121200209243087', N'群众', N'2021', N'4', N'汉族', N'20213260049', N'2021级信息管理与信息系统', N'6', N'1002', NULL, N'1', NULL)
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1244', N'碧梨.爱丽诗', N'女', N'2002-06-05', N'20213260078', NULL, N'1292', N'1085', N'451221200207130413', N'中共党员', N'2021', N'4', N'汉族', N'null', N'2021级信息管理与信息系统', N'6', N'1000', NULL, N'1', N'1006')
GO

INSERT INTO [dbo].[DATA_STUDENT] ([ID], [XSXM], [XSXB], [BIRTH], [YHM], [MM], [SSBJ], [ZYDM], [SFZH], [ZZMM], [SSNJ], [XZ], [MZ], [XSXH], [BJMC], [XLDM], [JYZT], [XSZP], [QYDM], [FZJS]) VALUES (N'1245', N'泰勒.斯威夫特', N'女', N'2000-11-09', N'20213260079', N'123', N'1412', N'1102', N'451221200207130413', N'中共预备党员', N'2021', N'4', N'汉族', N'null', N'2022壮医学', N'1', N'1000', NULL, N'1', N'1006')
GO

SET IDENTITY_INSERT [dbo].[DATA_STUDENT] OFF
GO


-- ----------------------------
-- Table structure for DATA_XSJLK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DATA_XSJLK]') AND type IN ('U'))
	DROP TABLE [dbo].[DATA_XSJLK]
GO

CREATE TABLE [dbo].[DATA_XSJLK] (
  [JLDM] int IDENTITY(1,1) NOT NULL,
  [XSID] int NOT NULL,
  [FBBZ] int NOT NULL,
  [FBSJ] datetime NULL,
  [JLWB] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [HTML] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [SCXGTIME] datetime NULL,
  [JLFJ] nvarchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CJSJ] datetime DEFAULT (getdate()) NULL
)
GO

ALTER TABLE [dbo].[DATA_XSJLK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'简历代码',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'JLDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生ID，对应STUDENT表id',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'XSID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布标志，1发布0未发布(暂存)',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'FBBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间（可空）',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'FBSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简历文本',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'JLWB'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简历HTML内容',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'HTML'
GO

EXEC sp_addextendedproperty
'MS_Description', N'上次修改时间',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'SCXGTIME'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简历附件 文档url',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'JLFJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK',
'COLUMN', N'CJSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生简历库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_XSJLK'
GO


-- ----------------------------
-- Records of [DATA_XSJLK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DATA_XSJLK] ON
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'1', N'1226', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', N'http://example.com/file1.pdf', NULL)
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'4', N'1227', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, NULL)
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'20', N'1205', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'21', N'1206', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'22', N'1207', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'23', N'1208', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'24', N'1209', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'25', N'1210', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'26', N'1211', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'27', N'1212', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'28', N'1213', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'29', N'1214', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'30', N'1215', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'31', N'1216', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'32', N'1217', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'33', N'1218', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'34', N'1219', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'35', N'1220', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'36', N'1221', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'37', N'1222', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'38', N'1223', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'39', N'1224', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'40', N'1225', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'41', N'1226', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'42', N'1227', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'43', N'1228', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'44', N'1229', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'45', N'1230', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'46', N'1231', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'47', N'1232', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'48', N'1233', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'49', N'1234', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'50', N'1235', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'51', N'1236', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'52', N'1237', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'53', N'1238', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'54', N'1239', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'55', N'1240', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'56', N'1241', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'57', N'1242', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'58', N'1244', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

INSERT INTO [dbo].[DATA_XSJLK] ([JLDM], [XSID], [FBBZ], [FBSJ], [JLWB], [HTML], [SCXGTIME], [JLFJ], [CJSJ]) VALUES (N'59', N'1245', N'1', N'2024-02-10 10:00:00.000', N'尊敬的招聘经理：  
您好！感谢您在百忙之中抽出时间阅读我的简历。我是来自[学校名称]的大三学生，专业是[专业名称]。通过这份简历，您将了解到我的学术背景、实践经验以及我对未来职业发展的期望。希望能有机会加入贵公司，贡献自己的能力，并在贵公司的平台上不断学习和成长。\n\n
个人信息：  
- 姓名：[姓名]  
- 性别：[性别]  
- 出生日期：[出生日期]  
- 联系电话：[联系电话]  
- 电子邮件：[电子邮件]  
- 住址：[住址]  
\n\n
教育背景：  
[学校名称]，[时间段]  
专业：[专业名称]，学位：[学位名称]  
主要课程：[列举相关课程]  
[学校名称]的课程体系帮助我在专业知识上打下了扎实的基础，并让我学会了如何将理论与实践相结合。在学术方面，我特别对[感兴趣的领域]有浓厚的兴趣，并通过选修课程进一步扩展了自己的知识面。\n\n
实践经历：\n\n
1. [公司/机构名称] — 实习生  
[时间段]  
在[公司名称]的实习过程中，我参与了[具体项目/任务]，主要负责[具体工作]。通过这段实习经历，我不仅学到了[技能或工具]，还通过与团队成员的协作，提升了自己的沟通能力和团队合作精神。\n\n
主要工作内容：  
- 参与[具体任务]的设计与实施；  
- 使用[相关软件/工具]进行数据分析，并编写报告；  
- 与团队成员共同探讨并解决项目中的技术难题；  
- 按时高质量完成任务并获得领导好评。\n\n
2. [其他项目或兼职经历]  
[时间段]  
在此项目中，我负责了[具体任务]，并成功实现了[具体成果]。通过这一经历，我学到了如何在快节奏的环境中管理时间和优先级，并提升了自己的组织能力。\n\n
技能与证书：\n\n
- 编程语言：熟练掌握[编程语言，如Python、Java等]，并在多个项目中应用过；  
- 办公软件：熟练使用Microsoft Office套件，尤其是Excel与PowerPoint，在数据分析与报告制作方面有丰富经验；  
- 外语能力：英语（CET-4），具备基本的英语口语和写作能力；  
- 证书：获得[相关证书名称]，并通过了[相关考试或培训]。\n\n
项目经验：\n\n
1. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，通过[技术或方法]解决了[问题或需求]。我在该项目中担任了[角色]，并负责了[具体任务]。\n\n
主要贡献：  
- 设计并开发了[模块或功能]；  
- 参与了项目的需求分析和功能测试；  
- 在团队中承担了协调与沟通工作，确保项目顺利推进。\n\n
2. 项目名称：[项目名称]  
[时间段]  
项目描述：该项目旨在[项目目标]，并通过[技术或方法]解决了[问题或需求]。作为项目成员，我与团队合作完成了项目的[主要任务]，并帮助客户达成了[预期目标]。\n\n
主要贡献：  
- 完成了[特定工作]，确保项目按时交付；  
- 进行技术调研，为项目的技术选型提供了数据支持；  
- 在项目过程中与客户进行沟通，保证了需求的准确传达。\n\n
自我评价：  
我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。\n\n
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。\n\n
期望岗位：[岗位名称]  
期望薪资：[薪资范围]  
工作地点：[希望工作地点]  
感谢您阅读我的简历，期待与您的面谈机会！', N'<div>HTML示例</div>', N'2024-02-10 09:30:00.000', NULL, N'2025-02-16 11:15:09.190')
GO

SET IDENTITY_INSERT [dbo].[DATA_XSJLK] OFF
GO


-- ----------------------------
-- Table structure for DATA_ZPHJLK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DATA_ZPHJLK]') AND type IN ('U'))
	DROP TABLE [dbo].[DATA_ZPHJLK]
GO

CREATE TABLE [dbo].[DATA_ZPHJLK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [ZPHBT] varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [DWDM] int NOT NULL,
  [WZBZ] int NOT NULL,
  [JBSJ] datetime NOT NULL,
  [DYGWDM] varchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [SZXX] varchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT ('本校') NOT NULL,
  [JBDD] varchar(255) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[DATA_ZPHJLK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'招聘会代码   招聘会记录库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'招聘会标题',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK',
'COLUMN', N'ZPHBT'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位代码',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK',
'COLUMN', N'DWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'位置标志，1校内，2校外',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK',
'COLUMN', N'WZBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'举办时间',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK',
'COLUMN', N'JBSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'对应岗位代码，此次招聘会对应的岗位代码，多个就用+来链接，如1+2+3...',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK',
'COLUMN', N'DYGWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所在学校',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK',
'COLUMN', N'SZXX'
GO

EXEC sp_addextendedproperty
'MS_Description', N'举办地点',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK',
'COLUMN', N'JBDD'
GO

EXEC sp_addextendedproperty
'MS_Description', N'招聘会记录库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPHJLK'
GO


-- ----------------------------
-- Table structure for DATA_ZPJZK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DATA_ZPJZK]') AND type IN ('U'))
	DROP TABLE [dbo].[DATA_ZPJZK]
GO

CREATE TABLE [dbo].[DATA_ZPJZK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [DWDM] int NOT NULL,
  [WBNR] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [HTML] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [CJRGH] nvarchar(500) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [CJSJ] datetime NULL,
  [FBBZ] int DEFAULT ((0)) NOT NULL,
  [FBSJ] datetime NULL
)
GO

ALTER TABLE [dbo].[DATA_ZPJZK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'招聘简章代码',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPJZK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位代码。对应DATA_DWDMK',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPJZK',
'COLUMN', N'DWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'文本内容',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPJZK',
'COLUMN', N'WBNR'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPJZK',
'COLUMN', N'CJSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布标志，1为已发布，0为未发布(默认)',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPJZK',
'COLUMN', N'FBBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发布时间(FBBZ为0时为空)',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPJZK',
'COLUMN', N'FBSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'招聘简章库',
'SCHEMA', N'dbo',
'TABLE', N'DATA_ZPJZK'
GO


-- ----------------------------
-- Table structure for DWGMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DWGMK]') AND type IN ('U'))
	DROP TABLE [dbo].[DWGMK]
GO

CREATE TABLE [dbo].[DWGMK] (
  [GMDM] int IDENTITY(1,1) NOT NULL,
  [GMXQ] varchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[DWGMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'规模代码',
'SCHEMA', N'dbo',
'TABLE', N'DWGMK',
'COLUMN', N'GMDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'规模详情',
'SCHEMA', N'dbo',
'TABLE', N'DWGMK',
'COLUMN', N'GMXQ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位规模库',
'SCHEMA', N'dbo',
'TABLE', N'DWGMK'
GO


-- ----------------------------
-- Records of [DWGMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DWGMK] ON
GO

INSERT INTO [dbo].[DWGMK] ([GMDM], [GMXQ]) VALUES (N'8', N'少于50人')
GO

INSERT INTO [dbo].[DWGMK] ([GMDM], [GMXQ]) VALUES (N'9', N'50-150人')
GO

INSERT INTO [dbo].[DWGMK] ([GMDM], [GMXQ]) VALUES (N'10', N'150-500人')
GO

INSERT INTO [dbo].[DWGMK] ([GMDM], [GMXQ]) VALUES (N'11', N'500-1000人')
GO

INSERT INTO [dbo].[DWGMK] ([GMDM], [GMXQ]) VALUES (N'12', N'1000-5000人')
GO

INSERT INTO [dbo].[DWGMK] ([GMDM], [GMXQ]) VALUES (N'13', N'5000-10000人')
GO

INSERT INTO [dbo].[DWGMK] ([GMDM], [GMXQ]) VALUES (N'14', N'10000人以上')
GO

SET IDENTITY_INSERT [dbo].[DWGMK] OFF
GO


-- ----------------------------
-- Table structure for DWHYDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DWHYDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[DWHYDMK]
GO

CREATE TABLE [dbo].[DWHYDMK] (
  [HYDM] int IDENTITY(1,1) NOT NULL,
  [HYMC] nvarchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [HYMS] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[DWHYDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'行业代码',
'SCHEMA', N'dbo',
'TABLE', N'DWHYDMK',
'COLUMN', N'HYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'行业名称',
'SCHEMA', N'dbo',
'TABLE', N'DWHYDMK',
'COLUMN', N'HYMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'行业描述',
'SCHEMA', N'dbo',
'TABLE', N'DWHYDMK',
'COLUMN', N'HYMS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位行业代码库',
'SCHEMA', N'dbo',
'TABLE', N'DWHYDMK'
GO


-- ----------------------------
-- Records of [DWHYDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DWHYDMK] ON
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'1', N'衣、林、牧、渔业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'2', N'采矿业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'3', N'制造业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'4', N'电力、热力、燃气及水生产和供应业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'5', N'建筑业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'6', N'批发和零售业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'7', N'交通运输、仓储和邮政业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'8', N'住店和餐饮业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'9', N'信息传输、软件和信息技术服务业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'10', N'金融业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'11', N'房地产业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'12', N'租赁和商务服务业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'13', N'科学研究和技术服务业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'14', N'水利、环境和公共设施管理业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'15', N'居民服务、修理和其他服务业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'16', N'教育', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'17', N'卫生和社会工作', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'18', N'文化、体育和娱乐业', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'19', N'公共管理、社会保障和社会组织', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'20', N'国际组织', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'21', N'军队', NULL)
GO

INSERT INTO [dbo].[DWHYDMK] ([HYDM], [HYMC], [HYMS]) VALUES (N'28', N'旅游行业', N'就是旅游行业')
GO

SET IDENTITY_INSERT [dbo].[DWHYDMK] OFF
GO


-- ----------------------------
-- Table structure for DWXZK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DWXZK]') AND type IN ('U'))
	DROP TABLE [dbo].[DWXZK]
GO

CREATE TABLE [dbo].[DWXZK] (
  [DWXZDM] int IDENTITY(1,1) NOT NULL,
  [DWXZ] nvarchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [XZMS] nvarchar(1000) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[DWXZK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位性质代码',
'SCHEMA', N'dbo',
'TABLE', N'DWXZK',
'COLUMN', N'DWXZDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位性质',
'SCHEMA', N'dbo',
'TABLE', N'DWXZK',
'COLUMN', N'DWXZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位性质描述',
'SCHEMA', N'dbo',
'TABLE', N'DWXZK',
'COLUMN', N'XZMS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位性质库',
'SCHEMA', N'dbo',
'TABLE', N'DWXZK'
GO


-- ----------------------------
-- Records of [DWXZK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DWXZK] ON
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'1', N'机关', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'2', N'科研设计单位', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'3', N'高等教育单位', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'4', N'中初教育单位', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'5', N'医疗卫生单位', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'6', N'其他事业单位', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'7', N'国有企业', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'8', N'民营企业', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'9', N'三资企业', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'10', N'其他企业', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'11', N'部队', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'12', N'农村建制村', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'13', N'城镇社区', NULL)
GO

INSERT INTO [dbo].[DWXZK] ([DWXZDM], [DWXZ], [XZMS]) VALUES (N'14', N'其他', NULL)
GO

SET IDENTITY_INSERT [dbo].[DWXZK] OFF
GO


-- ----------------------------
-- Table structure for DWYHK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[DWYHK]') AND type IN ('U'))
	DROP TABLE [dbo].[DWYHK]
GO

CREATE TABLE [dbo].[DWYHK] (
  [ID] int IDENTITY(1000,1) NOT NULL,
  [DYDW] int NOT NULL,
  [YHM] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [MM] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [TYBZ] int DEFAULT ((0)) NOT NULL,
  [YHXM] nvarchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT (N'暂未提供') NULL,
  [SEX] nvarchar(10) COLLATE Chinese_PRC_CI_AS NULL,
  [ZW] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [SSDW] int NOT NULL,
  [RZBZ] int DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[DWYHK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位代码(对应)',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'DYDW'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'YHM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'MM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'停用代码',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'TYBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名称',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'YHXM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'SEX'
GO

EXEC sp_addextendedproperty
'MS_Description', N'职位',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'ZW'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属单位,对应DWDMK的DWDM',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'SSDW'
GO

EXEC sp_addextendedproperty
'MS_Description', N'认证标志，0 未认证，1 认证审核中 2 已认证',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK',
'COLUMN', N'RZBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位用户库',
'SCHEMA', N'dbo',
'TABLE', N'DWYHK'
GO


-- ----------------------------
-- Records of [DWYHK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DWYHK] ON
GO

INSERT INTO [dbo].[DWYHK] ([ID], [DYDW], [YHM], [MM], [TYBZ], [YHXM], [SEX], [ZW], [SSDW], [RZBZ]) VALUES (N'1000', N'1', N'luo', N'123', N'0', N'罗邓卫宁招聘', N'男', N'人事专员', N'1', N'1')
GO

INSERT INTO [dbo].[DWYHK] ([ID], [DYDW], [YHM], [MM], [TYBZ], [YHXM], [SEX], [ZW], [SSDW], [RZBZ]) VALUES (N'1001', N'4', N'billie', N'123', N'0', N'Billie Eilish', N'女', N'CEO', N'4', N'0')
GO

INSERT INTO [dbo].[DWYHK] ([ID], [DYDW], [YHM], [MM], [TYBZ], [YHXM], [SEX], [ZW], [SSDW], [RZBZ]) VALUES (N'1002', N'57', N'deepseek', N'123', N'0', N'梁文锋', N'男', N'董事长', N'57', N'2')
GO

INSERT INTO [dbo].[DWYHK] ([ID], [DYDW], [YHM], [MM], [TYBZ], [YHXM], [SEX], [ZW], [SSDW], [RZBZ]) VALUES (N'1003', N'58', N'msk', N'1', N'0', N'Elon Reeve Musk', N'男', N'首席执行官CEO', N'58', N'0')
GO

INSERT INTO [dbo].[DWYHK] ([ID], [DYDW], [YHM], [MM], [TYBZ], [YHXM], [SEX], [ZW], [SSDW], [RZBZ]) VALUES (N'1004', N'59', N'hrx', N'123', N'0', N'黄仁勋', N'男', N'CEO 创始人', N'59', N'2')
GO

SET IDENTITY_INSERT [dbo].[DWYHK] OFF
GO


-- ----------------------------
-- Table structure for FLDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[FLDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[FLDMK]
GO

CREATE TABLE [dbo].[FLDMK] (
  [FLDM] int IDENTITY(100,100) NOT NULL,
  [FLMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [FLMS] nvarchar(500) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[FLDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'福利代码',
'SCHEMA', N'dbo',
'TABLE', N'FLDMK',
'COLUMN', N'FLDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'福利名称',
'SCHEMA', N'dbo',
'TABLE', N'FLDMK',
'COLUMN', N'FLMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'福利描述',
'SCHEMA', N'dbo',
'TABLE', N'FLDMK',
'COLUMN', N'FLMS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'福利代码库',
'SCHEMA', N'dbo',
'TABLE', N'FLDMK'
GO


-- ----------------------------
-- Records of [FLDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[FLDMK] ON
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'100', N'补充公积金', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'300', N'通讯补贴', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'700', N'专业培训', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'900', N'交通补贴', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'1400', N'培训旅游', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'1600', N'五险一金', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'1700', N'年终奖', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'2000', N'双休', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'2400', N'定期体检', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'2600', N'技能培训', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'2700', N'扁平管理', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'3800', N'年底双薪', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'4100', N'带薪年假', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'4300', N'节日礼物', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'4500', N'管理规范', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'4600', N'岗位晋升', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'4700', N'高温补贴', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'4900', N'年终分红', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'5100', N'加班工资', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'5200', N'餐补', NULL)
GO

INSERT INTO [dbo].[FLDMK] ([FLDM], [FLMC], [FLMS]) VALUES (N'5400', N'周末双休', NULL)
GO

SET IDENTITY_INSERT [dbo].[FLDMK] OFF
GO


-- ----------------------------
-- Table structure for GLYDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[GLYDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[GLYDMK]
GO

CREATE TABLE [dbo].[GLYDMK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [DLZH] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [DLMM] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [MC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [QYDM] int DEFAULT ((1)) NOT NULL
)
GO

ALTER TABLE [dbo].[GLYDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录账号',
'SCHEMA', N'dbo',
'TABLE', N'GLYDMK',
'COLUMN', N'DLZH'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录密码',
'SCHEMA', N'dbo',
'TABLE', N'GLYDMK',
'COLUMN', N'DLMM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'管理员名称',
'SCHEMA', N'dbo',
'TABLE', N'GLYDMK',
'COLUMN', N'MC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'启用代码',
'SCHEMA', N'dbo',
'TABLE', N'GLYDMK',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'管理员代码库',
'SCHEMA', N'dbo',
'TABLE', N'GLYDMK'
GO


-- ----------------------------
-- Records of [GLYDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[GLYDMK] ON
GO

INSERT INTO [dbo].[GLYDMK] ([ID], [DLZH], [DLMM], [MC], [QYDM]) VALUES (N'1', N'123', N'123', N'罗邓', N'1')
GO

SET IDENTITY_INSERT [dbo].[GLYDMK] OFF
GO


-- ----------------------------
-- Table structure for GWFLDYK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[GWFLDYK]') AND type IN ('U'))
	DROP TABLE [dbo].[GWFLDYK]
GO

CREATE TABLE [dbo].[GWFLDYK] (
  [GWDM] int NOT NULL,
  [FLDM] int NOT NULL
)
GO

ALTER TABLE [dbo].[GWFLDYK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位代码',
'SCHEMA', N'dbo',
'TABLE', N'GWFLDYK',
'COLUMN', N'GWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'福利代码',
'SCHEMA', N'dbo',
'TABLE', N'GWFLDYK',
'COLUMN', N'FLDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位福利对应库',
'SCHEMA', N'dbo',
'TABLE', N'GWFLDYK'
GO


-- ----------------------------
-- Records of [GWFLDYK]
-- ----------------------------
INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'6', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'4', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'15', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'22', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'5400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'23', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'4700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'2400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'5', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'4100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'8', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'2000')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'2600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'2700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'4900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'34', N'5100')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'900')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'4300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'33', N'5200')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'300')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'1400')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'1600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'1700')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'3800')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'4500')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'4600')
GO

INSERT INTO [dbo].[GWFLDYK]  VALUES (N'32', N'4700')
GO


-- ----------------------------
-- Table structure for GWFLK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[GWFLK]') AND type IN ('U'))
	DROP TABLE [dbo].[GWFLK]
GO

CREATE TABLE [dbo].[GWFLK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [FLMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [FLMS] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[GWFLK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位分类id',
'SCHEMA', N'dbo',
'TABLE', N'GWFLK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'分类名称',
'SCHEMA', N'dbo',
'TABLE', N'GWFLK',
'COLUMN', N'FLMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'分类描述',
'SCHEMA', N'dbo',
'TABLE', N'GWFLK',
'COLUMN', N'FLMS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位分类库',
'SCHEMA', N'dbo',
'TABLE', N'GWFLK'
GO


-- ----------------------------
-- Records of [GWFLK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[GWFLK] ON
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'1', N'IT/互联网', N'包括软件开发、系统分析、网络安全、数据分析等与信息技术相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'2', N'金融/会计', N'包括银行、投资、财务管理、审计、税务等与金融和会计相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'3', N'销售/市场', N'包括销售代表、市场营销、品牌管理、客户关系管理等与销售和市场相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'4', N'人力资源', N'包括招聘、培训与发展、绩效管理、员工关系等与人力资源管理相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'5', N'生产/制造', N'包括生产管理、质量控制、设备维护、工艺工程等与生产和制造相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'6', N'物流/供应链', N'包括物流管理、仓储管理、采购、供应链管理等与物流和供应链相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'7', N'教育/培训', N'包括教师、培训师、教育管理、课程开发等与教育和培训相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'8', N'医疗/护理', N'包括医生、护士、医疗技术人员、公共卫生等与医疗和护理相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'9', N'法律/合规', N'包括律师、合规专员、法律顾问、知识产权等与法律和合规相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'10', N'行政/文秘', N'包括行政助理、文秘、办公室管理、客户服务等与行政和文秘相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'11', N'设计/创意', N'包括平面设计、产品设计、室内设计、用户体验设计等与设计和创意相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'12', N'公共关系', N'包括公关专员、媒体关系、品牌传播、危机管理等与公共关系相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'13', N'科研/技术', N'包括研究员、实验室技术人员、科学家、技术开发等与科研和技术相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'14', N'建筑/工程', N'包括建筑师、土木工程师、结构工程师、项目经理等与建筑和工程相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'15', N'旅游/酒店', N'包括旅游顾问、酒店管理、客户服务、活动策划等与旅游和酒店相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'16', N'媒体/广告', N'包括记者、编辑、广告策划、市场传播等与媒体和广告相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'17', N'电子商务', N'包括电商运营、网络营销、产品经理、客户服务等与电子商务相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'18', N'环保/能源', N'包括环境工程师、能源管理、可持续发展、环保顾问等与环保和能源相关的职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'19', N'其他', N'包括不属于以上分类的其他职位。')
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'20', N'核电类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'21', N'充电桩/站类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'22', N'产品', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'23', N'售电类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'24', N'经营管理类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'25', N'储能类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'26', N'市场/策划/推广类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'27', N'智能电网类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'28', N'能源互联网', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'29', N'氢能', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'30', N'综合能源', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'31', N'碳管理', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'32', N'风力发电', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'33', N'火电运行', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'34', N'软件', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'35', N'环保运行', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'36', N'光伏电站', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'37', N'人力资源', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'38', N'翻译类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'39', N'技术研发', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'40', N'销售招商类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'41', N'发电', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'42', N'工程管理/施工', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'43', N'水电站', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'44', N'采购类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'45', N'水利水电工程', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'46', N'硬件', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'47', N'环保检修', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'48', N'商务', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'49', N'输变电', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'50', N'风电整机', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'51', N'光伏工程', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'52', N'行政', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'53', N'成本/造价/预算类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'54', N'火电检修', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'55', N'咨询/顾问类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'56', N'生产制造/工艺', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'57', N'贸易/进出口类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'58', N'光伏系统', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'59', N'监理类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'60', N'物流/仓储类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'61', N'技术支持/客服类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'62', N'供配电', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'63', N'电气设备成本', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'64', N'其他', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'65', N'数据分析', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'66', N'叶片及材料', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'67', N'财务/审计/统计类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'68', N'环境监测', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'69', N'环保电厂管理', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'70', N'成本', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'71', N'火电电厂管理', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'72', N'测试/调试', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'73', N'环保环境监测', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'74', N'法务', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'75', N'技术支持', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'76', N'光伏设备', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'77', N'控制系统', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'78', N'技工类', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'79', N'运维/实施', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'80', N'塔筒/塔架', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'81', N'环保综合', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'82', N'项目管理', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'83', N'综合', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'84', N'光伏电池及组件', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'85', N'土木/建筑', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'86', N'光电/光热', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'87', N'发电机及元件', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'88', N'质量品质', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'89', N'勘测/环评', NULL)
GO

INSERT INTO [dbo].[GWFLK] ([ID], [FLMC], [FLMS]) VALUES (N'90', N'光伏零部件', NULL)
GO

SET IDENTITY_INSERT [dbo].[GWFLK] OFF
GO


-- ----------------------------
-- Table structure for JSBJDYK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[JSBJDYK]') AND type IN ('U'))
	DROP TABLE [dbo].[JSBJDYK]
GO

CREATE TABLE [dbo].[JSBJDYK] (
  [BJID] int NOT NULL,
  [JSID] int NOT NULL
)
GO

ALTER TABLE [dbo].[JSBJDYK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'班级代码ID，对应BJDMK的id',
'SCHEMA', N'dbo',
'TABLE', N'JSBJDYK',
'COLUMN', N'BJID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'教师编号ID，对应JSDMK .id',
'SCHEMA', N'dbo',
'TABLE', N'JSBJDYK',
'COLUMN', N'JSID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'教师班级对应库',
'SCHEMA', N'dbo',
'TABLE', N'JSBJDYK'
GO


-- ----------------------------
-- Records of [JSBJDYK]
-- ----------------------------
INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1411', N'1000')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1073', N'1001')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1376', N'1000')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1382', N'1000')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1477', N'1006')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1416', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1414', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1411', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1421', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1422', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1417', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1418', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1412', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1415', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1410', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1436', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1440', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1439', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1438', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1437', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1481', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1480', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1482', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1479', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1446', N'1003')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1392', N'1003')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1413', N'1000')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1415', N'1000')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1401', N'1004')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1440', N'1006')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1419', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1420', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1413', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1435', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1477', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1478', N'1002')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1427', N'1003')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1398', N'1004')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1416', N'1000')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1402', N'1004')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1412', N'1000')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1414', N'1000')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1292', N'1006')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1411', N'1006')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1416', N'1006')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1415', N'1006')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1412', N'1006')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1292', N'1009')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1307', N'1009')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1286', N'1009')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1284', N'1009')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1292', N'2007')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1413', N'1006')
GO

INSERT INTO [dbo].[JSBJDYK]  VALUES (N'1414', N'1006')
GO


-- ----------------------------
-- Table structure for JSDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[JSDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[JSDMK]
GO

CREATE TABLE [dbo].[JSDMK] (
  [ID] int IDENTITY(1000,1) NOT NULL,
  [JSMC] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [SEX] nvarchar(10) COLLATE Chinese_PRC_CI_AS DEFAULT (N'未知') NULL,
  [DLZH] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [DLMM] nvarchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT ((123)) NOT NULL,
  [QYDM] int DEFAULT ((1)) NOT NULL
)
GO

ALTER TABLE [dbo].[JSDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'教师名称',
'SCHEMA', N'dbo',
'TABLE', N'JSDMK',
'COLUMN', N'JSMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'教师性别',
'SCHEMA', N'dbo',
'TABLE', N'JSDMK',
'COLUMN', N'SEX'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录账号',
'SCHEMA', N'dbo',
'TABLE', N'JSDMK',
'COLUMN', N'DLZH'
GO

EXEC sp_addextendedproperty
'MS_Description', N'登录密码',
'SCHEMA', N'dbo',
'TABLE', N'JSDMK',
'COLUMN', N'DLMM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'启用代码',
'SCHEMA', N'dbo',
'TABLE', N'JSDMK',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'教师代码库',
'SCHEMA', N'dbo',
'TABLE', N'JSDMK'
GO


-- ----------------------------
-- Records of [JSDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[JSDMK] ON
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1000', N'罗老湿', N'男', N'lls', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1001', N'碧梨', N'女', N'bl', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1002', N'罗邓', N'男', N'ld', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1003', N'蔡徐坤', N'女', N'cxk', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1004', N'唐梧倩', N'女', N'twq', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1006', N'田邵园', N'女', N'tsy', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1005', N'xdd', N'男', N'xjp', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1007', N'碧梨爱拉屎', N'女', N'billie', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1008', N'爱因斯坦', N'男', N'ayst', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1009', N'小瑞瑞', N'女', N'xrr', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'1010', N'郁爱萍', N'女', N'yap123', N'123', N'1')
GO

INSERT INTO [dbo].[JSDMK] ([ID], [JSMC], [SEX], [DLZH], [DLMM], [QYDM]) VALUES (N'2007', N'郁丹明', N'女', N'ydm123', N'123', N'1')
GO

SET IDENTITY_INSERT [dbo].[JSDMK] OFF
GO


-- ----------------------------
-- Table structure for JYHJK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[JYHJK]') AND type IN ('U'))
	DROP TABLE [dbo].[JYHJK]
GO

CREATE TABLE [dbo].[JYHJK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [IMGURL] nvarchar(1000) COLLATE Chinese_PRC_CI_AS NULL,
  [GWDM] int NOT NULL,
  [TJSJ] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[JYHJK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'编号',
'SCHEMA', N'dbo',
'TABLE', N'JYHJK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'图片链接',
'SCHEMA', N'dbo',
'TABLE', N'JYHJK',
'COLUMN', N'IMGURL'
GO

EXEC sp_addextendedproperty
'MS_Description', N'对应岗位代码',
'SCHEMA', N'dbo',
'TABLE', N'JYHJK',
'COLUMN', N'GWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提交时间，默认为插入时间',
'SCHEMA', N'dbo',
'TABLE', N'JYHJK',
'COLUMN', N'TJSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'就业环境库',
'SCHEMA', N'dbo',
'TABLE', N'JYHJK'
GO


-- ----------------------------
-- Records of [JYHJK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[JYHJK] ON
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'1', N'/img/upload/1738833762607_.jpg', N'15', N'2025-02-06 17:22:43.060')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'2', N'/img/upload/1738833763013_.jpg', N'15', N'2025-02-06 17:22:43.063')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'3', N'/img/upload/1739096132689_.png', N'30', N'2025-02-09 18:15:32.837')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'4', N'/img/upload/1739099390248_.png', N'31', N'2025-02-09 19:09:50.430')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'5', N'/img/upload/1739099390392_.png', N'31', N'2025-02-09 19:09:50.433')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'18', N'/img/upload/1739369111659_.jpg', N'34', N'2025-02-12 22:05:11.700')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'19', N'/img/upload/1739369111692_.jpg', N'34', N'2025-02-12 22:05:11.703')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'20', N'/img/upload/1739369259337_.jpg', N'33', N'2025-02-12 22:07:39.370')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'21', N'/img/upload/1739682412884_.jpeg', N'17', N'2025-02-16 13:06:52.893')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'22', N'/img/upload/1739682412889_.jpg', N'17', N'2025-02-16 13:06:52.893')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'23', N'/img/upload/1739791089371_.jpg', N'35', N'2025-02-17 19:18:09.503')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'24', N'/img/upload/1739791089421_.jpg', N'35', N'2025-02-17 19:18:09.530')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'25', N'/img/upload/1739791089432_.jpg', N'35', N'2025-02-17 19:18:09.543')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'26', N'/img/upload/1739791089462_.jpg', N'35', N'2025-02-17 19:18:09.543')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'6', N'/img/upload/1739114501067_.jpg', N'32', N'2025-02-09 23:21:41.483')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'7', N'/img/upload/1739114501247_.jpg', N'32', N'2025-02-09 23:21:41.483')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'8', N'/img/upload/1739114501260_.jpg', N'32', N'2025-02-09 23:21:41.487')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'9', N'/img/upload/1739114501290_.jpg', N'32', N'2025-02-09 23:21:41.490')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'10', N'/img/upload/1739114501328_.jpg', N'32', N'2025-02-09 23:21:41.490')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'11', N'/img/upload/1739114501390_.jpg', N'32', N'2025-02-09 23:21:41.490')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'12', N'/img/upload/1739114501414_.jpg', N'32', N'2025-02-09 23:21:41.493')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'13', N'/img/upload/1739114501432_.jpg', N'32', N'2025-02-09 23:21:41.493')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'14', N'/img/upload/1739114501442_.jpg', N'32', N'2025-02-09 23:21:41.497')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'15', N'/img/upload/1739114567932_.jpg', N'32', N'2025-02-09 23:22:48.050')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'16', N'/img/upload/1739114568032_.jpg', N'32', N'2025-02-09 23:22:48.050')
GO

INSERT INTO [dbo].[JYHJK] ([ID], [IMGURL], [GWDM], [TJSJ]) VALUES (N'17', N'/img/upload/1739114568034_.jpg', N'32', N'2025-02-09 23:22:48.053')
GO

SET IDENTITY_INSERT [dbo].[JYHJK] OFF
GO


-- ----------------------------
-- Table structure for JYZTDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[JYZTDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[JYZTDMK]
GO

CREATE TABLE [dbo].[JYZTDMK] (
  [ZTDM] int IDENTITY(1000,1) NOT NULL,
  [JYZT] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ZTMS] nvarchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [QYDM] int DEFAULT ((1)) NOT NULL
)
GO

ALTER TABLE [dbo].[JYZTDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态代码',
'SCHEMA', N'dbo',
'TABLE', N'JYZTDMK',
'COLUMN', N'ZTDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'就业状态',
'SCHEMA', N'dbo',
'TABLE', N'JYZTDMK',
'COLUMN', N'JYZT'
GO

EXEC sp_addextendedproperty
'MS_Description', N'状态描述',
'SCHEMA', N'dbo',
'TABLE', N'JYZTDMK',
'COLUMN', N'ZTMS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'启用代码',
'SCHEMA', N'dbo',
'TABLE', N'JYZTDMK',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'就业状态代码库',
'SCHEMA', N'dbo',
'TABLE', N'JYZTDMK'
GO


-- ----------------------------
-- Records of [JYZTDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[JYZTDMK] ON
GO

INSERT INTO [dbo].[JYZTDMK] ([ZTDM], [JYZT], [ZTMS], [QYDM]) VALUES (N'1000', N'未就业', N'未就业', N'1')
GO

INSERT INTO [dbo].[JYZTDMK] ([ZTDM], [JYZT], [ZTMS], [QYDM]) VALUES (N'1001', N'已就业', N'已就业', N'1')
GO

INSERT INTO [dbo].[JYZTDMK] ([ZTDM], [JYZT], [ZTMS], [QYDM]) VALUES (N'1002', N'实习中', N'学生在实习期间', N'1')
GO

INSERT INTO [dbo].[JYZTDMK] ([ZTDM], [JYZT], [ZTMS], [QYDM]) VALUES (N'1003', N'已签订第三方', NULL, N'1')
GO

SET IDENTITY_INSERT [dbo].[JYZTDMK] OFF
GO


-- ----------------------------
-- Table structure for LXFSDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[LXFSDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[LXFSDMK]
GO

CREATE TABLE [dbo].[LXFSDMK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [FSMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [lXNR] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [QYDM] int DEFAULT ((1)) NULL,
  [SSYH] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [CJSJ] datetime DEFAULT (getdate()) NOT NULL
)
GO

ALTER TABLE [dbo].[LXFSDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'方式名称，如微信，QQ，手机号，邮箱',
'SCHEMA', N'dbo',
'TABLE', N'LXFSDMK',
'COLUMN', N'FSMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系内容',
'SCHEMA', N'dbo',
'TABLE', N'LXFSDMK',
'COLUMN', N'lXNR'
GO

EXEC sp_addextendedproperty
'MS_Description', N'启用代码',
'SCHEMA', N'dbo',
'TABLE', N'LXFSDMK',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属用户，对应YHM',
'SCHEMA', N'dbo',
'TABLE', N'LXFSDMK',
'COLUMN', N'SSYH'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'LXFSDMK',
'COLUMN', N'CJSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'联系方式代码库',
'SCHEMA', N'dbo',
'TABLE', N'LXFSDMK'
GO


-- ----------------------------
-- Table structure for MSDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[MSDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[MSDMK]
GO

CREATE TABLE [dbo].[MSDMK] (
  [MSDM] int IDENTITY(1,1) NOT NULL,
  [XSDM] int NOT NULL,
  [DWDM] int NOT NULL,
  [GWDM] int NOT NULL,
  [MSSJ] datetime NULL,
  [MSZT] int DEFAULT ((1)) NOT NULL,
  [MSJG] int NULL
)
GO

ALTER TABLE [dbo].[MSDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'面试代码',
'SCHEMA', N'dbo',
'TABLE', N'MSDMK',
'COLUMN', N'MSDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生代码',
'SCHEMA', N'dbo',
'TABLE', N'MSDMK',
'COLUMN', N'XSDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位代码',
'SCHEMA', N'dbo',
'TABLE', N'MSDMK',
'COLUMN', N'DWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗业代码',
'SCHEMA', N'dbo',
'TABLE', N'MSDMK',
'COLUMN', N'GWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'面试时间',
'SCHEMA', N'dbo',
'TABLE', N'MSDMK',
'COLUMN', N'MSSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'面试状态',
'SCHEMA', N'dbo',
'TABLE', N'MSDMK',
'COLUMN', N'MSZT'
GO

EXEC sp_addextendedproperty
'MS_Description', N'面试结果,MSJGDMK.ID',
'SCHEMA', N'dbo',
'TABLE', N'MSDMK',
'COLUMN', N'MSJG'
GO

EXEC sp_addextendedproperty
'MS_Description', N'面试代码库',
'SCHEMA', N'dbo',
'TABLE', N'MSDMK'
GO


-- ----------------------------
-- Table structure for MSJGDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[MSJGDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[MSJGDMK]
GO

CREATE TABLE [dbo].[MSJGDMK] (
  [ID] int IDENTITY(100,1) NOT NULL,
  [MSJG] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[MSJGDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'结果编号',
'SCHEMA', N'dbo',
'TABLE', N'MSJGDMK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'面试结果',
'SCHEMA', N'dbo',
'TABLE', N'MSJGDMK',
'COLUMN', N'MSJG'
GO

EXEC sp_addextendedproperty
'MS_Description', N'面试结果代码库',
'SCHEMA', N'dbo',
'TABLE', N'MSJGDMK'
GO


-- ----------------------------
-- Records of [MSJGDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[MSJGDMK] ON
GO

INSERT INTO [dbo].[MSJGDMK] ([ID], [MSJG]) VALUES (N'100', N'录用')
GO

INSERT INTO [dbo].[MSJGDMK] ([ID], [MSJG]) VALUES (N'101', N'不录用')
GO

INSERT INTO [dbo].[MSJGDMK] ([ID], [MSJG]) VALUES (N'102', N'待定')
GO

INSERT INTO [dbo].[MSJGDMK] ([ID], [MSJG]) VALUES (N'103', N'多轮面试')
GO

SET IDENTITY_INSERT [dbo].[MSJGDMK] OFF
GO


-- ----------------------------
-- Table structure for SFDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SFDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[SFDMK]
GO

CREATE TABLE [dbo].[SFDMK] (
  [SFDM] int IDENTITY(1,1) NOT NULL,
  [SFMC] nvarchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[SFDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'省份代码',
'SCHEMA', N'dbo',
'TABLE', N'SFDMK',
'COLUMN', N'SFDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'省份名称',
'SCHEMA', N'dbo',
'TABLE', N'SFDMK',
'COLUMN', N'SFMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'省份代码库',
'SCHEMA', N'dbo',
'TABLE', N'SFDMK'
GO


-- ----------------------------
-- Records of [SFDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SFDMK] ON
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'1', N'北京市')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'2', N'北京市')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'3', N'天津市')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'4', N'河北省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'5', N'山西省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'6', N'内蒙古自治区')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'7', N'辽宁省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'8', N'吉林省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'9', N'黑龙江省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'10', N'上海市')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'11', N'江苏省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'12', N'浙江省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'13', N'安徽省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'14', N'福建省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'15', N'江西省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'16', N'山东省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'17', N'河南省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'18', N'湖北省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'19', N'湖南省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'20', N'广东省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'21', N'广西壮族自治区')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'22', N'海南省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'23', N'重庆市')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'24', N'四川省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'25', N'贵州省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'26', N'云南省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'27', N'西藏自治区')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'28', N'陕西省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'29', N'甘肃省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'30', N'青海省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'31', N'宁夏回族自治区')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'32', N'新疆维吾尔自治区')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'33', N'香港特别行政区')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'34', N'澳门特别行政区')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'35', N'台湾省')
GO

INSERT INTO [dbo].[SFDMK] ([SFDM], [SFMC]) VALUES (N'36', N'昆明')
GO

SET IDENTITY_INSERT [dbo].[SFDMK] OFF
GO


-- ----------------------------
-- Table structure for TDJLK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TDJLK]') AND type IN ('U'))
	DROP TABLE [dbo].[TDJLK]
GO

CREATE TABLE [dbo].[TDJLK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [STUID] int NOT NULL,
  [GWDM] int NOT NULL,
  [TDSJ] datetime DEFAULT (getdate()) NOT NULL,
  [QYDM] int DEFAULT ((1)) NOT NULL,
  [QRDM] int DEFAULT ((0)) NOT NULL,
  [LYNR] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [JLDM] int NULL,
  [HYDM] int DEFAULT ((0)) NULL,
  [HYNR] nvarchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [TDJG] int NULL
)
GO

ALTER TABLE [dbo].[TDJLK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'投递代码',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生代码ID DATA_STUDENG.ID',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'STUID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'岗位代码',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'GWDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'投递时间',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'TDSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'投递否是生效 , ',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'单位用户确认代码，默认0，一旦确认就无法撤销',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'QRDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'留言内容',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'LYNR'
GO

EXEC sp_addextendedproperty
'MS_Description', N'简历代码，对应DATA_XSJLK.JLDM',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'JLDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回应代码，1已回应，0 默认 未回应',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'HYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回应内容',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'HYNR'
GO

EXEC sp_addextendedproperty
'MS_Description', N'回应结果：0 不录用，2 安排面试  3 录用 4 待定 ',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK',
'COLUMN', N'TDJG'
GO

EXEC sp_addextendedproperty
'MS_Description', N'投递记录库',
'SCHEMA', N'dbo',
'TABLE', N'TDJLK'
GO


-- ----------------------------
-- Records of [TDJLK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TDJLK] ON
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'3', N'1226', N'33', N'2025-02-15 00:27:00.847', N'1', N'1', N'特斯拉是信仰！', N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'4', N'1226', N'4', N'2025-02-15 01:11:13.133', N'1', N'0', N'我是数学科学家！！', N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'5', N'1226', N'5', N'2025-02-15 01:16:53.823', N'1', N'0', N'“您好，感谢您给我这个机会。我的名字是[你的名字]，我是一名市场分析师，拥有[具体年数]年的相关工作经验。在过去的职业生涯中，我曾在[公司或行业]中负责市场研究与数据分析，熟练使用Excel和Tableau等工具，有效支持决策制定。

我对[公司名]的[提及一两个具体的项目或成果]非常感兴趣，这让我对能够加入贵公司的团队感到兴奋。我相信，我的分析能力和对市场趋势的敏锐洞察，能够为贵公司带来价值。

非常期待能展开进一步的交流，了解贵公司在市场策略方面的需求。”', N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'6', N'1226', N'6', N'2025-02-15 01:17:26.683', N'1', N'0', N'“您好！感谢您给我这次面试的机会。我是[你的名字]，我是一名产品设计师，拥有[具体年数]年的设计经验。在我的职业生涯中，我曾参与多个项目，专注于用户体验（UX）和用户界面（UI）的设计，帮助开发出既美观又实用的产品。

我在[提及过往工作的公司或项目]中，利用[提及使用的设计工具，比如Sketch、Adobe XD、Figma等]设计并优化了多个界面，提高了用户满意度和产品功能性。我特别喜欢与跨职能团队合作，深信设计不仅是外观，更是解决用户痛点的重要过程。

我对[公司名]在[提及某个具体的产品或项目]方面的创新设计非常钦佩，尤其是[具体的特点，比如用户反馈、设计理念等]。我希望能将我的创意思维和技术能力加入贵公司的设计团队，一同推动更优秀的产品。

期待能进一步交流，感谢您提供这次机会。', N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'7', N'1226', N'34', N'2025-02-15 01:17:56.453', N'1', N'1', N'“您好！感谢您给我这个机会，我叫[你的名字]。我是一名具有[具体年数]年销售经验的专业人士，曾在[相关公司或行业]领域工作。在这一过程中，我不仅积累了丰富的销售技巧，还学会了如何建立和维护客户关系，确保客户满意度。

我对电动车行业充满热情，特别是特斯拉在可持续能源和技术创新方面的领先地位，让我深感钦佩。我了解特斯拉的核心价值观，包括对环境的承诺和推动全球向可持续交通转型的使命。这也让我更加渴望成为贵公司的一员，帮助更多客户了解和选择特斯拉的产品。

在我的上一份工作中，我成功达成并超越销售目标，尤其是在推广新产品和教育客户方面。我相信，凭借我的人际交往能力和对市场趋势的敏锐洞察，我能够为特斯拉带来更多客户和销售业绩。

期待能够进一步讨论我如何为特斯拉贡献力量，感谢您再次给予我这个机会。”', N'1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'8', N'1227', N'34', N'2025-02-15 23:27:48.177', N'1', N'0', N'求你给我这份工作！！！', N'4', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'11', N'1234', N'33', N'2025-02-16 12:31:58.883', N'1', N'0', N'浩哥', N'49', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'18', N'1226', N'7', N'2025-02-17 13:14:19.113', N'1', N'0', N'你好！！', N'1', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'19', N'1226', N'9', N'2025-02-17 13:15:11.560', N'1', N'0', N'111', N'1', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'20', N'1226', N'11', N'2025-02-17 13:15:42.380', N'1', N'0', N'iii', N'1', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'21', N'1211', N'4', N'2025-02-17 13:33:50.223', N'1', N'0', N'你啊哈哦！！！', N'26', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'22', N'1211', N'5', N'2025-02-17 13:41:12.190', N'1', N'0', N'111', N'26', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'23', N'1211', N'6', N'2025-02-17 13:44:56.910', N'1', N'0', N'111', N'26', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'24', N'1211', N'17', N'2025-02-17 13:53:28.820', N'1', N'1', N'罗邓给我个岗位吧！！', N'26', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'9', N'1227', N'6', N'2025-02-15 23:28:55.497', N'1', N'0', N'求求！！！我找不懂啊', N'4', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'16', N'1226', N'12', N'2025-02-17 13:12:52.273', N'1', N'0', N'hahahha1', N'41', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'17', N'1226', N'8', N'2025-02-17 13:13:30.140', N'1', N'0', N'1111', N'41', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'10', N'1234', N'9', N'2025-02-16 11:17:42.720', N'1', N'0', N'求求求求！', N'49', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'12', N'1234', N'34', N'2025-02-16 12:32:15.140', N'1', N'0', N'哈哈', N'49', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'13', N'1234', N'29', N'2025-02-16 12:53:35.420', N'1', N'1', N'罗邓先生你好', N'49', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'15', N'1226', N'30', N'2025-02-16 21:27:42.477', N'1', N'1', N'求求给我工作', N'41', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'14', N'1226', N'17', N'2025-02-16 13:05:17.390', N'1', N'1', N'hello!', N'41', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'25', N'1222', N'17', N'2025-02-17 14:15:38.547', N'1', N'1', N'尊敬的大佬：
展信安。晚辈梁琪，辛巳年荷月生于潇湘之地，今值桃李之年，谨以寸楮聊表拳拳之意。《诗经》有云"有匪君子，如切如磋，如琢如磨"，二十二载春秋的自我砥砺，恰似璞玉初现莹润之色。

幼承庭训，祖父授我以《颜氏家训》，故深谙"积财千万，不如薄技在身"之理。求学时期效仿欧阳修"三上读书"之志，于中南大学主修工商管理时，常携《商君书》《盐铁论》出入图书馆，尤在市场营销课程中，借管仲"通轻重之权，徼山海之业"的智慧，带领团队斩获全国高校商业精英挑战赛金奖。这份经历恰如《文心雕龙》所言"操千曲而后晓声，观千剑而后识器"。

曾于某上市公司实习，亲历"治大国若烹小鲜"的管理艺术。在策划"国潮复兴"营销项目时，取法张择端《清明上河图》的叙事格局，融合苏轼"腹有诗书气自华"的文化底蕴，使产品销售额环比提升47%。这段经历让我体悟到《周易》"穷则变，变则通，通则久"的真谛。

平素以顾恺之"渐入佳境"自勉，好研习《梦溪笔谈》中的创新思维。近日正研读彼得·德鲁克著作，尝试用《孙子兵法》"以正合，以奇胜"的谋略解构现代企业管理案例。闲暇时亦效法李清照"赌书消得泼茶香"的雅趣，在茶艺与书法中涵养心性。

庄子云"吾生也有涯，而知也无涯"，我愿以韩愈《进学解》中"业精于勤荒于嬉"为座右铭，期待能在贵司这片沃土上，效仿范仲淹"不以物喜，不以己悲"的胸怀，践行《中庸》"致广大而尽精微"的职业追求。

临书仓促，不尽欲言。惟愿能得春风化雨，使新燕得衔芹藻之香。
梁琪 谨呈', N'37', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'26', N'1207', N'34', N'2025-02-17 15:32:40.257', N'1', N'0', N'我是一个积极进取、充满热情的人，对工作认真负责，能够适应快节奏的工作环境，并且在团队中能够发挥自己的优势，与团队成员共同合作完成任务。在大学期间，我始终保持积极的学习态度，努力拓宽自己的知识面，不仅仅局限于课本知识，还积极参与了多个校外项目和实践，锻炼了自己的实际操作能力。
在未来的职业生涯中，我希望能够在[行业名称]领域中发挥自己的所学，并在贵公司这个平台上不断进步。如果有机会加入贵公司，我将尽全力发挥自己的优势，贡献我的力量。', N'22', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'28', N'1226', N'35', N'2025-02-17 19:39:16.590', N'1', N'1', N'碧梨！！', N'41', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'29', N'1234', N'35', N'2025-02-17 19:50:28.343', N'1', N'0', N'碧梨你好，我是大数据工程师！', N'49', N'0', NULL, NULL)
GO

INSERT INTO [dbo].[TDJLK] ([ID], [STUID], [GWDM], [TDSJ], [QYDM], [QRDM], [LYNR], [JLDM], [HYDM], [HYNR], [TDJG]) VALUES (N'30', N'1226', N'10', N'2025-02-17 20:51:57.100', N'1', N'0', N'法律顾问！', N'1', N'0', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[TDJLK] OFF
GO


-- ----------------------------
-- Table structure for XLTTK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XLTTK]') AND type IN ('U'))
	DROP TABLE [dbo].[XLTTK]
GO

CREATE TABLE [dbo].[XLTTK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [XLMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [XLMS] nvarchar(max) COLLATE Chinese_PRC_CI_AS NOT NULL
)
GO

ALTER TABLE [dbo].[XLTTK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'学历id',
'SCHEMA', N'dbo',
'TABLE', N'XLTTK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学历名称',
'SCHEMA', N'dbo',
'TABLE', N'XLTTK',
'COLUMN', N'XLMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学历描述',
'SCHEMA', N'dbo',
'TABLE', N'XLTTK',
'COLUMN', N'XLMS'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学历天梯库',
'SCHEMA', N'dbo',
'TABLE', N'XLTTK'
GO


-- ----------------------------
-- Records of [XLTTK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[XLTTK] ON
GO

INSERT INTO [dbo].[XLTTK] ([ID], [XLMC], [XLMS]) VALUES (N'1', N'学前教育', N'为幼儿提供基础教育，通常为一到三年。')
GO

INSERT INTO [dbo].[XLTTK] ([ID], [XLMC], [XLMS]) VALUES (N'2', N'小学', N'提供基础教育，一般为六年，分为初年级、中年级和高年级。')
GO

INSERT INTO [dbo].[XLTTK] ([ID], [XLMC], [XLMS]) VALUES (N'3', N'初中', N'提供中等教育，通常为三年。')
GO

INSERT INTO [dbo].[XLTTK] ([ID], [XLMC], [XLMS]) VALUES (N'4', N'高中或中专', N'提供高级中等教育，通常为三年。')
GO

INSERT INTO [dbo].[XLTTK] ([ID], [XLMC], [XLMS]) VALUES (N'5', N'专科（大专）', N'属于高等教育的一部分，一般为二到三年，分为全日制和非全日制。')
GO

INSERT INTO [dbo].[XLTTK] ([ID], [XLMC], [XLMS]) VALUES (N'6', N'本科', N'属于高等教育的一部分，一般为四到五年，分为全日制和非全日制，非全日制包括自考、成人高考等方式。')
GO

INSERT INTO [dbo].[XLTTK] ([ID], [XLMC], [XLMS]) VALUES (N'7', N'硕士研究生', N'属于高等教育的一部分，一般为二到三年，分为学术型硕士和专业型硕士。')
GO

INSERT INTO [dbo].[XLTTK] ([ID], [XLMC], [XLMS]) VALUES (N'8', N'博士研究生', N'属于高等教育的一部分，一般为三到五年，是最高一级的学位。')
GO

SET IDENTITY_INSERT [dbo].[XLTTK] OFF
GO


-- ----------------------------
-- Table structure for XSZPMBK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XSZPMBK]') AND type IN ('U'))
	DROP TABLE [dbo].[XSZPMBK]
GO

CREATE TABLE [dbo].[XSZPMBK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [XSXH] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [IMGURL] nvarchar(max) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [QYDM] int DEFAULT ((1)) NOT NULL
)
GO

ALTER TABLE [dbo].[XSZPMBK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生照片代码',
'SCHEMA', N'dbo',
'TABLE', N'XSZPMBK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生学号',
'SCHEMA', N'dbo',
'TABLE', N'XSZPMBK',
'COLUMN', N'XSXH'
GO

EXEC sp_addextendedproperty
'MS_Description', N'启用代码',
'SCHEMA', N'dbo',
'TABLE', N'XSZPMBK',
'COLUMN', N'QYDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'学生照片模版库',
'SCHEMA', N'dbo',
'TABLE', N'XSZPMBK'
GO


-- ----------------------------
-- Table structure for XTJLDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XTJLDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[XTJLDMK]
GO

CREATE TABLE [dbo].[XTJLDMK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [YHM] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [YHXM] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [SFDM] int NOT NULL,
  [CREATETIME] datetime DEFAULT (getdate()) NOT NULL,
  [TYPE] int NOT NULL,
  [IPADDRES] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [MEMO] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[XTJLDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'标识ID',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户名',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK',
'COLUMN', N'YHM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户姓名',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK',
'COLUMN', N'YHXM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户身份代码，对应YHSFDMK.ID',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK',
'COLUMN', N'SFDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间，默认为插入时间',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK',
'COLUMN', N'CREATETIME'
GO

EXEC sp_addextendedproperty
'MS_Description', N'记录标识，1 查看学生信息，2查看学生简历 3，查看岗位信息，4，用户登录 ，5 用户退出登录',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK',
'COLUMN', N'TYPE'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户IP地址',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK',
'COLUMN', N'IPADDRES'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注信息',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK',
'COLUMN', N'MEMO'
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统记录代码库，用于记录用户行为',
'SCHEMA', N'dbo',
'TABLE', N'XTJLDMK'
GO


-- ----------------------------
-- Table structure for XTSHK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XTSHK]') AND type IN ('U'))
	DROP TABLE [dbo].[XTSHK]
GO

CREATE TABLE [dbo].[XTSHK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [YHM] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [YHSFDM] int NOT NULL,
  [SHBZ] int DEFAULT ((0)) NOT NULL,
  [WZBZ] int DEFAULT ((0)) NOT NULL,
  [TJSJ] datetime DEFAULT (getdate()) NOT NULL,
  [WCSJ] datetime NULL,
  [QQNR] nvarchar(max) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [WCR] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[XTSHK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户身份代码',
'SCHEMA', N'dbo',
'TABLE', N'XTSHK',
'COLUMN', N'YHSFDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审核标志',
'SCHEMA', N'dbo',
'TABLE', N'XTSHK',
'COLUMN', N'SHBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'完成标志',
'SCHEMA', N'dbo',
'TABLE', N'XTSHK',
'COLUMN', N'WZBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'提交时间',
'SCHEMA', N'dbo',
'TABLE', N'XTSHK',
'COLUMN', N'TJSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'完成时间',
'SCHEMA', N'dbo',
'TABLE', N'XTSHK',
'COLUMN', N'WCSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'请求内容',
'SCHEMA', N'dbo',
'TABLE', N'XTSHK',
'COLUMN', N'QQNR'
GO

EXEC sp_addextendedproperty
'MS_Description', N'完成人用户名,管理员',
'SCHEMA', N'dbo',
'TABLE', N'XTSHK',
'COLUMN', N'WCR'
GO

EXEC sp_addextendedproperty
'MS_Description', N'系统审核库：用户提交修改，管理员审核修改',
'SCHEMA', N'dbo',
'TABLE', N'XTSHK'
GO


-- ----------------------------
-- Table structure for XXDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XXDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[XXDMK]
GO

CREATE TABLE [dbo].[XXDMK] (
  [ID] int IDENTITY(1,1) NOT NULL,
  [CFZ] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [CFZXW] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [CFSJ] datetime DEFAULT (getdate()) NOT NULL,
  [JSZ] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [QBBZ] int DEFAULT ((0)) NOT NULL,
  [DZLX] int NOT NULL,
  [CFZSFDM] int NOT NULL,
  [JSZSFDM] int NOT NULL,
  [DZNR] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [YDBZ] int DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[XXDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'消息代码',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发者',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'CFZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发者行为',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'CFZXW'
GO

EXEC sp_addextendedproperty
'MS_Description', N'消息产生时间',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'CFSJ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'接收者',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'JSZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'全部标志：即全部用户都可收到',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'QBBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'动作类型: 1 单位用户确认投递  2 单位用户回应投递  3 单位用户安排面试  4 单位用户录入结果 5学生预览岗位 6 学生投递 7 新增系统请求 ',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'DZLX'
GO

EXEC sp_addextendedproperty
'MS_Description', N'触发者身份代码',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'CFZSFDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'接收者身份代码',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'JSZSFDM'
GO

EXEC sp_addextendedproperty
'MS_Description', N'动作内容',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'DZNR'
GO

EXEC sp_addextendedproperty
'MS_Description', N'已读标志',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK',
'COLUMN', N'YDBZ'
GO

EXEC sp_addextendedproperty
'MS_Description', N'XXDMK',
'SCHEMA', N'dbo',
'TABLE', N'XXDMK'
GO


-- ----------------------------
-- Records of [XXDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[XXDMK] ON
GO

INSERT INTO [dbo].[XXDMK] ([ID], [CFZ], [CFZXW], [CFSJ], [JSZ], [QBBZ], [DZLX], [CFZSFDM], [JSZSFDM], [DZNR], [YDBZ]) VALUES (N'1', N'1', N'学生投递了岗位', N'2025-02-17 20:51:57.350', N'billie', N'0', N'6', N'4', N'3', N'学生投递', N'0')
GO

SET IDENTITY_INSERT [dbo].[XXDMK] OFF
GO


-- ----------------------------
-- Table structure for YHSFDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[YHSFDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[YHSFDMK]
GO

CREATE TABLE [dbo].[YHSFDMK] (
  [SFDM] int IDENTITY(1,1) NOT NULL,
  [SFMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[YHSFDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'身份名称',
'SCHEMA', N'dbo',
'TABLE', N'YHSFDMK',
'COLUMN', N'SFMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户身份代码库',
'SCHEMA', N'dbo',
'TABLE', N'YHSFDMK'
GO


-- ----------------------------
-- Records of [YHSFDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[YHSFDMK] ON
GO

INSERT INTO [dbo].[YHSFDMK] ([SFDM], [SFMC]) VALUES (N'1', N'管理员')
GO

INSERT INTO [dbo].[YHSFDMK] ([SFDM], [SFMC]) VALUES (N'2', N'老师')
GO

INSERT INTO [dbo].[YHSFDMK] ([SFDM], [SFMC]) VALUES (N'3', N'单位用户')
GO

INSERT INTO [dbo].[YHSFDMK] ([SFDM], [SFMC]) VALUES (N'4', N'学生')
GO

SET IDENTITY_INSERT [dbo].[YHSFDMK] OFF
GO


-- ----------------------------
-- Table structure for ZYDMK
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ZYDMK]') AND type IN ('U'))
	DROP TABLE [dbo].[ZYDMK]
GO

CREATE TABLE [dbo].[ZYDMK] (
  [ID] int IDENTITY(1000,1) NOT NULL,
  [ZYMC] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ZYLB] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL
)
GO

ALTER TABLE [dbo].[ZYDMK] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'专业代码',
'SCHEMA', N'dbo',
'TABLE', N'ZYDMK',
'COLUMN', N'ID'
GO

EXEC sp_addextendedproperty
'MS_Description', N'专业名称',
'SCHEMA', N'dbo',
'TABLE', N'ZYDMK',
'COLUMN', N'ZYMC'
GO

EXEC sp_addextendedproperty
'MS_Description', N'专业类别',
'SCHEMA', N'dbo',
'TABLE', N'ZYDMK',
'COLUMN', N'ZYLB'
GO

EXEC sp_addextendedproperty
'MS_Description', N'专业代码库',
'SCHEMA', N'dbo',
'TABLE', N'ZYDMK'
GO


-- ----------------------------
-- Records of [ZYDMK]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[ZYDMK] ON
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1066', N'护理高职', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1067', N'2018中医学（一体化）1班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1068', N'2018护理学4班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1069', N'中药学（订单班）', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1070', N'针灸推拿免费医学定向', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1071', N'姚嘉', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1072', N'中医学桂派杏林师承班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1073', N'中医骨伤科学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1074', N'针灸推拿高职', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1075', N'医学美容技术高职', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1076', N'2021级助产学1班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1077', N'口腔医学高职', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1078', N'中医学农村订单定向医学生', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1079', N'护理（高职北湖）', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1080', N'针灸推拿（高职）', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1081', N'中医学定向', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1082', N'针灸推拿农村订单定向医学生', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1083', N'针灸推拿', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1084', N'中医学师承班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1085', N'信息管理与信息系统', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1086', N'中医养生学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1087', N'中西医临床医学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1088', N'中医学免费医学定向', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1089', N'康复治疗学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1090', N'护理学中外合作班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1091', N'中医骨伤', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1092', N'中药学高职', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1093', N'针灸推拿（高职北湖）', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1094', N'针灸推拿学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1095', N'药学（订单班）', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1096', N'中药高职', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1097', N'医学检验技术', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1098', N'临床医学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1099', N'公共事业管理', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1100', N'健康服务与管理', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1101', N'中医学骨伤班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1102', N'壮医学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1103', N'制药工程', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1104', N'中药学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1105', N'2019针灸推拿学2班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1106', N'2018中医学（定向）1班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1107', N'药学校企合作班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1108', N'中医', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1109', N'医学影像技术', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1110', N'医学检验', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1111', N'药学（高职北湖）', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1112', N'护理学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1113', N'中医康复学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1114', N'2020中医学（定向）1班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1115', N'口腔医学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1116', N'预防医学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1117', N'助产学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1118', N'临床医学整合课程教改班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1119', N'药学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1120', N'食品质量与安全', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1121', N'护理学中外合作办学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1122', N'中药学校企合作班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1123', N'药学产教融合应用型本科', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1124', N'2021级护理学2班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1125', N'中药学专升本班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1126', N'2021级药学1班', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1127', N'药学高职', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1128', N'中医儿科学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1129', N'护理', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1130', N'中医学', NULL)
GO

INSERT INTO [dbo].[ZYDMK] ([ID], [ZYMC], [ZYLB]) VALUES (N'1131', N'中医学一体化', NULL)
GO

SET IDENTITY_INSERT [dbo].[ZYDMK] OFF
GO


-- ----------------------------
-- Procedure structure for usp_DwLogin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DwLogin]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_DwLogin]
GO

CREATE PROCEDURE [dbo].[usp_DwLogin]
	@Username NVARCHAR(50),  
    @Password NVARCHAR(50) 
AS
BEGIN
	/*
		作用：单位用户登录接口
		时间：2025年1月30日
	*/

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 
    -- 检查单位用户表  select * from    DWYHK
	
	 IF EXISTS (SELECT 1 FROM DWYHK WHERE YHM = @Username)  
	    
		IF EXISTS (SELECT 1 FROM DWYHK WHERE YHM = @Username AND MM = @Password AND TYBZ=0)  
			 BEGIN  
					BEGIN  
						SELECT  1 AS 'RESULT' , '登录成功' AS 'Msg',@Username AS 'YHM',  '单位' AS 'UserRole',(SELECT YHXM FROM DWYHK WHERE YHM=@Username) AS YHMC,
						(SELECT SFDM FROM YHSFDMK WHERE SFMC='单位用户') AS 'YHSFDM';
		    		END 
			 END
		ELSE  
			IF ((SELECT TYBZ FROM DWYHK WHERE YHM = @Username)=1)
				BEGIN  
			    	-- 登录失败  
		        	SELECT  0 AS 'RESULT' , '账户已被禁用' AS 'Msg',@Username AS 'YHM',  '单位' AS 'UserRole',(SELECT YHXM FROM DWYHK WHERE YHM=@Username) AS YHMC,
					(SELECT SFDM FROM YHSFDMK WHERE SFMC='单位用户') AS 'YHSFDM';  
				END 
			ELSE
				BEGIN  
					-- 登录失败  
					  SELECT  0 AS 'RESULT' , '密码错误' AS 'Msg',@Username AS 'YHM',  '单位' AS 'UserRole',(SELECT YHXM FROM DWYHK WHERE YHM=@Username) AS YHMC,
					  (SELECT SFDM FROM YHSFDMK WHERE SFMC='单位用户') AS 'YHSFDM';  
				END  

	ELSE  
			BEGIN  
				-- 登录失败  
				  SELECT  0 AS 'RESULT' , '用户不存在' AS 'Msg',@Username AS 'YHM', Null AS 'UserRole',(SELECT YHXM FROM DWYHK WHERE YHM=@Username) AS YHMC,
				  (SELECT SFDM FROM YHSFDMK WHERE SFMC='单位用户') AS 'YHSFDM';  
    
			END  
END
GO


-- ----------------------------
-- Procedure structure for usp_GetJyhjkByFbzyhm
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetJyhjkByFbzyhm]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_GetJyhjkByFbzyhm]
GO

CREATE PROCEDURE [dbo].[usp_GetJyhjkByFbzyhm]
	@FBZYHM NVARCHAR(50)
AS
BEGIN
	/*
		作用：根据发布者用户名获取 就业环境图片信息，用于前端管理
		时间：2025年2月3日
	*/
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 
    -- 检查单位用户表  select * from    DWYHK
	SELECT a.*,b.GWMC,b.DWDM,b.DWMC,c.GSMC,b.JYHJMS FROM JYHJK a 
	left join DATA_GWDMK b on a.GWDM=b.ID   
	left join DATA_DWDMK c on b.DWDM=c.DWDM  -- 通过单位代码获取单位数据
	where b.FBZ=@FBZYHM
END
GO


-- ----------------------------
-- Procedure structure for usp_GetAllSystemUser
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetAllSystemUser]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_GetAllSystemUser]
GO

CREATE PROCEDURE [dbo].[usp_GetAllSystemUser]  
    @userRole INT, -- 1 管理员，2 学生，3 教师，4 单位，5 全部用户角色  
    @state INT -- 1 获取全部，2 仅获取启用的用户，3 仅获取关闭的用户  
AS  
BEGIN  
    /*  
        作用：获取系统用户信息  
        时间：2025年1月30日  
        管理员: GLYDMK  
        学生: DATA_STUDENT  
        教师: JSDMK  
        单位用户: DWYHK  
    */  

    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  

    -- 处理不同角色的查询  
    IF @userRole = 1 -- 管理员  
    BEGIN  
        IF @state = 1  
            SELECT * FROM GLYDMK  
        ELSE  
            SELECT * FROM GLYDMK WHERE QYDM = CASE WHEN @state = 2 THEN 1 ELSE 0 END  
    END  
    ELSE IF @userRole = 2 -- 学生  
    BEGIN  
        IF @state = 1  
            SELECT * FROM DATA_STUDENT  
        ELSE  
            SELECT * FROM DATA_STUDENT WHERE QYDM = CASE WHEN @state = 2 THEN 1 ELSE 0 END  
    END  
    ELSE IF @userRole = 3 -- 教师  
    BEGIN  
        IF @state = 1  
            SELECT * FROM JSDMK  
        ELSE  
            SELECT * FROM JSDMK WHERE QYDM = CASE WHEN @state = 2 THEN 1 ELSE 0 END  
    END  
    ELSE IF @userRole = 4 -- 单位用户  
    BEGIN  
        IF @state = 1  
            SELECT * FROM DWYHK  
        ELSE  
            SELECT * FROM DWYHK WHERE TYBZ = CASE WHEN @state = 2 THEN 0 ELSE 1 END  
    END  
    ELSE IF @userRole = 5 -- 全部用户  
    BEGIN  
        -- 获取所有用户，考虑状态过滤  
        IF @state = 1  
        BEGIN  
            SELECT * FROM GLYDMK  
               
            SELECT * FROM DATA_STUDENT a 
			left join BJDMK b on a.SSBJ=b.ID
               
            SELECT * FROM JSDMK
 
            SELECT a.*,b.DWMC,b.DWXZ,b.DWHY,b.GSMC FROM DWYHK a
			left join DATA_DWDMK b on a.DYDW=b.DWDM
        END  
        ELSE IF @state = 2  
        BEGIN  
            SELECT * FROM GLYDMK WHERE QYDM = 1  
               
            SELECT * FROM DATA_STUDENT WHERE QYDM = 1  
               
            SELECT * FROM JSDMK WHERE QYDM = 1  
               
            SELECT * FROM DWYHK WHERE TYBZ = 0  
        END  
        ELSE IF @state = 3  
        BEGIN  
            SELECT * FROM GLYDMK WHERE QYDM = 0  
          
            SELECT * FROM DATA_STUDENT WHERE QYDM = 0  
        
            SELECT * FROM JSDMK WHERE QYDM = 0  
      
            SELECT * FROM DWYHK WHERE TYBZ = 1  
        END  
    END  
    ELSE  
    BEGIN  
        -- 如果 @userRole 不在预期范围内，返回详细错误信息  
        SELECT '无效的用户角色，请输入 1-5 之间的值' AS ErrorMessage;  
    END  
END
GO


-- ----------------------------
-- Procedure structure for usp_GetTdjlk
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetTdjlk]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_GetTdjlk]
GO

CREATE PROCEDURE [dbo].[usp_GetTdjlk]  
    @Style INT,  -- 获取方式 1.获取全部 2.通过学生用户名获取 3.根据岗位代码获取 4.通过单位用户名获取 5.通过教师用户名获取  
    @YHM NVARCHAR(50) = NULL,  -- 用户名 如果@Style为3 则此参数为空   
    @GWDM NVARCHAR(50) = NULL  -- 岗位代码 ，如果@Style不为3则此参数为空   
AS  
BEGIN  
    /*  
        作用：获取投递记录信息  
        时间：2025年2月14日  
		--  f.TYBZ=0 即只显示 没有停用的单位用户
    */  

    -- 防止额外结果集干扰SELECT语句  
    SET NOCOUNT ON;  

    -- 根据获取方式执行不同的查询  
    IF @Style = 1  
    BEGIN  
        -- 获取全部记录  
        SELECT a.*,
		b.SSBJ,b.XSXM,b.BJMC,b.ID STUID,b.SSNJ,b.XLDM,d.XLMC,b.XSXB,b.XSZP,b.FZJS,b.XSXH,b.ZZMM,
			c.ID GWDM,c.GWMC,c.TDSM,c.FBZ,
			e.GSMC,
			f.YHXM
		FROM TDJLK a
		left join DATA_STUDENT b on a.STUID=b.ID
		left join DATA_GWDMK c on a.GWDM=c.ID
		left join XLTTK d on b.XLDM=d.ID
		left join DATA_DWDMK e on c.DWDM=e.DWDM 
		left join DWYHK f on c.FBZ= f.YHM 
    END  
    ELSE IF @Style = 2  
    BEGIN  
        -- 通过学生用户名获取记录  
		  -- 获取全部记录  
        SELECT a.*,
		b.SSBJ,b.XSXM,b.BJMC,b.ID STUID,b.SSNJ,b.XLDM,d.XLMC,b.XSXB,b.XSZP,b.FZJS,b.XSXH,b.ZZMM,
			c.ID GWDM,c.GWMC,c.TDSM,c.FBZ,
			e.GSMC,
			f.YHXM
		FROM TDJLK a
		left join DATA_STUDENT b on a.STUID=b.ID
		left join DATA_GWDMK c on a.GWDM=c.ID
		left join XLTTK d on b.XLDM=d.ID
		left join DATA_DWDMK e on c.DWDM=e.DWDM 
		left join DWYHK f on c.FBZ= f.YHM 
		where b.YHM=@YHM and  f.TYBZ=0
    END  
    ELSE IF @Style = 3  
    BEGIN  
        -- 根据岗位代码获取记录   
        SELECT a.*,b.SSBJ,b.XSXM,b.BJMC,b.ID STUID,b.SSNJ,b.XLDM,d.XLMC,b.XSXB,b.XSZP,b.FZJS,b.XSXH,b.ZZMM,
			c.ID GWDM,c.GWMC,c.TDSM,c.FBZ,
			e.GSMC,
			f.YHXM
		FROM TDJLK a
		left join DATA_STUDENT b on a.STUID=b.ID
		left join DATA_GWDMK c on a.GWDM=c.ID
		left join XLTTK d on b.XLDM=d.ID
		left join DATA_DWDMK e on c.DWDM=e.DWDM 
		left join DWYHK f on c.FBZ= f.YHM
		where a.GWDM=@GWDM and  f.TYBZ=0
    END  
    ELSE IF @Style = 4  
    BEGIN  
        -- 通过单位用户名获取记录  
       SELECT a.*,b.SSBJ,b.XSXM,b.BJMC,b.ID STUID,b.SSNJ,b.XLDM,d.XLMC,b.XSXB,b.XSZP,b.FZJS,b.XSXH,b.ZZMM,
			c.ID GWDM,c.GWMC,c.TDSM,c.FBZ,
			e.GSMC,
			f.YHXM
		FROM TDJLK a
		left join DATA_STUDENT b on a.STUID=b.ID
		left join DATA_GWDMK c on a.GWDM=c.ID
		left join XLTTK d on b.XLDM=d.ID
		left join DATA_DWDMK e on c.DWDM=e.DWDM 
		left join DWYHK f on c.FBZ= f.YHM
		where  c.FBZ=  @YHM and c.FBZYHSFDM=3 and f.TYBZ=0-- 单位用户
    END  
    ELSE IF @Style = 5  
    BEGIN  
        -- 通过教师用户名获取记录  
          SELECT a.*,b.SSBJ,b.XSXM,b.BJMC,b.ID STUID,b.SSNJ,b.XLDM,d.XLMC,b.XSXB,b.XSZP,b.FZJS,b.XSXH,b.ZZMM,
		    c.ID GWDM,c.GWMC,c.TDSM,c.FBZ,c.FBZYHSFDM,
			e.GSMC,
			f.YHXM
			FROM TDJLK a
			left join DATA_STUDENT b on a.STUID=b.ID
			left join DATA_GWDMK c on a.GWDM=c.ID
			left join XLTTK d on b.XLDM=d.ID
			left join DATA_DWDMK e on c.DWDM=e.DWDM 
			left join DWYHK f on c.FBZ= f.YHM
			where  b.FZJS=@YHM and f.TYBZ=0--负责教师 
		
    END  
    ELSE  
    BEGIN  
        -- 如果@Style无效，抛出错误  
        RAISERROR('无效的获取方式', 16, 1);  
        RETURN;  
    END  

    -- 返回结果  
    -- TODO: 根据查询结果返回相应记录  
END
GO


-- ----------------------------
-- Procedure structure for Luodeng_XSJLINSERT
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Luodeng_XSJLINSERT]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Luodeng_XSJLINSERT]
GO

CREATE PROCEDURE [dbo].[Luodeng_XSJLINSERT]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 /*
 为每个学生新建一个简历--测试而用，正式上线请勿使用！
 */
 
INSERT INTO DATA_XSJLK (XSID, JLWB, HTML, SCXGTIME, FBSJ, FBBZ)
SELECT 
    s.id AS XSID,  -- 使用DATA_STUDENT的ID替换固定值
    j.JLWB,
    j.HTML,
    j.SCXGTIME,
    j.FBSJ,
    1 AS FBBZ      -- 固定FBBZ为1
FROM DATA_STUDENT s
CROSS JOIN (
    SELECT TOP 1 
        JLWB, 
        HTML, 
        SCXGTIME, 
        FBSJ 
    FROM DATA_XSJLK 
    ORDER BY SCXGTIME DESC  -- 按需调整排序条件确保获取正确记录
) j;

END
GO


-- ----------------------------
-- Procedure structure for usp_GetDwyhData
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetDwyhData]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_GetDwyhData]
GO

CREATE PROCEDURE [dbo].[usp_GetDwyhData]
	@YHM NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 /*
	获取单位用户数据---管理时用
 */-- GWFBSL 岗位发布数量
 select a.*,(select count(*) from DATA_GWDMK where FBZ=@YHM and FBZYHSFDM=3 and QYDM=1) GWFBSL,b.* from DWYHK a 
left join DATA_DWDMK b on a.SSDW=b.DWDM
where a.YHM=@YHM
END
GO


-- ----------------------------
-- Procedure structure for usp_Get_JCSJ
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Get_JCSJ]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_Get_JCSJ]
GO

CREATE PROCEDURE [dbo].[usp_Get_JCSJ]  
AS  
BEGIN  
    /*  
        存储过程名称: usp_Get_All_Data  
        创建时间: 2024-12-06  
        修改记录:  
            
        描述:  
            用于获取系统基础数据表 ，包括: SFDMK, XLTTK, DWXZK, DWGMK, DWHYDMK 等。  
        
        返回了多个表的数据，每个表的数据会在一个单独的结果集中返回。  
    */  

    SET NOCOUNT ON;  
    BEGIN TRY  
        -- 获取 SFDMK 表   
        SELECT * FROM SFDMK;  
        -- 获取 XLTTK 表   
        SELECT * FROM XLTTK;  
        -- 获取 DWXZK 表   
        SELECT * FROM DWXZK; 
        -- 获取 DWGMK 表   
        SELECT * FROM DWGMK;  
        -- 获取 DWHYDMK 表   
        SELECT * FROM DWHYDMK;  
    END TRY  
    BEGIN CATCH  
        -- 错误处理  
        DECLARE @ErrorMessage NVARCHAR(4000);  
        DECLARE @ErrorSeverity INT;  
        DECLARE @ErrorState INT;  

        SELECT   
            @ErrorMessage = ERROR_MESSAGE(),  
            @ErrorSeverity = ERROR_SEVERITY(),  
            @ErrorState = ERROR_STATE();  

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);  
    END CATCH  
END
GO


-- ----------------------------
-- Procedure structure for usp_LoginInterface
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_LoginInterface]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_LoginInterface]
GO

CREATE PROCEDURE [dbo].[usp_LoginInterface]  
    @Username NVARCHAR(50),  
    @Password NVARCHAR(50)  
AS  
BEGIN  
    /*  
        存储过程名称 : usp_LoginInterface  
        创建时间: 2024-12-04  
        修改记录:  
            - 2024-12-04: 创建了存储过程  
        描述:  
            登录接口，验证用户身份并返回角色信息  
        使用实例:  
            EXEC usp_LoginInterface @Username = 'example_user', @Password = 'example_pass';  
    */  
    SET NOCOUNT ON;  

    DECLARE @UserRole NVARCHAR(50);  -- 用户身份
    DECLARE @LoginSuccess BIT = 0; -- 成功标志  
	DECLARE @YHXM NVARCHAR(50)-- 用户姓名

    -- 检查学生表  select * from    DATA_STUDENT
    IF EXISTS (SELECT 1 FROM DATA_STUDENT WHERE YHM = @Username AND MM = @Password AND QYDM=1)  
    BEGIN  
        SET @UserRole = '学生';  
        SET @LoginSuccess = 1;  
		SET @YHXM=(select XSXM from DATA_STUDENT where YHM =@Username )
    END  

    -- 检查老师表   select * from   JSDMK 
    IF EXISTS (SELECT 1 FROM JSDMK WHERE DLZH = @Username AND DLMM = @Password AND QYDM=1)  
    BEGIN  
        SET @UserRole = '老师';  
        SET @LoginSuccess = 1;  
		SET @YHXM=(select JSMC from JSDMK where DLZH =@Username )
    END  

    -- 检查 select * from  DWYHK  单位用户库
    IF EXISTS (SELECT 1 FROM DWYHK WHERE  YHM= @Username AND MM = @Password  )  
    BEGIN  
        SET @UserRole = '单位用户';  
        SET @LoginSuccess = 1;  
		SET @YHXM=(select YHXM from DWYHK where YHM =@Username )
    END  

    -- 检查管理员表    select * from GLYDMK
    IF EXISTS (SELECT 1 FROM GLYDMK WHERE DLZH = @Username AND DLMM = @Password AND QYDM=1)  
    BEGIN  
        SET @UserRole = '管理员';  
        SET @LoginSuccess = 1;  
		SET @YHXM=(select MC from GLYDMK where DLZH =@Username )
    END  

    IF @LoginSuccess = 1  
    BEGIN  
     	-- 登录成功，返回用户角色  
        SELECT @LoginSuccess AS 'RESULT' , '登录成功' AS Msg,@Username AS 'YHM', @UserRole AS UserRole,@YHXM AS YHMC,
		(SELECT SFDM FROM YHSFDMK WHERE SFMC='管理员') AS 'YHSFDM';  
    
	
	END 
	
    ELSE  
    BEGIN  
        -- 登录失败  
        SELECT @LoginSuccess AS 'RESULT' , '登录失败' AS Msg,@Username AS 'YHM',  @UserRole AS 'UserRole',@YHXM AS YHMC,
		(SELECT SFDM FROM YHSFDMK WHERE SFMC='管理员') AS 'YHSFDM';  
    
    END  
END;
GO


-- ----------------------------
-- Procedure structure for usp_GetAllStudentData
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetAllStudentData]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_GetAllStudentData]
GO

CREATE PROCEDURE [dbo].[usp_GetAllStudentData]  
    @Username NVARCHAR(50),  
    @UserRole NVARCHAR(50)  
AS  
BEGIN  
    /*  
        存储过程名称 : usp_GetAllStudentData  
        创建时间: 2024-12-04  
        修改记录:  
            - 2024-12-04: 创建了存储过程  
        描述:  
            获取学生信息接口  
        使用实例:  
            EXEC [usp_GetAllStudentData] @Username, @UserRole;  
            -- 老师     获取 数据  
            -- 管理员   获取数据  
    */  
    
    SET NOCOUNT ON;  
   
    DECLARE @ISERROR INT = 0;  -- 是否错误标志  
    DECLARE @SFDM INT;   

    -- 检查用户角色是否存在  
    IF NOT EXISTS (SELECT 1 FROM YHSFDMK WHERE SFMC = @UserRole)  
    BEGIN  
        SET @ISERROR = 1;  -- 设置错误标志  
        SELECT 1 AS ISERROR, '用户身份不存在' AS MSG;  
        RETURN;  -- 返回，不执行后续查询  
    END  

    -- 获取用户角色的 SFDM  
    SELECT @SFDM = SFDM FROM YHSFDMK WHERE SFMC = @UserRole;  

    -- 管理员角色（SFDM = 1）  
    IF (@SFDM = 1)  
    BEGIN  
        -- 查询所有学生信息  
        SELECT   
            a.[ID] AS '学生代码',  
            a.[XSXM] AS '学生姓名',  
            a.[XSXB] AS '性别',  
            a.[BIRTH] AS '出生日期',  
            DATEDIFF(YEAR, [BIRTH], GETDATE()) AS 年龄,  
            a.[YHM] AS '登录账号',  
            c.ZYMC AS '专业',  
            a.[SFZH] AS '身份证号',  
            a.[ZZMM] AS '政治面貌',  
            a.[SSNJ] AS '年级',  
            CASE a.[XZ]  
                WHEN 1 THEN '一年制'  
                WHEN 2 THEN '二年制'  
                WHEN 3 THEN '三年制'  
                WHEN 4 THEN '四年制'  
                WHEN 5 THEN '五年制'  
                WHEN 6 THEN '六年制（傻逼才读）'  
                ELSE '暂未提供'  
            END AS '学制',  
            a.[MZ] AS '民族',  
            a.[XSXH] AS '学号',  
            a.[BJMC] AS '班级',
			a.SSBJ as '班级代码',
            b.XLMC AS '学历',  
            d.JYZT AS '就业状态',
			a.XSZP AS '学生照片',
			a.FZJS AS '负责教师',
			e.JSMC AS '教师名称'
        FROM   
            DATA_STUDENT a  
        LEFT JOIN   
            XLTTK b ON a.XLDM = b.ID  
        LEFT JOIN   
            ZYDMK c ON a.ZYDM = c.ID  
        LEFT JOIN   
            JYZTDMK d ON a.JYZT = d.ZTDM  
		LEFT JOIN 
		     JSDMK e ON a.FZJS=e.ID  --用于获取教师信息（姓名）
		where a.QYDM=1;
    END  
    -- 教师角色（SFDM = 2）  
    ELSE IF (@SFDM = 2)  
    BEGIN  
        -- 查询教师对应班级的学生信息  
        SELECT   
            a.[ID] AS '学生代码',  
            a.[XSXM] AS '学生姓名',  
            a.[XSXB] AS '性别',  
            a.[BIRTH] AS '出生日期',  
            DATEDIFF(YEAR, [BIRTH], GETDATE()) AS 年龄,  
            a.[YHM] AS '登录账号',  
            c.ZYMC AS '专业',  
            a.[SFZH] AS '身份证号',  
            a.[ZZMM] AS '政治面貌',  
            a.[SSNJ] AS '年级',  
            CASE a.[XZ]  
                WHEN 1 THEN '一年制'  
                WHEN 2 THEN '二年制'  
                WHEN 3 THEN '三年制'  
                WHEN 4 THEN '四年制'  
                WHEN 5 THEN '五年制'  
                WHEN 6 THEN '六年制（傻逼才读）'  
                ELSE '暂未提供'  
            END AS '学制',  
            a.[MZ] AS '民族',  
            a.[XSXH] AS '学号',  
            a.[BJMC] AS '班级', 
			a.SSBJ as '班级代码',
            b.XLMC AS '学历',  
            d.JYZT AS '就业状态',
			a.XSZP AS '学生照片',
			a.FZJS AS '负责教师',
			e.JSMC AS '教师名称'
        FROM   
            DATA_STUDENT a  
        LEFT JOIN   
            XLTTK b ON a.XLDM = b.ID  
        LEFT JOIN   
            ZYDMK c ON a.ZYDM = c.ID  
        LEFT JOIN   
            JYZTDMK d ON a.JYZT = d.ZTDM   
		LEFT JOIN 
		     JSDMK e ON a.FZJS=e.ID  --用于获取教师信息（姓名）
        WHERE   
            SSBJ in (SELECT BJID FROM JSBJDYK WHERE JSID = (SELECT ID FROM JSDMK WHERE DLZH = @Username))
			and    a.QYDM=1;;  
    END  
    -- 如果不是管理员或教师  
    ELSE  
    BEGIN  
        SELECT 1 AS ISERROR, '用户无权限' AS MSG;  -- 返回权限不足的消息  
    END  
END;
GO


-- ----------------------------
-- Procedure structure for LuodengTable
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[LuodengTable]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[LuodengTable]
GO

CREATE PROCEDURE [dbo].[LuodengTable]
	@objname nvarchar(256) = NULL		-- object name we're after
as
begin
	set nocount on
	set @objname=replace ( @objname , '[' , '' )
	set @objname=replace ( @objname , ']' , '' )
	-- @objname must be either sysobjects or systypes: first look in sysobjects
	declare @objid int
	declare @sysobj_type char(2)
	select @objid = object_id, @sysobj_type = type from sys.all_objects where object_id = object_id(@objname)
 
	if @objid is null
	begin
		return
	end
 
	SELECT 
    表名       = case when a.colorder=1 then d.name else '' end,
    表说明     = case when a.colorder=1 then isnull(f.value,'') else '' end,
    字段序号   = a.colorder,
    字段名     = a.name,
    字段说明   = isnull(g.[value],''),
    自增标识   = case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '√'else '' end,
    主键       = case when exists(SELECT 1 FROM sysobjects where xtype='PK' and parent_obj=a.id and name in (
                     SELECT name FROM sysindexes WHERE indid in( SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid))) then '√' else '' end,
    类型       = b.name,
    占用字节数 = a.length,
    长度       = COLUMNPROPERTY(a.id,a.name,'PRECISION'),
    小数位数   = isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0),
    允许空     = case when a.isnullable=1 then '√'else '' end,
    默认值     = isnull(e.text,'')
FROM 
    syscolumns a
left join 
    systypes b 
on 
    a.xusertype=b.xusertype
inner join 
    sysobjects d 
on 
    a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
left join 
    syscomments e 
on 
    a.cdefault=e.id
left join 
sys.extended_properties   g 
on 
    a.id=G.major_id and a.colid=g.minor_id  
left join
sys.extended_properties f
on 
    d.id=f.major_id and f.minor_id=0
where 
    d.name=@objname  
order by 
    a.id,a.colorder
	-- DISPLAY COLUMN IF TABLE / VIEW
	
	-- DISPLAY TABLE INDEXES & CONSTRAINTS
	if @sysobj_type in ('S ','U ')
	begin
		print ' '
		EXEC sys.sp_helpindex @objname
		print ' '
		EXEC sys.sp_helpconstraint @objname,'nomsg'
		if (select count(*) from sys.objects obj, sysdepends deps
			where obj.type ='V' and obj.object_id = deps.id and deps.depid = @objid and deps.deptype = 1) = 0
		begin
			raiserror(15647,-1,-1,@objname) -- No views with schemabinding reference table '%ls'.
		end
		else
		begin
			select distinct 'Table is referenced by views' = obj.name from sys.objects obj, sysdepends deps
				where obj.type ='V' and obj.object_id = deps.id and deps.depid = @objid
					and deps.deptype = 1 group by obj.name
		end
	end
	else if @sysobj_type in ('V ')
	begin
		print ' '
		raiserror(15469,-1,-1,@objname) -- No constraints defined
		print ' '
		raiserror(15470,-1,-1,@objname) -- No foreign keys reference table '%ls'.
		EXEC sys.sp_helpindex @objname
	end
end
GO


-- ----------------------------
-- Procedure structure for LuoDeng_getAlltableInfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[LuoDeng_getAlltableInfo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[LuoDeng_getAlltableInfo]
GO

CREATE PROCEDURE [dbo].[LuoDeng_getAlltableInfo]  
AS  
BEGIN  
    SET NOCOUNT ON;  -- 防止返回受影响的行数，提升性能  
	/*
	获取表部分信息
	*/


    SELECT   
        t.name AS '表名',  
        ep.value AS '表备注',  
        COUNT(c.column_id) AS '字段数量'  
    FROM   
        sys.tables t   
    JOIN   
        sys.columns c ON t.object_id = c.object_id  
    LEFT JOIN   
        sys.extended_properties ep ON ep.major_id = t.object_id AND ep.minor_id = 0 AND ep.name = 'MS_Description'  
    WHERE   
        t.is_ms_shipped = 0  -- 过滤掉系统表  
    GROUP BY  
        t.name, ep.value  -- 必须包含所有非聚合列  
    ORDER BY   
        t.name;  
END;
GO


-- ----------------------------
-- Procedure structure for usp_StudengLogin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_StudengLogin]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_StudengLogin]
GO

CREATE PROCEDURE [dbo].[usp_StudengLogin]
	@Username NVARCHAR(50),  
    @Password NVARCHAR(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 

    -- 检查学生表  select * from    DATA_STUDENT
	
	 IF EXISTS (SELECT 1 FROM DATA_STUDENT WHERE YHM = @Username)  
	    
		IF EXISTS (SELECT 1 FROM DATA_STUDENT WHERE YHM = @Username AND MM = @Password AND QYDM=1)  
			 BEGIN  
					BEGIN  
						SELECT  1 AS 'RESULT' , '登录成功' AS 'Msg',@Username AS 'YHM',  '学生' AS 'UserRole',(SELECT XSXM FROM DATA_STUDENT WHERE YHM=@Username) AS YHMC,
						(SELECT SFDM FROM YHSFDMK WHERE SFMC='学生') AS 'YHSFDM';
		    		END 
			 END
		ELSE  
			IF ((SELECT QYDM FROM DATA_STUDENT WHERE YHM = @Username)=0)
				BEGIN  
			    	-- 登录失败  
		        	SELECT  0 AS 'RESULT' , '账户已被禁用' AS 'Msg',@Username AS 'YHM',  '学生' AS 'UserRole',(SELECT XSXM FROM DATA_STUDENT WHERE YHM=@Username) AS YHMC,
					(SELECT SFDM FROM YHSFDMK WHERE SFMC='学生') AS 'YHSFDM';  
				END 
			ELSE
				BEGIN  
					-- 登录失败  
					  SELECT  0 AS 'RESULT' , '密码错误' AS 'Msg',@Username AS 'YHM',  '学生' AS 'UserRole',(SELECT XSXM FROM DATA_STUDENT WHERE YHM=@Username) AS YHMC,
					  (SELECT SFDM FROM YHSFDMK WHERE SFMC='学生') AS 'YHSFDM';  
				END  

	ELSE  
			BEGIN  
				-- 登录失败  
				  SELECT  0 AS 'RESULT' , '用户不存在' AS 'Msg',@Username AS 'YHM', Null AS 'UserRole',(SELECT XSXM FROM DATA_STUDENT WHERE YHM=@Username) AS YHMC,
				  (SELECT SFDM FROM YHSFDMK WHERE SFMC='学生') AS 'YHSFDM';  
    
			END  
END
GO


-- ----------------------------
-- Procedure structure for usp_ClearDuplicates
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ClearDuplicates]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[usp_ClearDuplicates]
GO

CREATE PROCEDURE [dbo].[usp_ClearDuplicates]  
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON;  

    -- 使用公共表表达式 (CTE) 来识别重复记录  
    WITH CTE AS (  
        SELECT   
            *,  
            ROW_NUMBER() OVER (PARTITION BY JSID, BJID ORDER BY (SELECT NULL)) AS RowNum  
        FROM   
            JSBJDYK  
    )  
    -- 删除重复记录，只保留每组的第一条记录  
    DELETE FROM CTE WHERE RowNum > 1;  

    -- 可选：返回受影响的行数  
    SELECT @@ROWCOUNT AS DeletedRows;  
END
GO


-- ----------------------------
-- Procedure structure for LuodengClearCF
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[LuodengClearCF]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[LuodengClearCF]
GO

CREATE PROCEDURE [dbo].[LuodengClearCF]  
    @TableName NVARCHAR(128),  
    @ColumnName NVARCHAR(128)  
AS  
BEGIN  
    DECLARE @SQL NVARCHAR(MAX)  

    -- 动态 SQL 语句，用于删除重复记录  
    SET @SQL = N'  
    WITH CTE AS (  
        SELECT *,  
               ROW_NUMBER() OVER (PARTITION BY ' + QUOTENAME(@ColumnName) + ' ORDER BY (SELECT NULL)) AS RowNum  
        FROM ' + QUOTENAME(@TableName) + '  
    )  
    DELETE FROM CTE WHERE RowNum > 1;'  

    -- 执行动态 SQL  
    EXEC sp_executesql @SQL  
END
GO


-- ----------------------------
-- Primary Key structure for table DATA_DWDMK_luodeng
-- ----------------------------
ALTER TABLE [dbo].[DATA_DWDMK_luodeng] ADD CONSTRAINT [PK__data_dwd__7C921084C3B59A0A] PRIMARY KEY CLUSTERED ([DWDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DATA_GWDMK
-- ----------------------------
ALTER TABLE [dbo].[DATA_GWDMK] ADD CONSTRAINT [PK__data_gwd__3214EC2750B4FA03] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Triggers structure for table DATA_STUDENT
-- ----------------------------
CREATE TRIGGER [dbo].[cfq_AfterUpdateStudentData]
ON [dbo].[DATA_STUDENT]
WITH EXECUTE AS CALLER
FOR UPDATE
AS
BEGIN  
    -- 保证数据的一致性，班级代码更新班级名称 、专业根据班级来同步修改 
    UPDATE ds  
    SET ds.BJMC = bj.BJMC  , ZYDM=bj.ZYDM
    FROM DATA_STUDENT ds  
    INNER JOIN inserted i ON ds.ID = i.ID --  
    INNER JOIN BJDMK bj ON i.SSBJ = bj.ID;  
END;
GO


-- ----------------------------
-- Primary Key structure for table DATA_STUDENT
-- ----------------------------
ALTER TABLE [dbo].[DATA_STUDENT] ADD CONSTRAINT [PK__data_stu__3214EC274C78E042] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DATA_XSJLK
-- ----------------------------
ALTER TABLE [dbo].[DATA_XSJLK] ADD CONSTRAINT [PK_DATA_XSJLK] PRIMARY KEY CLUSTERED ([JLDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DATA_ZPHJLK
-- ----------------------------
ALTER TABLE [dbo].[DATA_ZPHJLK] ADD CONSTRAINT [PK__data_zph__3214EC27EE0CC61F] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DATA_ZPJZK
-- ----------------------------
ALTER TABLE [dbo].[DATA_ZPJZK] ADD CONSTRAINT [PK_DATA_ZPJZK] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DWGMK
-- ----------------------------
ALTER TABLE [dbo].[DWGMK] ADD CONSTRAINT [PK__dwgmk__5CB04908B5455E27] PRIMARY KEY CLUSTERED ([GMDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DWHYDMK
-- ----------------------------
ALTER TABLE [dbo].[DWHYDMK] ADD CONSTRAINT [PK__dwhydmk__6FB0C66A169D680B] PRIMARY KEY CLUSTERED ([HYDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table DWXZK
-- ----------------------------
ALTER TABLE [dbo].[DWXZK] ADD CONSTRAINT [PK__dwxzk__5340CF86BA8CC270] PRIMARY KEY CLUSTERED ([DWXZDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table FLDMK
-- ----------------------------
ALTER TABLE [dbo].[FLDMK] ADD CONSTRAINT [PK_FLDMK] PRIMARY KEY CLUSTERED ([FLDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table GWFLK
-- ----------------------------
ALTER TABLE [dbo].[GWFLK] ADD CONSTRAINT [PK_GWFLK] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table JYZTDMK
-- ----------------------------
ALTER TABLE [dbo].[JYZTDMK] ADD CONSTRAINT [PK_JYZTDMK] PRIMARY KEY CLUSTERED ([ZTDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table MSDMK
-- ----------------------------
ALTER TABLE [dbo].[MSDMK] ADD CONSTRAINT [PK_MSDMK] PRIMARY KEY CLUSTERED ([MSDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table SFDMK
-- ----------------------------
ALTER TABLE [dbo].[SFDMK] ADD CONSTRAINT [PK__sfdmk__F4B7CA2256F2413E] PRIMARY KEY CLUSTERED ([SFDM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Triggers structure for table TDJLK
-- ----------------------------
CREATE TRIGGER [dbo].[trg_AfterInsert_TDJLK]
ON [dbo].[TDJLK]
WITH EXECUTE AS CALLER
FOR INSERT
AS
BEGIN   
    DECLARE @STUID INT;  
    DECLARE @GWDM INT;  
	/*
		此触发器为INSERT 即学生投递简历

	   从 inserted 表获取新插入行的值  :
		STUID 学生ID
		GWDM 岗位代码
	*/
    SELECT   
        @STUID = STUID,  
        @GWDM = GWDM
     FROM inserted;  -- 'inserted' 表只有新插入的行  
	 /*
		ID	   消息代码
		CFZ	    触发者
		CFZXW	触发者行为
		CFSJ	消息产生时间
		JSZ	    接收者
		QBBZ	全部标志：即全部用户都可收到
		DZLX	动作类型: 1 单位用户确认投递  2 单位用户回应投递  3 单位用户安排面试  4 单位用户录入结果 5学生预览岗位 6 学生投递 7 新增系统请求 
		CFZSFDM	触发者身份代码   学生为4 来自YHSFDMK
		JSZSFDM	接收者身份代码   
		DZNR    动作内容
	 */
	 DECLARE @GWFBZ NVARCHAR(50); -- 岗位发布者用户名
     DECLARE @FBZSFDM INT;        -- 发布者身份代码 
	 select @GWFBZ=FBZ,@FBZSFDM=FBZYHSFDM from DATA_GWDMK where ID=@GWDM

	INSERT INTO XXDMK(CFZ,CFZXW,JSZ,DZLX,DZNR,CFZSFDM,JSZSFDM) 
	 values((select YHM from DATA_STUDENT where ID=@STUID),
	          '学生投递了岗位',@GWFBZ,6,'学生投递',4,@FBZSFDM)
END;
GO


-- ----------------------------
-- Primary Key structure for table XLTTK
-- ----------------------------
ALTER TABLE [dbo].[XLTTK] ADD CONSTRAINT [PK__xlttk__3213E83F0F1C9186] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table XTSHK
-- ----------------------------
ALTER TABLE [dbo].[XTSHK] ADD CONSTRAINT [PK_XTSHK] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table XXDMK
-- ----------------------------
ALTER TABLE [dbo].[XXDMK] ADD CONSTRAINT [PK_XXDMK] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

