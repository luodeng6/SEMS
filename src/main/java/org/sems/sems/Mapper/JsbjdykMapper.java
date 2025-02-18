package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.*;
import org.sems.sems.entity.Bjdmk;
import org.sems.sems.entity.Jsdmk;

import java.util.List;

// 教师班级对应关系 Mapper
@Mapper
public interface JsbjdykMapper {

    //老师对应多个班级！
    @Select("SELECT *  FROM BJDMK WHERE ID IN ( SELECT BJID FROM JSBJDYK WHERE JSID=#{JSID})")
    //由教师id获取班级信息
    List<Bjdmk> getBjdmkByJsdmk(int JSID);


    // 添加关联
    @Insert("INSERT INTO JSBJDYK(JSID, BJID) VALUES(#{JSID}, #{BJID})")
    int TianJiaJsbjdyk(@Param("JSID") int JSID,@Param("BJID") int bjdmk);

    // 取消关联
    @Delete("delete from JSBJDYK where  JSID=#{JSID} and BJID=#{BJID}")
    int CanslJsbjdyk(@Param("JSID") int JSID, @Param("BJID") int BJID);



    //由班级id获取教师信息-- z责任老师
    @Select("select * from JSDMK where ID in (select JSID from JSBJDYK where BJID=#{bjdm})")
    List<Jsdmk> getJsdmkByBjdmk(int bjdm);
}
