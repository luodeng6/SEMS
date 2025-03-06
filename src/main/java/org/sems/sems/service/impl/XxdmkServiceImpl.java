package org.sems.sems.service.impl;

import org.sems.sems.service.XxdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class XxdmkServiceImpl implements XxdmkService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    /**
     * 获取消息信息
     *
     * @param yhm    用户名
     * @param yhsfdm 用户身份代码
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getXxdmk(String yhm, int yhsfdm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取消息信息
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_getXxdmkData(?,?)}", yhsfdm, yhm);
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
