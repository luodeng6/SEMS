package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.DataXsjlk;


import java.util.List;

@Mapper
public interface XsjlkMapper {
    @Select("select * from sems.dbo.DATA_XSJLK where XSID = #{stuId} and FBBZ = 1")
    List<DataXsjlk> getXsjlkByStuId(@Param("stuId") int stuId);
}
