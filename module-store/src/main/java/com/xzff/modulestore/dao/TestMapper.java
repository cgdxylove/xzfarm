package com.xzff.modulestore.dao;


import com.xzff.modulestore.beans.model.Test;

import java.util.List;
import java.util.Map;

public interface TestMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Test record);

    int insertSelective(Test record);

    Test selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Test record);

    int updateByPrimaryKey(Test record);

}