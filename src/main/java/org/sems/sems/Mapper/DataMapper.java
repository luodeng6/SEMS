package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface DataMapper {
    // 使用 List<List<Map<String, Object>>> 接收多个结果集
    @Select("{CALL usp_Get_JCSJ()}")
    List<List<Map<String, Object>>> getAllData();

    @MapKey("YHMC") // 自定义 Map 的 key 为 tableName
    Map<String, Object> loginInterface(@Param("username") String username,@Param("password") String password); // 使用 Map<String, Object>

}
