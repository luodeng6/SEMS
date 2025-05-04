package org.sems.sems.Controller;

import org.sems.sems.entity.Xsxxk;
import org.sems.sems.service.XsxxkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

@RestController
@RequestMapping("/xsxxk")
public class XsxxkController {
    @Autowired
    private XsxxkService xsxxkService;
    @GetMapping("/getXxxk")
    public Map<String, Object> getXxxk(int BYYHM, String YHM, int STUID) {
        return xsxxkService.getXxxk(BYYHM ,YHM, STUID);
    }

    @PostMapping("/insertXsxxk")
    public Map<String, Object> insertXsxxk(Xsxxk xsxxk) {
        return xsxxkService.insertXsxxk(xsxxk);
    }

    @PostMapping("/updateXsxxk")
    public Map<String, Object> updateXsxxk(Xsxxk xsxxk) {
        return xsxxkService.updateXsxxk(xsxxk);
    }
}
