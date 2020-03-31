//package com.xzff.modulestore;
//
//import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
//import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
//import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
//import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
//import org.apache.rocketmq.client.exception.MQClientException;
//import org.apache.rocketmq.common.message.MessageExt;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.util.List;
//
////@SpringBootTest
//class ModuleStoreApplicationTests {
//    public static void main(String[] args) {
//
//    // Instantiate with specified consumer group name.
//    DefaultMQPushConsumer consumer = new DefaultMQPushConsumer("group1");
//
//    // Specify name server addresses.
//        consumer.setNamesrvAddr("192.168.65.130:9876");
//
//    // Subscribe one more more topics to consume.
//        try {
//            consumer.subscribe("log-topic", "*");
//        } catch (MQClientException e) {
//            e.printStackTrace();
//        }
//        // Register callback to execute on arrival of messages fetched from brokers.
//        consumer.registerMessageListener(new MessageListenerConcurrently() {
//
//        @Override
//        public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> msgs,
//                                                        ConsumeConcurrentlyContext context) {
//            System.out.printf("%s Receive New Messages: %s %n", Thread.currentThread().getName(), msgs);
//            return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
//        }
//    });
//
//    //Launch the consumer instance.
//        try {
//            consumer.start();
//        } catch (MQClientException e) {
//            e.printStackTrace();
//        }
//
//        System.out.printf("Consumer Started.%n");
//}
//
//}
