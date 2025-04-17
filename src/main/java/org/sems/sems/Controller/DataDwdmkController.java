package org.sems.sems.Controller;

import org.sems.sems.entity.DataDwdmk;
import org.sems.sems.service.DataDwdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/dw")
public class DataDwdmkController {
@Autowired
private DataDwdmkService dataDwdmkService;

    @RequestMapping("/getAllDw")
    public Map<String, Object> getAllDw() {
        return dataDwdmkService.getAllDataDwdmk();
    }

    // 获取单位信息：根据单位启用状态
    @GetMapping(value = "/getDwByQydm")
    public Map<String, Object> getDwByQydm(int qydm) {return dataDwdmkService.getDwByQydm(qydm);}

    // 停用单位
    @RequestMapping("/tingYongDw")
    public Map<String, Object> tingYongDw(int dwdm) {
        System.out.println("停用单位:"+dwdm);
        return  dataDwdmkService.disableDataDwdmk(dwdm);
    }

    // 获取单位发布的所有岗位
    @RequestMapping("/getDwGangWei")
    public Map<String, Object> getDwGangWei(int dwdm) {
        return dataDwdmkService.getDwGangWei(dwdm);
    }

    // 修改单位接口: 只修改单位名称、规模、行业、性质、简介、公司名称、公司简介----动态修改
    @PostMapping("/updateDw")
    public Map<String, Object> updateDw(DataDwdmk dataDwdm) {
        System.out.println("修改单位接口:"+dataDwdm.toString());
        return dataDwdmkService.updateDataDwdmk(dataDwdm);
    }

    // 新增单位接口: 新增单位信息
    @PostMapping("/addDw")
    public Map<String, Object> addDw(DataDwdmk dataDwdm) {
        System.out.println("新增单位接口:"+dataDwdm.toString());
        return dataDwdmkService.addDataDwdmk(dataDwdm);
    }

    // 根据单位用户用户名 获取对应单位信息
    @GetMapping("/getDwDataByDwUserName")
    public Map<String, Object> getDwDataByDwUserName(String dwUserName) {
        return dataDwdmkService.getDwDataByDwUserName(dwUserName);
    }

    // 单位编辑 GSJJHTML时，上传图片接口
    @PostMapping("/uploadGsjjImg")
    public Map<String, Object> uploadGsjjImg(MultipartFile file) {
        return dataDwdmkService.uploadGsjjImg(file);
    }


    // 视频上传接口，与前端配置的 uploadVideoServer 对应
    @PostMapping("/uploadVideo")
    public Map<String, Object> uploadVideo(
            @RequestParam("videoFile") MultipartFile videoFile) {
        return dataDwdmkService. uploadVideoFile(videoFile);
    }
    @PostMapping("/uploadDwLogo")
    public Map<String, Object> uploadDwLogo(
            @RequestParam("file") MultipartFile file,
            @RequestParam("dwdm") int dwdm) {
        return dataDwdmkService.uploadDwLogo(file, dwdm);
    }


    /*@GetMapping("/getDATADWDMKBYusp")
    public Map<String, Object> getDATADWDMKBYusp(String usp) {
        return dataDwdmkService.getDwDataByDwUserName(usp);
    }*/
}
