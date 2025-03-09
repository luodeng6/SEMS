package org.sems.sems.service.impl;

import org.sems.sems.entity.Msdmk;
import org.sems.sems.service.MsdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.*;
import org.sems.sems.Mapper.MsdmkMapper;

@Service
public class MsdmkServiceImpl implements MsdmkService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private MsdmkMapper msdmkMapper;

    /**
     * 获取待面试列表
     *
     * @param yhm 用户名
     * @return 待审批的APM列表
     */
    @Override
    public Map<String, Object> getWaitApms(String yhm) {

        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_getWaitAddMS(?)}", yhm);
            resultMap.put("data", resultList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
            return resultMap;
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
     * 获取所有面试列表 通过发布者用户名
     *
     * @return 所有面试列表
     */
    @Override
    public Map<String, Object> getAllInterviews(String yhm, int yhsfdm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取所有面试列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_getMsData(?,?)}", yhsfdm, yhm
            );
            System.out.println("获取的面试列表：");
            System.out.println(resultList);
            resultMap.put("data", resultList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
            return resultMap;
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
     * 发布面试
     *
     * @param msdmk 面试信息
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> addInterview(Msdmk msdmk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {

            // 处理发布面试逻辑
            if (msdmkMapper.addMsdmk(msdmk) > 0) {
                // 发布成功后，更新TDJLK ISMS (是否已经安排面试)状态
                if(msdmkMapper.updateTdjlkIsms(msdmk.getXsdm(), msdmk.getGwdm()) > 0){
                    resultMap.put("code", 200);
                    resultMap.put("msg", "all success");
                    resultMap.put("result", true);
                }else{
                    resultMap.put("code", 504);
                    resultMap.put("msg", "database error, update TDJLK ISMS failed");
                    resultMap.put("result", false);
                }
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "database error, add MSDMK failed");
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
     * 删除草稿面试
     *
     * @param msdm 面试ID
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> deletemsdmk(int msdm) {
       Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理删除草稿面试逻辑
            if (msdmkMapper.deleteMsdmk(msdm) > 0) {
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

    /**
     * 更新面试信息
     *
     * @param msdmk 面试信息
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> updateInterview(Msdmk msdmk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理更新面试信息逻辑
            if (msdmkMapper.updateMsdmk(msdmk) > 0) {
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

    /**
     * 学生获取待确认面试列表
     *
     * @param yhm 用户名
     * @return 待确认的APM列表
     */
    @Override
    public Map<String, Object> getWaitConfirmApms(String yhm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取待确认面试列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_StuGetWaitMsData(?)}", yhm);
            resultMap.put("data", resultList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
        }catch (Exception e){
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 确认面试
     *
     * @param msdmk 面试信息
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> confirmInterview(Msdmk msdmk) {
        Map<String, Object> resultMap = new HashMap<>();
        try{
            if (msdmkMapper.updateMsdmk(msdmk) > 0){
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
            }else{
                resultMap.put("code", 504);
                resultMap.put("msg", "database error");
                resultMap.put("result", false);
            }
        }catch (Exception e){
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 拒绝面试
     *
     * @param msdmk 面试信息
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> refuseInterview(Msdmk msdmk) {
        Map<String, Object> resultMap = new HashMap<>();
        try{
            if (msdmkMapper.updateMsdmk(msdmk) > 0){
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
            }else{
                resultMap.put("code", 504);
                resultMap.put("msg", "database error");
                resultMap.put("result", false);
            }
        }catch (Exception e){
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 获取面试数据：单位、学生都可以用
     *
     * @param type 获取方式
     * @param yhm  用户名
     * @return Map<String, Object> 面试数据
     */
    @Override
    public Map<String, Object> getInterviewsMainIdea(int type, String yhm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取面试数据逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetMsData_StuAndDw(?,?)}", type, yhm);
            resultMap.put("data", resultList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
        }catch (Exception e){
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 开始面试
     *
     * @param msdm 面试ID
     * @return Map<String, Object> 结果
     */
    @Override
    public Map<String, Object> startInterview(int msdm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理开始面试逻辑
            if (msdmkMapper.startMsdmk(msdm) > 0) {
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
