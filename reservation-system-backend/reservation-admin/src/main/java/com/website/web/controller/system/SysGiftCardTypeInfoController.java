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
import com.website.system.domain.SysGiftCardTypeInfo;
import com.website.system.service.ISysGiftCardTypeInfoService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 会员卡类型Controller
 *
 * @author david
 * @date 2024-01-26
 */
@RestController
@RequestMapping("/reservation/giftCardTypeInfo")
public class SysGiftCardTypeInfoController extends BaseController
{
    @Autowired
    private ISysGiftCardTypeInfoService sysGiftCardTypeInfoService;

    /**
     * 查询会员卡类型列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardTypeInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysGiftCardTypeInfo sysGiftCardTypeInfo)
    {
        startPage();
        List<SysGiftCardTypeInfo> list = sysGiftCardTypeInfoService.selectSysGiftCardTypeInfoList(sysGiftCardTypeInfo);
        return getDataTable(list);
    }

    /**
     * 导出会员卡类型列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardTypeInfo:export')")
    @Log(title = "会员卡类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysGiftCardTypeInfo sysGiftCardTypeInfo)
    {
        List<SysGiftCardTypeInfo> list = sysGiftCardTypeInfoService.selectSysGiftCardTypeInfoList(sysGiftCardTypeInfo);
        ExcelUtil<SysGiftCardTypeInfo> util = new ExcelUtil<SysGiftCardTypeInfo>(SysGiftCardTypeInfo.class);
        util.exportExcel(response, list, "会员卡类型数据");
    }

    /**
     * 获取会员卡类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardTypeInfo:query')")
    @GetMapping(value = "/{giftCardTypeId}")
    public AjaxResult getInfo(@PathVariable("giftCardTypeId") Long giftCardTypeId)
    {
        return success(sysGiftCardTypeInfoService.selectSysGiftCardTypeInfoByGiftCardTypeId(giftCardTypeId));
    }

    /**
     * 新增会员卡类型
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardTypeInfo:add')")
    @Log(title = "会员卡类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysGiftCardTypeInfo sysGiftCardTypeInfo)
    {
        return toAjax(sysGiftCardTypeInfoService.insertSysGiftCardTypeInfo(sysGiftCardTypeInfo));
    }

    /**
     * 修改会员卡类型
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardTypeInfo:edit')")
    @Log(title = "会员卡类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysGiftCardTypeInfo sysGiftCardTypeInfo)
    {
        return toAjax(sysGiftCardTypeInfoService.updateSysGiftCardTypeInfo(sysGiftCardTypeInfo));
    }

    /**
     * 删除会员卡类型
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardTypeInfo:remove')")
    @Log(title = "会员卡类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{giftCardTypeIds}")
    public AjaxResult remove(@PathVariable Long[] giftCardTypeIds)
    {
        return toAjax(sysGiftCardTypeInfoService.deleteSysGiftCardTypeInfoByGiftCardTypeIds(giftCardTypeIds));
    }
}
