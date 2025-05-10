package com.vitalinsight.service.impl;

import com.alipay.api.internal.util.file.IOUtils;
import com.vitalinsight.domain.CheckupItems;
import com.vitalinsight.service.ParserService;
import net.sourceforge.tess4j.Tesseract;
import lombok.RequiredArgsConstructor;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.vitalinsight.service.CheckupItemsService;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.File;

/**
 * @author VitalInsight Team
 * @date 2025-05-10
 */

@Service
@RequiredArgsConstructor
public class ReportParser implements ParserService {
    private final Tesseract tesseract;
    private final CheckupItemsService checkupItemsService;

    public List<CheckupItems> parseMultiReport(MultipartFile multipartFile) throws TesseractException, IOException {
        File tempFile = File.createTempFile("temp", ".tmp");
        try (OutputStream out = new FileOutputStream(tempFile)) {
            IOUtils.copy(multipartFile.getInputStream(), out);
        }
        List<CheckupItems> checkupItemsList = parseReport(tempFile);
        tempFile.deleteOnExit();
        return checkupItemsList;
    }

    public List<CheckupItems> parseReport(File file) throws TesseractException, IOException {
        // OCR识别
        String ocrText = tesseract.doOCR(file);

        // 数据清洗增强
        String cleanedText = ocrText
                .replaceAll("[↓↑]", "") // 去除干扰符号
                .replaceAll("伶查", "检查")
                .replaceAll("\\s+美国.*", "") // 清理检查小结乱码
                .replaceAll("\\s{2,}", "|") // 关键分隔符转换
                .replaceAll("(\\d)([a-zA-Z])", "$1|$2") // 数值和单位间加分隔符
                .replaceAll("([a-zA-Z])(\\d)", "$1|$2"); // 单位和数值间加分隔符

        return parseCheckupItems(cleanedText);
    }

    private List<CheckupItems> parseCheckupItems(String text) {
        List<CheckupItems> items = new ArrayList<>();
        // 强化正则表达式（样例测试通过版本）
        Pattern pattern = Pattern.compile(
                "^(?<name>[\\u4e00-\\u9fa5a-zA-Z\\-—α]+(?:\\s[\\u4e00-\\u9fa5a-zA-Z\\-—α]+)*?)" + // 支持多词项目名称
                        "\\|" +
                        "(?<result>(?:\\d+\\.?\\d*|[阴性阳性弱阳性有无±]+))" +  // 数值或定性结果[2,7](@ref)
                        "\\|" +
                        "(?<unit>(?:[a-zA-Z\\d*/%]+\\^?\\d*~?\\d*[a-zA-Z\\d*/%]*|—)?)" + // 支持复合单位[5,8](@ref)
                        "\\|" +
                        "(?<ref>(?:\\d+\\.?\\d*[~\\-—]\\d+\\.?\\d*\\s*[a-zA-Z\\d*/%]*)|[\\u4e00-\\u9fa5]+.*?)(?=\\||$)" // 范围或定性描述[3,6](@ref)
        );  // 无法检出 “情定性|阴性|弱阳性” 等数据...

        Arrays.stream(text.split("\\r?\\n"))
                .map(line -> line.replaceAll("\\s+", "")) // 清理行内空格
                .filter(line -> line.matches(".*\\|.*\\|.*")) // 必须包含两个分隔符
                .forEach(line -> {
                    // 细胞计数|2.4|10*16/L|0-8
                    Matcher matcher = pattern.matcher(line);
                    if (matcher.find()) {
                        CheckupItems item = new CheckupItems();
                        // 处理项目名称（还原连接符）
                        String name = matcher.group("name").replace("—", "-")
                                .replace("α", "α")
                                .replace("β", "β")
                                .replace("γ", "γ")
                                .replace("δ", "δ")
                                .replace("ε", "ε")
                                .replace("ζ", "ζ")
                                .replace("η", "η");;

                        // 处理结果（恢复单位分隔符）
                        String result = matcher.group("result").replace("|", " ").replace(",", ".");

                        // 处理参考范围（恢复单位分隔符）
                        String ref = matcher.group("ref").replace("|", " ").replace("~", "-");

                        // 单位，后续考虑是否加入 Checkup_Items 表
                        String unit = matcher.group("unit").replace("|", " ").replace("~", "-");

                        item.setItemName(name);
                        item.setItemValue(result);
                        item.setReferenceRange(ref);
                        checkupItemsService.create(item);

                        items.add(item);
                    }
                });
        return items;
    }
}