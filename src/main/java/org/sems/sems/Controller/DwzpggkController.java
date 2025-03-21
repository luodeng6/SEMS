package org.sems.sems.Controller;


import org.sems.sems.entity.Dwzpggk;
import org.sems.sems.service.DwzpggkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/dwzpggk")
public class DwzpggkController {

    @Autowired
    private DwzpggkService dwzpggkService;

    // 公告图片上传接口
    @PostMapping("/uploaddwzpggkimg")
    public Map<String, Object> uploadDwZpggkImg(MultipartFile file) {
        return dwzpggkService.uploadDwZpggkImg(file);
    }

    @PostMapping("/adddwzpggk")
    public Map<String, Object> addDwZpggk(Dwzpggk dwzpggk) {
        System.out.println(dwzpggk);
        return dwzpggkService.addDwZpggk(dwzpggk);
    }

    @PostMapping("/updatedwzpggk")
    public Map<String, Object> updateDwZpggk(Dwzpggk dwzpggk) {
        return dwzpggkService.updateDwZpggk(dwzpggk);
    }


    // 公告查询接口
    @GetMapping("/getdwzpggk")
    public Map<String, Object> getDwZpggk(Integer YFSFDM, String YHM, Integer QYDM,Integer JUSTONE ,Integer GGID) {
        /*System.out.println("YFSFDM:"+YFSFDM);
        System.out.println("YHM:"+YHM);
        System.out.println("QYDM:"+QYDM);
        System.out.println("JUSTONE:"+JUSTONE);
        System.out.println("GGID:"+GGID);*/

        // 设定默认值
        if (JUSTONE == null){
            JUSTONE = 0;
            GGID = -1;
        }
        return dwzpggkService.getDwZpggk( YFSFDM,  YHM,  QYDM, JUSTONE, GGID);
    }
}
