package org.sems.sems.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

/**
 * 单位用户库(Dwyhk)实体类
 *
 * @author makejava
 * @since 2025-01-30 22:30:49
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dwyhk implements Serializable {
    private static final long serialVersionUID = -13438803186051493L;

    private Integer id;
    /**
     * 单位代码(对应)
     */
    private Integer dydw;
    /**
     * 用户名
     */
    private String yhm;
    /**
     * 密码
     */
    private String mm;
    /**
     * 停用代码
     */
    private Integer tybz;
    /**
     * 用户名称
     */
    private String yhxm;
    /**
     * 用户姓名
     */
    private String sex;
    /**
     * 职位
     */
    private String zw;
    /**
     * 所属单位,对应DWDMK的DWDM
     */
    private Integer ssdw;
    /**
     * 认证标志
     */
    private Integer rzbz;

}

