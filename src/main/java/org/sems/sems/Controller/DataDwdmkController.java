package org.sems.sems.Controller;

import org.sems.sems.entity.DataDwdmk;
import org.sems.sems.service.DataDwdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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

    // 修改单位接口: 只修改单位名称、规模、行业、性质、简介、公司名称、公司简介
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
}
