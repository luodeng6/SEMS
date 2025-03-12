package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Gzjlk;

@Mapper
public interface GzjlkMapper {
    int updateGZJLK(Gzjlk gzjlk);
    int insertGZJLK(Gzjlk gzjlk);
    @Delete("delete from gzjlk where id = #{id}")
    int deleteGZJLK(Integer id);
}

