package org.sems.sems.Controller;

import org.sems.sems.entity.Tdjlk;
import org.sems.sems.service.TdjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/tdjlk")
public class TdjlkController {

    @Autowired
    private TdjlkService tdjlkService;

    // 学生投递简历
    @PostMapping("/TdJl")
    public Map<String, Object> tdJl(Tdjlk tdjlk) {
        System.out.println("学生投递简历:");
        System.out.println(tdjlk);
        return tdjlkService.tdJl(tdjlk);
    }

    // 通过投递记录id获取简历信息
    @GetMapping("/getTdjlkById")
    public Map<String, Object> getTdjlkById(int id) {
        return tdjlkService.getTdjlkById(id);
    }
    // 单位确认
    @GetMapping("/dwqr")
    public Map<String, Object> dwqr(int id) {
        return tdjlkService.dwqr(id);
    }
    // 删除投递记录
    @PostMapping("/deleteTdjlkById")
    public Map<String, Object> deleteTdjlkById(int id) {return tdjlkService.deleteTdjlkById(id);}

    // 学生取消/启用 投递--通过id
    @PostMapping("/UpdateTdjlkQyztById")
    public Map<String, Object> cancelTdJl(int id,int qyzt) {
        return tdjlkService.UpdateTdjlkQyztById(id,qyzt);
    }

    // 获取学生简历列表
    @GetMapping("/getTdjlk")
    public Map<String, Object> getTdjlk(int  Style,String YHM,int GWDM) {
        return tdjlkService.getTdjlk(Style,YHM,GWDM);
    }

    // 单位用户 回应投递
    @PostMapping("/Huiying")
    public  Map<String, Object> huiying(int id, String hynr, String dwyh,int hyjg) {
        return tdjlkService.huiying(id, hynr, dwyh, hyjg);
    }

}
