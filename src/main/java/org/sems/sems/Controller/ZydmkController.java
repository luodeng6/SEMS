package org.sems.sems.Controller;

import org.sems.sems.service.ZydmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/zydmk")
public class ZydmkController {
    @Autowired
    private ZydmkService zydmkService;

    @GetMapping("/getAllZydmk")
    public Map<String, Object> getAllZydmk() {
        return  zydmkService.getAllZydmk();
    }

}
