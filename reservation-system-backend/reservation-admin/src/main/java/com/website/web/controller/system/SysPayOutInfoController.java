package com.website.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.website.system.domain.SysCardOrder;
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
import com.website.system.domain.SysPayOutInfo;
import com.website.system.service.ISysPayOutInfoService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 支出管理Controller
 *
 * @author ruoyi
 * @date 2024-01-25
 */
@RestController
@RequestMapping("/system/payOutInfo")
public class SysPayOutInfoController extends BaseController
{
    @Autowired
    private ISysPayOutInfoService sysPayOutInfoService;

    /**
     * 查询支出管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:payOutInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPayOutInfo sysPayOutInfo)
    {
        startPage();
        List<SysPayOutInfo> list = sysPayOutInfoService.selectSysPayOutInfoList(sysPayOutInfo);
        return getDataTable(list);
    }

    /**
     * 导出支出管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:payOutInfo:export')")
    @Log(title = "支出管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysPayOutInfo sysPayOutInfo)
    {
        List<SysPayOutInfo> list = sysPayOutInfoService.selectSysPayOutInfoList(sysPayOutInfo);
        ExcelUtil<SysPayOutInfo> util = new ExcelUtil<SysPayOutInfo>(SysPayOutInfo.class);
        util.exportExcel(response, list, "支出管理数据");
    }

    /**
     * 获取支出管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:payOutInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysPayOutInfoService.selectSysPayOutInfoById(id));
    }

    /**
     * 新增支出管理
     */
    @PreAuthorize("@ss.hasPermi('system:payOutInfo:add')")
    @Log(title = "支出管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysPayOutInfo sysPayOutInfo)
    {
        return toAjax(sysPayOutInfoService.insertSysPayOutInfo(sysPayOutInfo));
    }

    /**
     * 修改支出管理
     */
    @PreAuthorize("@ss.hasPermi('system:payOutInfo:edit')")
    @Log(title = "支出管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPayOutInfo sysPayOutInfo)
    {
        return toAjax(sysPayOutInfoService.updateSysPayOutInfo(sysPayOutInfo));
    }

    /**
     * 删除支出管理
     */
    @PreAuthorize("@ss.hasPermi('system:payOutInfo:remove')")
    @Log(title = "支出管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysPayOutInfoService.deleteSysPayOutInfoByIds(ids));
    }

    /**
     * 获取礼品卡订单记录详细信息
     */
    @PostMapping(value = "/payOutAmount")
    public AjaxResult payOutAmount(@RequestBody SysPayOutInfo sysPayOutInfo)
    {
        return success(sysPayOutInfoService.selectPayOutAmount(sysPayOutInfo));
    }
}
