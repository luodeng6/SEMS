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


    // 根据学生 ID +岗位代码 获取投递记录信息，也可以用于检查是否已经投递过
    @Select("select * from tdjlk where stuid = #{stuid} and gwdm = #{gwdm}")
    Tdjlk getTdjlkByStuidAndGwdm(@Param("stuid") Integer stuid, @Param("gwdm") Integer gwdm);

    // 根据投递记录ID删除投递记录
    @Delete("delete from tdjlk where id = #{id}")
    int deleteTdjlkById(int id);

    // 单位用户回应
    @Update("update tdjlk set HYSJ=now(),DWYH=#{dwyh},HYJG=#{hyjg},HYNR=#{hynr} where id = #{id}")
    int HyTdjlkById(int id, String hynr, String dwyh, int hyjg);
}
