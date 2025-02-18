package org.sems.sems.service;


import java.util.Map;

public interface JsbjdykService {

    //取消教师与班级管理
    Map<String, Object>  QuXiaoGuanLian(int JSID,int BJID);

    /**
     * 添加教师与班级管理
     * @param JSID 教师ID
     * @param BJID 班级ID
     * */
    Map<String, Object>  TianJiaGuanLian(int JSID,int BJID);

    /**
     * 根据班级ID获取责任教师信息
     * @param bjdm
     * @return
     */
    Map<String, Object> getTeacherByClassId(int bjdm);
}
