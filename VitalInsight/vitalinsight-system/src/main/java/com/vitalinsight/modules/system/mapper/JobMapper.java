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
package com.vitalinsight.modules.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.vitalinsight.modules.system.domain.Job;
import com.vitalinsight.modules.system.domain.dto.JobQueryCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;

/**
* @author Zheng Jie
* @date 2023-06-20
*/
@Mapper
public interface JobMapper extends BaseMapper<Job> {

    @Select("select job_id as id from sys_job where name = #{name}")
    Job findByName(@Param("name") String name);

    List<Job> findAll(@Param("criteria") JobQueryCriteria criteria);

    IPage<Job> findAll(@Param("criteria") JobQueryCriteria criteria, Page<Object> page);
}