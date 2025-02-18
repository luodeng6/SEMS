package org.sems.sems.service.impl;
import org.sems.sems.Mapper.SfdmkMapper;
import org.sems.sems.entity.Sfdmk;
import org.sems.sems.service.SfdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
/**
 * 省份代码库(Sfdmk)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
@Service("SfdmkService")
public class SfdmkServiceImpl implements SfdmkService {
    @Autowired
    private SfdmkMapper sfdmkMapper;

    /**
     * 获取省份代码库(Sfdmk)表所有数据
     *
     * @return
     */
    @Override
    public Map<String, Object> getAllSfdmk() {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("code", 200);
            result.put("data", sfdmkMapper.getAllSfdmk());
            result.put("result", true);
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("code", 500);
            result.put("data", e.getMessage());
            result.put("result", false);
            result.put("msg", "error");
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据省份代码(SFDM)获取省份代码库(Sfdmk)表数据
     *
     * @param SFDM
     * @return
     */
    @Override
    public Map<String, Object> deleteSfdmkBySFDM(int SFDM) {
        Map<String, Object> result = new HashMap<>();
        try {
            sfdmkMapper.deleteSfdmkBySFDM(SFDM);
            result.put("code", 200);
            result.put("data", "success");
            result.put("result", true);
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("code", 500);
            result.put("data", e.getMessage());
            result.put("result", false);
            result.put("msg", "error");
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 添加省份代码库(Sfdmk)表数据
     *
     * @param sfdmk
     * @return
     */
    @Override
    public Map<String, Object> AddSfdmk(Sfdmk sfdmk) {
        Map<String, Object> result = new HashMap<>();
        try {
            sfdmkMapper.AddSfdmk(sfdmk.getSfmc());
            result.put("code", 200);
            result.put("data", "success");
            result.put("result", true);
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("code", 500);
            result.put("data", e.getMessage());
            result.put("result", false);
            result.put("msg", "error");
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 修改更新省份代码库(Sfdmk)表数据
     * @param sfdmk
     * @return
     */
    @Override
    public Map<String, Object> updateSfdmk(Sfdmk sfdmk) {
        Map<String, Object> result = new HashMap<>();
        try {
            sfdmkMapper.updateSfdmkBySFDM(sfdmk);
            result.put("code", 200);
            result.put("data", "success");
            result.put("result", true);
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("code", 500);
            result.put("data", e.getMessage());
            result.put("result", false);
            result.put("msg", "error");
            e.printStackTrace();
        }
        return result;
    }
}
