package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;

import org.sems.sems.entity.Msfpk;


@Mapper
public interface MsfpkMapper {
    int insertMsfpk(Msfpk msfpk);
}
