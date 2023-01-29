package com.xxx.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.core.structure.config.BigMapConfig;
import shz.orm.annotation.Column;
import shz.orm.annotation.Id;
import shz.orm.annotation.Table;
import shz.orm.annotation.Where;

import java.util.List;

/**
 * @author system
 * @description 系统角色
 */
@Getter
@Setter
@ToString
@Table("sys_role")
public class SysRole {
    /**
     * 主键
     */
    @Id
    private Long id;
    /**
     * 编码
     */
    @Where
    private String code;
    /**
     * 名称
     */
    @Where
    private String name;
    /**
     * 排序
     */
    @Where
    private Integer sort;
    /**
     * 图标资源id
     */
    @Where
    @JsonIgnore
    private Long icon;
    /**
     * 路径
     */
    @Where
    private String path;
    /**
     * 图标路径
     */
    @Column(exist = false)
    private String iconPath;
    /**
     * 禁用
     */
    @Column(exist = false)
    private Boolean disabled;
    /**
     * 权限配置
     */
    @JsonIgnore
    @Column(exist = false)
    private BigMapConfig permissionConfig;
    /**
     * 接口集
     */
    @Column(exist = false)
    private List<Long> apiIds;
    /**
     * 菜单集
     */
    @Column(exist = false)
    private List<Long> menuIds;
}
