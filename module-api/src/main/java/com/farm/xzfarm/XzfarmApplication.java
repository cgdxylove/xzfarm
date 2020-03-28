package com.farm.xzfarm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.farm.xzfarm.dao")//将项目中对应的mapper类的路径加进来就可以了
public class XzfarmApplication {

	public static void main(String[] args) {
		SpringApplication.run(XzfarmApplication.class, args);
		System.out.println("=======心庄农场系统API模块，启动成功======");
	}

}
