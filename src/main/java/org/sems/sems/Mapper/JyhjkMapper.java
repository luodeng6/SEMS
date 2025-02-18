package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.*;
import org.sems.sems.entity.Jyhjk;

import java.util.List;

@Mapper
public interface JyhjkMapper {

    // 获取所有JYHJK数据
    @Select("SELECT * FROM  sems.dbo.JYHJK")
    List<Jyhjk> SelectAllJYHJK();

    // 新建JYHJK数据  IMGURL
    //GWDM
    //TJSJ
    @Insert("INSERT INTO sems.dbo.JYHJK(IMGURL, GWDM) VALUES(#{imgurl}, #{gwdm})")
    int InsertJYHJK(Jyhjk jyhjk);

    @Insert("INSERT INTO sems.dbo.JYHJK(IMGURL, GWDM) VALUES(#{imgurl}, #{gwdm})")
    int InsertJYHJK2(@Param("imgurl") String imgurl, @Param("gwdm") String gwdm);

    // 根据GWDM获取所有JYHJK数据
    @Select("SELECT * FROM  sems.dbo.JYHJK WHERE GWDM = #{gwdm}")
    List<Jyhjk> SelectAllJYHJKByGwdm(int gwdm);

    // 根据发布者用户名获取所有JYHJK数据，
    @Select("SELECT * FROM  JYHJK WHERE GWDM in (SELECT a.ID  FROM DATA_GWDMK a  WHERE FBZ = #{fbzYhm})")
    List<Jyhjk> SelectAllJYHJKByFbzYhm(@Param("fbzYhm") String fbzYhm);

    // 根据ID删除JYHJK数据
    @Delete("DELETE FROM sems.dbo.JYHJK WHERE ID = #{id}")
    int deleteJYHJKById(int id);
}
