package org.sems.sems.Controller;

import org.sems.sems.entity.DataGwdmk;
import org.sems.sems.service.DataGwdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/dataGwdmk")

public class DataGwdmkController {

    @Autowired
    private DataGwdmkService dataGwdmkService;

    // 获取所有岗位信息
    @GetMapping("/getGwdmkData")
    public Map<String, Object> getALlGwdmkData() {
        return dataGwdmkService.getDataGwdmk();
    }

    // 获取岗位信息,根据是否启用
    @GetMapping("/getGwdmkDataByisQy")
    public Map<String, Object> getGwdmkDataByisQy(Integer isQy) {return dataGwdmkService.getDataGwdmkByisQy(isQy);}

    // 通过发布者获取岗位信息
    @GetMapping("/getGwdmkDataByFbz")
    public Map<String, Object> getGwdmkDataByFbz(String fbzyhm) {
        return dataGwdmkService.getDataGwdmkByFbz(fbzyhm);
    }

    // 停用岗位信息
    @PostMapping("/endUsingGangWei")
    public Map<String, Object> endUsingGangWei(Integer id) {
        return dataGwdmkService.endUsingGangWei(id);
    }

    // 启用岗位信息
    @GetMapping("/startUsingGangWei")
    public Map<String, Object> startUsingGangWei(Integer id) {
        return dataGwdmkService.startUsingGangWei(id);
    }

    // 新增岗位信息
    @PostMapping("/addGangWei")
    public Map<String, Object> addGangWei(DataGwdmk dataGwdmk) {
        // return dataGwdmkService.addGangWei(dataGwdmk);
        System.out.println("新增岗位信息：");
        System.out.println(dataGwdmk);
        return dataGwdmkService.addGangWei(dataGwdmk);
    }

    // 修改岗位信息
    @PostMapping("/updateGangWei")
    public Map<String, Object> updateGangWei(DataGwdmk dataGwdmk) {
        System.out.println("修改岗位信息：");
        System.out.println(dataGwdmk);
        return dataGwdmkService.updateGangWei(dataGwdmk);
    }

    // 获取火热岗位信息
    @GetMapping("/getHotGwdmkData")
    public Map<String, Object> GetHotGwdmkData(Integer num) {
        return dataGwdmkService.getHotDataGwdmk(num);
    }

    // 获取岗位信息通过id
    @GetMapping("/getGwdmById")
    public Map<String, Object> getGwdmById(Integer id) {
        return dataGwdmkService.getGwdmById(id);
    }


    // 岗位环境图片上传
    @PostMapping("/uploadGangWeiHuanJingImg")
    public Map<String, Object> uploadGangWeiHuanJingImg(@RequestPart("files") MultipartFile[] files) {
        return dataGwdmkService.uploadGangWeiHuanJingImg(files);
    }
}
