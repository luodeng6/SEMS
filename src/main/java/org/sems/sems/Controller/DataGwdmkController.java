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
    public Map<String, Object> getGwdmkDataByisQy(Integer isQy) {
        return dataGwdmkService.getDataGwdmkByisQy(isQy);
    }

    // 通过发布者获取岗位信息
    @GetMapping("/getGwdmkDataByFbz")
    public Map<String, Object> getGwdmkDataByFbz(String fbzyhm) {
        return dataGwdmkService.getDataGwdmkByFbz(fbzyhm);
    }

    // 统一接口获取岗位信息
    @GetMapping("/getGwdmkDataToInterface")
    public Map<String, Object> getGwdmkDataToInterface( @RequestParam(defaultValue = "0")int IsJustOne,//是否只是获取一条
                                                       @RequestParam(defaultValue = "-1") int gwdm,// 当@IsJustOne为1时，此参数才有用
                                                       @RequestParam(defaultValue = "2") int QYDM,// 1时只获取启用的，0 只获取未启用的，2 获取全部
                                                       @RequestParam(defaultValue = "0")    int IsByFBZ,// 是否通过发布者获取
                                                       @RequestParam(defaultValue = "null")    String FBZ, // 发布者  ，@IsByFBZ为1时有效
                                                       @RequestParam(defaultValue = "2") int SXBZ   //实习标志，1只获取实习，0 只获取正式岗位，2全部
    ) {
        if (IsJustOne == 1) {
            System.out.println(111);
            IsByFBZ = 0;
            FBZ = "";
            SXBZ = 2;
            QYDM = 2;
        } else if (IsByFBZ == 1) {
            IsJustOne = 0;
            gwdm = -1;
        }
        return dataGwdmkService.getGwdmkDataToInterface(IsJustOne, gwdm, QYDM, IsByFBZ, FBZ, SXBZ);
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
