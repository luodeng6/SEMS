package org.sems.sems.Controller;

import org.sems.sems.service.DwxzkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/dwxzk")
public class DwxzkController {
    @Autowired
    private DwxzkService dwxzkService;

    @GetMapping("/getAllDwxxk")
    public Map<String, Object> getAllDwxxk() {
        return dwxzkService.getAllDWXK();
    }
}
