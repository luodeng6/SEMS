package org.sems.sems.service;

import java.util.Map;

public interface XsjlkService {

    /**
     * 根据学生ID获取学生简历
     * @param stuId 学生ID
     * @return  Map<String, Object> 学生简历
     */
    Map<String, Object> getStuResumeByStuId(int stuId);
}
