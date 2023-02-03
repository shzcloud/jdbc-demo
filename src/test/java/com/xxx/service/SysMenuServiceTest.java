package com.xxx.service;

import com.xxx.entity.SysMenu;
import com.xxx.vo.menu.SysMenuDetailVo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
public class SysMenuServiceTest {
    @Autowired
    SysMenuService service;

    @Test
    public void add() {
        SysMenu entity = new SysMenu();
        //指定ID(如果不指定ID则会自动生成)
        entity.setId(100L);
        entity.setName("this is a test name");
        int row = service.add(entity);
        assertEquals(1, row);
    }

    @Test
    public void update() {
        SysMenu entity = new SysMenu();
        entity.setId(100L);
        entity.setName("this is a test name 2");
        int row = service.update(entity);
        assertEquals(1, row);
    }

    @Test
    public void delete() {
        int row = service.delete(Arrays.asList(100L));
        assertEquals(1, row);
    }

    @Test
    public void list() {
        List<SysMenu> list = service.list();
        list.forEach(System.out::println);
    }

    @Test
    public void detail() {
        SysMenuDetailVo detail = service.detail(100L);
        System.out.println(detail);
    }
}