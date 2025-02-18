package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.*;
import org.sems.sems.entity.Sfdmk;

import java.util.List;

/**
 * (SfdmkMapper)Mapper接口 -- 省份代码表
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:15
 */
@Mapper
public interface SfdmkMapper {
    // 获取所有省份代码
    @Select("SELECT * FROM SFDMK")
    List<Sfdmk> getAllSfdmk();

    // 删除指定省份代码
    @Delete("delete from SFDMK where  SFDM= #{SFDM}")
    int deleteSfdmkBySFDM(int SFDM);

    // 新增省份代码
    @Insert("insert  into SFDMK(SFMC) values(#{SFMC})")
    int AddSfdmk(String SFMC);

    // 通过省份代码修改省份数据
    @Update("update SFDMK set SFMC = #{sfmc} where SFDM = #{sfdm}")
    int updateSfdmkBySFDM(Sfdmk sfdmk);

}
