package org.sems.sems.service.impl;

import org.sems.sems.Mapper.DwyhkMapper;
import org.sems.sems.entity.Dwyhk;
import org.sems.sems.service.DwyhkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DwyhkServiceImpl implements DwyhkService {
    @Autowired
    private DwyhkMapper dwyhkMapper;

    /**
     * 获取所有单位用户信息
     *
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getAllDwyhk() {
        Map<String, Object> result = new HashMap<>();
        // TODO: 获取所有单位用户信息
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dwyhkMapper.selectAllDwyhk());
            result.put("result", true);

        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", null);
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 更新单位用户信息:停用标志
     *
     * @param yhm  用户名
     * @param tybz 停用标志
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> updateDwyhkTYBZ(String yhm, int tybz) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 更新单位用户信息:停用标志
        try {
            if (dwyhkMapper.updateDwyhkTYBZ(yhm, tybz) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database failed");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 新增单位用户信息
     *
     * @param dwyhk
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> addDwyhk(Dwyhk dwyhk) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 新增单位用户信息
        try {
            if (dwyhkMapper.addDwyhk(dwyhk) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database failed");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 更新单位用户信息
     *
     * @param dwyhk 单位用户信息实体类
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> updateDwyhk(Dwyhk dwyhk) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 更新单位用户信息
        try {
            if (dwyhkMapper.AdminUpdateDwyhkData(dwyhk) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database failed");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;


    /**
     * 根据位用户名 获取单位用户全部数据+单位信息+发布岗位数量
     *
     * @param yhm 用户名
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getDwyhkAndDwDataAndPostCountByYhm(String yhm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 根据位用户名 获取单位用户全部数据+单位信息+发布岗位数量
        try {
            List<Map<String, Object>> userList = jdbcTemplate.queryForList("{call usp_GetDwyhData(?)}", yhm);
            System.out.println("执行存储过程:单位用户数据接口成功！");
            if (userList.size() > 1) {
                result.put("code", 504);
                result.put("msg", "database get so many data!");
                result.put("data", userList);
                result.put("result", false);
            } else {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", userList.get(0));
                result.put("result", true);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", null);
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }


}
