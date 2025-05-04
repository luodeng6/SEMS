package org.sems.sems.service;

import java.util.Map;

public interface XxdmkService {
    /**
     * 获取消息信息
     * @param yhm 用户名
     * @param yhsfdm 用户身份代码
     * @return Map<String, Object>
     */
    Map<String, Object> getXxdmk(String yhm, int yhsfdm);
    /**
     * 设置已读
     * @param yhm 用户名
     * @param yhsfdm 用户身份代码
     * @return Map<String, Object>
     */
    Map<String, Object> setRead(String yhm, int yhsfdm);
}
