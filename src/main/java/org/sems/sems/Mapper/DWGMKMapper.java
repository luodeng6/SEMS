package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Dwgmk;
import org.sems.sems.entity.Dwxzk;

import java.util.List;

// 单位规模库
@Mapper
public interface DWGMKMapper {

    // 获取所有单位规模库
    @Select("select * from DWGMK")
    List<Dwgmk> getAllDwgmk();

    // 删除指定单位规模库
    @Delete("delete from DWGMK where GMDM = #{GMDM}")
    int deleteDwgmkByID(int GMDM);

    // 新增单位规模
    @Insert("insert  into DWGMK(GMXQ) values(#{GMXQ})")
    int AddDWXK(String GMXQ);

}
