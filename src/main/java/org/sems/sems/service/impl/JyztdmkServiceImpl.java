package org.sems.sems.service.impl;

import org.sems.sems.Mapper.JyztdmkMapper;
import org.sems.sems.service.JyztdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class JyztdmkServiceImpl implements JyztdmkService {

    @Autowired
    private JyztdmkMapper jyztdmkMapper;

    /**
     * 获取全部就业状态
     * @return  Map<String, Object>
     */
    @Override
    public Map<String, Object> getAllJyztdmk() {
       Map<String, Object> map = new HashMap<>();
       try {
           // TODO: 获取全部就业状态数据
           map.put("code", 200);
           map.put("msg", "success");
           map.put("data", jyztdmkMapper.selectAllJyztdmk());
           map.put("result", true);
       } catch (Exception e) {
          e.printStackTrace();
          map.put("code", 500);
          map.put("msg", "error");
          map.put("result", false);
          map.put("data", e.getMessage());
       }
       return map;
    }
}
