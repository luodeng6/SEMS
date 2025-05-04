package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Tjdxk;

@Mapper
public interface TjdxkMapper {

    @Insert("insert into tjdxk(dxlx, dxdm, tjdm) values(#{dxlx}, #{dxdm}, #{tjdm})")
    int insertTjdxk(Tjdxk tjdxk);
}
