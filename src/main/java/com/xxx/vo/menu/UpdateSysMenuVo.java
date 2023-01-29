package com.xxx.vo.menu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
public class UpdateSysMenuVo {
    @NotNull(message = "主键不能为空")
    private Long id;
    private Long parentId;
    @NotBlank(message = "名称不能为空")
    private String name;
    private Integer sort;
    private String path;
    private Boolean expanded;
}
