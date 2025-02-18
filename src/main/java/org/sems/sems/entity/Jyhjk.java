package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 就业环境库(Jyhjk)实体类
 *
 * @author makejava
 * @since 2025-02-03 09:24:45
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Jyhjk implements Serializable {
    private static final long serialVersionUID = 700271317395406744L;
    /**
     * 编号
     */
    private Integer id;
    /**
     * 图片链接
     */
    private String imgurl;
    /**
     * 对应岗位代码
     */
    private Integer gwdm;
    /**
     * 提交时间，默认为插入时间
     */
    private Date tjsj;
}

