package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.*;
import org.sems.sems.entity.Dwhydmk;

import java.util.List;

// 单位行业代码库Mapper接口
@Mapper
public interface DWHYDMKMapper {

    // 获取所有单位行业代码
    @Select("select * from DWHYDMK")
    List<Dwhydmk> getAllDwhydmk();

    // 删除指定单位行业代码
    @Delete("delete from sems.dbo.DWHYDMK where sems.dbo.DWHYDMK.HYDM = #{hydm}")
    int deleteDwgmkByID(int  hydm);

    // 新增单位行业
    @Insert("insert  into DWHYDMK(hymc, hyms) values(#{hymc}, #{hyms})")
    int AddDWHYDMK(Dwhydmk dwhydmk);

    // 根据单位行业代码更新行业名称和行业简称
    @Update("update DWHYDMK set HYMC = #{hymc}, HYMS = #{hyms} where HYDM = #{hydm}")
    int updateDWHYDMKById(Dwhydmk dwhydmk);
}
