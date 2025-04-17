package org.sems.sems.service.impl;

import org.sems.sems.Mapper.DataZphjlkMapper;
import org.sems.sems.entity.DataZphjlk;
import org.sems.sems.service.DataZphjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 招聘会记录库(DataZphjlk)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
@Service("dataZphjlkService")
public class DataZphjlkServiceImpl implements DataZphjlkService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private DataZphjlkMapper dataZphjlkMapper;
    /**
     * 获取招聘会记录库(DataZphjlk)表数据
     * @return 招聘会记录库(DataZphjlk)表数据
     */
    @Override
    public Map<String, Object> getDataZphjlk(int QYDM, int ISJUSTONE, int ZPHID, int ISJUSTONEYH, String YHM, int YHSFDM, int getBySHR, String SHR, int SHRSFDM) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetZphData(?,?,?,?,?,?,?,?,?)}", QYDM, ISJUSTONE, ZPHID, ISJUSTONEYH, YHM, YHSFDM, getBySHR, SHR, SHRSFDM);
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
     * 新增招聘会记录库(DataZphjlk)表数据
     *
     * @return
     */
    @Override
    public Map<String, Object> insertDataZphjlk(DataZphjlk dataZphjlk) {
        // TODO: 新增招聘会记录库(DataZphjlk)表数据
        Map<String, Object> result = new HashMap<>();
        try {
            if(dataZphjlkMapper.insertDataZphjlk(dataZphjlk) > 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", dataZphjlk);
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", dataZphjlk);
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
     * 修改招聘会记录库(DataZphjlk)表数据
     *
     * @param dataZphjlk 招聘会记录库(DataZphjlk)表数据
     * @return 修改结果
     * @throws Exception 异常
     */
    @Override
    public Map<String, Object> updateDataZphjlk(DataZphjlk dataZphjlk) {
        // TODO:  修改招聘会记录库(DataZphjlk)表数据
        Map<String, Object> result = new HashMap<>();
        try {
            if(dataZphjlkMapper.updateDataZphjlk(dataZphjlk) > 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", dataZphjlk);
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", dataZphjlk);
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
     * 删除招聘会记录库(DataZphjlk)表数据
     *
     * @param id 主键id
     * @return 删除结果
     * @throws Exception 异常
     */
    @Override
    public Map<String, Object> deleteDataZphjlk(int id) {
        // TODO:  删除招聘会记录库(DataZphjlk)表数据
        Map<String, Object> result = new HashMap<>();
        try {
            if(dataZphjlkMapper.deleteDataZphjlk(id) > 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", id);
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", id);
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


}
