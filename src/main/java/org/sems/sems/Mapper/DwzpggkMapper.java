package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Dwzpggk;
@Mapper
public interface DwzpggkMapper {

    int insertDwzpggk(Dwzpggk dwzpggk);

    int updateDwzpggk(Dwzpggk dwzpggk);
}
