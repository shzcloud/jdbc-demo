package com.xxx.repository;

import shz.orm.annotation.Query;
import shz.orm.annotation.Repository;

@Repository
public interface SysUserRepository {
    @Query("SELECT COUNT(*) FROM sys_user WHERE state = 'ON_LINE'")
    int onLineCount();
}
