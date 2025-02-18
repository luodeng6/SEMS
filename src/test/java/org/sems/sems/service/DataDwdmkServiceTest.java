package org.sems.sems.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class DataDwdmkServiceTest {

    @Autowired
    private DataDwdmkService dataDwdmkService;
    // 测试根据单位用户名 获取单位数据
    @Test
    void getDwDataByDwUserName() {
        System.out.println(dataDwdmkService.getDwDataByDwUserName("luo"));
    }
}