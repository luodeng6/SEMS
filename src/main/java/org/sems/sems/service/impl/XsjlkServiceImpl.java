package org.sems.sems.service.impl;

import org.sems.sems.Mapper.XsjlkMapper;
import org.sems.sems.service.XsjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class XsjlkServiceImpl implements XsjlkService {
    @Autowired
    private XsjlkMapper xsjlkMapper;

    /**
     * 根据学生ID获取学生简历
     *
     * @param stuId 学生ID
     * @return Map<String, Object> 学生简历
     */
    @Override
    public Map<String, Object> getStuResumeByStuId(int stuId) {
        Map<String, Object> stuResume = new HashMap<>();
        try{
            stuResume.put("code", 200);
            stuResume.put("msg", "success");
            stuResume.put("data", xsjlkMapper.getXsjlkByStuId(stuId));
            stuResume.put("result",true);
        }catch (Exception e){
            e.printStackTrace();
            stuResume.put("code", 500);
            stuResume.put("msg", "server fail");
            stuResume.put("result",false);
            stuResume.put("data", e.getMessage());
        }
        return stuResume;
    }
}
