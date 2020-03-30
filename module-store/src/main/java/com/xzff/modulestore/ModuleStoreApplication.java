package com.xzff.modulestore;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.xzff.modulestore.dao")//将项目中对应的mapper类的路径加进来就可以了
public class ModuleStoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(ModuleStoreApplication.class, args);
	}

}
