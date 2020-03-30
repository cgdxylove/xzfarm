package com.farm.xzfarm.dao;

//import org.apache.ibatis.transaction.Transaction;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class Test {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @org.junit.jupiter.api.Test
    void deleteByPrimaryKey() {
        redisTemplate.watch("seckill");


    }
}
