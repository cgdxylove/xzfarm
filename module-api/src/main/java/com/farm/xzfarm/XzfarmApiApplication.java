package com.farm.xzfarm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;


@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
public class XzfarmApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(XzfarmApiApplication.class, args);
		System.out.println("=======心庄农场系统API模块，启动成功======");
	}

}
