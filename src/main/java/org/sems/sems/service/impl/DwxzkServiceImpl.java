package org.sems.sems.service.impl;
import org.sems.sems.Mapper.DWXZKMapper;
import org.sems.sems.entity.Dwxzk;
import org.sems.sems.service.DwxzkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;

/**
 * 单位性质库(Dwxzk)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
@Service("dwxzkService")
public class DwxzkServiceImpl implements DwxzkService {
    @Autowired
    private DWXZKMapper dwxzkMapper;

    /**
     * 获取所有单位性质库信息
     * @return
     */
    @Override
    public Map<String, Object> getAllDWXK() {
        Map<String, Object> map = new HashMap<>();
        try{
            map.put("code", 200);
            map.put("message","success");
            map.put("result", true);
            map.put("data", dwxzkMapper.getAllDWXK());
        }catch (Exception e){
            map.put("code", 500);
            map.put("message","server error");
            map.put("result", false);
            map.put("data", e.getMessage());
            e.printStackTrace();
        }
        return map;
    }


    /**
     * 根据单位性质代码删除单位性质信息
     * @param DWXZDM
     * @return
     */
    @Override
    public Map<String, Object> deleteDWXKById(int DWXZDM) {
        Map<String, Object> map = new HashMap<>()  ;
        try{
            if (dwxzkMapper.deleteDWXKById(DWXZDM)!=0){
                map.put("code", 200);
                map.put("message","success");
                map.put("result", true);
            }else{
                map.put("code", 504);
                map.put("message","databas error");
                map.put("result", false);
            }
        }catch (Exception e){
            map.put("code", 500);
            map.put("message","server error");
            map.put("result", false);
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 新增单位性质信息
     * @param dwxzk
     * @return
     */
    @Override
    public Map<String, Object> AddDWXK(Dwxzk dwxzk) {
       Map<String, Object> map = new HashMap<>();
        try{
            if (dwxzkMapper.AddDWXK(dwxzk)!=0){
                map.put("code", 200);
                map.put("message","success");
                map.put("result", true);
            }else{
                map.put("code", 504);
                map.put("message","databas error");
                map.put("result", false);
            }
        }catch (Exception e){
            map.put("code", 500);
            map.put("message","server error");
            map.put("result", false);
            e.printStackTrace();
        }
        return map;
    }
}
