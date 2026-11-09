package com.website.web.controller.system;

import com.website.common.core.controller.BaseController;
import com.website.common.core.page.TableDataInfo;
import com.website.system.domain.EmployeeWages;
import com.website.system.domain.ServiceStatistics;
import com.website.system.service.ISysCardInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 预约卡片管理Controller
 *
 * @author david
 * @date 2024-01-21
 */
@RestController
@RequestMapping("/reservation/serviceStatistics")
public class SysServiceStaitisticsController extends BaseController
{
    @Autowired
    private ISysCardInfoService sysCardInfoService;

    /**
     * 查询服务统计列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ServiceStatistics serviceStatistics)
    {
        startPage();
        List<ServiceStatistics> list = sysCardInfoService.getServiceStatistics(serviceStatistics);
        return getDataTable(list);
    }
}
