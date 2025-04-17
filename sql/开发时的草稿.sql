exec usp_GetAllStudentData 123,'管理员'
-- 登录接口汇总
exec usp_DwLogin 'luo','123'
exec usp_StudengLogin '1','1'
exec usp_LoginInterface '123','123'
exec usp_GetJyhjkByFbzyhm 'luo'
select GWMC,DWDM,DWMC,FBZ from DATA_GWDMK where FBZ='luo'
update DATA_GWDMK set FBZ='luo',FBZYHSFDM=3 where FBZ is null
select * from YHSFDMK
select GWFL,GZSF,* from DATA_GWDMK
select * from BJDMK
select * from GWFLK
select * from DATA_DWDMK 
select * from XLTTK
select * from DWYHK
select * from XXDMK
Select QYDM,* from DATA_STUDENT
exec usp_getXxdmkData 3,'msk'
select * from tdjlk where stuid = 1226 and gwdm =4
select * from dhjlk
exec LuodengTable 'XXDMK'
select * from DHJLK where (FROMYHM='20213260035' and FROMYHSFDM=4) or  (TOYHM='20213260035' and TOYHSFDM=4)

INSERT INTO dhjlk (fromyhm, toyhm, fromyhsfdm, toyhsfdm, nr) VALUES
('msk', '20213260035', 3, 4, '测试消息11'),
('msk', '20213260035', 3,4, '测试消息12')

 exec usp_GetUserData 'ozf',3
--exec usp_GetDhjl '20213260035',4,3,'msk'
exec LuodengTable 'DATA_ZPHJLK'
exec LuoDeng_getAlltableInfo
select * from DATA_ZPHJLK
select * from FPWTBQK
select * from MSFPWTK
-- 获取面试场次
exec usp_GetMsData_StuAndDw 3,'20213260024'
exec usp_AllUserGetGongGaoData 3,'msk',-1,0,-1
USE [sems];
GO

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    DATETIME_PRECISION 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'DATA_ZPHJLK'
  AND COLUMN_NAME = 'JBSJ';


begin  tran
update DATA_ZPHJLK          SET ZPHBT    = '卫宁招聘会',             DWDM     = 1,             WZBZ     = 1,             JBSJ     = '2025-04-15T00:00:00.000+0800',             DYGWDM  = '实施、开发',             SZXX     = '广西中医药大学2',             JBDD     = '教学楼1楼',             FBZ      = 'lls',             FBZSFDM = 2,                          ZY       = '计算机专业类即可！',             YYRS     = 100          where ID = 1
rollback


exec usp_GetZphData 2,0,-1,1,'lls',2,0,'-1',-1
select * from DATA_ZPHJLK

select * from DHJLK

update DATA_GWDMK set FBZ='billie' , FBZYHSFDM=3 where FBZYHSFDM=1

exec LuoDeng_getAlltableInfo


 exec usp_GetStudentXmcg 2,1,1237

exec LuodengTable 'DATA_ZPHJLK'


exec usp_AllUserGetGongGaoData 4,'null',1,0,-1



select * from DWZPGGK
 select * from XTGGK
  TRUNCATE TABLE XTGGK
-- 获取某岗位对应的 环境
select * from JYHJK order by TJSJ desc
select * from DATA_GWDMK where ID=34
select * from  MSDMK  MSJGDMK
exec usp_GetTdjlk 2,'1',''
select * from DATA_GWDMK
exec usp_Clear   -- 清库
exec usp_GetDwyhData 'luo'
exec sems.dbo.LuodengTable 'DWHYDMK'
exec LuodengTable 'DATA_STUDENT' --学生代码库
select * from DATA_STUDENT
select * from XLTTK
-- 更新班级
UPDATE a
SET a.SSBJ = b.ID
FROM DATA_STUDENT a
INNER JOIN BJDMK b ON a.BJMC = b.BJMC;

exec usp_GetZphData 2,0,-1,1,'lls',2,0,'-1',-1

exec LuodengTable 'DATA_ZPHJLK'
 exec usp_getXsjlkData '20213260026',-1
select a.*,b.XSXM,b.XSXB,b.XSZP,b.JYZT from DATA_XSJLK a 
				left join DATA_STUDENT b on a.XSID=b.ID
			where b.YHM='20213260026'

delete from  DATA_STUDENT where BJMC != '2021级信息管理与信息系统'



