package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Dwxzk;

import java.util.List;

// 单位性质库
@Mapper
public interface DWXZKMapper {

    // 获取所有单位性质
    @Select("select * from DWXZK")
    List<Dwxzk> getAllDWXK();

    // 删除指定单位性质
    @Delete("delete from DWXZK where  DWXZDM= #{DWXZDM}")
    int deleteDWXKById(int DWXZDM);

    // 新增单位性质
    @Insert("insert  into DWXZK(DWXZ, XZMS) values(#{DWXZDM},#{DWXZMC})")
    int AddDWXK(Dwxzk dwxzk);



}
