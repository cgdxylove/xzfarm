package com.farm.xzfarm;

//import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;


@EnableDiscoveryClient
@SpringBootApplication
public class XzfarmApplication {

	public static void main(String[] args) {
		SpringApplication.run(XzfarmApplication.class, args);
		System.out.println("=======心庄农场系统API模块，启动成功======");
	}

}
