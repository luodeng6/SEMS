package org.sems.sems.service.impl;

import org.sems.sems.Mapper.XscjdkMapper;
import org.sems.sems.entity.Xscjdk;
import org.sems.sems.service.XscjdkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class XscjdkServiceImpl implements XscjdkService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private XscjdkMapper xscjdkMapper;

    /**
     * 获取XSCJDK数据：通过存储过程.
     *
     * @param QYDM
     * @param YHSFDM
     * @param YHM
     * @param STUID
     * @return Map<String, String>
     */
    @Override
    public Map<String, Object> getXscjdk(int QYDM, int YHSFDM, String YHM, int STUID) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_getXscjdK(?,?,?,?)}", QYDM, YHSFDM, YHM, STUID);
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
     * 插入XSCJDK数据
     *
     * @param xscjdk Xscjdk
     * @return Map<String, String>
     * key: success: 插入成功；error: 插入失败；exist: 已存在该条数据。
     */
    @Override
    public Map<String, Object> insertXscjdk(Xscjdk xscjdk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  添加工作经历数据
            if (xscjdkMapper.insertXscjdk(xscjdk) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data",xscjdk);
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
     * 更新XSCJDK数据
     *
     * @param xscjdk Xscjdk
     * @return Map<String, String>
     */
    @Override
    public Map<String, Object> updateXscjdk(Xscjdk xscjdk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            if (xscjdkMapper.updateXscjdk(xscjdk) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
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
