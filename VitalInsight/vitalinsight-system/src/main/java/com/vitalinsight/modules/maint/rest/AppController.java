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
package com.vitalinsight.modules.maint.rest;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import com.vitalinsight.annotation.Log;
import com.vitalinsight.modules.maint.domain.App;
import com.vitalinsight.modules.maint.domain.dto.AppQueryCriteria;
import com.vitalinsight.modules.maint.service.AppService;
import com.vitalinsight.utils.PageResult;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
* @author zhanghouying
* @date 2019-08-24
*/
@RestController
@RequiredArgsConstructor
@Api(tags = "运维：应用管理")
@RequestMapping("/api/app")
public class AppController {

    private final AppService appService;

    @ApiOperation("导出应用数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@el.check('app:list')")
    public void exportApp(HttpServletResponse response, AppQueryCriteria criteria) throws IOException {
        appService.download(appService.queryAll(criteria), response);
    }

    @ApiOperation(value = "查询应用")
    @GetMapping
    @PreAuthorize("@el.check('app:list')")
    public ResponseEntity<PageResult<App>> queryApp(AppQueryCriteria criteria){
        Page<Object> page = new Page<>(criteria.getPage(), criteria.getSize());
        return new ResponseEntity<>(appService.queryAll(criteria, page),HttpStatus.OK);
    }

    @Log("新增应用")
    @ApiOperation(value = "新增应用")
    @PostMapping
    @PreAuthorize("@el.check('app:add')")
    public ResponseEntity<Object> createApp(@Validated @RequestBody App resources){
        appService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @Log("修改应用")
    @ApiOperation(value = "修改应用")
    @PutMapping
    @PreAuthorize("@el.check('app:edit')")
    public ResponseEntity<Object> updateApp(@Validated @RequestBody App resources){
        appService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除应用")
    @ApiOperation(value = "删除应用")
    @DeleteMapping
    @PreAuthorize("@el.check('app:del')")
    public ResponseEntity<Object> deleteApp(@RequestBody Set<Long> ids){
        appService.delete(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
