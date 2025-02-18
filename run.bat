@echo off  
REM 清理并构建项目  
mvn clean install  

REM 运行 Spring Boot 应用
mvn spring-boot:run