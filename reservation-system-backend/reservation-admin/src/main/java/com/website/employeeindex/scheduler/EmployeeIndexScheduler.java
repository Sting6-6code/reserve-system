package com.website.employeeindex.scheduler;

import com.website.employeeindex.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class EmployeeIndexScheduler {

    @Autowired
    private EmployeeService employeeService;

    @Scheduled(cron = "0 0 0 * * ?")
    public void updateEmployeeIndexDaily() {
        employeeService.updateEmployeeIndex();
    }
}