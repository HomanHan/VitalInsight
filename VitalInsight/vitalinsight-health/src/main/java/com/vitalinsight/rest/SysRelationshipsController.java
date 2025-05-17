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
package com.vitalinsight.rest;

import com.vitalinsight.annotation.Log;
import com.vitalinsight.domain.SysRelationships;
import com.vitalinsight.service.SysRelationshipsService;
import com.vitalinsight.domain.dto.SysRelationshipsQueryCriteria;
import lombok.RequiredArgsConstructor;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.vitalinsight.utils.PageResult;

/**
* @author VitalInsight Team
* @date 2025-05-16
**/
@RestController
@RequiredArgsConstructor
@Api(tags = "relationship")
@RequestMapping("/api/sysRelationships")
public class SysRelationshipsController {

    private final SysRelationshipsService sysRelationshipsService;

    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    public void exportSysRelationships(HttpServletResponse response, SysRelationshipsQueryCriteria criteria) throws IOException {
        sysRelationshipsService.download(sysRelationshipsService.queryAll(criteria), response);
    }

    @GetMapping
    @ApiOperation("查询relationship")
    public ResponseEntity<PageResult<SysRelationships>> querySysRelationships(SysRelationshipsQueryCriteria criteria){
        Page<Object> page = new Page<>(criteria.getPage(), criteria.getSize());
        return new ResponseEntity<>(sysRelationshipsService.queryAll(criteria,page),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增relationship")
    @ApiOperation("新增relationship")
    public ResponseEntity<Object> createSysRelationships(@Validated @RequestBody SysRelationships resources){
        sysRelationshipsService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改relationship")
    @ApiOperation("修改relationship")
    public ResponseEntity<Object> updateSysRelationships(@Validated @RequestBody SysRelationships resources){
        sysRelationshipsService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除relationship")
    @ApiOperation("删除relationship")
    public ResponseEntity<Object> deleteSysRelationships(@ApiParam(value = "传ID数组[]") @RequestBody List<Long> ids) {
        sysRelationshipsService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}