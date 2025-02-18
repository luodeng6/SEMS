package org.sems.sems.Controller;

import org.sems.sems.entity.Dwhydmk;
import org.sems.sems.service.DwhydmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping(value = "/dwhydmk")
public class DwhydmkController {

    @Autowired
    private DwhydmkService dwhydmkService;

    // 获取所有单位行业代码
    @GetMapping("/getAllDwhydmk")
    public Map<String, Object> getAllDwhydmk() {
      return  dwhydmkService.getAllDwhydmk();
    }

    // 新增单位行业代码
    @PostMapping("/AddDWHYDMK")
    public Map<String, Object> AddDWHYDMK(Dwhydmk dwhydmk) {
        System.out.println("新增的行业代码：");
        System.out.println(dwhydmk);
        return dwhydmkService.AddDWHYDMK(dwhydmk);
    }
    // 删除单位行业代码
    @GetMapping("/deleteDwhydmkById")
    public Map<String, Object> deleteDwhydmkById(int hydm) {
        System.out.println("删除的行业代码：");
        System.out.println(hydm);
        return dwhydmkService.deleteDwhydmkById(hydm);
    }

    // 修改单位行业代码
    @PostMapping("/EditDWHYDMKById")
    public Map<String, Object> EditDWHYDMKById(Dwhydmk dwhydmk) {
        System.out.println("修改的行业代码：");
        System.out.println(dwhydmk);
        return dwhydmkService.EditDWHYDMKById(dwhydmk);
    }
}
