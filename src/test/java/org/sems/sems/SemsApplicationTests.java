package org.sems.sems;


import org.junit.jupiter.api.Test;
import org.sems.sems.Controller.JsdmkController;
import org.sems.sems.Mapper.*;
import org.sems.sems.Public.PublicService;
import org.sems.sems.service.DataStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class SemsApplicationTests {

    @Autowired
    private XlttkMapper xlttkMapper;
    @Autowired
    private SfdmkMapper sfdmkMapper;
    @Autowired
    private DataMapper dataMapper;

    @Autowired
    private PublicService publicService;
    @Autowired
    private DataStudentService dataStudentService;

    @Test
    void contextLoads123() {
        System.out.println(dataMapper.loginInterface("123", "123"));
    }

    // 测试获取教师数据

    @Test
    void getPublicService() {
        JsdmkController jsdmkController = new JsdmkController();
        jsdmkController.getAllTeachers();
    }

    // 测试读取json文件
    @Test
    void contextLoads() {
        System.out.println(publicService.readJSONFile("dataJson.json"));
    }

    @Autowired
    private DataStudentMapper dataStudentMapper;

    //测试管理员更新学生信息
    @Test
    void contextLoads1() {

    }

    @Autowired
    private JsbjdykMapper jsbjdykMapper;

    // 测试获取教师对应班级列表
    @Test
    void contextLoads23() {
        System.out.println(jsbjdykMapper.getBjdmkByJsdmk(1000));
    }

    @Test
        //测试存储过程
    void contextLoads2() {
        publicService.LoginInterface("123", "123", "admin");
    }

    @Test
        //测试学生登录接口
    void contextLoads6() {
        publicService.LoginInterface("20213260032", "123", "student");
    }

    @Test
        //测试单位登录接口
    void contextLoads7() {
        publicService.LoginInterface("luo", "123", "dw");
    }

    // 测试获取用户数据
    @Test
    void contextLoads8() {
        System.out.println(publicService.getUserOneType(1, 1));
    }

    @Test
    void contextLoads85() {
        System.out.println(publicService.getUserAllType(1));
    }

    @Test
    void test1() {
        dataStudentService.getStudentByIdentity();
    }


    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    void contextLoads3() {
        Integer SFDM = 10;
        jdbcTemplate.query(
                "SELECT * FROM SFDMK WHERE SFDM = ?",
                new Object[]{SFDM},
                (ResultSet rs) -> {
                    ResultSetMetaData metaData = rs.getMetaData();
                    int columnCount = metaData.getColumnCount();

                    while (rs.next()) {
                        for (int i = 1; i <= columnCount; i++) {
                            String columnName = metaData.getColumnName(i);
                            Object value = rs.getObject(i);
                            System.out.println(columnName + ": " + value);
                        }
                        System.out.println("---");
                    }
                }
        );
    }

    @Test
    void contextLoads4() {
        String searchTerm = "广";

        // 方法1：详细打印
        List<Map<String, Object>> results = jdbcTemplate.queryForList(
                "SELECT * FROM SFDMK WHERE SFMC LIKE ?",
                "%" + searchTerm + "%"
        );

        System.out.println("总记录数：" + results.size());
        results.forEach(row -> {
            System.out.println("记录详情：" + row);
        });

    }


    /**
     * 执行 usp_Get_JCSJ 存储过程并获取所有结果集数据
     *
     * <p>此方法调用存储过程 usp_Get_JCSJ，并返回存储过程中所有结果集的数据。
     * 每个结果集被转换为 Map 列表，允许动态处理不同结构的数据表。</p>
     *
     * <p>适用场景：
     * <ul>
     *   <li>获取多个数据表的基础数据</li>
     *   <li>处理返回多个结果集的存储过程</li>
     *   <li>需要灵活处理不同表结构的场景</li>
     * </ul>
     * </p>
     *
     * <p>示例：
     * <pre>
     * List<List<Map<String, Object>>> allData = jcsjService.getJCSJData();
     * for (List<Map<String, Object>> resultSet : allData) {
     *     // 处理每个结果集
     *     resultSet.forEach(row -> {
     *         // 处理每一行数据
     *     });
     * }
     * </pre>
     * </p>
     *
     * @return 包含所有结果集的列表，每个结果集是一个 Map 列表
     * - 外层 List 代表不同的结果集
     * - 内层 List 包含每个结果集的所有行
     * - 每行用 Map 表示，键为列名，值为对应的数据
     * @throws RuntimeException 如果执行存储过程时发生数据库错误
     * @version 1.0
     * @since 1.0
     */
    public List<List<Map<String, Object>>> getJCSJData(String sql) {
        // 使用 jdbcTemplate 执行数据库连接回调
        // 返回一个包含多个结果集的列表，每个结果集是 Map 的列表
        return jdbcTemplate.execute((ConnectionCallback<List<List<Map<String, Object>>>>) connection -> {
            // 创建最终结果的列表，用于存储所有结果集
            List<List<Map<String, Object>>> results = new ArrayList<>();

            // 使用 try-with-resources 确保 CallableStatement 正确关闭
            try (CallableStatement callableStatement = connection.prepareCall(sql)) {
                // 执行存储过程，返回是否有结果集
                boolean hasResults = callableStatement.execute();

                // 循环处理所有结果集
                while (hasResults) {
                    // 使用 try-with-resources 确保 ResultSet 正确关闭
                    try (ResultSet rs = callableStatement.getResultSet()) {
                        // 创建当前结果集的列表
                        List<Map<String, Object>> currentResults = new ArrayList<>();

                        // 获取结果集的元数据
                        ResultSetMetaData metaData = rs.getMetaData();
                        // 获取列的总数
                        int columnCount = metaData.getColumnCount();

                        // 遍历结果集的每一行
                        while (rs.next()) {
                            // 创建一个 Map 来存储当前行的数据
                            Map<String, Object> row = new HashMap<>();

                            // 遍历每一列，将列名和对应的值存入 Map
                            for (int i = 1; i <= columnCount; i++) {
                                row.put(
                                        // 获取列名
                                        metaData.getColumnName(i),
                                        // 获取对应列的值
                                        rs.getObject(i)
                                );
                            }

                            // 将当前行添加到当前结果集列表
                            currentResults.add(row);
                        }

                        // 将当前结果集添加到最终结果列表
                        results.add(currentResults);
                    }

                    // 移动到下一个结果集
                    hasResults = callableStatement.getMoreResults();
                }
            }

            // 返回所有结果集
            return results;
        });
    }

    @Test
    void contextLoads5() {
        List<List<Map<String, Object>>> allResults = getJCSJData("{call usp_Get_JCSJ()}");

        // 打印每个结果集的信息---在不知map的结构的情况下
        for (int i = 0; i < allResults.size(); i++) {
            List<Map<String, Object>> resultSet = allResults.get(i);
            System.out.println("第 " + (i + 1) + " 个结果集 记录数：" + resultSet.size());

            // 遍历结果集
            resultSet.forEach(row -> {
                // 方法1：使用 entrySet()
                for (Map.Entry<String, Object> entry : row.entrySet()) {
                    String columnName = entry.getKey();   // 获取列名
                    Object value = entry.getValue();      // 获取对应的值
                    System.out.println(columnName + ": " + value);
                }
            });
            System.out.println("结果集结束啦！------------------");
        }
    }

}
