package org.sems.sems.Mapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sems.sems.entity.DataGwdmk;

import java.util.List;
@Mapper
public interface DataGwdmkMapper {
    // 获取所有岗位信息
    @Select("select  * from DATA_GWDMK")
    List<DataGwdmk> getALlGwdmkData();
    // 由单位获取其发布的所有岗位
    @Select("select * from DATA_GWDMK where DWDM=#{DWDM}")
    List<DataGwdmk> getALlGwByDwdm(@Param("DWDM") int DWDM);
    // id获取岗位信息
    @Select("select * from DATA_GWDMK where ID=#{ID}")
    DataGwdmk getGwdmkById(@Param("ID") int ID);
    // 热门岗位：根据投递次数排序获取前7条数据
    @Select("SELECT * FROM DATA_GWDMK WHERE QYDM=1 ORDER BY TDCS DESC")
    List<DataGwdmk> getHotDataGwdmk();
    // 停用岗位：根据停用状态 0：启用 1：停用
    @Update("UPDATE DATA_GWDMK SET QYDM=0 WHERE ID=#{id}")
    int endUsingGangWei(int id);
    // 启用岗位：根据停用状态 0：启用 1：停用
    @Update("UPDATE DATA_GWDMK SET QYDM=1 WHERE ID=#{id}")
    int startUsingGangWei(int id);
    // 更新岗位信息
    int updateGangWei(DataGwdmk dataGwdmk);
    // 添加岗位信息
    int addGangWei(DataGwdmk dataGwdmk);
    // 根据岗位启用代码模糊查询
    @Select("SELECT * FROM DATA_GWDMK WHERE QYDM = #{isQy}")
    List<DataGwdmk> getAllGwdmkByQydm(Integer isQy);

    // 根据发布者用户名获取其发布的所有岗位
    @Select("SELECT * FROM DATA_GWDMK WHERE FBZ = #{fbzyhm}")
    List<DataGwdmk> getAllgwByFbzYhm(String fbzyhm);
}