exec LuodengTable 'BJDMK' -- 班级代码库
exec LuodengTable 'DATA_XSJLK' -- 班级代码库
exec LuodengTable 'JSDMK'  -- 教师代码库
exec LuodengTable 'SFDMK' --省份代码库
exec LuodengTable 'XLTTK' -- 学历天题库
exec LuodengTable 'DWXZK' -- 单位性质库
exec LuodengTable 'DATA_GWDMK' --岗位代码库
exec LuodengTable 'DWXZK' --单位性质库
exec LuodengTable 'DATA_DWDMK' --单位代码库
exec LuodengTable 'DWGMK'-- 单位规模库
exec LuodengTable 'JYHJK' --就业环境库
exec LuodengTable 'GWFLK' --岗位分类库
exec LuodengTable 'DATA_DWDMK'-- 单位代码库
exec LuodengTable 'DWYHK'  --单位用户库
exec LuodengTable 'MSDMK' -- 面试代码库
exec LuodengTable 'JYHJK' -- 就业环境库
exec LuodengTable 'GLYDMK' -- 管理员代码库
exec LuodengTable 'XSZPMBK' --学生照片模版库
exec LuodengTable 'DATA_XSJLK'--学生简历库
exec LuodengTable 'MSJGDMK' --面试结果代码库
exec LuodengTable 'TDJLK'-- 投递记录库
exec LuodengTable 'DATA_XSJLK'--学生简历库
exec LuodengTable 'TDJGK'
exec LuodengTable 'XXDMK'
exec LuodengTable 'MSSQK'
exec LuodengTable 'MSFPK'
exec LuodengTable 'MSFPWTK'--面试复盘问题库：对应MSFPK的问题
exec LuodengTable 'FPWTBQK'--复盘问题标签库
exec LuodengTable 'GZJLK' -- 工作经历库
exec LuodengTable 'DATA_DWDMK'
exec LuodengTable 'XSZSK'
exec LuodengTable 'XSCJDK'
exec LuodengTable 'DHJLK'

exec usp_GetAllStudentData'lls', '老师'
 select * from JSBJDYK

 SELECT   
					a.[ID],  a.[XSXM],  a.[XSXB],  a.[BIRTH],  
					DATEDIFF(YEAR, [BIRTH], GETDATE()) AS NL,  
					a.[YHM],  c.ZYMC,  a.[SFZH],  a.[ZZMM],  a.[SSNJ],  
					CASE a.[XZ]  
						WHEN 1 THEN '一年制'  
						WHEN 2 THEN '二年制'  
						WHEN 3 THEN '三年制'  
						WHEN 4 THEN '四年制'  
						WHEN 5 THEN '五年制'  
						WHEN 6 THEN '六年制'  
						ELSE '暂未提供'  
					END AS XZ,  
					a.[MZ],  a.[XSXH],  a.[BJMC],a.SSBJ,a.BJMC,
					b.XLMC,  d.JYZT,a.XSZP,a.FZJS,e.JSMC
				FROM   
					DATA_STUDENT a  
				LEFT JOIN   
					XLTTK b ON a.XLDM = b.ID  
				LEFT JOIN   
					ZYDMK c ON a.ZYDM = c.ID  
				LEFT JOIN   
					JYZTDMK d ON a.JYZT = d.ZTDM  
				LEFT JOIN 
					JSDMK e ON a.FZJS = e.ID  
				where a.SSBJ in (select BJID from JSBJDYK where JSID=(select ID from JSDMK where YHM='lls'))
				 --用于获取教师信息（姓名）
				 SELECT * FROM  JSDMK
select BJID from JSBJDYK where JSID=(select ID from JSDMK where YHM='lls')
 exec getStudentDataNewInterface 3, 2, 'lls' 


select * from YHSFDMK
select * from JSDMK
select * from XSZSK 
select * from MSJGDMK
select * from XSZSK
exec [usp_StuGet_MsfpDaTa] '20213260024'
select * from MSFPK
select * from FPWTBQK
select * from MSFPWTK
select * from DATA_DWDMK where DWMC like '%特斯拉%'
update DWYHK set MM=1
select *from MSJGDMK
 select * from TDJGK
select * from DATA_DWDMK
delete from XSCJDK where STUID=1224

exec usp_getMsData 3,'msk'
select * from DATA_STUDENT where ID=1224

select b.XSXM,a.* from MSDMK a left join DATA_STUDENT b on a.XSDM=b.ID

select a.GWMC,* from MSDMK b left join DATA_GWDMK a on a.ID=b.GWDM
select * from TDJLK
exec usp_GetZphData 2
--查看系统消息
SELECT   
   *
from XXDMK
select * from DATA_ZPHJLK
-- 新建一个草稿表
select *  into MSCGDMK  from MSDMK 
select * from DATA_ZPHJLK
exec usp_Clear

ALTER TABLE DWYHK  
ADD CONSTRAINT DF_DWYHK_YHZP DEFAULT 'defaultphoto.png' FOR YHZP;  

exec usp_getXxdmkData 3,'msk'

