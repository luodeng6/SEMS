package org.sems.sems.service;

import java.util.Map;

public interface FldmkService {

    /**
     *
     * 获取所有福利数据
     * @return Map<String, Object>
     * */

    Map<String, Object> getAllFLData();

    /**
     * 福利和岗位对应
     *
     * @param fldm 福利代码
     * @param gwdm 岗位代码
     * @return 岗位分类库(Gwflk)表数据
     */
    Map<String, Object> gwfldy(int fldm, int gwdm);

    /**
     * 根据岗位代码获取福利信息
     *
     * @param gwdm 岗位代码
     * @return 福利信息
     */
    Map<String, Object> getGwflByGWDM(int gwdm);

    /**
     * 清除岗位对应的福利信息
     *  --- 每次修改岗位对应的福利时都要调用此接口
     * @param gwdm 岗位代码
     * @return 成功或失败信息
     */
    Map<String, Object> clearGwflByGWDM(int gwdm);
}
