package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Xmcgk;

@Mapper
public interface XmcgkMapper {
    int insertXmcgk(Xmcgk xmcgk);
    //int deleteXmcgk(String xmcgk);
    int updateXmcgk(Xmcgk xmcgk);
}
