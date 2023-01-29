package com.xxx.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.orm.annotation.Id;
import shz.orm.annotation.Table;
import shz.orm.annotation.Where;

/**
 * @author system
 * @description 系统用户角色关系
 */
@Getter
@Setter
@ToString
@Table("sys_user_role")
public class SysUserRole {
    /**
     * 主键
     */
    @Id
    private Long id;
    /**
     * 用户id
     */
    @Where
    private Long userid;
    /**
     * 角色id
     */
    @Where
    private Long roleId;
}
