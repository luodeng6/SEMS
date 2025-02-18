package org.sems.sems.service;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Dwhydmk;
import org.sems.sems.entity.Dwxzk;

import java.util.List;
import java.util.Map;

/**
 * 单位行业代码库(Dwhydmk)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
public interface DwhydmkService {

    // 获取所有单位行业代码
    Map<String, Object> getAllDwhydmk();


    // 新增单位行业
    Map<String, Object> AddDWHYDMK(Dwhydmk dwhydmk);

    /**
     * 根据id删除单位行业代码
     *
     * @param hydm 单位行业代码id
     * @return 删除结果
     */
    Map<String, Object> deleteDwhydmkById(int hydm);

    /**
     * 根据id修改单位行业代码
     *
     * @param dwhydmk 单位行业代码实体类
     * @return 修改结果
     */
    Map<String, Object> EditDWHYDMKById(Dwhydmk dwhydmk);
}
