package org.sems.sems.service.impl;

import org.sems.sems.Mapper.XsjlkMapper;
import org.sems.sems.service.XsjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class XsjlkServiceImpl implements XsjlkService {
    @Autowired
    private XsjlkMapper xsjlkMapper;
    @Autowired
    private JdbcTemplate jdbcTemplate;


    /**
     * 根据学生ID获取学生简历
     *
     * @param stuId 学生ID
     * @return Map<String, Object> 学生简历
     */
    @Override
    public Map<String, Object> getStuResumeByStuId(int stuId) {
        Map<String, Object> stuResume = new HashMap<>();
        try {
            stuResume.put("code", 200);
            stuResume.put("msg", "success");
            stuResume.put("data", xsjlkMapper.getXsjlkByStuId(stuId));
            stuResume.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            stuResume.put("code", 500);
            stuResume.put("msg", "server fail");
            stuResume.put("result", false);
            stuResume.put("data", e.getMessage());
        }
        return stuResume;
    }

    /**
     * 通过存储过程获取学生简历数据
     *
     * @param yhm  用户姓名
     * @param jldm 简历代码
     * @return Map<String, Object> 教师简历
     */
    @Override
    public Map<String, Object> getXsjlDataAuto(String yhm, int jldm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            List<Map<String, Object>> resultList;
            resultList = jdbcTemplate.queryForList(
                    "{call usp_getXsjlkData(?,?)}", yhm, jldm);
            resultMap.put("data", resultList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }
}
