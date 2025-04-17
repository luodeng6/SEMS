package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.DataZpjzk;

@Mapper
public interface DataZpjzkMapper {
    int insetDataZpjzk(DataZpjzk data);
}
