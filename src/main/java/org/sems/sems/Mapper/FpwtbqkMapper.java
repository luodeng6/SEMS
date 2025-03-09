package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sems.sems.entity.Fpwtbqk;

@Mapper
public interface FpwtbqkMapper {
    @Insert("insert into FPWTBQK(wtid, bqnr) values(#{wtid}, #{bqnr})")
    int insertFpwtbqk(Fpwtbqk fpwtbqk);
}

