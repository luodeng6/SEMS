package org.sems.sems.Controller;

import org.sems.sems.entity.Xtggk;
import org.sems.sems.service.XtggkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/xtggk")
public class XtggkController {

    @Autowired
    private XtggkService xtggkService;

    @RequestMapping("/insertXtggk")
    public Map<String, Object> insertXtggk(Xtggk xtggk) {
        return xtggkService.insertXtggk(xtggk);
    }

    /*usp_AllUserGetXtgg*/
    @RequestMapping("/updateXtggk")
    public Map<String, Object> updateXtggk(Xtggk xtggk) {
        return xtggkService.updateXtggk(xtggk);
    }

    @RequestMapping("/getXtggk")
    public Map<String, Object> getXtggk(
            @RequestParam(defaultValue = "1", required = false) Integer QYDM,// 默认只获取启用的
            @RequestParam(defaultValue = "0", required = false) Integer JUSTONE, // 默认获取多条
            @RequestParam(defaultValue = "0", required = false) Integer GGID) {
        return xtggkService.getXtggk(QYDM, JUSTONE, GGID);
    }
}
