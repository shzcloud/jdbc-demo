package com.xxx.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class SysUserRepositoryTest {
    @Autowired
    SysUserRepository repository;

    @Test
    public void onLineCount() {
        int count = repository.onLineCount();
        System.out.println(count);
    }
}