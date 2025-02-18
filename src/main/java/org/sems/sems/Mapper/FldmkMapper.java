package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.*;
import org.sems.sems.entity.Fldmk;

import java.util.List;

@Mapper
public interface FldmkMapper {
    // 获取所有福利代码数据
    @Select("SELECT * FROM fldmk")
    List<Fldmk> getAllFldmk();

    // 新增福利代码数据
    @Insert("INSERT INTO fldmk(flmc, flms) VALUES(#{flmc}, #{flms})")
    int insertFldmk(Fldmk fldmk);

    // 根据福利代码删除数据
    @Delete("DELETE FROM fldmk WHERE fldm = #{fldm}")
    int deleteFldmkByFldm(Integer fldm);

    // 岗位福利对应
    @Insert("INSERT INTO GWFLDYK(GWDM, FLDM) VALUES(#{gwdm}, #{fldm})")
    int gwfldy(@Param("fldm") int fldm, @Param("gwdm") int gwdm);

    //根据岗位获取对于的福利
    @Select("SELECT * FROM sems.dbo.FLDMK WHERE FLDM IN (SELECT FLDM FROM GWFLDYK WHERE GWDM = #{gwdm})")
    List<Fldmk> getFldmkByGwdm(Integer gwdm);

    @Delete("DELETE FROM GWFLDYK WHERE GWDM = #{gwdm}")
    int clearGwflByGWDM(@Param("gwdm") Integer gwdm);
}
