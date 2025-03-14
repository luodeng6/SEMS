package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Xscjdk;

@Mapper
public interface XscjdkMapper {
    int insertXscjdk(Xscjdk xscjdk);

   int   updateXscjdk(Xscjdk xscjdk);
}
