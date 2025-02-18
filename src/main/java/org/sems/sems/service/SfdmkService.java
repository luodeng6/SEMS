package org.sems.sems.service;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.Sfdmk;

import java.util.List;
import java.util.Map;

/**
 * 省份代码库(Sfdmk)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
public interface SfdmkService {
    // 获取所有省份代码
    Map<String, Object> getAllSfdmk();

    // 删除指定省份代码
    Map<String, Object> deleteSfdmkBySFDM(int SFDM);

    // 新增省份代码
    Map<String, Object> AddSfdmk(Sfdmk sfdmk);

    // 更新省份代码
    Map<String, Object> updateSfdmk(Sfdmk sfdmk);
}
