package org.sems.sems.service.impl;

import org.sems.sems.Mapper.TdjlkMapper;
import org.sems.sems.entity.Tdjlk;
import org.sems.sems.service.TdjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TdjlkServiceImpl implements TdjlkService {
    @Autowired
    private TdjlkMapper tdjlkMapper;

    /**
     * 投递简历
     *
     * @param tdjlk 投递简历实体类
     * @return Map<String, Object> 返回结果
     */
    @Override
    public Map<String, Object> tdJl(Tdjlk tdjlk) {
        Map<String, Object> result = new HashMap<>();
        try {

            // 检查是否已经投递过该岗位简历
            Map<String, Object> checkResult = checkTdjlk(tdjlk);
            if (!checkResult.get("result").equals(true)) {
                // 用户未投递过该岗位简历
                System.out.println("用户未投递过该岗位简历！");
                // 处理投递简历逻辑
                if (tdjlkMapper.addNewTdjlk(tdjlk) > 0) {
                    result.put("code", 200);
                    result.put("msg", "success");
                    result.put("data", tdjlk);
                    result.put("result", true);
                } else {
                    result.put("code", 504);
                    result.put("msg", "database error");
                    result.put("data", "添加失败");
                    result.put("result", false);
                }
            } else if (checkResult.get("isError").equals(false)) {
                // 用户已经投递过该岗位简历
                // 处理重复投递逻辑
                System.out.println("用户已经投递过该岗位简历！");
                result.put("code", 200);
                result.put("data", "success");
                result.put("msg", checkResult.get("msg"));
                result.put("result", false);
            } else {
                System.out.println("数据库错误！");
                // 数据库错误
                result.put("code", 504);
                result.put("msg", "server error:10001");
                result.put("data", "添加失败");
                result.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error:10002");
            result.put("data", e.getMessage());
            result.put("result", false);
        }
        return result;
    }

    private Map<String, Object> checkTdjlk(Tdjlk tdjlk) {
        Map<String, Object> result = new HashMap<>();
        // 处理检查是否已经投递过该岗位简历逻辑
        try {
            if (tdjlkMapper.getTdjlkByStuidAndGwdm(tdjlk.getStuid(), tdjlk.getGwdm()) != null) {
                result.put("code", 200);
                result.put("msg", "已投递过该岗位简历！");
                result.put("result", true);
                result.put("isError", false);
            } else {
                result.put("code", 200);
                result.put("msg", "未投递过该岗位简历！");
                result.put("result", false);
                result.put("isError", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
            result.put("isError", true);
        }
        return result;
    }


    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 获取投递简历列表
     *
     * @param style 获取方式
     * @param yhm   用户名
     * @param gwdm  岗位代码
     * @return Map<String, Object> 返回结果
     */
    @Override
    public Map<String, Object> getTdjlk(int style, String yhm, int gwdm) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> tdjlkList = new ArrayList<>();
            tdjlkList = jdbcTemplate.queryForList(
                    "{call usp_GetTdjlk(?, ?, ?)}", style, yhm, gwdm);
            System.out.println("执行获取投递简历列表的存储过程成功");
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", tdjlkList);
            result.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
        }
        return result;
    }

    /**
     * 根据id获取投递记录
     *
     * @param id 投递记录id
     * @return Map<String, Object> 返回结果
     */
    @Override
    public Map<String, Object> getTdjlkById(int id) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 处理根据id获取投递记录逻辑
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", tdjlkMapper.getTdjlkByID(id));
            result.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
        }
        return result;
    }


    /**
     * 取消/继续使用 投递简历
     *
     * @param id   投递记录id
     * @param qyzt 投递状态 1:继续使用 0:取消使用
     * @return Map<String, Object> 返回结果
     */
    @Override
    public Map<String, Object> UpdateTdjlkQyztById(int id, int qyzt) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 处理取消/继续使用 投递简历逻辑
            if (tdjlkMapper.updateQyztById(id, qyzt) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", "更新成功");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", "更新失败");
                result.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
        }
        return result;
    }

    /**
     * 单位确认收到投递记录
     *
     * @param id 投递记录id
     * @return Map<String, Object> 返回结果
     */
    @Override
    public Map<String, Object> dwqr(int id) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 处理单位确认收到投递记录逻辑
            if (tdjlkMapper.updateQrdmById(id) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
        }
        return result;
    }

    /**
     * 删除投递记录
     *
     * @param id 投递记录id
     * @return Map<String, Object> 返回结果
     * @throws Exception 投递记录不存在异常
     */
    @Override
    public Map<String, Object> deleteTdjlkById(int id) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 处理删除投递记录逻辑
            if (tdjlkMapper.deleteTdjlkById(id) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
        }
        return result;
    }

    /**
     * 单位确认回应投递记录
     *
     * @param id   投递记录id , hynr 回应内容, dwyh 单位用户, hyjg 回应结果 ： 0 不录用，2 安排面试  3 录用 4 待定
     * @param hynr
     * @param dwyh
     * @param hyjg
     * @return Map<String, Object> 返回结果
     */
    @Override
    public Map<String, Object> huiying(int id, String hynr, String dwyh, int hyjg) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 处理单位确认回应投递记录逻辑
            if (tdjlkMapper.HyTdjlkById(id, hynr, dwyh, hyjg) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", e.getMessage());
            result.put("result", false);
        }
            return result;
    }
}
