package org.sems.sems.service.impl;

import org.sems.sems.Mapper.GzjlkMapper;
import org.sems.sems.Mapper.GzjlsxkMapper;
import org.sems.sems.Public.PublicService;
import org.sems.sems.entity.Gzjlk;
import org.sems.sems.entity.Gzjlsxk;
import org.sems.sems.service.GzjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GzjlkServiceImpl implements GzjlkService {

    @Autowired
    private GzjlkMapper gzjlkMapper;

    @Autowired
    private PublicService publicService;
    /**
     * 获取所有工作经历列表
     *
     * @param YHM
     * @return
     */
    @Override
    public Map<String, Object> getAllGzjlk(String YHM) {


        Map<String, Object> result = new HashMap<>();
        // TODO: 实现msfpk信息的获取
        try {
            Map<String, Object> DataAll = new HashMap<>();
            List<List<Map<String, Object>>> resultData = publicService.getDataFromCCGC(
                    "{call usp_GetStuGzjlData(?)}",
                    YHM
            );
            System.out.println(resultData);
            DataAll.put("gzjlk",resultData.get(0));
            DataAll.put("gzjlsxk", resultData.get(1));

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

    /**
     * 添加工作经历
     *
     * @param gzjlk 工作经历实体
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> addGzjlk(Gzjlk gzjlk) {
      Map<String, Object> resultMap = new HashMap<>();
      try {
          //  添加工作经历数据
          if (gzjlkMapper.insertGZJLK(gzjlk)>0) {
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
     * 更新工作经历
     *
     * @param gzjlk 工作经历实体
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> updateGzjlk(Gzjlk gzjlk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  添加工作经历数据
            if (gzjlkMapper.updateGZJLK(gzjlk)>0) {
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
     * 删除工作经历
     *
     * @param id 工作经历id
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> deleteGzjlk(Integer id) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  添加工作经历数据
            if (gzjlkMapper.deleteGZJLK(id)>0) {
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

    @Autowired
    private GzjlsxkMapper gzjlsxkMapper;
    /**
     * 新增工作经历事项库
     *
     * @param gzjlsxk
     * @return
     */
    @Override
    public Map<String, Object> addGzjlsxK(Gzjlsxk gzjlsxk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  添加工作经历数据
            if (gzjlsxkMapper.insertGzjlsxk(gzjlsxk)>0) {
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
     * 删除工作经历事项库
     *
     * @param id
     * @return
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> deleteGzjlsxK(Integer id) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            //  删除工作经历数据
            if (gzjlsxkMapper.deleteGzjlsxK(id)>0) {
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
