package org.sems.sems.service.impl;

import org.sems.sems.Mapper.DhjlkMapper;
import org.sems.sems.entity.Dhjlk;
import org.sems.sems.service.SstXService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SstXServiceImpl implements SstXService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private DhjlkMapper dhjlkMapper;


    /**
     * 获取对话记录
     *
     * @param yhm      用户名
     * @param yhsfdm   用户身份代码
     * @param lyyhsfdm 另一用户身份代码
     * @param lyyhm    另一用户名
     * @return 返回结果
     */
    @Override
    public Map<String, Object> getDhjl(String yhm, int yhsfdm, int lyyhsfdm, String lyyhm) {
        Map<String, Object> resultMap = new HashMap<>();
      /*  @YHM nvarchar(50),-- 当前用户
        @YHSFDM INT ,--当前用户身份代码
        @LYYHM nvarchar(50),-- 另一用户名
        @LYYHSFDM int-- 另一用户身份代码*/
        try {
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetDhjl(?,?,?,?)}", yhm, yhsfdm, lyyhm, lyyhsfdm);
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
     * 获取对话记录列表
     *
     * @param yhm    用户名
     * @param yhsfdm 用户身份代码
     * @return 返回结果
     */
    @Override
    public Map<String, Object> getDhjlList(String yhm, int yhsfdm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
            resultMap.put("data",dhjlkMapper.getDhjlList(yhm,yhsfdm));
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
     * 新增联系人：初始化聊天记录
     * @param dhjlk 联系人信息
     * @return 返回结果
     */
    @Override
    public Map<String, Object> addNewlxr(Dhjlk dhjlk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            if (dhjlkMapper.insertDhjlk(dhjlk) > 0){
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data", dhjlk);
            }else{
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
