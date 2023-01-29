package com.xxx.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.orm.annotation.Column;
import shz.orm.annotation.Table;
import shz.orm.annotation.Where;
import shz.orm.entity.TreeEntity;

/**
 * @author system
 * @description 系统菜单
 */
@Getter
@Setter
@ToString(callSuper = true)
@Table("sys_menu")
public class SysMenu extends TreeEntity<SysMenu> {
    /**
     * 应用程序名
     */
    @Where
    private String appName;
    /**
     * 位置
     */
    @Where
    private String location;
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
     * 路由
     */
    @Where
    private String path;
    /**
     * 是否展开
     */
    @Where
    private Boolean expanded;
    /**
     * 图标路径
     */
    @Column(exist = false)
    private String iconPath;
}
