package org.sems.sems.Controller;

import org.sems.sems.service.FldmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/fl")
public class FldmkController {

    @Autowired
    private FldmkService fldmkService;

    // 获取所有Fldmk信息
    @RequestMapping("/getAllFLData")
    public Map<String, Object> getAllFldmk() {
        // TODO: 获取Fldmk信息并返回
        return fldmkService.getAllFLData();
    }

    // 岗位福利对应
    @PostMapping("/gwfldy")
    public Map<String, Object> gwfldy(int fldm, int gwdm) {
        System.out.println("调用岗位福利对应接口:");
        System.out.println("fldm: " + fldm + " , gwdm: " + gwdm);
        return fldmkService.gwfldy(fldm, gwdm);}

    // 由岗位id获取岗位福利
    @GetMapping("/getGwflByGWDM")
    public Map<String, Object> getGwflByGWDM(int gwdm) {
        System.out.println("调用获取岗位福利接口:");
        System.out.println("gwdm: " + gwdm);
        return fldmkService.getGwflByGWDM(gwdm);
    }

    // 清空指定岗位的福利
    @PostMapping("/clearGwflByGWDM")
    public Map<String, Object> clearGwflByGWDM(int gwdm) {
        System.out.println("调用清空指定岗位的福利接口:");
        System.out.println("gwdm: " + gwdm);
        // TODO: 清空指定岗位的福利
        return fldmkService.clearGwflByGWDM(gwdm);
    }
}