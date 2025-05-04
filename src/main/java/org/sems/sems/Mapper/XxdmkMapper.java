package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface XxdmkMapper {
    @Update("UPDATE XXDMK SET YDBZ = 1, YDSJ = GETDATE() WHERE JSZ = #{yhm} AND JSZSFDM = #{yhsfdm}")
    int setAllRead(@Param("yhm") String yhm, @Param("yhsfdm") int yhsfdm);
}
