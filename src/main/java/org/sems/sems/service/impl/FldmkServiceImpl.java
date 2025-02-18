package org.sems.sems.service.impl;

import org.sems.sems.Mapper.FldmkMapper;
import org.sems.sems.service.FldmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class FldmkServiceImpl implements FldmkService {
    @Autowired
    private FldmkMapper fldmkMapper;
    /**
     * 获取所有福利数据
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getAllFLData() {
      Map<String, Object> result = new HashMap<>();
      try{
          // 处理数据
          result.put("code", 200);
          result.put("msg", "success");
          result.put("data", fldmkMapper.getAllFldmk());
          result.put("result",true);
      }catch (Exception e){
          result.put("code", 500);
          result.put("msg", "error");
          result.put("data", e.getMessage());
          result.put("result",false);
          e.printStackTrace();
      }
      return result;
    }

    /**
     * 福利和岗位对应
     *
     * @param fldm 福利代码
     * @param gwdm 岗位代码
     * @return 岗位分类库(Gwflk)表数据
     */
    @Override
    public Map<String, Object> gwfldy(int fldm, int gwdm) {
        // TODO: 2025-01-22 实现福利和岗位对应
        Map<String, Object> result = new HashMap<>();
        try{
            if(fldmkMapper.gwfldy(fldm, gwdm)!= 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
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
     * 根据岗位代码获取福利信息
     *
     * @param gwdm 岗位代码
     * @return 福利信息
     */
    @Override
    public Map<String, Object> getGwflByGWDM(int gwdm) {
        // TODO: 2025-01-22 实现根据岗位代码获取福利信息
        Map<String, Object> result = new HashMap<>();
        try{
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", fldmkMapper.getFldmkByGwdm(gwdm));
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 清除岗位对应的福利信息
     * --- 每次修改岗位对应的福利时都要调用此接口
     *
     * @param gwdm 岗位代码
     * @return 成功或失败信息
     */
    @Override
    public Map<String, Object> clearGwflByGWDM(int gwdm) {
        // TODO: 2025-01-22 实现清除岗位对应的福利信息
        Map<String, Object> result = new HashMap<>();
        try{
            if(fldmkMapper.clearGwflByGWDM(gwdm) != 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
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
}
