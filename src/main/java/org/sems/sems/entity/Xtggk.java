package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.io.Serializable;

/**
 * 系统公告库(Xtggk)实体类
 *
 * @author makejava
 * @since 2025-03-15 10:17:46
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Xtggk implements Serializable {
    private static final long serialVersionUID = 527275684709990335L;

    private Integer id;
    /**
     * 公告标题
     */
    private String ggbt;

    private String ggnr;

    private String ggnrhtml;
    /**
     * 启用代码
     */
    private Integer qydm;
    /**
     * 创建时间
     */
    private Date cjsj;
    /**
     * 发布者
     */
    private String fbz;
    /**
     * 发布者省身份代码
     */
    private Integer fbzsfdm;
    /**
     * 浏览量
     */
    private Integer lll;
    /**
     * 公告类型
     */
    private String gglx;

}

