package org.sems.sems.service.impl;

import org.sems.sems.Mapper.BjdmkMapper;
import org.sems.sems.service.BjdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class BjdmkServiceImpl implements BjdmkService {
    @Autowired
    private BjdmkMapper bjdmkMapper;

    /**
     * 获取未对应指定教师的班级信息
     *
     * @param jsid 教师id
     * @return 班级信息
     * @throws Exception
     */
    @Override
    public Map<String, Object> getNoTeacherBjdmkInfo(int jsid) {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("data", bjdmkMapper.getBjdmkByIdNotBline(jsid));
            result.put("code", 200);
            result.put("msg", "success");
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }
// TODO: Implement BjdmkService


    /**
     * 获取所有班级信息
     *
     * @return
     */
    @Override
    public Map<String, Object> getAllBjdmkInfo() {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("data", bjdmkMapper.getAllBjdmk());
            result.put("code", 200);
            result.put("msg", "success");
            result.put("result", true);

        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取所有班级
     *
     * @return
     */
    @Override
    public Map<String, Object> getAllClass() {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("data", bjdmkMapper.getAllBjdmk());
            result.put("code", 200);
            result.put("msg", "success");
            result.put("result", true);

        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }
}
