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
package com.vitalinsight.modules.maint.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.vitalinsight.modules.maint.domain.Deploy;
import com.vitalinsight.modules.maint.domain.DeployHistory;
import com.vitalinsight.modules.maint.domain.dto.DeployQueryCriteria;
import com.vitalinsight.utils.PageResult;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;

/**
* @author zhanghouying
* @date 2019-08-24
*/
public interface DeployService extends IService<Deploy> {

    /**
     * 分页查询
     *
     * @param criteria 条件
     * @param page     分页参数
     * @return /
     */
    PageResult<Deploy> queryAll(DeployQueryCriteria criteria, Page<Object> page);

    /**
     * 查询全部数据
     * @param criteria 条件
     * @return /
     */
    List<Deploy> queryAll(DeployQueryCriteria criteria);

    /**
     * 创建
     * @param resources /
     */
    void create(Deploy resources);


    /**
     * 编辑
     * @param resources /
     */
    void update(Deploy resources);

    /**
     * 删除
     * @param ids /
     */
    void delete(Set<Long> ids);

    /**
     * 部署服务
     * @param fileSavePath /
     * @param appId /
     */
    void deploy(String fileSavePath, Long appId);

    /**
     * 查询部署状态
     * @param resources /
     * @return /
     */
    String serverStatus(Deploy resources);
    /**
     * 启动服务
     * @param resources /
     * @return /
     */
    String startServer(Deploy resources);
    /**
     * 停止服务
     * @param resources /
     * @return /
     */
    String stopServer(Deploy resources);

    /**
     * 停止服务
     * @param resources /
     * @return /
     */
    String serverReduction(DeployHistory resources);

    /**
     * 导出数据
     * @param queryAll /
     * @param response /
     * @throws IOException /
     */
    void download(List<Deploy> queryAll, HttpServletResponse response) throws IOException;
}
