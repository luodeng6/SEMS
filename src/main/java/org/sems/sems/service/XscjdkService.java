package org.sems.sems.service;

import org.sems.sems.entity.Xscjdk;

import java.util.Map;

public interface XscjdkService {

    /**
     * 获取XSCJDK数据：通过存储过程.
     * @return Map<String, String>
     */
     Map<String, Object> getXscjdk(int QYDM,int YHSFDM,String YHM,int STUID) ;
    /**
     * 插入XSCJDK数据
     * @param xscjdk Xscjdk
     * @return Map<String, String>
     *         key: success: 插入成功；error: 插入失败；exist: 已存在该条数据。
     */
    Map<String, Object> insertXscjdk(Xscjdk xscjdk);
    /**
     * 更新XSCJDK数据
     * @param xscjdk Xscjdk
     * @return Map<String, String>
     *
     */
    Map<String, Object> updateXscjdk(Xscjdk xscjdk);
}
