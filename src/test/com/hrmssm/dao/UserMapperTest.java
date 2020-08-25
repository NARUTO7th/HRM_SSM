package com.hrmssm.dao;

import com.hrmssm.pojo.User;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserMapperTest {
    
    @Autowired
    UserMapper userMapper;

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    @Test
    public void findUserByNameAndPwd() {
        User admin = userMapper.findUserByNameAndPwd ("admin", "123456");
        Assert.assertEquals (java.util.Optional.of (1),admin.getId ());
    }

    @Test
    public void insertByObject() {
    }

    @Test
    public void selectUserByName() {
    }
}