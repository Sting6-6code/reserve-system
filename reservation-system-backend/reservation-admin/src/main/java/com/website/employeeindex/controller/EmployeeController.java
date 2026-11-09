package com.website.employeeindex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;


// For Frontend use ONLY
@RestController
public class EmployeeController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/api/employeesindex")
    public List<Map<String, Object>> getEmployees() {
        String query = "SELECT * FROM `reservation-system`.sys_employee_info ORDER BY `order_num` ASC";
        return jdbcTemplate.queryForList(query);
    }
}