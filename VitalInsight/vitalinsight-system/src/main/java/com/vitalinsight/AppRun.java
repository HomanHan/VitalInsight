/*
 *  Copyright 2019-2025 Zheng Jie
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.vitalinsight;

import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import com.vitalinsight.annotation.rest.AnonymousGetMapping;
import com.vitalinsight.utils.SpringBeanHolder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.ApplicationPidFileWriter;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.core.env.Environment;

/**
 * @author Vital Insight Team
 * @date 2025-05-08
 */
@Slf4j
@RestController
@Api(hidden = true)
@SpringBootApplication
@EnableTransactionManagement
public class AppRun {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(AppRun.class);
        // 监控应用的PID，启动时可指定PID路径：--spring.pid.file=/home/VitalInsight/app.pid
        // 或者在 application.yml 添加文件路径，方便 kill，kill `cat /home/VitalInsight/app.pid`
        springApplication.addListeners(new ApplicationPidFileWriter());
        Environment env = springApplication.run(args).getEnvironment();
//        springApplication.run(args);
        log.info("---------------------------------------------");
        log.info("Local: {}", "http://localhost:8000");
        log.info("Swagger: {}", "http://localhost:8000/doc.html");
        log.info("Tess4j datapath: " + env.getProperty("tess4j.datapath"));
        log.info("---------------------------------------------");
        System.setProperty("jna.library.path", env.getProperty("tess4j.libpath"));

    }

    @Bean
    public SpringBeanHolder springContextHolder() {
        return new SpringBeanHolder();
    }

    /**
     * 访问首页 (localhost:8000/) 提示
     * @return /
     */
    @AnonymousGetMapping("/")
    public String index() {
        return "Backend service started successfully";
    }
}
