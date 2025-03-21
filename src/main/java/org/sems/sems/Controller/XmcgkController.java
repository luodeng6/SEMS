package org.sems.sems.Controller;

import org.sems.sems.entity.Xmcgk;
import org.sems.sems.service.XmcgkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;


@RestController
@RequestMapping("xmcgk")
public class XmcgkController {
    @Autowired
    private XmcgkService xmcgkService;

    @RequestMapping("/InsertXmcgk")
    public Map<String, Object> insertXmcgk(Xmcgk xmcgk) {
        return  xmcgkService.insertXmcgk(xmcgk);
    }

    @RequestMapping("/UpdateXmcgk")
    public Map<String, Object> updateXmcgk(Xmcgk xmcgk) {
        return  xmcgkService.updateXmcgk(xmcgk);
    }

    @GetMapping("/getXmcgk")
    public Map<String, Object> getXmcgk(
                        @RequestParam(defaultValue = "1", required = false) int QYDM,
                        @RequestParam(defaultValue = "0", required = false) int ISGETALL,
                        @RequestParam(defaultValue = "-1", required = false) int STUID) {
        return  xmcgkService.getXmcgk( QYDM, ISGETALL,  STUID);
    }

    // 上传成果附件文件
    @PostMapping("/uploadFile")
    public Map<String,Object> uploadZsZp(Integer id,MultipartFile cgfj){
        return xmcgkService.uploadFJFile(id, cgfj);
    }
}
