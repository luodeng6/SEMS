package org.sems.sems.Controller;

import org.sems.sems.service.MsdmkService;
import org.springframework.beans.factory.annotation.Autowired;
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
}
