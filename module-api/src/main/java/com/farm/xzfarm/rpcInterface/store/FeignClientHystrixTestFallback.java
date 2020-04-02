package com.farm.xzfarm.rpcInterface.store;

import beans.http.WebResponse;
import org.springframework.stereotype.Component;

/**
 * 功能描述：
 *
 * @Author: chengong
 * @Date: 2020/4/2 10:15
 */
@Component//不要忘记添加
public class FeignClientHystrixTestFallback implements StoreInterface{
    @Override
    public WebResponse test(Integer id) {
        WebResponse response = new WebResponse();
        response.error("1111","错误");
        return response;
    }
}
