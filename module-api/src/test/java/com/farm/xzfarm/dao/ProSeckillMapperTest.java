package com.farm.xzfarm.dao;

import com.alibaba.fastjson.JSON;
import com.farm.xzfarm.beans.VO.seckill.ProSeckillDetailVO;
import com.farm.xzfarm.beans.VO.seckill.ProSeckillVO;
import com.farm.xzfarm.beans.model.ProSeckill;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
class ProSeckillMapperTest extends com.farm.xzfarm.dao.Test{

    @Autowired
    ProSeckillMapper proSeckillMapper;

    @Test
    void deleteByPrimaryKey() {
    }

    @Test
    void insert() {
    }

    @Test
    void insertSelective() {
    }

    @Test
    void selectByPrimaryKey() {
    }

    @Test
    void updateByPrimaryKeySelective() {
    }

    @Test
    void updateByPrimaryKey() {
    }

    @Test
    void selectByPrimaryKeyAndStatus() {
//        int id = 1 ;
//        int status = 1;
//        ProSeckill proSeckill =proSeckillMapper.selectByPrimaryKeyAndStatus(id,status);
//        System.out.println(proSeckill.toString());
    }
    @Test
    void queryDoingSeckillList() {
        Date date = new Date();
        List<ProSeckillVO> list = proSeckillMapper.queryDoingSeckillList(date);
        System.out.println("==============="+JSON.toJSON(list));
    }

    @Test
    void getProductSeckillDetailVO() {
        Date date = new Date();
        ProSeckillDetailVO proSeckillDetailVO =  proSeckillMapper.getProductSeckillDetailVO(1,date);
        log.debug("=================>>>>>>>>>>>>>>>>"+JSON.toJSONString(proSeckillDetailVO));
    }

    @Test
    void getPackageSeckillDetailVO() {
        Date date = new Date();
        ProSeckillDetailVO proSeckillDetailVO =  proSeckillMapper.getProductSeckillDetailVO(1,date);
        log.debug("=================>>>>>>>>>>>>>>>>"+JSON.toJSONString(proSeckillDetailVO));
    }
}