package org.sems.sems.Controller;

import org.sems.sems.entity.Dwyhk;
import org.sems.sems.service.DwyhkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/dwyhk")
public class DwyhkController {
    @Autowired
    private DwyhkService dwyhkService;
    // 获取所有单位用户信息
    @GetMapping("/getAllDwyhk")
    public Map<String, Object> getAllDwyhk() {return dwyhkService.getAllDwyhk();}
    // 修改单位用户状态
    @PostMapping("/updateDwyhkQYBZ")
    public Map<String, Object> updateDwyhkTYBZ(String yhm,int tybz) {return dwyhkService.updateDwyhkTYBZ(yhm,tybz);}
    // 新增单位用户信息
    @PostMapping("/addDwyhk")
    public Map<String, Object> addDwyhk(Dwyhk dwyhk) {
        System.out.println("新增单位用户信息:");
        System.out.println(dwyhk);
        return dwyhkService.addDwyhk(dwyhk);
    }

    // 智能更新DWYHK信息
    @PostMapping("/updateDwyhk")
    public Map<String, Object> updateDwyhk(Dwyhk dwyhk) {
        System.out.println("智能更新DWYHK信息:");
        System.out.println(dwyhk);
        return dwyhkService.updateDwyhk(dwyhk);
    }

    // 根据位用户名 获取单位用户全部数据+单位信息+发布岗位数量
    @GetMapping("/getDwyhkAndDwDataAndPostCountByYhm")
    public Map<String, Object> getDwyhkAndDwDataAndPostCountByYhm(String yhm) {
        return dwyhkService.getDwyhkAndDwDataAndPostCountByYhm(yhm);
    }
}
