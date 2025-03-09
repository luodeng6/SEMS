package org.sems.sems.Controller;

import org.sems.sems.entity.Fpwtbqk;
import org.sems.sems.entity.Msfpk;
import org.sems.sems.entity.Msfpwtk;
import org.sems.sems.service.MsfpkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/msfpk")
public class MsfpkController {

    @Autowired
    private MsfpkService msfpkService;

    //新增面试复盘库
    @RequestMapping("/addMsfpk")
    public Map<String, Object> addMsfpk(Msfpk msfpk) {
        System.out.println("新增面试复盘库：" );
        System.out.println(msfpk);
        return msfpkService.addMsfpk(msfpk);
    }

    // 插入面试复盘的问题
    @RequestMapping("/addMsfpkQuestion")
    public Map<String, Object> addMsfpkQuestion(Msfpwtk msfpwtk) {
        System.out.println("新增面试复盘问题：" );
        System.out.println(msfpwtk);
        return msfpkService.addMsfpkQuestion(msfpwtk);
    }

    // 插入面试复盘标签
    @RequestMapping("/addMsfpkTag")
    public Map<String, Object> addMsfpkTag(Fpwtbqk fpwtbqk) {
        System.out.println("新增面试复盘标签：" );
        System.out.println(fpwtbqk);
        return msfpkService.addMsfpkTag(fpwtbqk);
    }

    // 获取面试复盘库列表
    @RequestMapping("/getMsfpkList")
    public Map<String, Object> getMsfpkList(String YHM) {
        System.out.println("获取面试复盘库列表："+YHM);
        return msfpkService.getMsfpkList(YHM);
    }
}
