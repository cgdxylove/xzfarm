package com.xzff.modulestore.dao;


import com.xzff.modulestore.beans.model.ProImages;

import java.util.List;

public interface ProImagesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProImages record);

    int insertSelective(ProImages record);

    ProImages selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProImages record);

    int updateByPrimaryKey(ProImages record);

    /**
     * @param objectId
     * @author: chengong
     * @description: 获取详情图片-- image_type = 2
     * @date: 2020/3/22 17:45
     * @return java.util.List<java.lang.String>
     */
    List<String> queryDetailsImageUrlsByObjectId(Integer objectId);
}