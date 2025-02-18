package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Jyztdmk;

import java.util.List;

// 就业状态库 Mapper
@Mapper
public interface JyztdmkMapper {

    // 获取就业状态列表
    @Select("select * from JYZTDMK where QYDM=1")
    List<Jyztdmk> selectAllJyztdmk();

}
