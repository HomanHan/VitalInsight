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

import com.vitalinsight.domain.CheckupItems;
import com.vitalinsight.domain.dto.CheckupItemsQueryCriteria;
import java.util.Map;
import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.vitalinsight.utils.PageResult;

/**
* @description 服务接口
* @author VitalInsight Team
* @date 2025-05-07
**/
public interface CheckupItemsService extends IService<CheckupItems> {

    /**
     * 查询指定用户最新的身高、体重、血压、血糖数据
     * @param userId 用户ID
     * @return 最新健康数据列表
     */
    List<CheckupItems> getLatestHealthData(Long userId);

    /**
    * 查询数据分页
    * @param criteria 条件
    * @param page 分页参数
    * @return PageResult
    */
    PageResult<CheckupItems> queryAll(CheckupItemsQueryCriteria criteria, Page<Object> page);

    /**
    * 查询所有数据不分页
    * @param criteria 条件参数
    * @return List<CheckupItemsDto>
    */
    List<CheckupItems> queryAll(CheckupItemsQueryCriteria criteria);

    /**
    * 创建
    * @param resources /
    */
    void create(CheckupItems resources);

    /**
    * 编辑
    * @param resources /
    */
    void update(CheckupItems resources);

    /**
    * 多选删除
    * @param ids /
    */
    void deleteAll(List<Long> ids);

    /**
    * 导出数据
    * @param all 待导出的数据
    * @param response /
    * @throws IOException /
    */
    void download(List<CheckupItems> all, HttpServletResponse response) throws IOException;
}