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

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.vitalinsight.annotation.Log;
import com.vitalinsight.annotation.rest.AnonymousAccess;
import com.vitalinsight.exception.BadRequestException;
import com.vitalinsight.service.ReportStorageService;
import com.vitalinsight.utils.FileUtil;
import com.vitalinsight.utils.PageResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.vitalinsight.domain.ReportStorage;
import com.vitalinsight.domain.dto.ReportStorageQueryCriteria;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Zheng Jie
 * @date 2019-09-05
 */
@RestController
@RequiredArgsConstructor
@Api(tags = "工具：本地存储管理")
@RequestMapping("/api/localStorage")
public class ReportStorageController {

    private final ReportStorageService reportStorageService;

    @GetMapping
    @ApiOperation("查询文件")
//    @PreAuthorize("@el.check('storage:list')")
//    @AnonymousAccess
    public ResponseEntity<PageResult<ReportStorage>> queryFile(ReportStorageQueryCriteria criteria){
        Page<Object> page = new Page<>(criteria.getPage(), criteria.getSize());
        return new ResponseEntity<>(reportStorageService.queryAll(criteria,page),HttpStatus.OK);
    }

    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
//    @PreAuthorize("@el.check('storage:list')")
    public void exportFile(HttpServletResponse response, ReportStorageQueryCriteria criteria) throws IOException {
        reportStorageService.download(reportStorageService.queryAll(criteria), response);
    }

    @PostMapping
    @ApiOperation("上传文件")
//    @PreAuthorize("@el.check('storage:add')")
    public ResponseEntity<Object> createFile(@RequestParam String name, @RequestParam String orgName, @RequestParam("file") MultipartFile file){
        reportStorageService.createOrg(name, orgName, file);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @ApiOperation("上传图片")
    @PostMapping("/pictures")
    public ResponseEntity<ReportStorage> uploadPicture(@RequestParam MultipartFile file){
        // 判断文件是否为图片
        String suffix = FileUtil.getExtensionName(file.getOriginalFilename());
        if(!FileUtil.IMAGE.equals(FileUtil.getFileType(suffix))){
            throw new BadRequestException("只能上传图片");
        }
        ReportStorage localStorage = reportStorageService.create(null, file);
        return new ResponseEntity<>(localStorage, HttpStatus.OK);
    }

    @PutMapping
    @Log("修改文件")
    @ApiOperation("修改文件")
//    @PreAuthorize("@el.check('storage:edit')")
    public ResponseEntity<Object> updateFile(@Validated @RequestBody ReportStorage resources){
        reportStorageService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除文件")
    @DeleteMapping
    @ApiOperation("多选删除")
    public ResponseEntity<Object> deleteFile(@RequestBody Long[] ids) {
        reportStorageService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}