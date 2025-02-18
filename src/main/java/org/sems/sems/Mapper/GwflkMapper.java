package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Gwflk;

import java.util.List;

@Mapper
public interface GwflkMapper {
    @Select("SELECT * FROM gwflk")
     List<Gwflk> getGwflk();

}
