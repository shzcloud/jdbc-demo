package com.xxx.service;

import com.xxx.entity.SysMenu;
import com.xxx.vo.menu.SysMenuDetailVo;
import shz.jdbc.IService;

import java.util.List;

/**
 * @author system
 * @description 系统菜单服务接口
 */
public interface SysMenuService extends IService<SysMenu> {
    List<SysMenu> list();

    SysMenuDetailVo detail(Long id);
}
