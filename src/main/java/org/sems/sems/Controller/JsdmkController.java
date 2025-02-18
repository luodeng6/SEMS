package org.sems.sems.Controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.sems.sems.Mapper.JsbjdykMapper;
import org.sems.sems.entity.Bjdmk;
import org.sems.sems.entity.Jsdmk;
import org.sems.sems.service.JsbjdykService;
import org.sems.sems.service.JsdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
@RequestMapping("/teacher")
public class JsdmkController {
    @Autowired
    private JsdmkService jsdmkService;

    @Autowired
    private JsbjdykMapper jsbjdykMapper;
    @Autowired
    private JsbjdykService jsbjdykService;

    @GetMapping("/getAllTeachers")
    public Map<String, Object> getAllTeachers() {
        Map<String, Object> result = new HashMap<>();

        // 获取教师信息
        Map<String, Object> teachers = jsdmkService.getAllJsdmkData();
        System.out.println("教师信息:");
        ObjectMapper objectMapper = new ObjectMapper();

        // 获取每个教师对应的班级
        List<Jsdmk> teacherData = (List<Jsdmk>) teachers.get("data");
        List<Map<String, Object>> teacherListWithClasses = new ArrayList<>();

        for (Jsdmk jsdmk : teacherData) {
            // 将教师对象转化为 Map
            Map<String, Object> teacherMap = objectMapper.convertValue(jsdmk, Map.class);

            // 获取该教师对应的班级列表
            List<Bjdmk> bjdmkList = jsbjdykMapper.getBjdmkByJsdmk(jsdmk.getId());  // 假设Jsdmk有getId方法

            // 将班级列表添加到教师Map中
            teacherMap.put("BJLIST", bjdmkList);
            teacherListWithClasses.add(teacherMap); // 添加到新的列表中

            System.out.println("教师 " + jsdmk.getJsmc() + " 对应的班级列表：");
            System.out.println(bjdmkList);
        }

        result.put("data", teacherListWithClasses); // 返回带班级列表的教师信息
        result.put("code", 200);
        result.put("msg", "success");
        result.put("result", true);

        return result;
    }


    // 通过班级代码获取教师信息--责任老师
    @GetMapping("/getTeacherByClassId")
    public Map<String, Object> getTeacherByClassId(int bjdm) {
        return jsbjdykService.getTeacherByClassId(bjdm);
    }


    // 取消关联
    @PostMapping("/cancelRelation")
    public Map<String, Object> cancelRelation(int JSID, int BJID) {
        return jsbjdykService.QuXiaoGuanLian(JSID, BJID);
    }
    // 添加关联
    @PostMapping("/addBjJsRelation")
    public Map<String, Object> addRelation(int JSID, int BJID) {
        System.out.println("--添加教师班级关联--教师："+JSID+" 班级："+BJID);
        return jsbjdykService.TianJiaGuanLian(JSID, BJID);
    }

    //教师停用
    @PostMapping("/stopTeacher")
    public Map<String, Object> stopTeacher(int JSID) {
        return jsdmkService.stopTeacher(JSID);
    }

    //新增教师
    @PostMapping("/addTeacher")
    public Map<String, Object> addTeacher(Jsdmk jsdmk) {
        System.out.println("新增教师数据:");
        System.out.println(jsdmk);
       return jsdmkService.AddTeacher(jsdmk);
    }

    // 新增教师，智能
    @PostMapping("/addTeacherAuto")
    public Map<String, Object> addTeacherAuto(Jsdmk jsdmk) {return  jsdmkService.AddJsdmkDataZhineng(jsdmk);}

    // 动态sql更新教师信息
    @PostMapping("/updateTeacher")
    public Map<String, Object> updateTeacher(Jsdmk jsdmk) {
        System.out.println("更新教师数据:");
        System.out.println(jsdmk);
        return jsdmkService.updateJsdmkData(jsdmk);
    }
}
