package org.sems.sems.service.impl;


import org.sems.sems.Mapper.DWGMKMapper;
import org.sems.sems.service.DwgmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 单位规模库(Dwgmk)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
@Service("dwgmkService")
public class DwgmkServiceImpl implements DwgmkService {
    @Autowired
    private DWGMKMapper  dwgmkMapper;

    /**
     * 获取所有单位规模库数据
     * @return
     */
    @Override
    public Map<String, Object> getAllDwgmk() {
       Map<String, Object> result = new HashMap<>();
       try {
           // TODO: 获取单位规模库数据
           result.put("code", 200);
           result.put("msg", "success");
           result.put("data", dwgmkMapper.getAllDwgmk());
           result.put("result", true);
       } catch (Exception e) {
           result.put("code", 500);
           result.put("msg", e.getMessage());
           result.put("data", null);
           result.put("result", false);
           e.printStackTrace();
       }
       return result;
    }

    /**
     * 通过ID删除单位规模库数据
     * @param GMDM
     * @return
     */
    @Override
    public Map<String, Object> deleteDwgmkByID(int GMDM) {
         Map<String, Object> result = new HashMap<>();
         try {
             if (dwgmkMapper.deleteDwgmkByID(GMDM) !=0){
                 // TODO: 删除单位规模库数据
                 result.put("code", 200);
                 result.put("msg", "success");
                 result.put("data", dwgmkMapper.deleteDwgmkByID(GMDM));
                 result.put("result", true);
             }else{
                 result.put("code", 503);// 数据库删除错误
                 result.put("msg", "删除失败");
                 result.put("data", null);
                 result.put("result", false);
             }
         } catch (Exception e) {
             result.put("code", 500);
             result.put("msg", e.getMessage());
             result.put("data", null);
         }
         return result;
    }

    /**
     * 新增单位规模库数据
     * @param GMXQ
     * @return
     */
    @Override
    public Map<String, Object> AddDWXK(String GMXQ) {
          Map<String, Object> result = new HashMap<>();
          try {
              if (dwgmkMapper.AddDWXK(GMXQ) !=0){
                  // TODO: 新增单位规模库数据
                  result.put("code", 200);
                  result.put("msg", "success");
                  result.put("data", null);
              }else{
                  result.put("code", 503);// 数据库新增错误
                  result.put("msg", "新增失败");
                  result.put("data", null);
                  result.put("result", false);
              }
          } catch (Exception e) {
              result.put("code", 500);
              result.put("msg", e.getMessage());
              result.put("data", null);
              result.put("result", false);
              e.printStackTrace();
          }
          return result;
    }
}
