package org.sems.sems.Controller;

import org.sems.sems.entity.Xszsk;
import org.sems.sems.service.XszskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/xszsk")
public class XszskController {

    @Autowired
    private XszskService xszskService;
    @GetMapping("/getXszsk")
    public Map<String, Object> getXszsk(Integer QYDM,Integer ISGETALL,Integer STUID) {
        return xszskService.getXszsk(QYDM,ISGETALL,STUID) ;
    }

    @PostMapping("/addXszsk")
    public Map<String,Object> AddXszsk(Xszsk xszsk){
        return xszskService.addXszsk(xszsk);
    }

    @GetMapping("/deleteXszsk")
    public Map<String,Object> deleteXszsk(Integer id){
        return xszskService.deleteXszsk(id);
    }

    @PostMapping("/updateXszsk")
    public Map<String,Object> updateXszsk(Xszsk xszsk){
        return xszskService.updateXszsk(xszsk);
    }
    // 上传证书照片
    @PostMapping("/uploadFile")
    public Map<String,Object> uploadZsZp(Integer id,MultipartFile zszp,MultipartFile zsfj){
        return xszskService.uploadFile(id,zszp,zsfj);
    }
}
