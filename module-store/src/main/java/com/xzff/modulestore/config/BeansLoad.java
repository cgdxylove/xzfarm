package com.xzff.modulestore.config;//package com.farm.xzfarm.config;
//
//import beans.constant.RedisConstant;
//import com.alibaba.fastjson.JSON;
//import com.xzff.modulestore.beans.model.ProSeckill;
//import com.farm.xzfarm.dao.ProSeckillMapper;
//import com.farm.xzfarm.service.cache.CacheService;
//import com.fasterxml.jackson.databind.util.JSONPObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.ApplicationArguments;
//import org.springframework.boot.ApplicationRunner;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.stereotype.Component;
//
////@Component
//public class BeansLoad implements ApplicationRunner {
//    @Autowired
//    private ProSeckillMapper proSeckillMapper;
//    @Autowired
//    private CacheService cacheService;
//
//    @Override
//    public void run(ApplicationArguments args) throws Exception {
//        cacheService.set("seckill","10000");
//        ProSeckill proSeckill = proSeckillMapper.selectByPrimaryKeyAndStatus(1,1);
//        if(proSeckill != null){
//            String key = RedisConstant.PROSECKILL_ID + "_seckill";
//            String proSeckillStr = JSON.toJSONString(proSeckill);
//            Boolean is =  cacheService.set(key,proSeckillStr);
//            if(is){
//                cacheService.expire(key,60);
//            }
//           Integer saleNum =  proSeckill.getSaledNum();
//            String  num = String.valueOf(saleNum);
//            String key_saleNum = RedisConstant.PROSECKILL_ID+"_saleNum";
//            cacheService.set(key_saleNum,num,60);
//            cacheService.set(key_saleNum,"100",60);
//        }
//    }
//}
