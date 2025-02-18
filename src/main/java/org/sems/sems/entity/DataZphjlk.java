package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * (DataZphjlk)实体类  --  招聘会记录库
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataZphjlk implements Serializable {
    private static final long serialVersionUID = -37452845146694536L;
    /**
     * 招聘会代码   招聘会记录库
     */
    private Integer id;
    /**
     * 招聘会标题
     */
    private String zphbt;
    /**
     * 单位代码
     */
    private Integer dwdm;
    /**
     * 位置标志，1校内，2校外
     */
    private Integer wzbz;
    /**
     * 举办时间
     */
    private Date jbsj;
    /**
     * 对应岗位代码，此次招聘会对应的岗位代码，多个就用+来链接，如1+2+3...
     */
    private String dygwdm;
    /**
     * 所在学校
     */
    private String szxx;
    /**
     * 举办地点
     */
    private String jbdd;
    
}

