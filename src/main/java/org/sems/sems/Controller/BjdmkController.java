package org.sems.sems.Controller;

import org.sems.sems.service.BjdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RequestMapping("/class")
@RestController
public class BjdmkController {

    @Autowired
    private BjdmkService bjdmkService;

    @GetMapping("/getAllClass")
    public Map<String, Object> getAllClass() {
        return bjdmkService.getAllClass();
    }

    // 获取指定教师未对应的班级
    @GetMapping("/getClassByTeacherIdNotBind")
    public Map<String, Object> getAllClassByTeacherIdNotBind(int jsid) {
        System.out.println("--获取指定教师未对应的班级:教师id="+jsid);
        return bjdmkService.getNoTeacherBjdmkInfo(jsid);
    }
}
