package org.sems.sems.Public.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.sems.sems.Public.PublicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.convert.ConversionService;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class PublicServiceImpl implements PublicService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * @return
     */
    @Override
    public List<List<Map<String, Object>>> getUserAllType(int state) {
        List<List<Map<String, Object>>> userList = new ArrayList<>();


        System.out.println("用户启用状态: " + state);
        // 使用 SimpleJdbcCall 来处理多个结果集
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withProcedureName("usp_GetAllSystemUser");

        // 调用存储过程并获取结果
        Map<String, Object> result = jdbcCall.execute(new MapSqlParameterSource()
                .addValue("userRole", 5)
                .addValue("state", state));

        // 处理返回的结果集
        for (String key : result.keySet()) {
            List<Map<String, Object>> userListPart = (List<Map<String, Object>>) result.get(key);
            userList.add(userListPart);
        }

        // 检查结果是否为空
        System.out.println("执行获取用户信息接口成功！");
        return userList; // 返回多个结果集

    }

    public List<Map<String, Object>> getUserOneType(int userRole, int state){
        List<Map<String, Object>> userList = new ArrayList<>();
        System.out.println("用户角色: " + userRole);
        System.out.println("用户启用状态: " + state);

        userList = jdbcTemplate.queryForList(
                "{call usp_GetAllSystemUser(?, ?)}", userRole,state);
        System.out.println("执行获取用户信息接口成功！");
        return userList;
    }


    @Qualifier("conversionService")


    /**
     * 执行 get_data_from_CCGC 存储过程并获取所有结果集数据
     *
     * <p>此方法调用存储过程 get_data_from_CCGC，并返回存储过程中所有结果集的数据。
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
     * List<List<Map<String, Object>>> allData = jcsjService.get_data_from_CCGC();
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
    public List<List<Map<String, Object>>> get_data_from_CCGC(String SQLTEXT) {
        // 使用 jdbcTemplate 执行数据库连接回调
        // 返回一个包含多个结果集的列表，每个结果集是 Map 的列表
        return jdbcTemplate.execute((ConnectionCallback<List<List<Map<String, Object>>>>) connection -> {
            // 创建最终结果的列表，用于存储所有结果集
            List<List<Map<String, Object>>> results = new ArrayList<>();

            // 使用 try-with-resources 确保 CallableStatement 正确关闭
            try (CallableStatement callableStatement = connection.prepareCall(SQLTEXT)) {
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


    /**
     * 登录接口，使用 Map 作为返回值
     *
     * @param username
     * @param password
     * @return Map<String, Object>
     */
    public Map<String, Object> LoginInterface(String username, String password, String UserRole) {
        Map<String, Object> result = new HashMap<>();
        try {
            // queryForList 是 Spring Framework 中 JdbcTemplate 类的一个方法，用于执行 SQL 查询并将结果映射为一个 List。
            // 这个方法非常适合用于从数据库中检索多行数据，并将每一行的数据封装成一个 Map 或者自定义对象
            List<Map<String, Object>> userList = new ArrayList<>();
            if (UserRole.equals("admin")) {
                userList = jdbcTemplate.queryForList(
                        "{call usp_LoginInterface(?, ?)}", username, password);
            } else if (UserRole.equals("student")) {

                userList = jdbcTemplate.queryForList(
                        "{call usp_StudengLogin(?, ?)}", username, password);
            } else if (UserRole.equals("dw")) {
                userList = jdbcTemplate.queryForList(
                        "{call usp_DwLogin(?, ?)}", username, password);
            }

            System.out.println("执行登录存储过程结果:");
            System.out.println(userList);
            System.out.println();
            if (userList.isEmpty()) {
                System.out.println("用户名或密码错误");
                result.put("code", 403);
                result.put("result", false);
                result.put("Msg", "用户名或密码错误");
            } else {
                System.out.println("执行登录接口成功！");
                result.put("code", 200);
                result.put("result", userList.get(0).get("RESULT"));
                result.put("Msg", userList.get(0).get("Msg"));
                result.put("YHM", userList.get(0).get("YHM"));
                result.put("UserRole", userList.get(0).get("UserRole"));
                result.put("YHMC", userList.get(0).get("YHMC"));
                result.put("YHSFDM", userList.get(0).get("YHSFDM"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("result", false);
            result.put("Msg", "系统异常");
        }
        System.out.println("执行登录接口结果:");
        System.out.println(result);
        return result;
    }

    /**
     * @param filePath
     * @return
     */
    @Override
    public Map<String, Object> readJSONFile(String filePath) {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = new HashMap<>();
        try {
            // 读取JSON文件
            jsonMap = objectMapper.readValue(new File(filePath), Map.class);
            // 输出结果
            System.out.println("读取JSON文件成功:");
            System.out.println(jsonMap);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonMap;
    }

}
