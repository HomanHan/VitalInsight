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
package com.vitalinsight.modules.maint.domain;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.sql.Timestamp;

/**
* @author zhanghouying
* @date 2019-08-24
*/
@Getter
@Setter
@TableName("mnt_deploy_history")
public class DeployHistory implements Serializable {

    @TableId(value = "history_id", type = IdType.AUTO)
    @ApiModelProperty(value = "ID", hidden = true)
    private String id;

    @ApiModelProperty(value = "应用名称")
    private String appName;

    @ApiModelProperty(value = "IP")
    private String ip;

    @ApiModelProperty(value = "部署时间")
    private Timestamp deployDate;

    @ApiModelProperty(value = "部署者")
    private String deployUser;

    @ApiModelProperty(value = "部署ID")
    private Long deployId;

    public void copy(DeployHistory source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
