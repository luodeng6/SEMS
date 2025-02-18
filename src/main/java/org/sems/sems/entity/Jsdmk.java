package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 教师代码库(Jsdmk)实体类 -- 教师代码库
 *
 * @author makejava
 * @since 2024-12-07 11:52:11
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Jsdmk implements Serializable {
    private static final long serialVersionUID = 507568674280518151L;

    private Integer id;
    /**
     * 教师名称
     */
    private Object jsmc;
    /**
     * 教师性别
     */
    private Object sex;
    /**
     * 登录账号
     */
    private String dlzh;
    /**
     * 登录密码
     */
    private String dlmm;
    /**
     * 启用代码
     */
    private Integer qydm;


}

