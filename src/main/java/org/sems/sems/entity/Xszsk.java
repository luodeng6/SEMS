package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.io.Serializable;

/**
 * 学生证书库(Xszsk)实体类
 *
 * @author makejava
 * @since 2025-03-12 12:39:56
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Xszsk implements Serializable {
    private static final long serialVersionUID = -18433370859436079L;
    /**
     * 编号
     */
    private Integer id;
    /**
     * 证书名称
     */
    private String zsmc;
    /**
     * 证书科目
     */
    private String zskm;
    /**
     * 证书成绩
     */
    private Float zscj;
    /**
     * 证书有效期
     */
    private Date zsyxq;
    /**
     * 颁发机构
     */
    private String bfjg;
    /**
     * 证书附件，文件地址URL
     */
    private String zsfj;
    /**
     * 证书照片
     */
    private String zszp;
    /**
     * 颁发时间
     */
    private Date bfsj;

    private Integer qydm;
    /**
     * 学生ID
     */
    private Integer stuid;
}

