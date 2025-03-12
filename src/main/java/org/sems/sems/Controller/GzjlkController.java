package org.sems.sems.Controller;

import org.sems.sems.entity.Gzjlk;
import org.sems.sems.entity.Gzjlsxk;
import org.sems.sems.service.GzjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/gzjlk")
public class GzjlkController {

    @Autowired
    private GzjlkService gzjlkService;

    @GetMapping("/getAllGzjlk")
    public Map<String, Object> getAllGzjlk(String YHM) {
        return gzjlkService.getAllGzjlk(YHM);
    }
    @PostMapping("/addGzjlk")
    public Map<String,Object> addGzjlk(Gzjlk gzjlk){
        System.out.println(gzjlk.toString());
        return gzjlkService.addGzjlk(gzjlk);
    }

    @PostMapping("/updateGzjlk")
    public Map<String,Object> updateGzjlk(Gzjlk gzjlk){
        System.out.println(gzjlk.toString());
        return gzjlkService.updateGzjlk(gzjlk);
    }
    @GetMapping("/deleteGzjlk")
    public Map<String,Object> deleteGzjlk(Integer id){
        return gzjlkService.deleteGzjlk(id);
    }

    @PostMapping("/addGzjlsxK")
    public Map<String,Object> addGzjlsxK(Gzjlsxk gzjlsxk){
        System.out.println(gzjlsxk.toString());
        return gzjlkService.addGzjlsxK(gzjlsxk);
    }
    @GetMapping("/deleteGzjlsxK")
    public Map<String,Object> deleteGzjlsxK(Integer id){
        return gzjlkService.deleteGzjlsxK(id);
    }
}
