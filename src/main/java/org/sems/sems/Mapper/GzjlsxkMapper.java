package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Gzjlsxk;

@Mapper
public interface GzjlsxkMapper {
    @Insert("insert into GZJLSXK( gzjlsx, gzjldm) values ( #{gzjlsx},  #{gzjldm})")
    int insertGzjlsxk(Gzjlsxk gzjlsxk);
    @Delete("delete from GZJLSXK where ID = #{id}")
    int deleteGzjlsxK(Integer id);
}
