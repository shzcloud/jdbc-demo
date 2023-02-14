package com.xxx.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.orm.annotation.Table;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Table("sys_user")
public class SysUser {
    private Long id;
    private LocalDateTime createTime;
    private String username;
    private String password;
    private String salt;
    private String realName;
    private String nickName;
    private Integer sex;
    private String mobile;
    private String email;
    private String identity;
    private String avatar;
    private String state;
}
