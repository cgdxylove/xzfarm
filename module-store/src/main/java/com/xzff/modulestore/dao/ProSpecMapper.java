package com.xzff.modulestore.dao;


import com.xzff.modulestore.beans.model.ProSpec;

public interface ProSpecMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProSpec record);

    int insertSelective(ProSpec record);

    ProSpec selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProSpec record);

    int updateByPrimaryKey(ProSpec record);
}