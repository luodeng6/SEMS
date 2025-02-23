package org.sems.sems.service;

import org.sems.sems.entity.Msdmk;

import java.util.Map;

// 面试代码库
public interface MsdmkService {
    /**
     * 获取待面试列表
     * @param yhm 用户名
     * @return 待审批的APM列表
     */
    Map<String, Object> getWaitApms(String yhm);
    /**
     * 获取所有面试列表 通过发布者用户名
     * @return 所有面试列表
     */
    Map<String, Object> getAllInterviews(String yhm,int yhsfdm);

    /**
     * 发布面试
     * @param msdmk 面试信息
     * @return Map<String, Object>
     */
    Map<String, Object> addInterview(Msdmk msdmk);
    /**
     * 删除草稿面试
     * @param msdm 面试ID
     * @return Map<String, Object>
     */
    Map<String, Object> deletemsdmk(int msdm);
    /**
     * 更新面试信息
     * @param msdmk 面试信息
     * @return Map<String, Object>
     */
    Map<String, Object> updateInterview(Msdmk msdmk);
}
