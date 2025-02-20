package org.sems.sems.service.impl;

import org.sems.sems.service.MsdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MsdmkServiceImpl implements MsdmkService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 获取待面试列表
     *
     * @param yhm 用户名
     * @return 待审批的APM列表
     */
    @Override
    public Map<String, Object> getWaitApms(String yhm) {

        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_getWaitAddMS(?)}", yhm);
            resultMap.put("data", resultList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
            return resultMap;
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 获取所有面试列表 通过发布者用户名
     *
     * @return 所有面试列表
     */
    @Override
    public Map<String, Object> getAllInterviews(String yhm,int yhsfdm) {
       Map<String, Object> resultMap = new HashMap<>();
       try {
           // 处理获取所有面试列表逻辑
           List<Map<String, Object>> resultList = new ArrayList<>();
           resultList = jdbcTemplate.queryForList(
                   "{call usp_getMsData(?,?)}", yhsfdm, yhm
           );
           resultMap.put("data", resultList);
           resultMap.put("code", 200);
           resultMap.put("msg", "success");
           resultMap.put("result", true);
           return resultMap;
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
