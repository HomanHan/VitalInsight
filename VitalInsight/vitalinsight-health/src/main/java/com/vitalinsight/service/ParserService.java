package com.vitalinsight.service;

import com.vitalinsight.domain.CheckupItems;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.List;

public interface ParserService {

    /**
     * 解析体检报告核心方法
     *
     * @param multipartFile 文件
     * @return 检查项列表
     * @throws TesseractException OCR解析异常
     * @throws IOException 文件读取异常
     */
    List<CheckupItems> parseMultiReport(MultipartFile multipartFile) throws TesseractException, IOException;

    /**
     * 解析体检报告核心方法
     *
     * @param file 文件
     * @return 检查项列表
     * @throws TesseractException OCR解析异常
     * @throws IOException 文件读取异常
     */
    List<CheckupItems> parseReport(File file) throws TesseractException, IOException;
}