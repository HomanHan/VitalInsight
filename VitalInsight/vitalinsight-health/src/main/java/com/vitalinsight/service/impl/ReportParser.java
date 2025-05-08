package com.vitalinsight.service.impl;

import com.alipay.api.internal.util.file.IOUtils;
import com.vitalinsight.domain.CheckupItems;
import net.sourceforge.tess4j.Tesseract;
import lombok.RequiredArgsConstructor;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.File;

@Service
@RequiredArgsConstructor
public class ReportParser {
    private final Tesseract tesseract;

    public List<CheckupItems> parseMultiReport(MultipartFile multipartFile) throws TesseractException, IOException {
        File tempFile = File.createTempFile("temp", ".tmp");
        try (OutputStream out = new FileOutputStream(tempFile)) {
            IOUtils.copy(multipartFile.getInputStream(), out);
        }
        List<CheckupItems> checkupItemsList = parseReport(tempFile);
        tempFile.deleteOnExit(); // 确保临时文件在程序结束时删除

        return checkupItemsList;
    }
    /**
     * 解析体检报告核心方法
     */
    public List<CheckupItems> parseReport(File file) throws TesseractException, IOException {
        // 1. OCR识别
        String ocrText = tesseract.doOCR(file);

        // 2. 数据清洗
        String cleanedText = ocrText.replaceAll("\\s{2,}", " ")
                .replaceAll("伶查", "检查");

        // 3. 结构化解析
        return parseCheckupItems(cleanedText);
    }

    /**
     * 使用正则表达式提取检查项
     */
    private List<CheckupItems> parseCheckupItems(String text) {
        List<CheckupItems> items = new ArrayList<>();
        Pattern pattern = Pattern.compile(
                "(?<name>[\\u4e00-\\u9fa5a-zA-Z]+)" +   // 项目名称（中英文）
                        "\\s+" +
                        "(?<result>[\\d.]+|[阴性阳性]+)" +       // 结果（数值或定性）
                        "\\s+" +
                        "(?<ref>[\\d.~—]+)"                     // 参考范围（含波浪线/破折号）
        );

        Arrays.stream(text.split("\\r?\\n"))
                .forEach(line -> {
                    Matcher matcher = pattern.matcher(line);
                    if (matcher.find()) {
                        CheckupItems item = new CheckupItems();
                        item.setItemName(matcher.group("name"));
                        item.setItemValue(matcher.group("result"));
                        item.setReferenceRange(matcher.group("ref"));
                        items.add(item);
                    }
                });
        return items;
    }
}