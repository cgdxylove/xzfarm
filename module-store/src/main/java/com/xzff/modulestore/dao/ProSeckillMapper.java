package com.xzff.modulestore.dao;

import com.farm.xzfarm.beans.VO.seckill.ProSeckillDetailVO;
import com.farm.xzfarm.beans.VO.seckill.ProSeckillVO;
import com.farm.xzfarm.beans.model.ProSeckill;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ProSeckillMapper {
    int deleteByPrimaryKey(Integer seckillId);

    int insert(ProSeckill record);

    int insertSelective(ProSeckill record);

    ProSeckill selectByPrimaryKey(Integer seckillId);

    int updateByPrimaryKeySelective(ProSeckill record);

    int updateByPrimaryKey(ProSeckill record);

   /**
    * @param seckillId
    * @param status
    * @author: chengong
    * @description: 查询单个秒杀活动信息
    * @date: 2020/3/21 22:26
    * @return com.farm.xzfarm.beans.model.ProSeckill
    */
    ProSeckill selectByPrimaryKeyAndStatus(@Param("seckillId") Integer seckillId, @Param("status") int status);

    /**
     * @author: chengong
     * @description: 查询所有即将开始和正在进行的秒杀活动
     * @date: 2020/3/21 22:29
     * @return java.util.List<com.farm.xzfarm.beans.model.ProSeckill>
     */
    List<ProSeckillVO> queryDoingSeckillList(@Param("searchTime") Date date);


    /**
     * @param seckillId
     * @param date
     * @author: chengong
     * @description: 获取秒杀商品详情信息--普通产品
     * @date: 2020/3/22 17:10
     * @return com.farm.xzfarm.beans.VO.seckill.ProSeckillDetailVO
     */
    ProSeckillDetailVO getProductSeckillDetailVO(@Param("seckillId") int seckillId, @Param("searchTime") Date date);

    /**
     * @param seckillId
     * @param date
     * @author: chengong
     * @description: 获取秒杀商品详情信息--产品包
     * @date: 2020/3/22 17:34
     * @return com.farm.xzfarm.beans.VO.seckill.ProSeckillDetailVO
     */
    ProSeckillDetailVO getPackageSeckillDetailVO(@Param("seckillId") int seckillId, @Param("searchTime") Date date);
}