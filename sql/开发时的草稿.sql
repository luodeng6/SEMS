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

select * from tdjlk where stuid = 1226 and gwdm =4
select * from 



update DATA_GWDMK set FBZ='billie' , FBZYHSFDM=3 where FBZYHSFDM=1

exec LuoDeng_getAlltableInfo
-- 获取某岗位对应的 环境
select * from JYHJK order by TJSJ desc
select * from DATA_GWDMK where ID=34
select * from  MSDMK  MSJGDMK
exec usp_GetTdjlk 2,'1',''
select * from DATA_GWDMK
exec usp_Clear
exec usp_GetDwyhData 'luo'
exec sems.dbo.LuodengTable 'DWHYDMK'
exec LuodengTable 'DATA_STUDENT' --学生代码库
exec LuodengTable 'BJDMK' -- 班级代码库
exec LuodengTable 'JSDMK'  -- 教师代码库
exec LuodengTable 'SFDMK' --省份代码库
exec LuodengTable 'XLTTK' -- 学历天题库
exec LuodengTable 'DWXZK' -- 单位性质库
exec LuodengTable 'DATA_GWDMK' --岗位代码库
exec LuodengTable 'DATA_DWDMK_luodeng' --岗位代码库
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


exec usp_getXxdmkData 1,'123'
select * from TDJGK
select * from DATA_DWDMK
select * from DWYHK
select a.GWMC,* from MSDMK b left join DATA_GWDMK a on a.ID=b.GWDM
select * from TDJLK
exec LuodengTable 'XXDMK'
--查看系统消息
SELECT   
   *
from XXDMK

-- 新建一个草稿表
select *  into MSCGDMK  from MSDMK 

exec usp_Clear

ALTER TABLE DWYHK  
ADD CONSTRAINT DF_DWYHK_YHZP DEFAULT 'defaultphoto.png' FOR YHZP;  


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

