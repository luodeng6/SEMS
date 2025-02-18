package org.sems.sems.Controller;

import org.sems.sems.service.DwgmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/dwgmk")
public class DwgmkController {
    @Autowired
    private DwgmkService dwgmkService;

    // 获取所有单位规模
    @RequestMapping("/getAllDwgmk")
    Map<String, Object> getAllDwgmk() {
       return dwgmkService.getAllDwgmk();
    }
}
