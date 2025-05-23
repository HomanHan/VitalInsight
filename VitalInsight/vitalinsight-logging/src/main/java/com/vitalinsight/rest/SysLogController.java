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
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import com.vitalinsight.annotation.Log;
import com.vitalinsight.domain.SysLog;
import com.vitalinsight.service.SysLogService;
import com.vitalinsight.domain.dto.SysLogQueryCriteria;
import com.vitalinsight.utils.PageResult;
import com.vitalinsight.utils.SecurityUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Zheng Jie
 * @date 2018-11-24
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/logs")
@Api(tags = "系统：日志管理")
public class SysLogController {

    private final SysLogService sysLogService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@el.check()")
    public void exportLog(HttpServletResponse response, SysLogQueryCriteria criteria) throws IOException {
        criteria.setLogType("INFO");
        sysLogService.download(sysLogService.queryAll(criteria), response);
    }

    @Log("导出错误数据")
    @ApiOperation("导出错误数据")
    @GetMapping(value = "/error/download")
    @PreAuthorize("@el.check()")
    public void exportErrorLog(HttpServletResponse response, SysLogQueryCriteria criteria) throws IOException {
        criteria.setLogType("ERROR");
        sysLogService.download(sysLogService.queryAll(criteria), response);
    }

    @GetMapping
    @ApiOperation("日志查询")
    @PreAuthorize("@el.check()")
    public ResponseEntity<PageResult<SysLog>> queryLog(SysLogQueryCriteria criteria){
        criteria.setLogType("INFO");
        Page<SysLog> page = new Page<>(criteria.getPage(), criteria.getSize());
        return new ResponseEntity<>(sysLogService.queryAll(criteria,page), HttpStatus.OK);
    }

    @GetMapping(value = "/user")
    @ApiOperation("用户日志查询")
    public ResponseEntity<PageResult<SysLog>> queryUserLog(SysLogQueryCriteria criteria){
        criteria.setLogType("INFO");
        criteria.setUsername(SecurityUtils.getCurrentUsername());
        Page<SysLog> page = new Page<>(criteria.getPage(), criteria.getSize());
        return new ResponseEntity<>(sysLogService.queryAllByUser(criteria,page), HttpStatus.OK);
    }

    @GetMapping(value = "/error")
    @ApiOperation("错误日志查询")
    @PreAuthorize("@el.check()")
    public ResponseEntity<PageResult<SysLog>> queryErrorLog(SysLogQueryCriteria criteria){
        criteria.setLogType("ERROR");
        Page<SysLog> page = new Page<>(criteria.getPage(), criteria.getSize());
        return new ResponseEntity<>(sysLogService.queryAll(criteria,page), HttpStatus.OK);
    }

    @GetMapping(value = "/error/{id}")
    @ApiOperation("日志异常详情查询")
    @PreAuthorize("@el.check()")
    public ResponseEntity<Object> queryErrorLogDetail(@PathVariable Long id){
        return new ResponseEntity<>(sysLogService.findByErrDetail(id), HttpStatus.OK);
    }
    @DeleteMapping(value = "/del/error")
    @Log("删除所有ERROR日志")
    @ApiOperation("删除所有ERROR日志")
    @PreAuthorize("@el.check()")
    public ResponseEntity<Object> delAllErrorLog(){
        sysLogService.delAllByError();
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping(value = "/del/info")
    @Log("删除所有INFO日志")
    @ApiOperation("删除所有INFO日志")
    @PreAuthorize("@el.check()")
    public ResponseEntity<Object> delAllInfoLog(){
        sysLogService.delAllByInfo();
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
