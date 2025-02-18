package org.sems.sems.service.impl;


import org.sems.sems.Mapper.DataDwdmkMapper;
import org.sems.sems.Mapper.DataGwdmkMapper;
import org.sems.sems.entity.DataDwdmk;
import org.sems.sems.entity.DataGwdmk;
import org.sems.sems.service.DataDwdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * 单位代码库(DataDwdmk)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:31
 */
@Service("dataDwdmkService")
public class DataDwdmkServiceImpl implements DataDwdmkService {

    @Autowired
    private DataDwdmkMapper dataDwdmkMapper;
    @Autowired
    private DataGwdmkMapper dataGwdmkMapper;

    /**
     * 获取所有单位代码库(DataDwdmk)表数据
     */
    @Override
    public Map<String, Object> getAllDataDwdmk() {
        Map<String, Object> result = new HashMap<>();
        // TODO: 获取所有单位代码库(DataDwdmk)表数据
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dataDwdmkMapper.getAllDataDwdmk());
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 停用单位代码库(DataDwdmk)表数据
     *
     * @param DWDM
     */
    @Override
    public Map<String, Object> disableDataDwdmk(int DWDM) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 停用单位代码库(DataDwdmk)表数据
        try {
            if (dataDwdmkMapper.tinyongDataDwdmk(DWDM) != 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 405);
                result.put("msg", "database error");
                result.put("result", false);
                result.put("error", "停用失败");
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取单位发布的所有岗位
     *
     * @param DWDM
     */
    @Override
    public Map<String, Object> getDwGangWei(int DWDM) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 获取单位发布的所有岗位
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dataGwdmkMapper.getALlGwByDwdm(DWDM));
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 更新单位基本信息
     * @param dataDwdm
     * @return
     */
    @Override
    public Map<String, Object> updateDataDwdmk(DataDwdmk dataDwdm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 更新单位基本信息
        try {
            if (dataDwdmkMapper.updateDataDwdmk(dataDwdm) != 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 405);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }

    /**
     * 新增单位基础信息
     *
     * @param dataDwdm
     */
    @Override
    public Map<String, Object> addDataDwdmk(DataDwdmk dataDwdm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 新增单位基础信息
        try {
            if (dataDwdmkMapper.AddDataDwdmk(dataDwdm) != 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", dataDwdm);
                result.put("result", true);
            } else {
                result.put("code", 405);
                result.put("data", dataDwdm);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }

    /**
     * 根据单位用户的用户名获取单位信息
     *
     * @param dwUserName
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getDwDataByDwUserName(String dwUserName) {
       Map<String, Object> result = new HashMap<>();
        // TODO: 根据单位用户的用户名获取单位信息
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dataDwdmkMapper.getDwDataByDwUserName(dwUserName));
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据单位启用状态 获取单位信息
     *
     * @param qydm 启用代码
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getDwByQydm(int qydm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 根据单位启用状态 获取单位信息
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dataDwdmkMapper.getAllDwDataByQydm(qydm));
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
}
