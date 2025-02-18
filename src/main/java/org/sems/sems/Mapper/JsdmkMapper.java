package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sems.sems.entity.Jsdmk;

import java.util.List;

@Mapper
public interface JsdmkMapper {

    // 获取所有教师信息
    @Select("SELECT * FROM jsdmk where QYDM=1")
    List<Jsdmk> getAllJsdmk();

    //教师登录


    // 教师停用
    @Update("update JSDMK set QYDM=0  where ID=#{jsdm}")
    int TingyongJsdmk(int jsdm);

    // 新增教师   Jsdmk(id=null, jsmc=罗邓, sex=男, dlzh=ld, dlmm=123)
    @Insert("insert into JSDMK(jsmc, sex, dlzh, dlmm) values (#{jsmc},#{sex},#{dlzh},#{dlmm})")
    int AddTeacher(Jsdmk jsdmk);


    // 新增教师信息--智能新增
    int AddJsdmkDataZhineng(Jsdmk jsdmk);

    // 修改教师信息
    int UpdateTeacher(Jsdmk jsdmk);

}
