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
import com.website.system.domain.SysIncomeInfo;
import com.website.system.service.ISysIncomeInfoService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 收入管理Controller
 *
 * @author david
 * @date 2024-01-25
 */
@RestController
@RequestMapping("/system/incomeInfo")
public class SysIncomeInfoController extends BaseController
{
    @Autowired
    private ISysIncomeInfoService sysIncomeInfoService;

    /**
     * 查询收入管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:incomeInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysIncomeInfo sysIncomeInfo)
    {
        startPage();
        List<SysIncomeInfo> list = sysIncomeInfoService.selectSysIncomeInfoList(sysIncomeInfo);
        return getDataTable(list);
    }

    /**
     * 导出收入管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:incomeInfo:export')")
    @Log(title = "收入管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysIncomeInfo sysIncomeInfo)
    {
        List<SysIncomeInfo> list = sysIncomeInfoService.selectSysIncomeInfoList(sysIncomeInfo);
        ExcelUtil<SysIncomeInfo> util = new ExcelUtil<SysIncomeInfo>(SysIncomeInfo.class);
        util.exportExcel(response, list, "收入管理数据");
    }

    /**
     * 获取收入管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:incomeInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysIncomeInfoService.selectSysIncomeInfoById(id));
    }

    /**
     * 新增收入管理
     */
    @PreAuthorize("@ss.hasPermi('system:incomeInfo:add')")
    @Log(title = "收入管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysIncomeInfo sysIncomeInfo)
    {
        return toAjax(sysIncomeInfoService.insertSysIncomeInfo(sysIncomeInfo));
    }

    /**
     * 修改收入管理
     */
    @PreAuthorize("@ss.hasPermi('system:incomeInfo:edit')")
    @Log(title = "收入管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysIncomeInfo sysIncomeInfo)
    {
        return toAjax(sysIncomeInfoService.updateSysIncomeInfo(sysIncomeInfo));
    }

    /**
     * 删除收入管理
     */
    @PreAuthorize("@ss.hasPermi('system:incomeInfo:remove')")
    @Log(title = "收入管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysIncomeInfoService.deleteSysIncomeInfoByIds(ids));
    }
}
