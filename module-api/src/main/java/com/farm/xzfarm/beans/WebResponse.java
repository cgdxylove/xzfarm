package com.farm.xzfarm.beans;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.IOException;
import java.util.Properties;

public class  WebResponse <T>{
    private String code;
    private String msg ;
    private T data ;
    private  Integer status;
    public static Properties props ;

    static {
        try {
            Resource resource = new ClassPathResource("/business-props/code.properties");
            props = PropertiesLoaderUtils.loadProperties(new EncodedResource(resource,"UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public WebResponse() {
        super();
    }

    public WebResponse(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public WebResponse(String code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public WebResponse(String code, String msg, T data, Integer status) {
        this.code = code;
        this.msg = msg;
        this.data = data;
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

   public  void error(String code){
       this.setStatus(500);
       this.setCode(code);
       this.setMsg(props.getProperty(code));
   }

    public  WebResponse<T> error(String code,String msg){
        this.setStatus(500);
        this.setCode(code);
        this.setMsg(msg);
        return this ;
    }

    public WebResponse<T> success(String code,T data){
        successCode(code,data);
        this.setMsg(props.getProperty(code));
        return this ;
    }

    public WebResponse<T> success(String code,String msg,T data){
        successCode(code,data);
        this.setMsg(msg);
        return this ;
    }

    private void successCode(String code,T data) {
        this.setStatus(200);
        this.setCode(code);
        this.setData(data);
    }

}
