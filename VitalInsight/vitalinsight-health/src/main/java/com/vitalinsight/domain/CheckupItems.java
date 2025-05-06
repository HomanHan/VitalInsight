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
package com.vitalinsight.domain;

import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import io.swagger.annotations.ApiModelProperty;
import cn.hutool.core.bean.copier.CopyOptions;
import java.sql.Timestamp;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
* @description /
* @author VitalInsight Team
* @date 2025-05-07
**/
@Data
@TableName("Checkup_Items")
public class CheckupItems implements Serializable {

    @TableId(value = "item_id", type = IdType.AUTO)
    @ApiModelProperty(value = "体检项目唯一标识符")
    private Long itemId;

    @NotBlank
    @ApiModelProperty(value = "体检项目名称（如身高、体重）")
    private String itemName;

    @NotBlank
    @ApiModelProperty(value = "体检项目值（如175 cm）")
    private String itemValue;

    @NotBlank
    @ApiModelProperty(value = "正常参考值范围")
    private String referenceRange;

    @ApiModelProperty(value = "记录创建时间")
    private Timestamp createdAt;

    @ApiModelProperty(value = "记录最后更新时间")
    private Timestamp updatedAt;

    @ApiModelProperty(value = "用户ID（外键，关联用户表）")
    private Long userId;

    public void copy(CheckupItems source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
