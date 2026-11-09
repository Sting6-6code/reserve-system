package com.website.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.website.common.annotation.Log;
import com.website.common.core.controller.BaseController;
import com.website.common.core.domain.AjaxResult;
import com.website.common.enums.BusinessType;
import com.website.system.domain.SysEmployeeService;
import com.website.system.service.ISysEmployeeServiceService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 员工服务Controller
 *
 * @author david
 * @date 2024-01-21
 */
@RestController
@RequestMapping("/system/service")
public class SysEmployeeServiceController extends BaseController
{
    @Autowired
    private ISysEmployeeServiceService sysEmployeeServiceService;

    /**
     * 查询员工服务列表
     */
    @PreAuthorize("@ss.hasPermi('system:service:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysEmployeeService sysEmployeeService)
    {
        startPage();
        List<SysEmployeeService> list = sysEmployeeServiceService.selectSysEmployeeServiceList(sysEmployeeService);
        return getDataTable(list);
    }

    /**
     * 导出员工服务列表
     */
    @PreAuthorize("@ss.hasPermi('system:service:export')")
    @Log(title = "员工服务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysEmployeeService sysEmployeeService)
    {
        List<SysEmployeeService> list = sysEmployeeServiceService.selectSysEmployeeServiceList(sysEmployeeService);
        ExcelUtil<SysEmployeeService> util = new ExcelUtil<SysEmployeeService>(SysEmployeeService.class);
        util.exportExcel(response, list, "员工服务数据");
    }

    /**
     * 获取员工服务详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:service:query')")
    @GetMapping(value = "/{serviceId}")
    public AjaxResult getInfo(@PathVariable("serviceId") Long serviceId)
    {
        return success(sysEmployeeServiceService.selectSysEmployeeServiceByServiceId(serviceId));
    }

    /**
     * 新增员工服务
     */
    @PreAuthorize("@ss.hasPermi('system:service:add')")
    @Log(title = "员工服务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysEmployeeService sysEmployeeService)
    {
        return toAjax(sysEmployeeServiceService.insertSysEmployeeService(sysEmployeeService));
    }

    /**
     * 修改员工服务
     */
    @PreAuthorize("@ss.hasPermi('system:service:edit')")
    @Log(title = "员工服务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysEmployeeService sysEmployeeService)
    {
        return toAjax(sysEmployeeServiceService.updateSysEmployeeService(sysEmployeeService));
    }

    /**
     * 删除员工服务
     */
    @PreAuthorize("@ss.hasPermi('system:service:remove')")
    @Log(title = "员工服务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{serviceIds}")
    public AjaxResult remove(@PathVariable Long[] serviceIds)
    {
        return toAjax(sysEmployeeServiceService.deleteSysEmployeeServiceByServiceIds(serviceIds));
    }
}
