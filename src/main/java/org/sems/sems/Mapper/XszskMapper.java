package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.sems.sems.entity.Xszsk;

@Mapper
public interface XszskMapper {
    int insertXszsk(Xszsk xszsk);

    int updateXszsk(Xszsk xszsk);

    @Delete("delete from xszsk where id = #{id}")
    int deleteXszsk(Integer id);
}
