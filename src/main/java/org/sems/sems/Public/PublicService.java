package org.sems.sems.Public;

import java.util.List;
import java.util.Map;

public interface PublicService {

    //获取用户信息接口
   /* List<Map<String, Object>> getUser(int userRole, int state);*/



    List<List<Map<String, Object>>> get_data_from_CCGC(String SQLTEXT);

    //登录接口，使用Tamplate模板
      Map<String, Object>  LoginInterface  (String username, String password,String UserRole);

    // 读取JSON文件接口
      Map<String, Object> readJSONFile(String filePath);
    // 获取单一用户信息接口
    List<Map<String, Object>> getUserOneType(int userRole, int state);
    // 获取所有用户信息接口
    List<List<Map<String, Object>>> getUserAllType(int state) ;
}
