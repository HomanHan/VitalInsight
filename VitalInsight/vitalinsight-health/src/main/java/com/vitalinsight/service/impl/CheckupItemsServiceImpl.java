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

import com.vitalinsight.domain.CheckupItems;
import com.vitalinsight.utils.FileUtil;
import com.vitalinsight.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vitalinsight.service.CheckupItemsService;
import com.vitalinsight.domain.dto.CheckupItemsQueryCriteria;
import com.vitalinsight.mapper.CheckupItemsMapper;
import com.vitalinsight.domain.Dict;
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
import com.vitalinsight.domain.DictDetail;
import com.vitalinsight.service.DictDetailService;

/**
* @description 服务实现
* @author VitalInsight Team
* @date 2025-05-07
**/
@Service
@RequiredArgsConstructor
public class CheckupItemsServiceImpl extends ServiceImpl<CheckupItemsMapper, CheckupItems> implements CheckupItemsService {

    private final CheckupItemsMapper checkupItemsMapper;
    private final DictDetailService dictDetailService;
    private Long dictId = 7L; // 体检项目的字典 ID
    private String dictName = "体检项目"; // 体检项目的字典名称

    @Override
    @Transactional(readOnly = true)
    public List<CheckupItems> getLatestHealthData(Long userId) {
        return checkupItemsMapper.findLatestHealthData(userId);
    }

    @Override
    public PageResult<CheckupItems> queryAll(CheckupItemsQueryCriteria criteria, Page<Object> page){
        criteria.setUserId(SecurityUtils.getCurrentUserId());
        return PageUtil.toPage(checkupItemsMapper.findAll(criteria, page));
    }

    @Override
    public List<CheckupItems> queryAll(CheckupItemsQueryCriteria criteria){
        criteria.setUserId(SecurityUtils.getCurrentUserId());
        return checkupItemsMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(CheckupItems resources) {
        resources.setUserId(SecurityUtils.getCurrentUserId());
        // 如果 itemName 不在 sys_dict 中，则加入
        // 7 是体检项目的字典 ID
        if (!dictDetailService.existsByNameAndId(resources.getItemName(), dictId)) {
            DictDetail dictDetail = new DictDetail();
            Dict tempdict = new Dict();
            tempdict.setId(dictId);
            tempdict.setName(dictName);
            dictDetail.setDict(tempdict);
            dictDetail.setLabel(resources.getItemName());
            dictDetail.setValue(resources.getItemName());
            dictDetail.setDictId(dictId);
            dictDetailService.create(dictDetail);
        }
        checkupItemsMapper.insert(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(CheckupItems resources) {
        CheckupItems checkupItems = getById(resources.getItemId());
        checkupItems.copy(resources);
        checkupItemsMapper.updateById(checkupItems);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(List<Long> ids) {
        checkupItemsMapper.deleteBatchIds(ids);
    }

    @Override
    public void download(List<CheckupItems> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (CheckupItems checkupItems : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("体检项目名称", checkupItems.getItemName());
            map.put("体检项目值", checkupItems.getItemValue());
            map.put("参考范围", checkupItems.getReferenceRange());
            map.put("创建时间", checkupItems.getCreatedAt());
            map.put("最后更新时间", checkupItems.getUpdatedAt());
            map.put("用户ID", checkupItems.getUserId());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}