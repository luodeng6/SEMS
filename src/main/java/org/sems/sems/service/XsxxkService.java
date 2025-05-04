package org.sems.sems.service;

import org.sems.sems.entity.Xsxxk;

import java.util.Map;

public interface XsxxkService {

    /**
    * 获取学生信息
     BYYHM int ,
     YHM nvarchar(50),
     STUID int
    * @return Map<String, Object>
    * */
    Map<String, Object> getXxxk(int BYYHM, String YHM, int STUID);
    /**
    * 插入学生信息
    * @param xsxxk Xsxxk
    * @return Map<String, Object>
    * */
    Map<String, Object> insertXsxxk(Xsxxk xsxxk);

    /**
    * 更新学生信息
    * @param xsxxk Xsxxk
    * @return Map<String, Object>
    * */
    Map<String, Object> updateXsxxk(Xsxxk xsxxk);
}
