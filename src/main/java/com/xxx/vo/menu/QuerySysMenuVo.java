package com.xxx.vo.menu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import shz.core.model.Range;
import shz.orm.annotation.Where;
import shz.orm.enums.Condition;

import java.util.Set;

@Getter
@Setter
@ToString
public class QuerySysMenuVo {
    @Where
    private String appName;
    @Where
    private Set<String> location;
    @Where
    private Range<Integer> level;
    @Where(condition = Condition.LIKE_RIGHT)
    private String tag;
}
