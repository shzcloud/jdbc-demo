package com.xxx.controller;

import com.xxx.entity.SysMenu;
import com.xxx.service.SysMenuService;
import com.xxx.vo.menu.AddSysMenuVo;
import com.xxx.vo.menu.SysMenuDetailVo;
import com.xxx.vo.menu.UpdateSysMenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import shz.core.FieldSetter;
import shz.core.model.Response;
import shz.orm.entity.TreeEntity;

import javax.validation.Valid;
import java.util.List;

/**
 * 系统菜单
 */
@RestController
@RequestMapping("/system/v1/menu")
public class SysMenuController {
    @Autowired
    SysMenuService sysMenuService;

    /**
     * 新增系统菜单
     */
    @PostMapping
    public Response<Long> add(@RequestBody @Valid AddSysMenuVo vo) {
        SysMenu entity = FieldSetter.copy(vo, new SysMenu());
        sysMenuService.add(entity);
        return Response.ok(entity.getId());
    }

    /**
     * 编辑系统菜单
     */
    @PutMapping
    public Response<Void> update(@RequestBody @Valid UpdateSysMenuVo vo) {
        SysMenu entity = FieldSetter.copy(vo, new SysMenu());
        sysMenuService.update(entity);
        return Response.ok();
    }

    /**
     * 删除系统菜单
     *
     * @param ids 菜单id集
     */
    @DeleteMapping("{ids}")
    public Response<Void> delete(@PathVariable("ids") List<Long> ids) {
        sysMenuService.delete(ids);
        return Response.ok();
    }

    /**
     * 系统菜单详情
     *
     * @param id 菜单id
     */
    @GetMapping("detail/{id}")
    public Response<SysMenuDetailVo> detail(@PathVariable("id") Long id) {
        SysMenuDetailVo detail = sysMenuService.detail(id);
        return Response.ok(detail);
    }

    /**
     * 系统菜单列表
     */
    @GetMapping("list")
    public Response<List<SysMenu>> list() {
        List<SysMenu> sysMenus = sysMenuService.list();

        //返回树形结构
        List<SysMenu> result = TreeEntity.group(sysMenus);
        TreeEntity.sort(result);
        return Response.ok(result);
    }
}
