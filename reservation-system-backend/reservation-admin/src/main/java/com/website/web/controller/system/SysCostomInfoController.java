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
import com.website.system.domain.SysCostomInfo;
import com.website.system.service.ISysCostomInfoService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 预约客户管理Controller
 *
 * @author david
 * @date 2024-01-29
 */
@RestController
@RequestMapping("/reservation/costomInfo")
public class SysCostomInfoController extends BaseController
{
    @Autowired
    private ISysCostomInfoService sysCostomInfoService;

    /**
     * 查询预约客户管理列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:costomInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysCostomInfo sysCostomInfo)
    {
        startPage();
        List<SysCostomInfo> list = sysCostomInfoService.selectSysCostomInfoList(sysCostomInfo);
        return getDataTable(list);
    }

    /**
     * 导出预约客户管理列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:costomInfo:export')")
    @Log(title = "预约客户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCostomInfo sysCostomInfo)
    {
        List<SysCostomInfo> list = sysCostomInfoService.selectSysCostomInfoList(sysCostomInfo);
        ExcelUtil<SysCostomInfo> util = new ExcelUtil<SysCostomInfo>(SysCostomInfo.class);
        util.exportExcel(response, list, "预约客户管理数据");
    }

    /**
     * 获取预约客户管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('reservation:costomInfo:query')")
    @GetMapping(value = "/{customId}")
    public AjaxResult getInfo(@PathVariable("customId") Long customId)
    {
        return success(sysCostomInfoService.selectSysCostomInfoByCustomId(customId));
    }

    /**
     * 新增预约客户管理
     */
    @PreAuthorize("@ss.hasPermi('reservation:costomInfo:add')")
    @Log(title = "预约客户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCostomInfo sysCostomInfo)
    {
        sysCostomInfoService.insertSysCostomInfo(sysCostomInfo);
        return AjaxResult.success(sysCostomInfo);
    }

    /**
     * 修改预约客户管理
     */
    @PreAuthorize("@ss.hasPermi('reservation:costomInfo:edit')")
    @Log(title = "预约客户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCostomInfo sysCostomInfo)
    {
        return toAjax(sysCostomInfoService.updateSysCostomInfo(sysCostomInfo));
    }

    /**
     * 删除预约客户管理
     */
    @PreAuthorize("@ss.hasPermi('reservation:costomInfo:remove')")
    @Log(title = "预约客户管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{customIds}")
    public AjaxResult remove(@PathVariable Long[] customIds)
    {
        return toAjax(sysCostomInfoService.deleteSysCostomInfoByCustomIds(customIds));
    }
}
