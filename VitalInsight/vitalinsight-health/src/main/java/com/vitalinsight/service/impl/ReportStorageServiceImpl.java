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

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.vitalinsight.config.properties.FileProperties;
import com.vitalinsight.domain.CheckupItems;
import com.vitalinsight.exception.BadRequestException;
import com.vitalinsight.service.ReportStorageService;
import com.vitalinsight.utils.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.vitalinsight.domain.ReportStorage;
import com.vitalinsight.domain.dto.ReportStorageQueryCriteria;
import com.vitalinsight.mapper.ReportStorageMapper;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import com.vitalinsight.service.ParserService;

/**
 * @author Vital Insight Team
 * @date 2025-05-07
 */
@Service
@RequiredArgsConstructor
public class ReportStorageServiceImpl extends ServiceImpl<ReportStorageMapper, ReportStorage> implements ReportStorageService {

    private final ReportStorageMapper reportStorageMapper;
    private final FileProperties properties;
    private final ParserService parserService;

    @Override
    public PageResult<ReportStorage> queryAll(ReportStorageQueryCriteria criteria, Page<Object> page){
        return PageUtil.toPage(reportStorageMapper.findAll(criteria, page));
    }

    @Override
    public List<ReportStorage> queryAll(ReportStorageQueryCriteria criteria){
        return reportStorageMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ReportStorage create(String name, MultipartFile multipartFile) {
        FileUtil.checkSize(properties.getMaxSize(), multipartFile.getSize());
        String suffix = FileUtil.getExtensionName(multipartFile.getOriginalFilename());
        String type = FileUtil.getFileType(suffix);
        File file = FileUtil.upload(multipartFile, properties.getPath().getPath() + type +  File.separator);
        if(ObjectUtil.isNull(file)){
            throw new BadRequestException("上传失败");
        }
        try {
            name = StringUtils.isBlank(name) ? FileUtil.getFileNameNoEx(multipartFile.getOriginalFilename()) : name;
            ReportStorage localStorage = new ReportStorage(
                    file.getName(),
                    name,
                    suffix,
                    file.getPath(),
                    type,
                    FileUtil.getSize(multipartFile.getSize())
            );
            save(localStorage);
            return localStorage;
        }catch (Exception e){
            FileUtil.del(file);
            throw e;
        }
    }

    // 上传文件 with 机构名称 and userid
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ReportStorage createOrg(String name, String orgName, MultipartFile multipartFile) {
        FileUtil.checkSize(properties.getMaxSize(), multipartFile.getSize());
        String suffix = FileUtil.getExtensionName(multipartFile.getOriginalFilename());
        String type = FileUtil.getFileType(suffix);
        File file = FileUtil.upload(multipartFile, properties.getPath().getPath() + type +  File.separator);
        if(ObjectUtil.isNull(file)){
            throw new BadRequestException("上传失败");
        }
        List<CheckupItems> tempp;
        try {
            tempp = parserService.parseReport(file);
        } catch (Exception e) {
            ResponseEntity.internalServerError().build();
        }
        try {
            // 解析文件
//            parserService.parseReport(file);
            // 输出解析结果以供调试？
//            System.out.println("解析结果: " + parserService.parseReport(file));

            name = StringUtils.isBlank(name) ? FileUtil.getFileNameNoEx(multipartFile.getOriginalFilename()) : name;
            Long userid = SecurityUtils.getCurrentUserId();
            ReportStorage localStorage = new ReportStorage(
                    userid,
                    orgName,
                    file.getName(),
                    name,
                    suffix,
                    file.getPath(),
                    type,
                    FileUtil.getSize(multipartFile.getSize())
            );
            save(localStorage);
            return localStorage;
        }catch (Exception e){
            FileUtil.del(file);
            throw e;
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(ReportStorage resources) {
        ReportStorage localStorage = getById(resources.getId());
        localStorage.copy(resources);
        saveOrUpdate(localStorage);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(Long[] ids) {
        for (Long id : ids) {
            ReportStorage storage = getById(id);
            FileUtil.del(storage.getPath());
            removeById(storage);
        }
    }

    @Override
    public void download(List<ReportStorage> queryAll, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (ReportStorage localStorage : queryAll) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("文件名", localStorage.getRealName());
            map.put("备注名", localStorage.getName());
            map.put("文件类型", localStorage.getType());
            map.put("文件大小", localStorage.getSize());
            map.put("创建者", localStorage.getCreateBy());
            map.put("创建日期", localStorage.getCreateTime());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}
