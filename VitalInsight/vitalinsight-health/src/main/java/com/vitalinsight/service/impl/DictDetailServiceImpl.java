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

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import com.vitalinsight.domain.Dict;
import com.vitalinsight.domain.DictDetail;
import com.vitalinsight.mapper.DictMapper;
import com.vitalinsight.domain.dto.DictDetailQueryCriteria;
import com.vitalinsight.utils.*;
import com.vitalinsight.mapper.DictDetailMapper;
import com.vitalinsight.service.DictDetailService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
* @author Zheng Jie
* @date 2019-04-10
*/
@Service
@RequiredArgsConstructor
public class DictDetailServiceImpl extends ServiceImpl<DictDetailMapper, DictDetail> implements DictDetailService {

    private final DictMapper dictMapper;
    private final DictDetailMapper dictDetailMapper;
    private final RedisUtils redisUtils;

    @Override
    public PageResult<DictDetail> queryAll(DictDetailQueryCriteria criteria, Page<Object> page) {
        return PageUtil.toPage(dictDetailMapper.findAll(criteria, page));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(DictDetail resources) {
        resources.setDictId(resources.getDict().getId());
        save(resources);
        // 清理缓存
        delCaches(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(DictDetail resources) {
        DictDetail dictDetail = getById(resources.getId());
        resources.setId(dictDetail.getId());
        // 更新数据
        saveOrUpdate(resources);
        // 清理缓存
        delCaches(dictDetail);
    }

    @Override
    public List<DictDetail> getDictByName(String name) {
        String key = CacheKey.DICT_NAME + name;
        List<DictDetail> dictDetails = redisUtils.getList(key, DictDetail.class);
        if(CollUtil.isEmpty(dictDetails)){
            dictDetails = dictDetailMapper.findByDictName(name);
            redisUtils.set(key, dictDetails, 1 , TimeUnit.DAYS);
        }
        return dictDetails;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id) {
        DictDetail dictDetail = getById(id);
        removeById(id);
        // 清理缓存
        delCaches(dictDetail);
    }

    public void delCaches(DictDetail dictDetail){
        Dict dict = dictMapper.selectById(dictDetail.getDictId());
        redisUtils.del(CacheKey.DICT_NAME + dict.getName());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean existsByNameAndId(String name, Long dictId) {
        return !(dictDetailMapper.findByDictIdAndLabel(dictId, name).isEmpty());
    }
}