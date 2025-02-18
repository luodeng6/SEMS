package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sems.sems.entity.DataStudent;

import java.util.List;

@Mapper
public interface DataStudentMapper {

    // 获取所有学生信息
    @Select("select * from DATA_STUDENT")
    List<DataStudent> getAllStudents();

    // 停用学生信息
    @Update("UPDATE DATA_STUDENT SET QYDM = 0 WHERE ID = #{id}")
    int TinYongStudentByID(int id);

    // 启用学生信息 -- 通过学生ID
    @Update("UPDATE DATA_STUDENT SET QYDM = 1 WHERE ID = #{id}")
    int QiYongStudentByID(int id);

     int AdminUpdateStudentData(DataStudent dataStudent);

    int AddStudentData(DataStudent dataStudent);

    int AddStudentDataZhiNeng(DataStudent dataStudent);

    @Select("select * from DATA_STUDENT where ID = #{id}")
    DataStudent getStudentByID(int id);


    @Select("select * from DATA_STUDENT where YHM =  #{yhm}")
    DataStudent getStudentByYHM(String yhm);

    @Update("UPDATE DATA_STUDENT SET XSZP = #{url} WHERE YHM = #{yhm}")
    int updateStudentPhoto(@Param("yhm") String yhm, @Param("url")  String url);
}
