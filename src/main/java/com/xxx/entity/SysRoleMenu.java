package com.xxx.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.orm.annotation.Id;
import shz.orm.annotation.Table;
import shz.orm.annotation.Where;

/**
 * @author system
 * @description 系统角色菜单关系
 */
@Getter
@Setter
@ToString
@Table("sys_role_menu")
public class SysRoleMenu {
    /**
     * 主键
     */
    @Id
    private Long id;
    /**
     * 角色id
     */
    @Where
    private Long roleId;
    /**
     * 菜单id
     */
    @Where
    private Long menuId;
}
