package org.sems.sems.service.impl;

import org.sems.sems.Mapper.JsbjdykMapper;
import org.sems.sems.Mapper.JsdmkMapper;
import org.sems.sems.entity.Bjdmk;
import org.sems.sems.entity.Jsbjdyk;
import org.sems.sems.entity.Jsdmk;
import org.sems.sems.service.JsdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JsdmkServiceImpl implements JsdmkService {

    @Autowired
    private JsdmkMapper jsdmkMapper;

    @Autowired
    private JsbjdykMapper jsbjdykMapper;


    /**
     * 获取所有未停用的教师数据
     * @return
     */

    public Map<String, Object> getAllJsdmkData() {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("data", jsdmkMapper.getAllJsdmk()); // 将教师数据（包含班级信息）放入结果中
            // 设置成功的返回信息
            result.put("result", true);
            result.put("msg", "success");
            result.put("code", 200);
        } catch (Exception e) {

            e.printStackTrace();
            result.put("result", false);
            result.put("msg", "error");
            result.put("code", 500);
        }
        return result;
    }

    /**
     * @param jsid
     * @return
     */
    @Override
    public Map<String, Object> stopTeacher(int jsid) {
      Map<String, Object> result = new HashMap<>();
      try{
          if(jsdmkMapper.TingyongJsdmk(jsid)!=0){
              result.put("result", true);
              result.put("msg", "success");
              result.put("code", 200);
          }else {

              result.put("result", true);
              result.put("msg", "database error");
              result.put("code", 403);
          }
      }catch (Exception e){
          e.printStackTrace();
          result.put("result", false);
          result.put("msg", "server error");
          result.put("code", 500);
      }
      return result;
    }

    /**
     * 新增教师
     *
     * @param jsdmk
     */
    @Override
    public Map<String, Object> AddTeacher(Jsdmk jsdmk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (jsdmkMapper.AddTeacher(jsdmk)!= 0) {
                result.put("result", true);
                result.put("msg", "success");
                result.put("code", 200);
                result.put("data", jsdmk);
            } else {
                result.put("result", false);
                result.put("msg", "database error");
                result.put("code", 403);
                result.put("data", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("msg", "server error");
            result.put("code", 500);
            result.put("data", null);
        }
        return result;
    }

    /**
     * 新增教师--智能
     *
     * @param jsdmk 教师信息
     * @return 结果
     */
    @Override
    public Map<String, Object> AddJsdmkDataZhineng(Jsdmk jsdmk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (jsdmkMapper.AddJsdmkDataZhineng(jsdmk)!= 0) {
                result.put("result", true);
                result.put("msg", "success");
                result.put("code", 200);
                result.put("data", jsdmk);
            } else {
                result.put("result", false);
                result.put("msg", "database error");
                result.put("code", 403);
                result.put("data", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("msg", "server error");
            result.put("code", 500);
            result.put("data", null);
        }
        return result;
    }

    /**
     * 编辑教师 --智能动态
     *
     * @param jsdmk 教师信息
     * @return Map<String, Object> 结果
     */
    @Override
    public Map<String, Object> updateJsdmkData(Jsdmk jsdmk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (jsdmkMapper.UpdateTeacher(jsdmk)!= 0) { // 更新教师信息
                result.put("result", true);
                result.put("msg", "success");
                result.put("code", 200);
                result.put("data", jsdmk);
            } else {
                result.put("result", false);
                result.put("msg", "database error");
                result.put("code", 403);
                result.put("data", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("msg", "server error");
            result.put("code", 500);
            result.put("data", null);
        }
        return result;
    }

}
