package org.sems.sems.Controller;

import org.sems.sems.service.GwflkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/gwflk")
public class GwflController {
    @Autowired
    private GwflkService  gwflkService;

    // 获取所有gwfl信息
    @GetMapping("/getAllGwflList")
    public Map<String, Object> getGwfl() {return gwflkService.getGwfl();}


}