exec usp_StuGetWaitMsData '20213260024'-- 获取学生待确认的面试信息
update XXDMK set YDBZ=1 
select * from 
exec LuodengTable 'XXDMK'--消息代码库
select * from JYZTDMK
select * from TDJLK where HYDM is null
select * from XXDMK
select * from DATA_XSJLK
SELECT * FROM DATA_STUDENT WHERE ID=1226
select * from JYHJK
exec usp_Clear 
upadte TDJLK set TDJGNR =case 


-- 查询投递记录
select b.XSXM,c.GWMC,* from TDJLK a 
left join DATA_STUDENT b on a.STUID=b.ID
left join DATA_GWDMK c on a.GWDM=c.ID  
order by TDSJ desc




-- 新建简历
  SELECT a.*,b.SSBJ,b.XSXM,b.BJMC,b.ID STUID,b.SSNJ,b.XLDM,d.XLMC,b.XSXB,b.XSZP,b.FZJS,b.XSXH,b.ZZMM,
			c.ID GWDM,c.GWMC,c.TDSM,e.GSMC
		FROM TDJLK a
		left join DATA_STUDENT b on a.STUID=b.ID
		left join DATA_GWDMK c on a.GWDM=c.ID
		left join XLTTK d on b.XLDM=d.ID
		left join DATA_DWDMK e on c.DWDM=e.DWDM  where  c.FBZ=  'luo' and c.FBZYHSFDM=3-- 单位用户

-- 获取指定单位用户发布的岗位
select QYDM,* from DATA_GWDMK where FBZ='luo'


insert into DATA_XSJLK(XSID,JLWB,HTML,SCXGTIME,FBSJ,FBBZ)  select top 1 1227,JLWB,HTML,SCXGTIME,FBSJ,1 from DATA_XSJLK 

-- 获取未投递的简历
select * from DATA_XSJLK where JLDM not in (select JLDM from TDJLK)
delete  DATA_XSJLK where JLDM not in (select JLDM from TDJLK)

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

 --
 update DATA_XSJLK set FB
 exec usp_getWaitAddMS '1'

select * from TDJLK
-- 获取投递数据
exec usp_GetTdjlk 2,'1',1

select * from DWYHK
select * from JSDMK
update BJDMK set BZRDM=1002

exec usp_GetAllSystemUser 5,1

select * from DATA_DWDMK
select * from JYHJK
select * from DWYHK
select * from MSDMK
select * from YHSFDMK
insert into FLDMK(FLMC) value()
select * from FLDMK
select * from GWFLDYK
select * from DATA_GWDMK   img/2025/2/3/1738548864127_.JPG
select * from YHSFDMK
select * from GWFLK
update DATA_GWDMK set FBZ='123',FBZYHSFDM=1 where ID<15
ALTER TABLE FLDMK  
ALTER COLUMN FLMS NVARCHAR(500);  

select * from MSJGDMK
exec LuoDeng_getAlltableInfo
insert into MSJGDMK(MSJG) values('录用'),('不录用'),('待定'),('多轮面试')
TRUNCATE TABLE MSJGDMK
TRUNCATE TABLE JYHJK
exec LuoDeng_getAlltableInfo

insert into DATA_DWDMK(DWMC,
DWXZ,-- 单位性质
DWXZDM, --单位性质代码
DWGMDM,--单位规模库
DWGM, --单位规模
DWHYDM,-- 单位行业代码
DWHY, -- 单位行业
GSMC,-- 公司名称
GSJJ, -- 公司简介
GSJJHTML,-- 
QYDM-- 0
) values()

SFDMK 
XLTTK 
DWXZK  
DWGMK 

ALTER TABLE MSDMK  
ADD MSJG int NOT NULL ;


select *  into DATA_DWDMK_bak from  DATA_DWDMK   

select GWFL,* from DATA_GWDMK
 
 select TDCS, * from DATA_GWDMK a order by a.TDCS desc

 select * from DATA_DWDMK
 select * from DWXZK
  select * from DWGMK
  select * from DWHYDMK
  select * from GWFLK



  select * from DATA_DWDMK where GSMC= '三一重能2023校招'

WITH CTE AS (  
    SELECT   
        DWDM,  
        GSMC,  
        ROW_NUMBER() OVER (PARTITION BY GSMC ORDER BY DWDM) AS RowNum  
    FROM   
        DATA_DWDMK  
)  
DELETE FROM CTE WHERE RowNum > 1;

exec LuodengClearCF 'FLDMK','FLMC'

CREATE PROCEDURE LuodengClearCF  
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
select * from DATA_GWDMK
begin tran
update DATA_GWDMK set FBZ='123',FBZYHSFDM=1 where DWDM!=1
rollback
select * from DATA_DWDMK

