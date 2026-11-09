package com.website.employeeindex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void updateEmployeeIndex() {
        String maxIndexQuery = "SELECT MAX(`order_num`) FROM `reservation-system`.sys_employee_info";
        Integer maxIndex = jdbcTemplate.queryForObject(maxIndexQuery, Integer.class);

        String updateIndexQuery = "UPDATE sys_employee_info SET order_num = CASE WHEN order_num = 0 THEN ? ELSE order_num - 1 END";
        jdbcTemplate.update(updateIndexQuery, maxIndex);
    }
}

