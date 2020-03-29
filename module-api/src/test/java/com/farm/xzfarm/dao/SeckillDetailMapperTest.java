package com.farm.xzfarm.dao;

import com.farm.xzfarm.beans.model.SeckillDetail;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class SeckillDetailMapperTest extends com.farm.xzfarm.dao.Test{

    @Autowired
    private SeckillDetailMapper seckillDetailMapper;

    @Test
    void insert() {
//        System.out.println(new Date());
//        System.out.println(new Date().getTime());
//        for (int i=0;i<100;i++){
//            SeckillDetail seckillDetail = new SeckillDetail();
//            long userId = i;
//            seckillDetail.setUserId(userId);
//            seckillDetail.setCreateTime(new Date());
//            seckillDetail.setSeckillId(1);
//            Runnable runnable = new Inner(seckillDetail);
//            Thread thread = new Thread(runnable);
//            thread.run();
//        }
//        System.out.println(new Date());
//        System.out.println(new Date().getTime());


    }


    class Inner implements Runnable{

        public SeckillDetail seckillDetail;

        public Inner() {
        }

        public Inner(SeckillDetail seckillDetail) {
            this.seckillDetail = seckillDetail;
        }

        public SeckillDetail getSeckillDetail() {
            return seckillDetail;
        }

        public void setSeckillDetail(SeckillDetail seckillDetail) {
            this.seckillDetail = seckillDetail;
        }

        @Override
        public void run() {
            seckillDetailMapper.insert(seckillDetail);
        }
    }



}