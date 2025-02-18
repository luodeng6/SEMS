package org.sems.sems.Controller;

import org.sems.sems.service.XsjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/xsjlk")
public class DataXsjlkController {

    @Autowired
    private XsjlkService xsjlkService;

    // 获取指定学生的简历信息--只获取发布的简历信息
    @GetMapping("/getStuResumeByStuId")
    public Map<String, Object> getStuResumeByStuId(int stuId) {return xsjlkService.getStuResumeByStuId(stuId);}
}
