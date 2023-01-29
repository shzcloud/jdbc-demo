package com.xxx.repository;

import com.xxx.entity.SysMenu;
import com.xxx.vo.menu.QuerySysMenuVo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import shz.core.model.Range;
import shz.core.tag.ixx.ILTag;

import java.util.List;

@SpringBootTest
public class SysMenuRepositoryTest {
    @Autowired
    SysMenuRepository repository;

    @Test
    public void list() {
        List<SysMenu> list = repository.list(null, null, new Range<>(1, 2), "2.");
        list.forEach(System.out::println);
    }

    @Test
    public void orList() {
        List<SysMenu> list = repository.orList(null, null, new Range<>(1, 2), "2.");
        list.forEach(System.out::println);
    }

    @Test
    public void orList2() {
        QuerySysMenuVo vo = new QuerySysMenuVo();
        vo.setLevel(new Range<>(1, 2));
        vo.setTag("2.");
        List<SysMenu> list = repository.orList2(vo);
        list.forEach(System.out::println);
    }

    @Test
    public void countByLevel() {
        List<ILTag<String>> list = repository.countByLevel();
        list.forEach(System.out::println);
    }
}