package org.sems.sems.service.impl;

import org.sems.sems.Mapper.XtggkMapper;
import org.sems.sems.entity.Xtggk;
import org.sems.sems.service.XtggkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class XtggkServiceImpl implements XtggkService {

    @Autowired
    private XtggkMapper xtggkMapper;

    /**
     * 插入系统公告
     *
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> insertXtggk(Xtggk xtggk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if(xtggkMapper.insertXtggk(xtggk) > 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", xtggk);
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", xtggk);
                result.put("result", false);
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }
    /**
     * 更新系统公告
     *
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> updateXtggk(Xtggk xtggk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if(xtggkMapper.updateXTGGK(xtggk) > 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", xtggk);
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", xtggk);
                result.put("result", false);
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", xtggk);
            result.put("result", false);
        }
        return result;
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 获取系统公告
     *
     * @param    QYDM,   JUSTONE,   GGID
     * @return
     * @throws Exception 异常
     */
    @Override
    public Map<String, Object> getXtggk(Integer QYDM, Integer JUSTONE, Integer GGID) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            /*
                 @QYDM int ,--1 只获取启用的，0 只获取不启用的 ，-1获取全部
                 @JUSTONE int, -- 1 只获取一条，0 获取多一条
                 @GGID int  -- 公告ID，当@JUSTONE为1时才会用到
            * */
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_AllUserGetXtgg(?,?,?)}", QYDM, JUSTONE, GGID);
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
