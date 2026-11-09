package com.website.web.controller.system;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.website.common.utils.DateUtils;
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
import com.website.system.domain.SysGiftCardSellRecord;
import com.website.system.service.ISysGiftCardSellRecordService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 礼品卡出售记录Controller
 *
 * @author david
 * @date 2024-01-26
 */
@RestController
@RequestMapping("/reservation/giftCardSellRecord")
public class SysGiftCardSellRecordController extends BaseController
{
    @Autowired
    private ISysGiftCardSellRecordService sysGiftCardSellRecordService;

    /**
     * 查询礼品卡出售记录列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardSellRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysGiftCardSellRecord sysGiftCardSellRecord)
    {
        startPage();
        List<SysGiftCardSellRecord> list = sysGiftCardSellRecordService.selectSysGiftCardSellRecordList(sysGiftCardSellRecord);
        return getDataTable(list);
    }

    /**
     * 导出礼品卡出售记录列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardSellRecord:export')")
    @Log(title = "礼品卡出售记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysGiftCardSellRecord sysGiftCardSellRecord)
    {
        List<SysGiftCardSellRecord> list = sysGiftCardSellRecordService.selectSysGiftCardSellRecordList(sysGiftCardSellRecord);
        ExcelUtil<SysGiftCardSellRecord> util = new ExcelUtil<SysGiftCardSellRecord>(SysGiftCardSellRecord.class);
        util.exportExcel(response, list, "礼品卡出售记录数据");
    }

    /**
     * 获取礼品卡出售记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardSellRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysGiftCardSellRecordService.selectSysGiftCardSellRecordById(id));
    }

    /**
     * 新增礼品卡出售记录
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardSellRecord:add')")
    @Log(title = "礼品卡出售记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysGiftCardSellRecord sysGiftCardSellRecord)
    {
        if(StringUtils.isEmpty(sysGiftCardSellRecord.getGiftCardCode())){
            return AjaxResult.error("会员卡编码不能为空！");
        }
        SysGiftCardSellRecord param=new SysGiftCardSellRecord();
        param.setGiftCardCode(sysGiftCardSellRecord.getGiftCardCode());
        List<SysGiftCardSellRecord> sysGiftCardSellRecords = sysGiftCardSellRecordService.selectSysGiftCardSellRecordList(param);
        if(sysGiftCardSellRecords.size()>0){
            return AjaxResult.error("会员卡编码已存在!");
        }
        // 设置销售日期
        sysGiftCardSellRecord.setSellDate(DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS,new Date()));
        return toAjax(sysGiftCardSellRecordService.insertSysGiftCardSellRecord(sysGiftCardSellRecord));
    }

    /**
     * 修改礼品卡出售记录
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardSellRecord:edit')")
    @Log(title = "礼品卡出售记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysGiftCardSellRecord sysGiftCardSellRecord)
    {
        return toAjax(sysGiftCardSellRecordService.updateSysGiftCardSellRecord(sysGiftCardSellRecord));
    }

    /**
     * 删除礼品卡出售记录
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardSellRecord:remove')")
    @Log(title = "礼品卡出售记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysGiftCardSellRecordService.deleteSysGiftCardSellRecordByIds(ids));
    }
}
