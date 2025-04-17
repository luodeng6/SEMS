package org.sems.sems.service;

import java.util.Map;

public interface XsjlkService {

    /**
     * 根据学生ID获取学生简历
     * @param stuId 学生ID
     * @return  Map<String, Object> 学生简历
     */
    Map<String, Object> getStuResumeByStuId(int stuId);
    /**
     * 通过存储过程获取学生简历数据
     * @param yhm 用户姓名
     * @param jldm 简历代码
     * @return  Map<String, Object> 教师简历
     */
    Map<String, Object> getXsjlDataAuto(String yhm, int jldm);
}
