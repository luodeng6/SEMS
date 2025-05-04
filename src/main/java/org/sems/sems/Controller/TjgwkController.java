package org.sems.sems.Controller;

import org.sems.sems.entity.Tjdxk;
import org.sems.sems.entity.Tjgwk;
import org.sems.sems.service.TjgwkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/tjgwk")
public class TjgwkController {
    @Autowired
    private TjgwkService tjgwkService;

    @GetMapping("/gettjgwk")
    public Map<String, Object> getTjgwk(String YHM,int YHSFDM) {
        return  tjgwkService.getTjgwk(YHM,YHSFDM);
    }
    @PostMapping("/insertTjgwk")
    public Map<String, Object> insertTjgwk(Tjgwk tjgwk) {
        return tjgwkService.insertTjgwk(tjgwk);
    }

    @PostMapping("/insertTjdxk")
    public Map<String, Object> insertTjdxk(Tjdxk tjdxk) {
        System.out.println(tjdxk);
        return tjgwkService.insertTjdxk(tjdxk);
    }
}
