package org.sems.sems.service;

import org.sems.sems.entity.Xtggk;

import java.util.Map;

public interface XtggkService {
    /**
     * 插入系统公告
     * @param xtggk 系统公告实体
     * @return
     * @throws Exception 异常
     */
    Map<String, Object> insertXtggk(Xtggk xtggk);
    /**
     * 更新系统公告
     * @param xtggk 系统公告实体
     * * @return
     * @throws Exception 异常
     */
    Map<String, Object> updateXtggk(Xtggk xtggk);
    /**
     * 获取系统公告
     * @param  QYDM 启用代码
     * @param  JUSTONE 单条数据
     * @param  GGID 公告ID
     * @return
     * @throws Exception 异常
     */
    Map<String, Object> getXtggk(Integer QYDM, Integer JUSTONE, Integer GGID);
}
