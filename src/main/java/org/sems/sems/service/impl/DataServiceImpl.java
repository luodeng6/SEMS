package org.sems.sems.service.impl;

import org.sems.sems.Mapper.*;
import org.sems.sems.Public.PublicService;
import org.sems.sems.entity.*;
import org.sems.sems.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.util.*;


@Service
public class DataServiceImpl  implements DataService {
 @Autowired
 private PublicService publicService;

    @Autowired
    private SfdmkMapper sfdmkMapper;//省份代码库
    @Autowired
    private XlttkMapper xltdkMapper;//学历天梯库
    @Autowired
    private DWXZKMapper dwxzdkMapper;//单位性质库
    @Autowired
    private DWGMKMapper dwgmkMapper;//单位规模库
    @Autowired
    private DWHYDMKMapper dwhydkMapper;//单位行业代码库





    /**
     * 获取所有基础数据:数据集顺序按照存储过程的顺序来
     * : SFDMK、XLTTK、DWXZK、DWGMK、DWHYDMK
     */
    @Override
    public  Map<String, Object> get_JCSJ1() {
        Map<String, Object> returnMap =new HashMap<>();
       try {
           Map<String, Object> dataList = new HashMap<>();
           List<List<Map<String, Object>>> dataReault =publicService.get_data_from_CCGC("{call usp_Get_JCSJ()}");
           dataList.put("SFDMK", dataReault.get(0));
           dataList.put("XLTTK", dataReault.get(1));
           dataList.put("DWXZK", dataReault.get(2));
           dataList.put("DWGMK", dataReault.get(3));
           dataList.put("DWHYDMK", dataReault.get(4));
           returnMap.put("data", dataList);
           returnMap.put("code", 200);
           returnMap.put("msg", "success");
           returnMap.put("result", true);
           return returnMap;
       }catch (Exception e){
           e.printStackTrace();
           returnMap.put("code", 500);
           returnMap.put("msg", "error");
           returnMap.put("data", null);
           returnMap.put("result", false);
           return returnMap;
       }
    }


    public List<String> GetMapColumns(Object obj) {
        List<String> columns = new ArrayList<>();
        Field[] fields = obj.getClass().getDeclaredFields();
        for (Field field : fields) {
            // 过滤掉 serialVersionUID 字段
            if (!field.getName().equals("serialVersionUID")) {
                columns.add(field.getName()); // 获取字段名
            }
        }
        return columns;
    }


    /**
     * 获取所有基础数据:数据集顺序按照存储过程的顺序来
     * : SFDMK、XLTTK、DWXZK、DWGMK、DWHYDMK
     */
    @Override
    public  Map<String, Object> get_JCSJ2() {
        Map<String, Object> returnMap =new HashMap<>();
        try {
            Map<String,Object>  AllData=new HashMap<>();

            List<Sfdmk> sfdmkList=sfdmkMapper.getAllSfdmk();
            List<Xlttk> xltdkList=xltdkMapper.getAllXlttk();
            List<Dwxzk> dwxzdkList=dwxzdkMapper.getAllDWXK();
            List<Dwgmk> dwgmkList=dwgmkMapper.getAllDwgmk();
            List<Dwhydmk> dwhydkList=dwhydkMapper.getAllDwhydmk();

            // 组装数据
            // 省份代码库
            // 学历天梯库
            // 单位性质库
            // 单位规模库
            // 单位行业代码库
             Map<String,Object>  SfdmkResponse =new HashMap<>();
             Map<String,Object>  XlttkResponse =new HashMap<>();
             Map<String,Object>  DwxzkResponse =new HashMap<>();
             Map<String,Object>  DwgmkResponse =new HashMap<>();
             Map<String,Object>  DwhydmkResponse =new HashMap<>();

             SfdmkResponse.put("data",sfdmkList);
             XlttkResponse.put("data",xltdkList);
             DwxzkResponse.put("data",dwxzdkList);
             DwgmkResponse.put("data",dwgmkList);
             DwhydmkResponse.put("data",dwhydkList);

             // 获取列名
            SfdmkResponse.put("columns",GetMapColumns(sfdmkList.get(0)));
            XlttkResponse.put("columns",GetMapColumns(xltdkList.get(0)));
            DwxzkResponse.put("columns",GetMapColumns(dwxzdkList.get(0)));
            DwgmkResponse.put("columns",GetMapColumns(dwgmkList.get(0)));
            DwhydmkResponse.put("columns",GetMapColumns(dwhydkList.get(0)));


             AllData.put("SFDMK",SfdmkResponse);
             AllData.put("XLTTK",XlttkResponse);
             AllData.put("DWXZK",DwxzkResponse);
             AllData.put("DWGMK",DwgmkResponse);
             AllData.put("DWHYDMK",DwhydmkResponse);

            returnMap.put("data", AllData);
            returnMap.put("code", 200);
            returnMap.put("msg", "success");
            returnMap.put("result", true);
        }catch (Exception e){
            e.printStackTrace();
            returnMap.put("code", 500);
            returnMap.put("msg", "server error");
            returnMap.put("data", null);
            returnMap.put("result", false);
        }
        return returnMap;
    }

    @Autowired
    private XlttkMapper xlttkMapper;// 学历天梯库
    @Autowired
    private BjdmkMapper bjdmkMapper; // 班级代码库
    @Autowired
    ZydmkMapper zydmkMapper; // 专业代码库
    /**
     * 获取学生管理所需数据
     */
    @Override
    public Map<String, Object> get_XSGLDATA() {
       Map<String, Object> returnMap =new HashMap<>();
        try {
            Map<String, Object> dataList = new HashMap<>();
            dataList.put("XLTTK",xlttkMapper.getAllXlttk());
            dataList.put("BJDMK",bjdmkMapper.getAllBjdmk());
            dataList.put("ZYDMK",zydmkMapper.getAllZydmk());
            returnMap.put("data", dataList);
            returnMap.put("code", 200);
            returnMap.put("msg", "success");
            returnMap.put("result", true);
        }catch (Exception e){
            e.printStackTrace();
            returnMap.put("code", 500);
            returnMap.put("msg", "server error");
            returnMap.put("data", null);
            returnMap.put("result", false);
        }
        return returnMap;
    }


}
