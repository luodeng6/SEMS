package org.sems.sems.Controller;


import org.sems.sems.entity.DataStudent;
import org.sems.sems.service.DataStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private DataStudentService dataStudentService;

    //获取所有学生信息
    @RequestMapping(value = "/getStudents", method = RequestMethod.GET)
    public Map<String, Object> getStudents() {
        return dataStudentService.getAllStudents();
    }

    //获取学生信息
    @RequestMapping(value = "/getStudentAuto", method = RequestMethod.GET)
    public Map<String, Object> getStudent() {
        return dataStudentService.getStudentByIdentity();
    }


    // 获取学生信息，通过用户名或者id
    @GetMapping(value = "/getStudentByUsernameOrId")
    public Map<String, Object> getStudentByUsernameOrId(@RequestParam(value = "usernameOrId") String usernameOrId,
                                                        @RequestParam(value = "type", required = false) String type) {
        return  dataStudentService.getStudentByUsernameOrId(usernameOrId, type);
    }

    // 编辑更新学生信息
    @PostMapping(value = "/updateStudentByEdit")
    public Map<String, Object> updateStudent(DataStudent dataStudent) {
        System.out.println("开始处理编辑更新学生信息：");
        System.out.println(dataStudent);
        return dataStudentService.AdminUpdateStudentData(dataStudent);
    }

    // 新增学生信息
    @PostMapping("/addStudent")
    public Map<String, Object> addStudent(DataStudent dataStudent) {
        System.out.println("开始处理新增学生信息：");
        System.out.println(dataStudent);
        return dataStudentService.AddStudentData(dataStudent);
    }
   // 智能新增学生信息
    @PostMapping("/addStudentAuto")
    public Map<String, Object> addStudentAuto(DataStudent dataStudent) {
        System.out.println("开始智能新增学生信息：");
        System.out.println(dataStudent);
        return dataStudentService.addStudentAuto(dataStudent);
    }
    // 学生照片上传接口
    @PostMapping("/uploadStudentPhoto")
    public Map<String, Object> uploadStudentPhoto(@RequestParam("file") MultipartFile file,
                                                   @RequestParam("yhm") String yhm) {
        return dataStudentService.uploadStudentPhoto(file, yhm);
    }


    // 删除停用学生
    @GetMapping("/deleteStudentById")
    public Map<String, Object> deleteStudentById(@RequestParam int id) {
        return dataStudentService.deleteStudentById(id);
    }
    // 启用学生
    @GetMapping("/enableStudentById")
    public Map<String, Object> enableStudentById(@RequestParam int id) {
        return dataStudentService.enableStudentById(id);
    }

}
