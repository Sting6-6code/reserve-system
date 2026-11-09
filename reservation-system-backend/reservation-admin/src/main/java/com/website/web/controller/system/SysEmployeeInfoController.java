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
import com.website.system.domain.SysEmployeeInfo;
import com.website.system.service.ISysEmployeeInfoService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 员工管理Controller
 *
 * @author ruoyi
 * @date 2024-01-21
 */
@RestController
@RequestMapping("/system/employeeInfo")
public class SysEmployeeInfoController extends BaseController
{
    @Autowired
    private ISysEmployeeInfoService sysEmployeeInfoService;

    /**
     * 查询员工管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:employeeInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysEmployeeInfo sysEmployeeInfo)
    {
        startPage();
        List<SysEmployeeInfo> list = sysEmployeeInfoService.selectSysEmployeeInfoList(sysEmployeeInfo);
        return getDataTable(list);
    }

    /**
     * 导出员工管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:employeeInfo:export')")
    @Log(title = "员工管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysEmployeeInfo sysEmployeeInfo)
    {
        List<SysEmployeeInfo> list = sysEmployeeInfoService.selectSysEmployeeInfoList(sysEmployeeInfo);
        ExcelUtil<SysEmployeeInfo> util = new ExcelUtil<SysEmployeeInfo>(SysEmployeeInfo.class);
        util.exportExcel(response, list, "员工管理数据");
    }

    /**
     * 获取员工管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:employeeInfo:query')")
    @GetMapping(value = "/{employeeId}")
    public AjaxResult getInfo(@PathVariable("employeeId") Long employeeId)
    {
        return success(sysEmployeeInfoService.selectSysEmployeeInfoByEmployeeId(employeeId));
    }

    /**
     * 新增员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:employeeInfo:add')")
    @Log(title = "员工管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysEmployeeInfo sysEmployeeInfo)
    {
        SysEmployeeInfo sysEmployee = sysEmployeeInfoService.selectSysEmployeeInfoByEmployeeId(sysEmployeeInfo.getEmployeeId());
        if(sysEmployee==null){
            sysEmployeeInfoService.insertSysEmployeeInfo(sysEmployeeInfo);
            return AjaxResult.success("添加预约员工成功");
        }else{
            return AjaxResult.error("用户已存在,请不要重复操作");
        }
    }

    /**
     * 修改员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:employeeInfo:edit')")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysEmployeeInfo sysEmployeeInfo)
    {
        return toAjax(sysEmployeeInfoService.updateSysEmployeeInfo(sysEmployeeInfo));
    }

    /**
     * 删除员工管理
     */
    @PreAuthorize("@ss.hasPermi('system:employeeInfo:remove')")
    @Log(title = "员工管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{employeeIds}")
    public AjaxResult remove(@PathVariable Long[] employeeIds)
    {
        return toAjax(sysEmployeeInfoService.deleteSysEmployeeInfoByEmployeeIds(employeeIds));
    }
}
