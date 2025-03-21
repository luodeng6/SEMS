package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 项目成果库(Xmcgk)实体类
 *
 * @author makejava
 * @since 2025-03-15 16:42:02
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Xmcgk implements Serializable {
    private static final long serialVersionUID = -60656866521167193L;
    /**
     * 成果编号
     */
    private Integer id;
    /**
     * 项目名称
     */
    private String xmmc;
    /**
     * 项目内容
     */
    private String xmnr;
    /**
     * 学生ID
     */
    private Integer stuid;

    private Integer qydm;
    /**
     * 创建时间
     */
    private Date cjsj;
    /**
     * 项目类型
     */
    private String xmlx;
    /**
     * 项目附件url
     */
    private String xmfj;
}

