package com.website.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.website.common.utils.StringUtils;
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
import com.website.system.domain.SysCardInfo;
import com.website.system.service.ISysCardInfoService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 预约卡片管理Controller
 *
 * @author david
 * @date 2024-01-21
 */
@RestController
@RequestMapping("/system/cardInfo")
public class SysCardInfoController extends BaseController
{
    @Autowired
    private ISysCardInfoService sysCardInfoService;

    /**
     * 查询预约卡片管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:cardInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysCardInfo sysCardInfo)
    {
        startPage();
        List<SysCardInfo> list = sysCardInfoService.selectSysCardInfoList(sysCardInfo);
        return getDataTable(list);
    }

    /**
     * 导出预约卡片管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:cardInfo:export')")
    @Log(title = "预约卡片管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCardInfo sysCardInfo)
    {
        List<SysCardInfo> list = sysCardInfoService.selectSysCardInfoList(sysCardInfo);
        ExcelUtil<SysCardInfo> util = new ExcelUtil<SysCardInfo>(SysCardInfo.class);
        util.exportExcel(response, list, "预约卡片管理数据");
    }

    /**
     * 新增预约卡片管理
     */
    @PreAuthorize("@ss.hasPermi('system:cardInfo:add')")
    @Log(title = "预约卡片管理", businessType = BusinessType.INSERT)
    @PostMapping("batchSave")
    public AjaxResult batchSave(@RequestBody List<SysCardInfo> sysCardInfo){
        if(StringUtils.isEmpty(sysCardInfo)){
            return AjaxResult.error("参数缺失");
        }
        return AjaxResult.success(sysCardInfoService.insertBatchSysCardInfo(sysCardInfo));
    }

    /**
     * 查询客户历史信息（第一次服务日期和最近一次服务信息）
     * 注意：此方法需要放在 /{cardId} 之前，避免路径冲突
     */
    @PreAuthorize("@ss.hasPermi('system:cardInfo:query')")
    @GetMapping("/customerHistory/{customId}")
    public AjaxResult getCustomerHistory(@PathVariable("customId") Long customId)
    {
        return success(sysCardInfoService.getCustomerHistoryInfo(customId));
    }

    /**
     * 获取预约卡片管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:cardInfo:query')")
    @GetMapping(value = "/{cardId}")
    public AjaxResult getInfo(@PathVariable("cardId") Long cardId)
    {
        return success(sysCardInfoService.selectSysCardInfoByCardId(cardId));
    }

    /**
     * 新增预约卡片管理
     */
    @PreAuthorize("@ss.hasPermi('system:cardInfo:add')")
    @Log(title = "预约卡片管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCardInfo sysCardInfo)
    {
        return toAjax(sysCardInfoService.insertSysCardInfo(sysCardInfo));
    }

    /**
     * 修改预约卡片管理
     */
    @PreAuthorize("@ss.hasPermi('system:cardInfo:edit')")
    @Log(title = "预约卡片管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCardInfo sysCardInfo)
    {
        return toAjax(sysCardInfoService.updateSysCardInfo(sysCardInfo));
    }


    @PreAuthorize("@ss.hasPermi('system:cardInfo:edit')")
    @Log(title = "预约结账", businessType = BusinessType.UPDATE)
    @PutMapping("order")
    public AjaxResult order(@RequestBody SysCardInfo sysCardInfo)
    {
        return toAjax(sysCardInfoService.updateCardOrder(sysCardInfo));
    }

    /**
     * 删除预约卡片管理
     */
    @PreAuthorize("@ss.hasPermi('system:cardInfo:remove')")
    @Log(title = "预约卡片管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cardIds}")
    public AjaxResult remove(@PathVariable Long[] cardIds)
    {
        return toAjax(sysCardInfoService.deleteSysCardInfoByCardIds(cardIds));
    }
}
