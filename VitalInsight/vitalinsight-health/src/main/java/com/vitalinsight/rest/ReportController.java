package com.vitalinsight.rest;

import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.vitalinsight.service.ParserService;
import java.util.List;
import com.vitalinsight.domain.CheckupItems;
import com.vitalinsight.annotation.rest.AnonymousAccess;

/**
 * @author Vital Insight Team
 * @date 2025-05-08
 */

@RestController
@RequiredArgsConstructor
@Api(tags = "工具：体检报告解析")
@RequestMapping("/api/reports")
public class ReportController {
    private ParserService Parser;

    @AnonymousAccess
    @PostMapping("/parse")
    public ResponseEntity<List<CheckupItems>> parseReport(@RequestParam("file") MultipartFile file) {
        try {
            return ResponseEntity.ok(Parser.parseMultiReport(file));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}
