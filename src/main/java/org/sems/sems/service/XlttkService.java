package org.sems.sems.service;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Xlttk;

import java.util.List;
import java.util.Map;

/**
 * (Xlttk)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:29
 */
public interface XlttkService {

    // 获取所有学历信息
    Map<String, Object> getAllXlttk();
    // 删除学历信息通过id
    Map<String, Object> deleteXlttkByID(@Param("id") int id);

    //新增学历信息
    Map<String, Object> insertXlttk(Xlttk xlttk);


}
