package com.xzff.modulestore.beans.VO.seckill;

import com.farm.xzfarm.beans.model.ProSeckill;

import java.util.List;

/**
 * 功能描述：
 *
 * @Author: chengong
 * @Date: 2020/3/22 16:11
 */
public class ProSeckillDetailVO extends ProSeckill {
    private String productName;
    private Integer specId;
    private String specName;//规格名称, ml/g/kg/L/袋/桶/斤
    private Integer specSum; //规格数量  1000/100/1
    private List<String> iamgeUrls;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Override
    public Integer getSpecId() {
        return specId;
    }

    @Override
    public void setSpecId(Integer specId) {
        this.specId = specId;
    }

    public String getSpecName() {
        return specName;
    }

    public void setSpecName(String specName) {
        this.specName = specName;
    }

    public Integer getSpecSum() {
        return specSum;
    }

    public void setSpecSum(Integer specSum) {
        this.specSum = specSum;
    }

    public List<String> getIamgeUrls() {
        return iamgeUrls;
    }

    public void setIamgeUrls(List<String> iamgeUrls) {
        this.iamgeUrls = iamgeUrls;
    }
}
