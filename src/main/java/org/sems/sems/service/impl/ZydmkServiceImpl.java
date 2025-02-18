package org.sems.sems.service.impl;

import org.sems.sems.Mapper.ZydmkMapper;
import org.sems.sems.service.ZydmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
@Service
public class ZydmkServiceImpl implements ZydmkService {
    @Autowired
    private ZydmkMapper zydmkMapper;

    /**
     * 获取所有专业代码对象
     * @return
     */
    @Override
    public Map<String, Object> getAllZydmk() {
        Map<String, Object> map = new HashMap<>();
        try{
            map.put("code",200);
            map.put("msg","success");
            map.put("data",zydmkMapper.getAllZydmk());
            map.put("result",true);

        }catch(Exception e){
            e.printStackTrace();
        }
        return map;
    }
}
