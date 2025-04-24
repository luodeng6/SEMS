package org.sems.sems.Controller;

import org.sems.sems.entity.DataZpjzk;
import org.sems.sems.service.DataZpjzkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/datazpjzk")
public class DataZpjzkController {

    @Autowired
    private DataZpjzkService dataZpjzkService;
    /*
      @FBBZ int ,-- 发布标志 1.0 。2全部

      @ISJUSTONE int ,--是否只获取一条招聘简章数据，@ISJUSTONE为1时，其他参数（除了@ZPJZID）无用
      @ZPJZID int ,-- 招聘简章ID，当@ISJUSTONE为1时有用

      @ISJUSTONEYH int, --是否只获取一个用户发布的，
      @YHM nvarchar(50) ,-- 当@ISJUSTYH为1时，会用到此参数！
      @YHSFDM int,

      @ISJUSTONEDW int ,--是否通过单位代码的招聘简章
      @DWDM int  -- 单位代码
      */
    @GetMapping("/getZpjzk")
    public Map<String, Object> getZpjzk(int fbbz, int isjustone, int zpjzid, int isjustoneyh, String yhm, int yhsfdm, int isjustonedw, int dwdm) {
        return dataZpjzkService.getZpjzk(fbbz, isjustone, zpjzid, isjustoneyh, yhm, yhsfdm, isjustonedw, dwdm);
    }

    @PostMapping("/saveZpjzk")
    public Map<String, Object> saveZpjzk(DataZpjzk dataZpjzk) {
        return dataZpjzkService.saveZpjzk(dataZpjzk);
    }
    @GetMapping("/deleteZpjzk")
    public Map<String, Object> deleteZpjzk(Integer id) {
        return dataZpjzkService.deleteZpjzk(id);
    }
    @PostMapping("/updateZpjzk")
    public Map<String, Object> updateZpjzk(DataZpjzk dataZpjzk) {
        return dataZpjzkService.updateZpjzk(dataZpjzk);
    }

    @PostMapping("/uploadImg")
    public Map<String, Object> uploadImg(MultipartFile file) {
        return dataZpjzkService.uploadImg(file);
    }

}
