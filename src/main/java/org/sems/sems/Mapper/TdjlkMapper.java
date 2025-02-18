package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.*;
import org.sems.sems.entity.Tdjlk;

import java.util.List;

@Mapper
public interface TdjlkMapper {
    @Insert("insert into tdjlk(stuid, gwdm, lynr,jldm) values(#{stuid}, #{gwdm}, #{lynr}, #{jldm})")
    int addNewTdjlk(Tdjlk tdjlk);

    // 获取所有 tdjlk 信息
    @Select("select * from tdjlk")
    List<Tdjlk> getAllTdjlk(Integer id);

    // 获取某学生的 tdjlk 信息 通过 stuid
    @Select("select * from tdjlk where stuid = #{stuid}")
    List<Tdjlk> getTdjlkByStuid(Integer stuid);

    // 获取某学生的 tdjlk 信息 通过 投递记录 id
    @Select("select * from TDJLK where ID=#{id}")
    Tdjlk getTdjlkByID(@Param("id") int id);
    // 更新某条 tdjlk 信息
    @Update("update tdjlk set QYDM=#{qyzt} where id = #{id}")
    int updateQyztById(@Param("id") int id, @Param("qyzt") int qyzt);
    // 单位确认
    @Update("update TDJLK set QRDM=1 where ID=#{id}")
    int updateQrdmById( @Param("id") int id);


    // 根据学生 ID +岗位代码 获取投递记录信息，也可以用于检查是否已经投递过;;Qydm=1 表示投递是否已经撤销
    @Select("select * from tdjlk where stuid = #{stuid} and gwdm = #{gwdm} and qydm=1")
    Tdjlk getTdjlkByStuidAndGwdm(@Param("stuid") Integer stuid, @Param("gwdm") Integer gwdm);

    // 根据投递记录ID删除投递记录
    @Delete("delete from tdjlk where id = #{id}")
    int deleteTdjlkById(int id);

    // 单位用户回应
    @Update("update tdjlk set HYSJ=GETDATE(),HYDM=1,DWYH=#{dwyh},TDJG=#{hyjg},TDJGNR=(select TDJG from TDJGK where ID=#{hyjg}),HYNR=#{hynr} where id = #{id}")
    int HyTdjlkById(@Param("id") int id,@Param("hynr") String hynr, @Param("dwyh") String dwyh, @Param("hyjg") int hyjg);


    // 用户是否已经回应
    @Select("select * from tdjlk where id = #{id} and hydm = 1")
   List<Tdjlk>  isHyTdjlkById(int id);
}
