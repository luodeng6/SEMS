package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Tjgwk;

@Mapper
public interface TjgwkMapper {
    @Delete("DELETE FROM TJGWK WHERE ID = #{id}")
    int deleteByPrimaryKey(Integer id);
    int insertNew(Tjgwk tjgwk);
}
