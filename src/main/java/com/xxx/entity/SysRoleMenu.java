package com.xxx.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.orm.annotation.Table;

@Getter
@Setter
@ToString
@Table("sys_role_menu")
public class SysRoleMenu {
    private Long id;
    private Long roleId;
    private Long menuId;
}
