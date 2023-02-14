package com.xxx.service.impl;

import com.xxx.constant.LocalLockKey;
import com.xxx.entity.SysMenu;
import com.xxx.entity.SysRoleMenu;
import com.xxx.service.SysMenuService;
import com.xxx.vo.menu.SysMenuDetailVo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import shz.core.FieldSetter;
import shz.core.lock.Lock;
import shz.core.lock.LockKey;
import shz.core.msg.ClientFailureMsg;
import shz.core.msg.ServerFailureMsg;
import shz.jdbc.SimpleService;
import shz.orm.annotation.Transactional;
import shz.orm.entity.TreeEntity;
import shz.orm.enums.Condition;

import java.util.Collection;
import java.util.List;

/**
 * @author system
 * @description 系统菜单服务实现类
 */
@Service
class SysMenuServiceImpl extends SimpleService<SysMenu> implements SysMenuService {
    @Value("${spring.application.name:DEFAULT}")
    String appName;

    @Lock(LocalLockKey.MENU)
    public int add(@LockKey("parentId") SysMenu entity) {
        entity.setAppName(appName);
        return jdbcService.insertTree(entity, tree -> ClientFailureMsg.requireNon(checkUniqueForInsert(tree, "parentId", "name", "path"), "菜单名称和路径已经存在"), "菜单");
    }

    @Lock(LocalLockKey.MENU)
    public int update(@LockKey("parentId") SysMenu entity) {
        entity.setAppName(null);
        return jdbcService.updateTree(entity, tree -> ClientFailureMsg.requireNon(checkUniqueForUpdate(tree, "parentId", "name", "path"), "菜单名称和路径已经存在"), "菜单");
    }

    @Transactional
    public int delete(Collection<?> ids) {
        checkId(ids);
        checkBoundData(SysRoleMenu.class, "menuId", ids, "菜单id%s已绑定角色");
        jdbcService.deleteByColumn(SysRoleMenu.class, "menuId", ids, Condition.IN);
        int row = super.delete(ids);
        ServerFailureMsg.requireNon(row != ids.size(), "删除菜单失败");
        return row;
    }

    @Override
    public List<SysMenu> list() {
        return TreeEntity.group(selectListByColumn("appName", appName));
    }

    @Override
    public SysMenuDetailVo detail(Long id) {
        SysMenu entity = selectById(id);
        ClientFailureMsg.requireNonNull(entity, "菜单不存在");
        return FieldSetter.copy(entity, new SysMenuDetailVo());
    }
}
