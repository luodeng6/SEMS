package org.sems.sems.Controller;
import org.sems.sems.service.XlttkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

// 学历控制器
@RestController
@RequestMapping("/xlttk")
public class XlttkController {

    @Autowired
    private XlttkService xlttkService;

    // 获取所有学历
    @RequestMapping("/getAllXlttkData")
    public Map<String, Object> getAllXlttkData() {
        // TODO: 获取所有学历数据
        return  xlttkService.getAllXlttk();
    }

}
