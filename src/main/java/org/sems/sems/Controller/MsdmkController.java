package org.sems.sems.Controller;

import org.sems.sems.entity.Msdmk;
import org.sems.sems.service.MsdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/msdmk")
public class MsdmkController {
    @Autowired
    private MsdmkService msdmkService;

    // 获取待安排面试的数据
    @RequestMapping("/getWaitApms")
    public Map<String, Object> getWaitApms(String yhm) {
        return msdmkService.getWaitApms(yhm);
    }

    // 获取面试代码库数据
    @RequestMapping("/getAllInterviews")
    public Map<String, Object> getAllInterviews(String yhm,int yhsfdm) {
        return msdmkService.getAllInterviews(yhm,yhsfdm);
    }

    // 删除草稿面试
    @GetMapping("/deletemsdmk")
    public Map<String, Object> deletemsdmk(int msdm) {
        return msdmkService.deletemsdmk(msdm);
    }

    // 新增面试 智能SQL
    @PostMapping("/addInterview")
    public Map<String,Object> addInterview(Msdmk msdmk){
        System.out.println(msdmk);
        return msdmkService.addInterview(msdmk);
    }
    // 更新面试 智能SQL
    @PostMapping("/updateInterview")
    public Map<String,Object> updateInterview(Msdmk msdmk){
        System.out.println(msdmk);
        return msdmkService.updateInterview(msdmk);
    }
}
