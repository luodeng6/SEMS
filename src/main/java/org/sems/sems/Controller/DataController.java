package org.sems.sems.Controller;

import org.sems.sems.Public.PublicService;
import org.sems.sems.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/data")
public class DataController {
    @Autowired
    private DataService dataService;
    @Autowired
    private PublicService publicService;

    @RequestMapping(value = "/getAllJCSJ1", method = RequestMethod.GET)
    public Map<String, Object> getAllJCSJ() {
        return dataService.get_JCSJ1();
    }

    @GetMapping(value = "/getAllJCSJ2")
    public Map<String, Object> getAllJCSJ2() {
        return dataService.get_JCSJ2();
    }

    // 获取学生管理所需数据：班级代码库、学历天梯库、专业代码库
    @GetMapping("/getAllStuGLData")
    public Map<String, Object> getAllStuGLData() {
        return dataService.get_XSGLDATA();

    }

    // 获取学生中文和数据库中英文对照
    @GetMapping("/getStuDYMap")
    public Map<String, Object> getAllStuDYMap() {
        // 对应的数据
        Map<String, Object> DYSJ = new HashMap<>();
        DYSJ.put("data", publicService.readJSONFile("dataJson.json").get("STUDYDATA"));
        DYSJ.put("code", 200);
        DYSJ.put("msg", "OK");
        DYSJ.put("result", true);
        return DYSJ;
    }
}
