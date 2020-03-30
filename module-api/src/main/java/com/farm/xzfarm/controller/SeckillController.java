//package com.farm.xzfarm.controller;
//
//import beans.constant.CommonConstant;
//import beans.constant.SeckillConstant;
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.xzff.modulestore.beans.VO.seckill.ProSeckillDetailVO;
//import com.xzff.modulestore.beans.VO.seckill.ProSeckillVO;
//import com.farm.xzfarm.beans.WebResponse;
//import com.xzff.modulestore.beans.model.ProSeckill;
////import com.farm.xzfarm.service.ProSeckillService;
////import com.farm.xzfarm.service.cache.CacheService;
//import com.farm.xzfarm.utils.ExceptionTool;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Service;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//
//@Slf4j
//@RestController
//@RequestMapping(value = "/seckill")
//public class SeckillController {
////    @Autowired
////    ProSeckillService proSeckillService;
//
//    /**
//     * @param request
//     * @author: chengong
//     * @description: 查询正在进行或者即将开始的秒杀活动列表
//     * 测试：本地单机1w并发，25,624.6/分钟
//     * @date: 2020/3/22 13:30
//     * @return com.farm.xzfarm.beans.WebResponse<java.util.List<com.xzff.modulestore.beans.model.ProSeckill>>
//     */
//    @RequestMapping(value = "/doingSeckillList")
//    @ResponseBody
//    public WebResponse<List<ProSeckillVO>> queryDoingSeckillList(HttpServletRequest request){
//        //return proSeckillService.queryDoingSeckillList();
//        return null;
//    }
//
//    /**
//     * @param request
//     * @param seckillId
//     * @param productType
//     * @author: chengong
//     * @description: 进入详情页面
//     * 测试：本地单机1w并发，1,598.164/分钟
//     * //todo 1，静态页面 2，间隔刷新限制
//     * @date: 2020/3/22 17:52
//     * @return com.farm.xzfarm.beans.WebResponse<com.xzff.modulestore.beans.VO.seckill.ProSeckillDetailVO>
//     */
//    @RequestMapping(value = "/getSeckillDetail/{seckillId}/{productType}")
//    @ResponseBody
//    public WebResponse<ProSeckillDetailVO> seckillDetail(HttpServletRequest request, @PathVariable("seckillId") Integer seckillId
//            , @PathVariable("productType") Integer productType){
//        ProSeckillDetailVO seckillDetailVO =  null;
////                proSeckillService.getSeckillDetail(seckillId,productType);
//        if(seckillDetailVO==null){
//            return new WebResponse<ProSeckillDetailVO>().success(SeckillConstant.SECKILL_NO,null);
//        }
//        return new WebResponse<ProSeckillDetailVO>().success(CommonConstant.SUCCESS_CODE,"success",seckillDetailVO);
//    }
//
//    @RequestMapping(value = "/seckilling/{seckillId}/{userId}")
//    @ResponseBody
//    //public WebResponse seckilling(HttpServletRequest request,@RequestBody JSONObject jsonObject){
////    Integer seckillId = jsonObject.getInteger(SeckillConstant.SECKILLID);
////    Long userId = jsonObject.getLong(SeckillConstant.USERID);
//    public WebResponse seckilling(HttpServletRequest request, @PathVariable("seckillId") Integer seckillId
//            , @PathVariable("userId") Long userId){
//        //获取user
//        //return proSeckillService.seckilling(seckillId,userId);
//        return null;
//    }
//
//}
