package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sems.sems.entity.Dwyhk;

import java.util.List;

@Mapper
public interface DwyhkMapper {
    // 获取所有单位用户信息
    @Select("select * from sems.dbo.DWYHK;")
    List<Dwyhk> selectAllDwyhk();

    @Update("update sems.dbo.DWYHK set TYBZ = #{tybz} where YHM = #{yhm}")
    int updateDwyhkTYBZ(@Param("yhm") String yhm, @Param("tybz") int tybz);

    int addDwyhk(Dwyhk dwyhk);

    // 动态智能更新语句
    int AdminUpdateDwyhkData(Dwyhk dwyhk);
}
