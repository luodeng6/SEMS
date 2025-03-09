package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Msfpwtk;

import java.util.List;

@Mapper
public interface MsfpwtkMapper {
    int insertMsfpwtk(Msfpwtk msfpwtk);

    @Select("SELECT * from MSFPWTK WHERE FPDM in (SELECT ID FROM MSFPK WHERE  )")
    List<Msfpwtk> getMsfpwtkList(String yhm);
}
