package com.website.web.controller.system;

import com.website.common.core.controller.BaseController;
import com.website.common.core.page.TableDataInfo;
import com.website.system.domain.EmployeeWages;
import com.website.system.service.ISysCardInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 预约卡片管理Controller
 *
 * @author david
 * @date 2024-01-21
 */
@RestController
@RequestMapping("/reservation/enployeeWages")
public class SysEmployeeWagesController extends BaseController
{
    @Autowired
    private ISysCardInfoService sysCardInfoService;

    /**
     * 查询工资列表
     */
    @GetMapping("/list")
    public TableDataInfo list(EmployeeWages employeeWages)
    {
        startPage();
        List<EmployeeWages> list = sysCardInfoService.getEmployeeWages(employeeWages);
        return getDataTable(list);
    }
}
