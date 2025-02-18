package org.sems.sems.Controller;

import org.sems.sems.service.JyhjkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/jyhjk")
public class JyhjkController {
    @Autowired
    private JyhjkService jyhjkService;

    // 通过岗位代码获取就业环境图
    @RequestMapping("/getJyhjkByGwdm")
    public Map<String, Object> getJyhjkByGwdm(int  gwdm) {return jyhjkService.getJyhjkByGwdm(gwdm); }

    // 就业环境图上传接口
    @PostMapping("/uploadJyhjk")
    public Map<String, Object> uploadJyhjk(
            @RequestPart("files") MultipartFile[] files,
            @RequestParam("gwdm") String gwdm ) {
        return jyhjkService.uploadJyhjk(files, gwdm);
    }
    // 通过发布者获取所有岗位的就业环境图
    @GetMapping("getAllJyhjkByFbzYhm")
    public Map<String, Object> getAllJyhjkByFbzYhm(String fbzYhm) {
        return jyhjkService.getAllJyhjkByFbzYhm(fbzYhm);
    }
    // 获取岗位、单位、就业环境图 对应关系
    @GetMapping("getGwAndDwAndJhByFbzYhm")
    public Map<String, Object> getGwAndDwAndJhByFbzYhm(String fbzyhm) {
        return jyhjkService.getGwAndDwAndJhByFbzYhm(fbzyhm);
    }
    // 删除就业huanjing图接口 通过环境图id
    @GetMapping("/deleteJyhjk")
    public Map<String, Object> deleteJyhjk(int id) {return   jyhjkService.deleteJyhjkById(id); }
}
