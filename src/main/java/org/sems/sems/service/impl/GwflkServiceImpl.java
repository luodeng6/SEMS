package org.sems.sems.service.impl;


import org.sems.sems.Mapper.GwflkMapper;
import org.sems.sems.service.GwflkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * 岗位分类库(Gwflk)表服务实现类
 *
 * @author makejava
 * @since 2025-01-22 18:20:18
 */
@Service
public class GwflkServiceImpl implements GwflkService {

    @Autowired
    private GwflkMapper gwflkMapper;

    /**
     * 获取岗位分类库(Gwflk)表数据
     *
     * @return 岗位分类库(Gwflk)表数据
     */
    @Override
    public Map<String, Object> getGwfl() {
        // TODO: 2025-01-22 实现获取岗位分类库(Gwflk)表数据
        Map<String, Object> result = new HashMap<>();
        try{
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data",gwflkMapper.getGwflk());
            result.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


}
