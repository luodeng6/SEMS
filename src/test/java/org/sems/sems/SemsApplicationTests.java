package org.sems.sems;


import org.junit.jupiter.api.Test;
import org.sems.sems.Controller.JsdmkController;
import org.sems.sems.Mapper.*;
import org.sems.sems.Public.PublicService;
import org.sems.sems.service.DataStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

}
