package com.xzff.modulestore;

//import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@EnableTransactionManagement//开启事务管理
@MapperScan("com.xzff.modulestore.dao")//将项目中对应的mapper类的路径加进来就可以了
public class ModuleStoreApplication {
	public static void main(String[] args) {
		SpringApplication.run(ModuleStoreApplication.class, args);
	}

}
