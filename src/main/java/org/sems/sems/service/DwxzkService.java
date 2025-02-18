package org.sems.sems.service;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Dwxzk;

import java.util.List;
import java.util.Map;

/**
 * 单位性质库(Dwxzk)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
public interface DwxzkService {
    // 获取所有单位性质

    Map<String, Object>  getAllDWXK();

    // 删除指定单位性质

    Map<String, Object>  deleteDWXKById(int DWXZDM);

    // 新增单位性质

    Map<String, Object> AddDWXK(Dwxzk dwxzk);


}
