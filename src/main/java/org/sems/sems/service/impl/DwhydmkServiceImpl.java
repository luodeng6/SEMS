package org.sems.sems.service.impl;


import org.sems.sems.Mapper.DWHYDMKMapper;
import org.sems.sems.entity.Dwhydmk;
import org.sems.sems.entity.Dwxzk;
import org.sems.sems.service.DwhydmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 单位行业代码库(Dwhydmk)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
@Service("dwhydmkService")
public class DwhydmkServiceImpl implements DwhydmkService {
    @Autowired
    private DWHYDMKMapper dwhydmkMapper;


    /**
     * 获取所有单位行业代码库(Dwhydmk)数据
     *
     * @return
     */
    @Override
    public Map<String, Object> getAllDwhydmk() {
        Map<String, Object> result = new HashMap<>();
        try {
            // TODO: 获取所有单位行业代码库(Dwhydmk)数据
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dwhydmkMapper.getAllDwhydmk());
            result.put("result", true);

        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "error");
            result.put("data", e.getMessage());
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }


    /**
     * 添加单位行业代码库(Dwhydmk)数据
     *
     * @param dwhydmk 单位行业代码库
     * @return
     */
    @Override
    public Map<String, Object> AddDWHYDMK(Dwhydmk dwhydmk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (dwhydmkMapper.AddDWHYDMK(dwhydmk) != 0) {
                // TODO: 添加单位行业代码库(Dwhydmk)数据
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
            e.printStackTrace();
        }
        return result;

    }

    /**
     * 根据id删除单位行业代码
     *
     * @param hydm 单位行业代码
     * @return 删除结果
     */
    @Override
    public Map<String, Object> deleteDwhydmkById(int hydm) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (dwhydmkMapper.deleteDwgmkByID(hydm) != 0) {
                // TODO: 根据id删除单位行业代码
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据id修改单位行业代码
     *
     * @param dwhydmk 单位行业代码实体类
     * @return 修改结果
     */
    @Override
    public Map<String, Object> EditDWHYDMKById(Dwhydmk dwhydmk) {
       Map<String, Object> result = new HashMap<>();
        try {
            if (dwhydmkMapper.updateDWHYDMKById(dwhydmk) != 0) {
                // TODO: 根据id修改单位行业代码
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }
}
