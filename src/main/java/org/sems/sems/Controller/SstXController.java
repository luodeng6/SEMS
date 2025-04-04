package org.sems.sems.Controller;

import org.sems.sems.Public.PublicService;
import org.sems.sems.entity.Dhjlk;
import org.sems.sems.service.SstXService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

// 实时通讯
@RestController
@RequestMapping("/sstx")
public class SstXController {

    @Autowired
    SstXService sstXService;
    @Autowired
    PublicService publicService;



    // 获取某用户的所有对话记录
    @GetMapping("/getDhjlList")
    public Map<String, Object> getDhjlList(String yhm,int yhsfdm) {
        return sstXService.getDhjlList(yhm, yhsfdm);
    }

    // 获取用户信息
    @GetMapping("/getUserInfo")
    public Map<String, Object> getUserInfo(String yhm,int yhsfdm) {
        return publicService.getUserData(yhm, yhsfdm);
    }



    // 新建对话
    @PostMapping("/addNewlxr")
    public Map<String, Object> addNewlxr(Dhjlk dhjlk) {
        return sstXService.addNewlxr(dhjlk);
    }


    /**
     * 获取对话记录
     *
     * @param yhm      用户名
     * @param yhsfdm   用户身份代码
     * @param lyyhsfdm 另一用户身份代码
     * @param lyyhm    另一用户名
     * @return 返回结果
     */
    @GetMapping("/getdhjl")
    public Map<String, Object> getdhjl(@RequestParam("yhm") String yhm,
                                       @RequestParam("yhsfdm") int yhsfdm,
                                       @RequestParam("lyyhsfdm") int lyyhsfdm,
                                       @RequestParam("lyyhm") String lyyhm) {
        return sstXService.getDhjl(yhm, yhsfdm, lyyhsfdm, lyyhm);
    }
}
