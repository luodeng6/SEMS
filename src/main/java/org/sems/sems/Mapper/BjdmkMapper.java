package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Bjdmk;

import java.util.List;


// 班级代码库
@Mapper
public interface BjdmkMapper {

    @Select("SELECT * FROM BJDMK")
    List<Bjdmk> getAllBjdmk();

    // 根据教师ID获取未分配的班级代码库
    @Select("SELECT * FROM BJDMK WHERE ID NOT IN (select BJID from JSBJDYK where JSID = #{jsid})")
    List<Bjdmk> getBjdmkByIdNotBline(int jsid);
}
