package com.xxx.service.impl;

import com.xxx.constant.LocalCacheKey;
import com.xxx.constant.LocalLockKey;
import com.xxx.entity.SysMenu;
import com.xxx.entity.SysRoleMenu;
import com.xxx.service.SysMenuService;
import com.xxx.vo.menu.SysMenuDetailVo;
import org.springframework.stereotype.Service;
import shz.core.FieldSetter;
import shz.core.lock.Lock;
import shz.core.lock.LockKey;
import shz.core.msg.ClientFailureMsg;
import shz.jdbc.SimpleService;
import shz.orm.annotation.Transactional;
import shz.orm.enums.Condition;
import shz.spring.cache.DelLocalCache;
import shz.spring.cache.GetLocalCache;

import java.util.Collection;
import java.util.List;

/**
 * @author system
 * @description 系统菜单服务实现类
 */
@Service
class SysMenuServiceImpl extends SimpleService<SysMenu> implements SysMenuService {
    @Lock(LocalLockKey.MENU)
    @DelLocalCache(LocalCacheKey.ALL_MENU)
    public int add(@LockKey("parentId") SysMenu entity) {
        return jdbcService.insertTree(entity, tree -> ClientFailureMsg.requireNon(checkUniqueForInsert(tree, "parentId", "name", "path"), "菜单名称和路径已经存在"), "菜单");
    }

    @Lock(LocalLockKey.MENU)
    @DelLocalCache(LocalCacheKey.ALL_MENU)
    public int update(@LockKey("parentId") SysMenu entity) {
        jdbcService.updateTree(entity, tree -> ClientFailureMsg.requireNon(checkUniqueForUpdate(tree, "parentId", "name", "path"), "菜单名称和路径已经存在"), "菜单");
        return 1;
    }

    @Transactional
    @DelLocalCache(value = LocalCacheKey.ALL_MENU)
    public int delete(Collection<?> ids) {
        //删除角色菜单关系
        jdbcService.deleteByColumn(SysRoleMenu.class, "menuId", ids, Condition.IN);
        return super.delete(ids);
    }

    @GetLocalCache(LocalCacheKey.ALL_MENU)
    public List<SysMenu> list() {
        return selectList(null);
    }

    @Override
    public SysMenuDetailVo detail(Long id) {
        SysMenu entity = selectById(id);
        ClientFailureMsg.requireNonNull(entity, "菜单不存在");
        return FieldSetter.copy(entity, new SysMenuDetailVo());
    }
}
