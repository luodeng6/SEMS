package org.sems.sems.Controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.sems.sems.Mapper.DataStudentMapper;
import org.sems.sems.Mapper.XscjdkMapper;
import org.sems.sems.entity.Xscjdk;
import org.sems.sems.service.XscjdkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.apache.poi.ss.usermodel.Cell;

import com.fasterxml.jackson.core.type.TypeReference;

@RestController
@RequestMapping("/xscjdk")
public class XscjdkController {


    @Autowired
    private XscjdkService xscjdkService;

    @RequestMapping("/getXscjdk")
    public Map<String, Object> getXscjdk(
            @RequestParam(defaultValue = "1",required = false) int QYDM,
            @RequestParam(defaultValue = "1") int YHSFDM,
            @RequestParam( defaultValue = "null") String YHM,
            @RequestParam(defaultValue = "-1") int STUID
    ) {
        return xscjdkService.getXscjdk(QYDM, YHSFDM, YHM, STUID);
    }

    @PostMapping("/insertXscjdk")
    public Map<String, Object> insertXscjdk(Xscjdk xscjdk) {
                return xscjdkService.insertXscjdk(xscjdk);
    }

    @PostMapping("/updateXscjdk")
    public Map<String, Object> updateXscjdk(Xscjdk xscjdk) {
                return xscjdkService.updateXscjdk(xscjdk);
    }

    @Autowired
    private DataStudentMapper dataStudentMapper;
    @Autowired
    private XscjdkMapper xscjdkMapper;
    @PostMapping("/import")
    public Map<String, Object> importData(@RequestParam("data") String data) {
        Map<String, Object> result = new LinkedHashMap<>();
        int  count = 0;
        try {
            // 使用 Jackson 解析 JSON 字符串
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, Object>> uploadList = objectMapper.readValue(data, new TypeReference<>() {
            });

            // 这里可以处理解析后的数据，比如存入数据库
            for (Map<String, Object> item : uploadList) {
                /*{课程名称=网络安全与管理（国家安全类）,
                 课程性质=公选网络课,
                  学分=2, 绩点=0.00,
                  成绩性质=正常考试,
                  任课教师=无,
                  学号=1.0,
                  姓名=罗邓,
                  成绩=91}*/
                Xscjdk xscjdk = new Xscjdk();
                xscjdk.setKcmc(item.get("课程名称") != null ? item.get("课程名称").toString() : null);
                xscjdk.setKcxz(item.get("课程性质") != null ? item.get("课程性质").toString() : null);

            // 处理学分，避免 Integer 转 String 再转换
                Object xfObj = item.get("学分");
                xscjdk.setXf(xfObj != null ? Float.parseFloat(xfObj.toString()) : null);

                Object jdObj = item.get("绩点");
                xscjdk.setJd(jdObj != null ? Float.parseFloat(jdObj.toString()) : null);

                xscjdk.setCjxz(item.get("成绩性质") != null ? item.get("成绩性质").toString() : null);

                Object cjObj = item.get("成绩");
                xscjdk.setKccj(cjObj != null ? Float.parseFloat(cjObj.toString()) : null);

                xscjdk.setSkjs(item.get("任课教师") != null ? item.get("任课教师").toString() : null);

                Object xhObj = item.get("学号");
                String xh = xhObj != null ? xhObj.toString() : null;
                xscjdk.setStuid(dataStudentMapper.getStudentByYHM(xh).getId());

                System.out.println(xscjdk);

                xscjdkMapper.insertXscjdk(xscjdk);
                count++;
            }

            result.put("code", 200);
            result.put("msg", "导入成功");
            result.put("result",true);
            result.put("count", uploadList.size());

        } catch (IOException e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg",  e.getMessage());
            result.put("result",false);
            result.put("count", count);
        }
        return result;
    }






        @PostMapping("/upload")
        public ResponseEntity<?> uploadExcel(@RequestParam("file") MultipartFile file) {
            List<Map<String, Object>> dataList = new ArrayList<>();

            try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
                Sheet sheet = workbook.getSheetAt(0);
                Iterator<Row> rowIterator = sheet.iterator();

                // 读取首行作为标题
                List<String> headers = new ArrayList<>();
                if (rowIterator.hasNext()) {
                    Row headerRow = rowIterator.next();
                    for (Cell cell : headerRow) {
                        headers.add(cell.getStringCellValue());
                    }
                }

                // 解析每一行数据
                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();
                    Map<String, Object> rowData = new LinkedHashMap<>();
                    for (int i = 0; i < headers.size(); i++) {
                        Cell cell = row.getCell(i, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
                        rowData.put(headers.get(i), getCellValue(cell));
                    }
                    dataList.add(rowData);
                }
            } catch (IOException e) {
                e.printStackTrace();
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body("文件解析出错: " + e.getMessage());
            }
           // System.out.println(dataList);
            // 返回 JSON 数据给前端
            return ResponseEntity.ok(dataList);
        }

        // 根据单元格类型返回相应的值
        private Object getCellValue(Cell cell) {
            Object cellValue;
            switch (cell.getCellType()) {
                case STRING:
                    cellValue = cell.getStringCellValue();
                    break;
                case NUMERIC:
                    if (DateUtil.isCellDateFormatted(cell)) {
                        cellValue = cell.getDateCellValue();
                    } else {
                        cellValue = cell.getNumericCellValue();
                    }
                    break;
                case BOOLEAN:
                    cellValue = cell.getBooleanCellValue();
                    break;
                case FORMULA:
                    cellValue = cell.getCellFormula();
                    break;
                case BLANK:
                default:
                    cellValue = "";
                    break;
            }
            return cellValue;
        }
    }


