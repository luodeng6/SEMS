package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Dhjlk;

import java.util.List;

@Mapper
public interface DhjlkMapper {


    int insertDhjlk(Dhjlk dhjlk);
    int updateDhjlk(Dhjlk dhjlk);

    @Select("select * from DHJLK where (FROMYHM=#{yhm} and FROMYHSFDM=#{yhsfdm}) or  (TOYHM=#{yhm} and TOYHSFDM=#{yhsfdm})")
    List<Dhjlk> getDhjlList(@Param("yhm") String yhm,@Param("yhsfdm") int yhsfdm);
}
