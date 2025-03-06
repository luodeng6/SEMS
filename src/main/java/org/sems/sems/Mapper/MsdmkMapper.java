package org.sems.sems.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.sems.sems.entity.Msdmk;

@Mapper
public interface MsdmkMapper {
    int addMsdmk(Msdmk msdmk);

    // 更新投递记录是否已经面试
    @Update("update TDJLK set ISMS=1 where STUID=#{xsdm} and GWDM=#{gwdm}")
    int updateTdjlkIsms(@Param("xsdm") Integer xsdm, @Param("gwdm") Integer gwdm);

    @Delete("delete from MSDMK where MSDM=#{msdm}")
    int deleteMsdmk(@Param("msdm") int msdm);

    // 更新面试信息
    int updateMsdmk(Msdmk msdmk);

    // 单位开始面试
    @Update("update MSDMK set MSKSSJ=getdate(),MSZT=3,QYDM=1,QRDM=1 where MSDM=#{msdm}")
    int startMsdmk(@Param("msdm") int msdm);
}
