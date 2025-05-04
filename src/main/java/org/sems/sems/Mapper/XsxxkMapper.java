package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Xsxxk;

@Mapper
public interface XsxxkMapper {
    int insertXSXXK(Xsxxk xsxxk);
    int updateXSXXK(Xsxxk xsxxk);
}

