package org.sems.sems.Mapper;


import org.apache.ibatis.annotations.*;
import org.sems.sems.entity.Sfdmk;
import org.sems.sems.entity.Xlttk;

import java.util.List;

@Mapper
public interface XlttkMapper {


    // 获取所有学历信息
    @Select("SELECT * FROM xlttk")
    List<Xlttk> getAllXlttk();
    // 删除学历信息通过id
    @Delete("delete from xlttk where ID = #{id}")
    int deleteXlttkByID(@Param("id") int id);

    //新增学历信息
    @Insert("insert into xlttk(XLMC, XLMS) values(#{XLMC}, #{XLMS})")
    int insertXlttk(Xlttk xlttk);
}
