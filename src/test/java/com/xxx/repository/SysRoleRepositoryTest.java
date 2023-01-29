package com.xxx.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class SysRoleRepositoryTest {
    @Autowired
    SysRoleRepository repository;

    @Test
    public void selectCodesByUserid() {
        List<String> roleCodes = repository.selectCodesByUserid(1L);
        roleCodes.forEach(System.out::println);
    }
}