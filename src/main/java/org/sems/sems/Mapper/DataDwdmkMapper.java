package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sems.sems.entity.DataDwdmk;
import org.sems.sems.entity.DataGwdmk;

import java.util.List;

@Mapper
public interface DataDwdmkMapper {

    //  获取所有单位数据
    @Select("select * from DATA_DWDMK")
    List<DataDwdmk> getAllDataDwdmk();


    // 停用单位数据
    @Update("update DATA_DWDMK set QYDM=0 where DWDM=#{DWDM}")
    int tinyongDataDwdmk(@Param("DWDM") int DWDM);

    //  更新单位基础数据
    int updateDataDwdmk(DataDwdmk dataDwdm);

    //  添加单位基础数据
    int AddDataDwdmk(DataDwdmk dataDwdm);

    //  根据单位用户名获取单位数据
    @Select("SELECT * FROM DATA_DWDMK WHERE DWDM = (SELECT SSDW FROM DWYHK  WHERE YHM = #{dwUserName})")
    DataDwdmk getDwDataByDwUserName(@Param("dwUserName") String dwUserName);

    @Select("SELECT * FROM DATA_DWDMK WHERE QYDM = #{qydm}")
    List<DataDwdmk> getAllDwDataByQydm(@Param("qydm") int qydm);
}
