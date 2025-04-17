package org.sems.sems.Controller;
import org.sems.sems.entity.DataZphjlk;
import org.sems.sems.service.DataZphjlkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
@RestController
@RequestMapping("/datazphjlk")
public class DataZphjlkController {

    @Autowired
    private DataZphjlkService datazphjlkService;


  /*  @QYDM int ,-- 启用代码 1.0 。2全部

    @ISJUSTONE int ,--是否只获取一条招聘会数据，@ISJUSTONE为1时，其他参数（除了@ZPHID）无用
    @ZPHID int ,-- 招聘会ID，当@ISJUSTONE为1时有用

    @ISJUSTONEYH int, --是否只获取一个用户发布的，
    @YHM nvarchar ,-- 当@ISJUSTYH为1时，会用到此参数！
    @YHSFDM int,

    @getBySHR int , --是否通过审核人获取招聘会
    @SHR nvarchar  ,--审核人用户名
    @SHRSFDM int  --审核人用户SFDM*/

    @GetMapping("/getDataZphjlk")
    public Map<String, Object> getDataZphjlk( int QYDM, int ISJUSTONE, int ZPHID, int ISJUSTONEYH, String YHM, int YHSFDM, int getBySHR, String SHR, int SHRSFDM)
    {return datazphjlkService.getDataZphjlk(QYDM, ISJUSTONE, ZPHID, ISJUSTONEYH, YHM, YHSFDM, getBySHR, SHR, SHRSFDM);  }

    @PostMapping("/addDataZphjlk")
    public Map<String, Object> addDataZphjlk(DataZphjlk dataZphjlk) {
        return datazphjlkService.insertDataZphjlk(dataZphjlk);
    }
    @PostMapping("/updateDataZphjlk")
    public Map<String, Object> updateDataZpjzk(DataZphjlk dataZphjlk) {
        return datazphjlkService.updateDataZphjlk(dataZphjlk);
    }
    @PostMapping("/deleteDataZphjlk")
    public Map<String, Object> deleteDataZpjzk(int id) {
        return datazphjlkService.deleteDataZphjlk(id);
    }
}
