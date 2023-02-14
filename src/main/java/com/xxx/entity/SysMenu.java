package com.xxx.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.orm.annotation.Table;
import shz.orm.entity.TreeEntity;

@Getter
@Setter
@ToString(callSuper = true)
@Table("sys_menu")
public class SysMenu extends TreeEntity<SysMenu> {
    private String appName;
    private String location;
    private String name;
    private String icon;
    private String path;
    private Boolean expanded;
}
