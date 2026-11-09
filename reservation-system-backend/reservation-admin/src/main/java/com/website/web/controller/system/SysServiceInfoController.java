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
import com.website.common.core.domain.entity.SysServiceInfo;
import com.website.system.service.ISysServiceInfoService;
import com.website.common.utils.poi.ExcelUtil;

/**
 * 服务管理Controller
 *
 * @author david
 * @date 2024-01-21
 */
@RestController
@RequestMapping("/system/serviceInfo")
public class SysServiceInfoController extends BaseController
{
    @Autowired
    private ISysServiceInfoService sysServiceInfoService;

    /**
     * 查询服务管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:serviceInfo:list')")
    @GetMapping("/list")
    public AjaxResult list(SysServiceInfo sysServiceInfo)
    {
        List<SysServiceInfo> list = sysServiceInfoService.selectSysServiceInfoList(sysServiceInfo);
        return success(list);
    }

    /**
     * 导出服务管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:serviceInfo:export')")
    @Log(title = "服务管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysServiceInfo sysServiceInfo)
    {
        List<SysServiceInfo> list = sysServiceInfoService.selectSysServiceInfoList(sysServiceInfo);
        ExcelUtil<SysServiceInfo> util = new ExcelUtil<SysServiceInfo>(SysServiceInfo.class);
        util.exportExcel(response, list, "服务管理数据");
    }

    /**
     * 获取服务管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:serviceInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysServiceInfoService.selectSysServiceInfoById(id));
    }

    /**
     * 新增服务管理
     */
    @PreAuthorize("@ss.hasPermi('system:serviceInfo:add')")
    @Log(title = "服务管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysServiceInfo sysServiceInfo)
    {
        return toAjax(sysServiceInfoService.insertSysServiceInfo(sysServiceInfo));
    }

    /**
     * 修改服务管理
     */
    @PreAuthorize("@ss.hasPermi('system:serviceInfo:edit')")
    @Log(title = "服务管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysServiceInfo sysServiceInfo)
    {
        return toAjax(sysServiceInfoService.updateSysServiceInfo(sysServiceInfo));
    }

    /**
     * 删除服务管理
     */
    @PreAuthorize("@ss.hasPermi('system:serviceInfo:remove')")
    @Log(title = "服务管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysServiceInfoService.deleteSysServiceInfoByIds(ids));
    }

    /**
     * 获取服务树结构
     */
    @GetMapping("/serviceTree")
    public AjaxResult serviceTree(SysServiceInfo sysServiceInfo)
    {
        return success(sysServiceInfoService.selectServiceTreeList(sysServiceInfo));
    }
}
