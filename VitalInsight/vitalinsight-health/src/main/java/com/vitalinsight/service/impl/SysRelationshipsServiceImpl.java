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
package com.vitalinsight.service.impl;

import com.vitalinsight.domain.SysRelationships;
import com.vitalinsight.utils.FileUtil;
import com.vitalinsight.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vitalinsight.service.SysRelationshipsService;
import com.vitalinsight.domain.dto.SysRelationshipsQueryCriteria;
import com.vitalinsight.mapper.SysRelationshipsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.vitalinsight.utils.PageUtil;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import com.vitalinsight.utils.PageResult;

/**
* @description 服务实现
* @author VitalInsight Team
* @date 2025-05-16
**/
@Service
@RequiredArgsConstructor
public class SysRelationshipsServiceImpl extends ServiceImpl<SysRelationshipsMapper, SysRelationships> implements SysRelationshipsService {

    private final SysRelationshipsMapper sysRelationshipsMapper;

    @Override
    public PageResult<SysRelationships> queryAll(SysRelationshipsQueryCriteria criteria, Page<Object> page){
        criteria.setUserId(SecurityUtils.getCurrentUserId());
        return PageUtil.toPage(sysRelationshipsMapper.findAll(criteria, page));
    }

    @Override
    public List<SysRelationships> queryAll(SysRelationshipsQueryCriteria criteria){
        criteria.setUserId(SecurityUtils.getCurrentUserId());
        return sysRelationshipsMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(SysRelationships resources) {
        sysRelationshipsMapper.insert(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(SysRelationships resources) {
        SysRelationships sysRelationships = getById(resources.getId());
        sysRelationships.copy(resources);
        sysRelationshipsMapper.updateById(sysRelationships);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Long> ids) {
        sysRelationshipsMapper.deleteBatchIds(ids);
    }

    @Override
    public void download(List<SysRelationships> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (SysRelationships sysRelationships : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("用户ID", sysRelationships.getUserId());
            map.put("亲友用户ID", sysRelationships.getRelatedUserId());
            map.put("关系类型", sysRelationships.getRelationshipType());
            map.put("关系创建时间", sysRelationships.getCreatedAt());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}