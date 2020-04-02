package com.farm.xzfarm.controller;

import beans.http.WebResponse;
import com.farm.xzfarm.service.TestService;
import com.farm.xzfarm.service.cache.CacheService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@Controller
@Slf4j
public class TestController {

    @Autowired
    private TestService service;
    @Autowired
    private CacheService cacheService;

    @RestController
    public class Test {
        //内网开发，没有lomback插件，需要用这老方法
        // private final Logger logger = LoggerFactory.getLogger(Test.class);

        @RequestMapping(value = "/test")
        @ResponseBody
        public WebResponse testRPC(Object o, HttpServletRequest request, Test test) {

            WebResponse webResponse =  service.testRPC();
            return webResponse;
        }
    }


    @RequestMapping(value = "/test1")
    @ResponseBody
    public long testRedis(Object o, HttpServletRequest request, Test test) {

        /**
         *
         *
         * 11:58:24.708 [http-nio-8091-exec-2] DEBUG com.farm.xzfarm.service.TestService - ========================》》》》》》》》》》》9989
         11:58:24.708 [http-nio-8091-exec-1] DEBUG com.farm.xzfarm.service.TestService - ========================》》》》》》》》》》》9991
         11:58:24.708 [http-nio-8091-exec-9] DEBUG o.s.d.r.core.RedisConnectionUtils - Closing Redis Connection.
         11:58:24.708 [http-nio-8091-exec-9] DEBUG com.farm.xzfarm.service.TestService - ========================》》》》》》》》》》》9992
         11:58:24.708 [lettuce-nioEventLoop-4-1] DEBUG i.l.core.protocol.CommandEncoder - [channel=0xd5a8c8ec, /127.0.0.1:50754 -> /127.0.0.1:6379] writing command AsyncCommand [type=DECRBY, output=IntegerOutput [output=null, error='null'], commandType=io.lettuce.core.protocol.Command]
         11:58:24.709 [lettuce-nioEventLoop-4-1] DEBUG i.l.core.protocol.CommandHandler - [channel=0xd5a8c8ec, /127.0.0.1:50754 -> /127.0.0.1:6379, chid=0x1] write(ctx, AsyncCommand [type=DECRBY, output=IntegerOutput [output=null, error='null'], commandType=io.lettuce.core.protocol.Command], promise)
         11:58:24.709 [lettuce-nioEventLoop-4-1] DEBUG i.l.core.protocol.CommandEncoder - [channel=0xd5a8c8ec, /127.0.0.1:50754 -> /127.0.0.1:6379] writing command AsyncCommand [type=DECRBY, output=IntegerOutput [output=null, error='null'], commandType=io.lettuce.core.protocol.Command]
         11:58:24.709 [http-nio-8091-exec-2] DEBUG o.s.w.s.m.m.a.RequestResponseBodyMethodProcessor - Writing [9989]
         11:58:24.709 [lettuce-nioEventLoop-4-1] DEBUG i.l.core.protocol.CommandHandler - [channel=0xd5a8c8ec, /127.0.0.1:50754 -> /127.0.0.1:6379, chid=0x1] Received: 14 bytes, 2 commands in the stack
         11:58:24.709 [http-nio-8091-exec-1] DEBUG o.s.w.s.m.m.a.RequestResponseBodyMethodProcessor - Writing [9991]
         11:58:24.709 [lettuce-nioEventLoop-4-1] DEBUG i.l.core.protocol.CommandHandler - [channel=0xd5a8c8ec, /127.0.0.1:50754 -> /127.0.0.1:6379, chid=0x1] Stack contains: 2 commands
         11:58:24.708 [http-nio-8091-exec-4] DEBUG com.farm.xzfarm.service.TestService - ========================》》》》》》》》》》》9990
         11:58:24.708 [http-nio-8091-exec-10] DEBUG com.farm.xzfarm.service.TestService - ========================》》》》》》》》》》》9993
         */

        return service.testService1();

    }

}
