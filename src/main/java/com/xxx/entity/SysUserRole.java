package com.xxx.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.orm.annotation.Table;

@Getter
@Setter
@ToString
@Table("sys_user_role")
public class SysUserRole {
    private Long id;
    private Long userid;
    private Long roleId;
}
