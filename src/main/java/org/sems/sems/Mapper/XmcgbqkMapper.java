package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Xmcgbqk;

@Mapper
public interface XmcgbqkMapper {

    int insertXmcgbqk(Xmcgbqk xmcgbqk);
    int deleteXmcgbqkById(Xmcgbqk xmcgbqk);
}
