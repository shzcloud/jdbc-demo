package com.xxx.vo.menu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SysMenuDetailVo {
    private Long id;
    private String name;
    private Integer sort;
    private String iconPath;
    private String path;
    private Boolean expanded;
}
