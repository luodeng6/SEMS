package org.sems.sems.service.impl;
import org.sems.sems.Mapper.XlttkMapper;
import org.sems.sems.entity.Xlttk;
import org.sems.sems.service.XlttkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;

/**
 * (Xlttk)表服务实现类
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
@Service("xlttkService")
public class XlttkServiceImpl implements XlttkService {

    @Autowired
    private XlttkMapper xlttkMapper;

    /**
     * 获取所有学历信息
     * @return
     */
    @Override
    public Map<String, Object> getAllXlttk() {
        Map<String, Object> map = new HashMap<>();
        try {
            // TODO: 查询所有Xlttk
            map.put("code", 200);
            map.put("msg", "success");
            map.put("data", xlttkMapper.getAllXlttk());
            map.put("result", true);
        } catch (Exception e) {
            map.put("code", 500);
            map.put("msg", "error");
            map.put("data", e.getMessage());
            map.put("result", false);
        }
        return map;

    }

    /**
     * 通过ID删除学历信息
     *
     * @param id
     * @return
     */
    @Override
    public Map<String, Object> deleteXlttkByID(int id) {
        Map<String, Object> map = new HashMap<>();
        try {
            if (xlttkMapper.deleteXlttkByID(id) != 0) {
                map.put("code", 200);
                map.put("msg", "success");

                map.put("result", true);
            } else {
                map.put("code", 504);
                map.put("msg", "database error");
                map.put("result", false);
            }
        } catch (Exception e) {
            map.put("code", 500);
            map.put("msg", "server error");
            map.put("result", false);
        }
        return map;
    }

    /**
     * 新增学历信息
     * @param xlttk
     * @return
     */
    @Override
    public Map<String, Object> insertXlttk(Xlttk xlttk) {
        Map<String, Object> map = new HashMap<>();
        try {
            if (xlttkMapper.insertXlttk(xlttk) != 0) {
                map.put("code", 200);
                map.put("msg", "success");
                map.put("result", true);
            } else {
                map.put("code", 504);
                map.put("msg", "database error");
                map.put("result", false);
            }
        } catch (Exception e) {
            map.put("code", 500);
            map.put("msg", "server error");
            map.put("result", false);
        }
        return map;
    }
}
