package com.xxx.repository;

import com.xxx.entity.SysMenu;
import com.xxx.vo.menu.QuerySysMenuVo;
import shz.core.model.Range;
import shz.core.tag.ixx.ILTag;
import shz.orm.annotation.Fields;
import shz.orm.annotation.Query;
import shz.orm.annotation.Repository;
import shz.orm.annotation.Where;
import shz.orm.enums.Condition;

import java.util.List;
import java.util.Set;

@Repository
public interface SysMenuRepository {
    @Query("SELECT id,parent_id,level,tag,app_name,location,name " +
            "FROM sys_menu " +
            "#{WHERE app_name = :appName} " +
            "#{AND location IN :location} " +
            "#{AND level BETWEEN :level.min AND :level.max} " +
            "#{AND tag LIKE CONCAT(:tag, '%')}"
    )
    List<SysMenu> list(String appName, Set<String> location, Range<Integer> level, String tag);

    /**
     * 在没有指定condition的情况下
     * 集合或数组将被看作IN
     * RangeL类将被看作BETWEEN
     * 其余视为=(具体什么条件可参看编译后的class文件)
     * 注解Fields指定查询的列
     */
    @Fields({"id", "parentId", "level", "tag", "appName", "location", "name"})
    List<SysMenu> orList(String appName, Set<String> location, Range<Integer> level, @Where(condition = Condition.LIKE_RIGHT) String tag);

    @Fields({"id", "parentId", "level", "tag", "appName", "location", "name"})
    List<SysMenu> orList2(QuerySysMenuVo vo);

    @Query("SELECT count(id) tag, level data " +
            "FROM sys_menu " +
            "GROUP BY data " +
            "ORDER BY data"
    )
    List<ILTag<String>> countByLevel();
}
