package com.xxx.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.orm.annotation.Table;

@Getter
@Setter
@ToString
@Table("sys_role")
public class SysRole {
    private Long id;
    private String code;
    private String name;
    private Integer level;
    private Integer sort;
    private Boolean common;
    private String icon;
    private String path;
}
