package org.sems.sems.service;

import java.util.Map;

// 实时通讯服务接口
public interface SstXService {


    /**
     * 获取对话记录
     *
     * @param yhm    用户名
     * @param yhsfdm 用户身份代码
     * @param lyyhsfdm 另一用户身份代码
     * @param lyyhm  另一用户名
     * @return 返回结果
     */
    Map<String, Object> getDhjl(String yhm, int yhsfdm, int lyyhsfdm, String lyyhm);
    /**
     * 获取对话记录列表
     * @param yhm    用户名
     * @param yhsfdm 用户身份代码
     * @return 返回结果
     */
    Map<String, Object> getDhjlList(String yhm,int yhsfdm);
}
