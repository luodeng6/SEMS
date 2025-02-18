package org.sems.sems.service;

import org.sems.sems.entity.Dwyhk;

import java.util.Map;

public interface DwyhkService {

    /**
     * 获取所有单位用户信息
     * @return Map<String, Object>
     */
    Map<String, Object> getAllDwyhk();

    /**
     * 更新单位用户信息:停用标志
     * @param yhm 用户名
     * @param tybz 停用标志
     * @return Map<String, Object>
     */
    Map<String, Object> updateDwyhkTYBZ(String yhm, int tybz);

    /**
     * 新增单位用户信息
     * @return Map<String, Object>
     */
    Map<String, Object> addDwyhk(Dwyhk  dwyhk);

    /**
     * 更新单位用户信息
     * @param dwyhk 单位用户信息实体类
     * @return Map<String, Object>
     */
    Map<String, Object> updateDwyhk(Dwyhk dwyhk);

    /**
     * 根据位用户名 获取单位用户全部数据+单位信息+发布岗位数量
     * @param yhm 用户名
     * @return Map<String, Object>
     */
    Map<String, Object> getDwyhkAndDwDataAndPostCountByYhm(String yhm);
}
