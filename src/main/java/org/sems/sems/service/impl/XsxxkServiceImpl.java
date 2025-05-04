package org.sems.sems.service.impl;

import org.sems.sems.Mapper.XscjdkMapper;
import org.sems.sems.Mapper.XsxxkMapper;
import org.sems.sems.entity.Xsxxk;
import org.sems.sems.service.XsxxkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class XsxxkServiceImpl implements XsxxkService {
    @Autowired
    private XsxxkMapper xsxxkMapper;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    /**
     * 获取学生信息
     * BYYHM int ,
     * YHM nvarchar(50),
     * STUID int
     *
     * @param BYYHM
     * @param YHM
     * @param STUID
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getXxxk(int BYYHM, String YHM, int STUID) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetXsxxk(?,?,?)}",BYYHM, YHM, STUID);
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
     * 插入学生信息
     *
     * @param xsxxk Xsxxk
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> insertXsxxk(Xsxxk xsxxk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  添加工作经历数据
            if (xsxxkMapper.insertXSXXK(xsxxk) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data",xsxxk);
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

    /**
     * 更新学生信息
     *
     * @param xsxxk Xsxxk
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> updateXsxxk(Xsxxk xsxxk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  添加工作经历数据
            if (xsxxkMapper.updateXSXXK(xsxxk) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data",xsxxk);
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
