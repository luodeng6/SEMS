package org.sems.sems.service.impl;

import org.sems.sems.Mapper.TjdxkMapper;
import org.sems.sems.Mapper.TjgwkMapper;
import org.sems.sems.entity.Tjdxk;
import org.sems.sems.entity.Tjgwk;
import org.sems.sems.service.TjgwkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class TjgwkServiceImpl implements TjgwkService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private TjgwkMapper tjgwkMapper;
    /**
     * 获取推荐岗位信息
     * @param yhm    用户名
     * @param yhsfdm 用户身份代码
     * @return 推荐岗位信息
     */
    @Override
    public Map<String, Object> getTjgwk(String yhm, int yhsfdm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetTjGwData(?,?)}",yhm,yhsfdm);
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
    /**
     * 插入推荐岗位信息
     *
     * @param tjgwk 推荐岗位信息
     * @return 插入结果
     */
    @Override
    public Map<String, Object> insertTjgwk(Tjgwk tjgwk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  添加工作经历数据
            if (tjgwkMapper.insertNew(tjgwk) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data",tjgwk);
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "database error");
                resultMap.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    @Autowired
    private TjdxkMapper tjdxkMapper;
    /**
     * 插入推荐对象信息
     *
     * @param tjdxk 推荐对象信息
     * @return 插入结果
     */
    @Override
    public Map<String, Object> insertTjdxk(Tjdxk tjdxk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  添加工作经历数据
            if (tjdxkMapper.insertTjdxk(tjdxk) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data",tjdxk);
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "database error");
                resultMap.put("result", false);
            }
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
