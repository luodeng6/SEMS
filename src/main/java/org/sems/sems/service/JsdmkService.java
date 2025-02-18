package org.sems.sems.service;

import org.sems.sems.entity.Jsdmk;

import java.util.Map;

public interface JsdmkService {

    Map<String, Object> getAllJsdmkData();


    //停用教师
    Map<String, Object> stopTeacher(int jsid);

    /**
     * 新增教师
     *
     * */
    Map<String, Object> AddTeacher(Jsdmk jsdmk);

    /**
     * 新增教师--智能
     * @param jsdmk 教师信息
     * @return 结果
     * */
    Map<String, Object> AddJsdmkDataZhineng(Jsdmk jsdmk);

    /**
     * 编辑教师 --智能动态
     * @param jsdmk 教师信息
     * @return Map<String, Object> 结果
     * */
    Map<String, Object> updateJsdmkData(Jsdmk jsdmk);
}
