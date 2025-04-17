package org.sems.sems.Controller;

import org.sems.sems.entity.DataZpjzk;
import org.sems.sems.service.DataZpjzkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/datazpjzk")
public class DataZpjzkController {

    @Autowired
    private DataZpjzkService dataZpjzkService;

   /* @GetMapping("/getDataZpjzk")
    public Map<String, Object> getDataZpjzk(int QYDM) {return dataZpjzkService.getDataZpjzk(QYDM);  }

    @PostMapping("/addDataZpjzk")
    public Map<String, Object> addDataZpjzk(DataZpjzk DataZpjzk) {
        return dataZpjzkService.addDataZpjzk(DataZpjzk);
    }*/
}
