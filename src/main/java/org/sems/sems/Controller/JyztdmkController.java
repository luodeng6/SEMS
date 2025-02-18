package org.sems.sems.Controller;


import org.sems.sems.service.JyztdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/jyztdmk")
public class JyztdmkController {

    // TODO: Implement controller methods for Jyztdmk

    @Autowired
    private JyztdmkService jyztdmkService;

    // 获取所有就业状态
    @GetMapping("/getAllJyztdmk")
    public Map<String, Object> getAllJyztdmk() {
        return jyztdmkService.getAllJyztdmk();
    }
}
