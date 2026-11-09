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
import com.website.system.domain.SysGiftCardOrder;
import com.website.system.service.ISysGiftCardOrderService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 会员卡订单记录Controller
 *
 * @author david
 * @date 2024-01-26
 */
@RestController
@RequestMapping("/reservation/giftCardOrder")
public class SysGiftCardOrderController extends BaseController
{
    @Autowired
    private ISysGiftCardOrderService sysGiftCardOrderService;

    /**
     * 查询会员卡订单记录列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysGiftCardOrder sysGiftCardOrder)
    {
        startPage();
        List<SysGiftCardOrder> list = sysGiftCardOrderService.selectSysGiftCardOrderList(sysGiftCardOrder);
        return getDataTable(list);
    }

    /**
     * 导出会员卡订单记录列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardOrder:export')")
    @Log(title = "会员卡订单记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysGiftCardOrder sysGiftCardOrder)
    {
        List<SysGiftCardOrder> list = sysGiftCardOrderService.selectSysGiftCardOrderList(sysGiftCardOrder);
        ExcelUtil<SysGiftCardOrder> util = new ExcelUtil<SysGiftCardOrder>(SysGiftCardOrder.class);
        util.exportExcel(response, list, "会员卡订单记录数据");
    }

    /**
     * 获取会员卡订单记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardOrder:query')")
    @GetMapping(value = "/{giftCardCode}")
    public AjaxResult getInfo(@PathVariable("giftCardCode") String giftCardCode)
    {
        return success(sysGiftCardOrderService.selectSysGiftCardOrderByGiftCardCode(giftCardCode));
    }

    /**
     * 新增会员卡订单记录
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardOrder:add')")
    @Log(title = "会员卡订单记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysGiftCardOrder sysGiftCardOrder)
    {
        return toAjax(sysGiftCardOrderService.insertSysGiftCardOrder(sysGiftCardOrder));
    }

    /**
     * 修改会员卡订单记录
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardOrder:edit')")
    @Log(title = "会员卡订单记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysGiftCardOrder sysGiftCardOrder)
    {
        return toAjax(sysGiftCardOrderService.updateSysGiftCardOrder(sysGiftCardOrder));
    }

    /**
     * 删除会员卡订单记录
     */
    @PreAuthorize("@ss.hasPermi('reservation:giftCardOrder:remove')")
    @Log(title = "会员卡订单记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{giftCardCodes}")
    public AjaxResult remove(@PathVariable String[] giftCardCodes)
    {
        return toAjax(sysGiftCardOrderService.deleteSysGiftCardOrderByGiftCardCodes(giftCardCodes));
    }

    /**
     * 获取会员卡订单记录详细信息
     */
    @PostMapping(value = "/giftCardPayAmount")
    public AjaxResult giftCardPayAmount(@RequestBody SysGiftCardOrder sysGiftCardOrder)
    {
        return success(sysGiftCardOrderService.selectGiftCardPayAmount(sysGiftCardOrder));
    }
}
