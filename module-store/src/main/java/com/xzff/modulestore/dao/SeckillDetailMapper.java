package com.xzff.modulestore.dao;


import com.xzff.modulestore.beans.model.SeckillDetail;

public interface SeckillDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SeckillDetail record);

    int insertSelective(SeckillDetail record);

    SeckillDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SeckillDetail record);

    int updateByPrimaryKey(SeckillDetail record);
}