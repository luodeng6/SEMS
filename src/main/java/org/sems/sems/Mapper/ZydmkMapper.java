package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Zydmk;

import java.util.List;

@Mapper
public interface ZydmkMapper {
    // 获取所有专业代码
    @Select("SELECT * FROM ZYDMK")
    List<Zydmk> getAllZydmk();
}
