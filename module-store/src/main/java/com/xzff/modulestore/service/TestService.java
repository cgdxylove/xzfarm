package com.xzff.modulestore.service;

import com.xzff.modulestore.dao.TestMapper;
import com.xzff.modulestore.service.cache.CacheService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SessionCallback;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

@Service
@Slf4j
public class TestService {

    @Autowired
    private TestMapper testDao;
    @Autowired
    private CacheService cacheService;
    @Autowired
    RedisTemplate redisTemplate ;



    SessionCallback sessionCallback = new SessionCallback() {
        @Override
        public Object execute(RedisOperations redisOperations) throws DataAccessException {
            redisOperations.watch("seckill");
            redisOperations.multi();
            redisTemplate.opsForValue().decrement("seckill",1L);
            return redisOperations.exec();
        }
    };

public void test2(){
    Object  results =  redisTemplate.execute(sessionCallback);
}

    public long testService(){
        Date date1 = new Date();
        Long storeNum = redisTemplate.opsForValue().get("seckill")==null?0:Long.valueOf(redisTemplate.opsForValue().get("seckill").toString());
        System.out.println("=======================================storeNum=============>>"+storeNum);
       if(storeNum<=0){
           //没有库存
           return 1;
       }
       Object  results =  redisTemplate.execute(sessionCallback);
       if(results ==null){
            //没有抢到，2s之后可以再次参与，
           //cacheService.set("seckill_user_,"+"1","N");
           cacheService.incr("fail",1);
           return 2;
       }else{//秒杀成功，不给第二次机会
           //List<Long> list = (List<Long>) results;
           //cacheService.set("seckill_user_,"+"1","Y");
           //List<Long> list = (List<Long>)results;
           ArrayList<Long> longs = (ArrayList<Long>)results;
           if (longs.size()>0&&longs.get(0)>=0)
                cacheService.incr("success",1L);
           else
               cacheService.incr("fail",1);
       }
        System.out.println("一条请求时间=============================>"+(new Date().getTime()-date1.getTime()));
        return 4;
    }

    public long testService1(){
        try{
            Long  seckill =  cacheService.decr("seckill",1);
            log.debug("========================》》》》》》》》》》》"+seckill);
            return seckill;
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }


}