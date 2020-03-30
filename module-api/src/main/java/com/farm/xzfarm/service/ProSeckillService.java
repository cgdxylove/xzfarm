//package com.farm.xzfarm.service;
//
//import beans.constant.CommonConstant;
//import beans.constant.SeckillConstant;
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.farm.xzfarm.service.cache.CacheService;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.dao.DataAccessException;
//import org.springframework.data.redis.core.RedisOperations;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.core.SessionCallback;
//import org.springframework.stereotype.Service;
//
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
///**
// * 功能描述：
// *
// * @Author: chengong
// * @Date: 2020/3/22 0:02
// */
//@Service
//@Slf4j
//public class ProSeckillService {
//
////    @Autowired
////    ProSeckillMapper proSeckillMapper ;
////    @Autowired
////    ProImagesMapper proImagesMapper;
//    @Autowired
//    CacheService cacheService;
//    @Autowired
//    RedisTemplate redisTemplate ;
//
//    /**
//     * @author: chengong
//     * @description: 查询正在进行或者即将开始的秒杀活动列表
//     * @date: 2020/3/22 13:16
//     * @return com.farm.xzfarm.beans.WebResponse<java.util.List<com.xzff.modulestore.beans.model.ProSeckill>>
//     */
//    public WebResponse<List<ProSeckillVO>> queryDoingSeckillList() {
//        Date date = new Date();
//        List<ProSeckillVO> list = null ;
//                //proSeckillMapper.queryDoingSeckillList(date);
//        //向redis缓存秒杀库存数量
//        if(list!=null&&list.size()>0){
//            for (int i=0;i<list.size();i++){
//                ProSeckillVO proSeckillVO = list.get(i);
//                Integer seckillId = proSeckillVO.getSeckillId();
//                if(cacheService.get(SeckillConstant.SECKILL_STORENUM_+seckillId)==null){
//                    cacheService.set(SeckillConstant.SECKILL_STORENUM_+seckillId,proSeckillVO.getStoreNum().toString());
//                }
//            }
//        }
//        return new WebResponse<List<ProSeckillVO>>().success(CommonConstant.SUCCESS_CODE,"success",list);
//    }
//
//    /**
//     * @param seckillId
//     * @param productType
//     * @author: chengong
//     * @description: 获取秒杀产品详情信息
//     * @date: 2020/3/22 17:32
//     * @return com.farm.xzfarm.beans.WebResponse<com.xzff.modulestore.beans.VO.seckill.ProSeckillDetailVO>
//     */
//    public ProSeckillDetailVO getSeckillDetail(int seckillId, int productType) {
//        ProSeckillDetailVO seckillDetailVO = null;
//        //先尝试从redis获取数据
//        Object object =cacheService.get(SeckillConstant.PROSECKILL_ID_+seckillId);
//        if(object!=null){
//            seckillDetailVO = JSONObject.parseObject(object.toString(),ProSeckillDetailVO.class);
//            return seckillDetailVO;
//            //return new WebResponse<ProSeckillDetailVO>().success(CommonConstant.SUCCESS_CODE,"success",seckillDetailVO);
//        }
//        //如果没有，则从mysql中获取数据，并缓存到redis
//        Date date = new Date();
//        switch (productType) {
//            case CommonConstant.PRODUCT_TYPE_PRODUCT://普通产品
//                seckillDetailVO = null;
//                        //proSeckillMapper.getProductSeckillDetailVO(seckillId,date);
//                break;
//            case CommonConstant.PRODUCT_TYPE_PACKAGE://产品包
//                seckillDetailVO = null;
//                        //proSeckillMapper.getPackageSeckillDetailVO(seckillId,date);
//                break;
//            default:
//                break;
//        }
//        //没有获取到信息，则秒杀结束
//        if(seckillDetailVO==null){
//            return null;
//        }
//        //获取产品图片list
//        Integer productId = seckillDetailVO.getProductId();
//        List<String> imgUrls = null ;
//                //proImagesMapper.queryDetailsImageUrlsByObjectId(productId);
//        seckillDetailVO.setIamgeUrls(imgUrls);
//        try {
//            //缓存到redis,
//            // todo 后期根据活动时间，定时器定期扫描清除
//            cacheService.set(SeckillConstant.PROSECKILL_ID_+seckillDetailVO.getSeckillId(), JSON.toJSONString(seckillDetailVO));
//        } catch (Exception e) {//秒杀的时候缓存异常，会导致缓存雪崩，即时通知相关人员
//            log.info(ExceptionTool.getExceptionInfo(e));
//            //todo 异步向日志表里面插一条数据，通知相关人员即时排查
//        }
//        return seckillDetailVO;
//    }
//
//
//    public WebResponse  seckilling(Integer seckillId, Long userId) {
//        String  storeNumKey =SeckillConstant.SECKILL_STORENUM_+seckillId ;
//        String   seckillUserIdKey= SeckillConstant.SECKILL_USER_+userId;
//        Long storeNum = cacheService.get(storeNumKey)==null?0:Long.valueOf(cacheService.get(storeNumKey).toString());
//        if(storeNum<=0){
//            //没有库存,秒杀结束,
//            return new WebResponse(SeckillConstant.SECKILL_NO,"",null);
//        }
//        Object  results =  redisTemplate.execute(new SessionCallback() {
//            @Override
//            public Object execute(RedisOperations redisOperations) throws DataAccessException {
//                redisOperations.watch(storeNumKey);
//                redisOperations.multi();
//                redisTemplate.opsForValue().decrement(storeNumKey,1L);
//                return redisOperations.exec();
//            }
//        });
//        if(results ==null){
//            //秒杀失败，2s后可以再试
//            cacheService.set(seckillUserIdKey,"N",2);
//            return new WebResponse<>().success(SeckillConstant.SECKILL_Fail,"failed");
//        }
//        //秒杀成功
//        ArrayList<Long> longs = (ArrayList<Long>)results;
//        Long StoreNumRemaining = longs.get(0);
//        if (StoreNumRemaining>=0){//秒杀操作库存成功
//            cacheService.set(seckillUserIdKey,"Y");
//            //todo 异步更新数据库库存，插入秒杀日志
//
//            return new WebResponse().success(SeckillConstant.SECKILL_SUCCESS,"success");
//        }else {
//            //todo 库存已经买完了,需要结束秒杀活动，异步更新数据库状态
//
//            return new WebResponse(SeckillConstant.SECKILL_NO,"",null);
//        }
//    }
//
//
//}
