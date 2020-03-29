package com.farm.xzfarm.dao;

import com.alibaba.fastjson.JSON;
import com.farm.xzfarm.beans.WebResponse;
import com.farm.xzfarm.beans.model.Test;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.common.message.Message;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

//@SpringBootTest
//@RunWith(SpringRunner.class)
public class TestMapperTest {
    @Resource
    private TestMapper testDao;

    @org.junit.Test
    public void deleteByPrimaryKey() throws Exception {
    }

    @org.junit.Test
    public void insert() throws Exception {
    }

    @org.junit.Test
    public void insertSelective() throws Exception {
    }

    @org.junit.Test
    public void selectByPrimaryKey() throws Exception {
//        int id = 1;
//        Test test = testDao.selectByPrimaryKey(id);
//        System.out.println(test.toString());
    }

    @org.junit.Test
    public void updateByPrimaryKeySelective() throws Exception {
    }

    @org.junit.Test
    public void updateByPrimaryKey() throws Exception {
    }

    public static void main(String[] args) {
        DefaultMQProducer producer = new DefaultMQProducer("test-group");
        producer.setNamesrvAddr("192.168.65.130:9876");
        producer.setInstanceName("rmq-instance");
        try {
            producer.start();
        } catch (MQClientException e) {
            e.printStackTrace();
        }
        try {
            WebResponse webResponse = new WebResponse<String>();
            webResponse.success("1","11111111111","111111");
            for (int i = 0; i < 100; i++) {
                Message message = new Message("log-topic", "user-tag", JSON.toJSONString(webResponse).getBytes());
                System.out.println("生产者发送消息:====================================" );
                producer.send(message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        producer.shutdown();
    }

}