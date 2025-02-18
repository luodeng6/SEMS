package org.sems.sems.service;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Dwxzk;

import java.util.List;
import java.util.Map;

/**
 * 单位规模库(Dwgmk)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
public interface DwgmkService {


    // 获取所有单位规模库
    Map<String, Object> getAllDwgmk();

    // 删除指定单位规模库
    Map<String, Object> deleteDwgmkByID(int GMDM);

    // 新增单位规模
    Map<String, Object> AddDWXK(String GMXQ);

}
