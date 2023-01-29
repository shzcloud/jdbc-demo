package com.xxx.repository;

import shz.orm.annotation.Query;
import shz.orm.annotation.Repository;

import java.util.List;

@Repository
public interface SysRoleRepository {
    @Query("SELECT sr.code " +
            "FROM sys_role sr " +
            "INNER JOIN sys_user_role sur ON sr.id = sur.role_id " +
            "#{WHERE sur.userid = :userid}"
    )
    List<String> selectCodesByUserid(Long userid);
}
