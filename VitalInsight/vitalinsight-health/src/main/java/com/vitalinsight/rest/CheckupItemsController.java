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
import com.vitalinsight.domain.CheckupItems;
import com.vitalinsight.service.CheckupItemsService;
import com.vitalinsight.domain.dto.CheckupItemsQueryCriteria;
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
* @date 2025-05-07
**/
@RestController
@RequiredArgsConstructor
@Api(tags = "view_checkup_items")
@RequestMapping("/api/checkupItems")
public class CheckupItemsController {

    private final CheckupItemsService checkupItemsService;

    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
//    @PreAuthorize("@el.check('checkupItems:list')")
    public void exportCheckupItems(HttpServletResponse response, CheckupItemsQueryCriteria criteria) throws IOException {
        checkupItemsService.download(checkupItemsService.queryAll(criteria), response);
    }

    @GetMapping
    @ApiOperation("查询view_checkup_items")
//    @PreAuthorize("@el.check('checkupItems:list')")
    public ResponseEntity<PageResult<CheckupItems>> queryCheckupItems(CheckupItemsQueryCriteria criteria){
        Page<Object> page = new Page<>(criteria.getPage(), criteria.getSize());
        return new ResponseEntity<>(checkupItemsService.queryAll(criteria,page),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增view_checkup_items")
    @ApiOperation("新增view_checkup_items")
//    @PreAuthorize("@el.check('checkupItems:add')")
    public ResponseEntity<Object> createCheckupItems(@Validated @RequestBody CheckupItems resources){
        checkupItemsService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改view_checkup_items")
    @ApiOperation("修改view_checkup_items")
//    @PreAuthorize("@el.check('checkupItems:edit')")
    public ResponseEntity<Object> updateCheckupItems(@Validated @RequestBody CheckupItems resources){
        checkupItemsService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping
    @Log("删除view_checkup_items")
    @ApiOperation("删除view_checkup_items")
//    @PreAuthorize("@el.check('checkupItems:del')")
    public ResponseEntity<Object> deleteCheckupItems(@ApiParam(value = "传ID数组[]") @RequestBody List<Long> ids) {
        checkupItemsService.deleteAll(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}