package org.sems.sems.service;

import java.util.Map;

// 班级服务接口
public interface BjdmkService {

    /*获取所有班级信息
     * @return 班级信息
     * @throws Exception
     */
    Map<String, Object> getAllBjdmkInfo();

    Map<String, Object> getAllClass();

    /**
     *
     * 获取未对应指定教师的班级信息
     * @param jsid 教师id
     * @return 班级信息
     * @throws Exception
     * */
    Map<String, Object> getNoTeacherBjdmkInfo(int jsid);
}
