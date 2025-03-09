package org.sems.sems.service.impl;

import org.sems.sems.Mapper.FpwtbqkMapper;
import org.sems.sems.Mapper.MsfpkMapper;
import org.sems.sems.Mapper.MsfpwtkMapper;
import org.sems.sems.Public.PublicService;
import org.sems.sems.entity.Fpwtbqk;
import org.sems.sems.entity.Msfpk;
import org.sems.sems.entity.Msfpwtk;
import org.sems.sems.service.MsfpkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MsfpkServiceImpl implements MsfpkService {

    @Autowired
    private MsfpkMapper msfpkMapper;
    @Autowired
    private MsfpwtkMapper msfpwtkMapper;
    @Autowired
    private FpwtbqkMapper fpwtbqkMapper;
    @Autowired
    private PublicService publicService;

    /**
     * 添加msfpk信息
     *
     * @param msfpk
     * @return map
     */
    @Override
    public Map<String, Object> addMsfpk(Msfpk msfpk) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 实现msfpk信息的添加
        try {
            if (msfpkMapper.insertMsfpk(msfpk) > 0) {
                result.put("code", 200);
                result.put("msg", "添加成功");
                result.put("data", msfpk);
                result.put("fpdm", msfpk.getId());
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
                result.put("data", msfpk);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("data", msfpk);
        }
        return result;
    }

    /**
     * 添加面试复盘问题
     *
     * @param msfpwtk 面试复盘问题
     * @return map
     */
    @Override
    public Map<String, Object> addMsfpkQuestion(Msfpwtk msfpwtk) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 实现msfpk信息的添加
        try {
            if (msfpwtkMapper.insertMsfpwtk(msfpwtk) > 0) {
                result.put("code", 200);
                result.put("msg", "添加成功");
                result.put("data", msfpwtk);
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
                result.put("data", msfpwtk);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("data", msfpwtk);
        }
        return result;
    }

    /**
     * 添加面试复盘问题-标签
     *
     * @param fpwtbqk 面试复盘问题-标签
     * @return map
     */
    @Override
    public Map<String, Object> addMsfpkTag(Fpwtbqk fpwtbqk) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 实现msfpk信息的添加
        try {
            if (fpwtbqkMapper.insertFpwtbqk(fpwtbqk) > 0) {
                result.put("code", 200);
                result.put("msg", "添加成功");
                result.put("data", fpwtbqk);
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
                result.put("data", fpwtbqk);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("data", fpwtbqk);
        }
        return result;
    }

    /**
     * 获取msfpk列表
     *
     * @param yhm 用户名
     * @return map
     */
    @Override
    public Map<String, Object> getMsfpkList(String yhm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 实现msfpk信息的获取
        try {
            Map<String, Object> DataAll = new HashMap<>();
            List<List<Map<String, Object>>> resultData = publicService.getDataFromCCGC(
                    "{call usp_StuGet_MsfpDaTa(?)}",
                    yhm
            );
            System.out.println(resultData);
            DataAll.put("msfpk",resultData.get(0));
            DataAll.put("msfpwtk", resultData.get(1));
            DataAll.put("fpwtbqk", resultData.get(2));

            result.put("code", 200);
            result.put("msg", "获取成功");
            result.put("data", DataAll);
            result.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("data", null);
        }
        return result;
    }
}

