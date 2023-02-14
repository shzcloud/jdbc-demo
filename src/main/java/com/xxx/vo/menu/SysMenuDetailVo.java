package com.xxx.vo.menu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SysMenuDetailVo {
    private Long id;
    private Integer sort;
    private String name;
    private String icon;
    private String path;
    private Boolean expanded;
}
