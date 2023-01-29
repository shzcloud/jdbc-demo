package com.xxx.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.core.security.PasswordDetail;
import shz.orm.annotation.Id;
import shz.orm.annotation.Table;
import shz.orm.annotation.Where;

import java.time.LocalDateTime;

/**
 * @author system
 * @description 系统用户
 */
@Getter
@Setter
@ToString
@Table("sys_user")
public class SysUser implements PasswordDetail {
    /**
     * 主键
     */
    @Id
    private Long id;
    /**
     * 创建时间
     */
    @Where
    private LocalDateTime createTime;
    /**
     * 登录账号
     */
    @Where
    private String username;
    /**
     * 账号密码
     */
    @Where
    private String password;
    /**
     * 加密盐
     */
    @Where
    private String salt;
    /**
     * 真实姓名
     */
    @Where
    private String realName;
    /**
     * 昵称
     */
    @Where
    private String nickName;
    /**
     * 性别
     */
    @Where
    private Integer sex;
    /**
     * 手机号
     */
    @Where
    private String mobile;
    /**
     * 邮箱
     */
    @Where
    private String email;
    /**
     * 身份证号
     */
    @Where
    private String identity;
    /**
     * 头像资源id
     */
    @Where
    private Long avatar;
    /**
     * 状态
     */
    @Where
    private String state;
    /**
     * 普通用户标识，对当前开发者帐号唯一，一个openid对应一个公众号
     */
    @Where
    private String openId;
    /**
     * 用户统一标识，针对一个微信开放平台帐号下的应用，同一用户的unionid是唯一的
     */
    @Where
    private String unionId;
}
