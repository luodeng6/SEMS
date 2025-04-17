package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.DataZphjlk;

@Mapper
public interface DataZphjlkMapper {

    int insertDataZphjlk(DataZphjlk dataZphjlk);
    int updateDataZphjlk(DataZphjlk dataZphjlk);
    int deleteDataZphjlk(Integer id);
}
