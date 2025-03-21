package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Xtggk;

@Mapper
public interface XtggkMapper {
    int insertXtggk(Xtggk xtggk);

    int updateXTGGK(Xtggk xtggk);
}
