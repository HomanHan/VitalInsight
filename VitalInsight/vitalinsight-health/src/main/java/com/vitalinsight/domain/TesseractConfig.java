package com.vitalinsight.domain;

import net.sourceforge.tess4j.Tesseract;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Vital Insight Team
 * @date 2025-05-08
 */
@Configuration
public class TesseractConfig {

    @Value("${tess4j.datapath}")
    private String dataPath;

    @Value("${tess4j.lang}")
    private String lang;

    @Bean
    public Tesseract tesseract() {

        Tesseract tesseract = new Tesseract();
        // 设置训练数据文件夹路径
        tesseract.setDatapath(dataPath);
        // 设置为中文简体, 英文, 阿拉伯语
        tesseract.setLanguage(lang);
        tesseract.setPageSegMode(3);    // PSM_AUTO 全自动页面分割
        tesseract.setOcrEngineMode(1);  // OEM_LSTM_ONLY 使用LSTM引擎
        tesseract.setVariable("preserve_interword_spaces", "1");
        return tesseract;
    }
}