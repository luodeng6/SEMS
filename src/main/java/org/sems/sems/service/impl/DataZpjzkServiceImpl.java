package org.sems.sems.service.impl;

import org.sems.sems.Mapper.DataZpjzkMapper;
import org.sems.sems.entity.DataZpjzk;
import org.sems.sems.service.DataZpjzkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DataZpjzkServiceImpl implements DataZpjzkService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private DataZpjzkMapper dataZpjzkMapper;
    /**
     * 获取招聘会数据
     *
     * @param qydm 启用代码
     * @return 招聘会数据
     */

    public Map<String, Object> getDataZpjzk(int qydm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetZphData(?,?,?,?)}", qydm);
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