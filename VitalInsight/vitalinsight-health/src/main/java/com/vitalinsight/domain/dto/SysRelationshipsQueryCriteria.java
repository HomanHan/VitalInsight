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
package com.vitalinsight.domain.dto;

import lombok.Data;
import io.swagger.annotations.ApiModelProperty;

/**
* @author VitalInsight Team
* @date 2025-05-16
**/
@Data
public class SysRelationshipsQueryCriteria{

    @ApiModelProperty(value = "页码", example = "1")
    private Integer page = 1;

    @ApiModelProperty(value = "每页数据量", example = "10")
    private Integer size = 10;

    @ApiModelProperty(value = "亲友用户ID")
    private Long relatedUserId;

    @ApiModelProperty(value = "关系类型")
    private String relationshipType;

    @ApiModelProperty(value = "查询的用户 ID")
    private Long userId;
}