package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 对话记录库(Dhjlk)实体类
 *
 * @author makejava
 * @since 2025-03-16 23:03:10
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Dhjlk implements Serializable {
    private static final long serialVersionUID = -38293244678992076L;
    /**
     * 编号
     */
    private Integer id;
    /**
     * 发送者用户名
     */
    private String fromyhm;
    /**
     * 接受者用户名
     */
    private String toyhm;
    /**
     * 发送者SFDM
     */
    private Integer fromyhsfdm;
    /**
     * 接收者身份代码
     */
    private Integer toyhsfdm;

    private Integer qydm;
    /**
     * 是否群发
     */
    private Integer isqf;
    /**
     * 已读标志
     */
    private Integer ydbz;
    /**
     * 发送时间
     */
    private Date sendtime;
    private String nr;
}

