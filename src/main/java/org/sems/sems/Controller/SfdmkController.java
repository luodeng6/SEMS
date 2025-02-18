package org.sems.sems.Controller;

import org.sems.sems.entity.Sfdmk;
import org.sems.sems.service.SfdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/sfdmk")
public class SfdmkController {
    @Autowired
    private SfdmkService sfdmkService;

    // Get all SFDMKS
    @GetMapping("/getAllSfdmks")
    public Map<String, Object> getAllSfdmks() {return sfdmkService.getAllSfdmk();}

    // 新增SFDMK数据
    @PostMapping("/AddSFDMK")
    public Map<String, Object> AddSFDMK(Sfdmk sfdmk) {
        System.out.println("新增SFDMK数据：");
        System.out.println(sfdmk);
        return sfdmkService.AddSfdmk(sfdmk);}

    @PostMapping("/UpdateSFDMK")
    public Map<String, Object> UpdateSFDMK(Sfdmk sfdmk) {return sfdmkService.updateSfdmk(sfdmk);}

}
