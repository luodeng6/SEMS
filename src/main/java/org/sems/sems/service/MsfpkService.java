package org.sems.sems.service;

import org.sems.sems.entity.Fpwtbqk;
import org.sems.sems.entity.Msfpk;
import org.sems.sems.entity.Msfpwtk;

import java.util.Map;

public interface MsfpkService {
    /**
     * 添加msfpk信息
     * @param msfpk
     * @return map
     */
    Map<String, Object> addMsfpk(Msfpk msfpk);
    /**
     * 添加面试复盘问题
     * @param msfpwtk 面试复盘问题
     * @return map
     */
    Map<String, Object> addMsfpkQuestion(Msfpwtk msfpwtk);
    /**
     * 添加面试复盘问题-标签
     * @param fpwtbqk 面试复盘问题-标签
     * @return map
     */
    Map<String, Object> addMsfpkTag(Fpwtbqk fpwtbqk);
    /**
     * 获取msfpk列表
     * @param yhm 用户名
     * @return map
     */
    Map<String, Object> getMsfpkList(String yhm);
}
