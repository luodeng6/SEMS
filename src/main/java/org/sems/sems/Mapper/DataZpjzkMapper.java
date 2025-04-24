package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.DataZpjzk;

@Mapper
public interface DataZpjzkMapper {
     int updateDataZphjlk(DataZpjzk dataZpjzk);
     int insertDataZphjlk(DataZpjzk dataZpjzk);
     int deleteDataZphjlk(Integer id);
}
