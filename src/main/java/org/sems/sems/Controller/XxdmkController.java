package org.sems.sems.Controller;

import org.sems.sems.service.XxdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/xxdmk")
public class XxdmkController {
    @Autowired
    private XxdmkService xxdmkService;
    // 获取消息
    @RequestMapping("/getXxdmk")
    public Map<String, Object> getXxdmk(String YHM,int YHSFDM) {
        return xxdmkService.getXxdmk(YHM,YHSFDM);
    }
}
