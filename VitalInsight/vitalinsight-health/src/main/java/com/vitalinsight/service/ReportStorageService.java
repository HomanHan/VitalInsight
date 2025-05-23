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

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.vitalinsight.utils.PageResult;
import org.springframework.web.multipart.MultipartFile;
import com.vitalinsight.domain.ReportStorage;
import com.vitalinsight.domain.dto.ReportStorageQueryCriteria;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author Vital Insight Team
 * @date 2025-05-08
 */
public interface ReportStorageService extends IService<ReportStorage> {

    /**
     * 分页查询
     *
     * @param criteria 条件
     * @param page     分页参数
     * @return /
     */
    PageResult<ReportStorage> queryAll(ReportStorageQueryCriteria criteria, Page<Object> page);

    /**
     * 查询全部数据
     * @param criteria 条件
     * @return /
     */
    List<ReportStorage> queryAll(ReportStorageQueryCriteria criteria);

    /**
     * 上传
     * @param name 文件名称
     * @param file 文件
     * @return /
     */
    ReportStorage create(String name, MultipartFile file);

    /**
     * 上传
     * @param name 文件名称
     * @param orgName 体检机构名称
     * @param file 文件
     * @return /
     */
    ReportStorage createOrg(String name, String orgName, MultipartFile file);

    /**
     * 编辑
     * @param resources 文件信息
     */
    void update(ReportStorage resources);

    /**
     * 多选删除
     * @param ids /
     */
    void deleteAll(Long[] ids);

    /**
     * 导出数据
     * @param localStorages 待导出的数据
     * @param response /
     * @throws IOException /
     */
    void download(List<ReportStorage> localStorages, HttpServletResponse response) throws IOException;
}