package com.xzff.modulestore.controller;

import beans.http.WebResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 功能描述：
 *
 * @Author: chengong
 * @Date: 2020/3/31 21:08
 */

@Controller
public class TestController {


    @RequestMapping("/test")
    @ResponseBody
    public WebResponse test(@RequestParam("id") Integer id){
//        try {
//            Thread.sleep(2*1000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
        WebResponse webResponse = new WebResponse();
        webResponse.success("1","666");
        return webResponse;
    }


}
