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
package com.vitalinsight.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.vitalinsight.domain.dto.EmailDto;
import com.vitalinsight.domain.EmailConfig;

/**
 * @author Zheng Jie
 * @date 2018-12-26
 */
public interface EmailService extends IService<EmailConfig> {

    /**
     * 更新邮件配置
     * @param emailConfig 邮箱配置
     * @param old /
     * @return /
     * @throws Exception /
     */
    EmailConfig config(EmailConfig emailConfig, EmailConfig old) throws Exception;

    /**
     * 查询配置
     * @return EmailConfig 邮件配置
     */
    EmailConfig find();

    /**
     * 发送邮件
     * @param emailDto 邮件发送的内容
     * @param emailConfig 邮件配置
     */
    void send(EmailDto emailDto, EmailConfig emailConfig);
}
