package org.sems.sems.service.impl;

import org.sems.sems.Mapper.JsbjdykMapper;
import org.sems.sems.service.JsbjdykService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class JsbjdykServiceImpl implements JsbjdykService {
    /**
     * 添加教师与班级管理
     *
     * @param JSID 教师ID
     * @param BJID 班级ID
     */
    @Override
    public Map<String, Object> TianJiaGuanLian(int JSID, int BJID) {
        Map<String, Object> result = new HashMap<>();
        try {
            //TODO 添加关联
            if (jsbjdykMapper.TianJiaJsbjdyk(JSID, BJID) != 0) {
                result.put("status", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("status", 404);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 1);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }

    /**
     * 根据班级ID获取责任教师信息
     *
     * @param bjdm
     * @return
     */
    @Override
    public Map<String, Object> getTeacherByClassId(int bjdm) {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("status", 200);
            // TODO 根据班级ID获取责任教师信息
            result.put("data", jsbjdykMapper.getJsdmkByBjdmk(bjdm));
            result.put("msg", "success");
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 1);
            result.put("msg", "server error");
            result.put("result", null);
        }
        return result;
    }

    @Autowired
    private JsbjdykMapper jsbjdykMapper;

    /**
     * 取消关联
     *
     * @param JSID
     * @param BJID
     * @return
     */
    @Override
    public Map<String, Object> QuXiaoGuanLian(int JSID, int BJID) {
        Map<String, Object> result = new HashMap<>();
        try {
            //TODO 取消关联
            if (jsbjdykMapper.CanslJsbjdyk(JSID, BJID) != 0) {
                result.put("status", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("status", 404);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 1);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }
}
