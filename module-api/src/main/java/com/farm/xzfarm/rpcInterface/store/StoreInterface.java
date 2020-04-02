package com.farm.xzfarm.rpcInterface.store;

import beans.http.WebResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 功能描述：
 *
 * @Author: chengong
 * @Date: 2020/3/31 20:48
 */
@FeignClient(name = "xzfarm-store",fallback = FeignClientHystrixTestFallback.class)
public interface StoreInterface {
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    WebResponse test(@RequestParam("id") Integer id);
}
