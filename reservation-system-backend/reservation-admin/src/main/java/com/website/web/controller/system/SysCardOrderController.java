package com.website.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.website.system.domain.SysGiftCardOrder;
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
import com.website.system.domain.SysCardOrder;
import com.website.system.service.ISysCardOrderService;
import com.website.common.utils.poi.ExcelUtil;
import com.website.common.core.page.TableDataInfo;

/**
 * 预约卡片支付管理Controller
 *
 * @author david
 * @date 2024-01-26
 */
@RestController
@RequestMapping("/reservation/cardOrder")
public class SysCardOrderController extends BaseController
{
    @Autowired
    private ISysCardOrderService sysCardOrderService;

    /**
     * 查询预约卡片支付管理列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:cardOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysCardOrder sysCardOrder)
    {
        startPage();
        List<SysCardOrder> list = sysCardOrderService.selectSysCardOrderList(sysCardOrder);
        return getDataTable(list);
    }

    /**
     * 导出预约卡片支付管理列表
     */
    @PreAuthorize("@ss.hasPermi('reservation:cardOrder:export')")
    @Log(title = "预约卡片支付管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCardOrder sysCardOrder)
    {
        List<SysCardOrder> list = sysCardOrderService.selectSysCardOrderList(sysCardOrder);
        ExcelUtil<SysCardOrder> util = new ExcelUtil<SysCardOrder>(SysCardOrder.class);
        util.exportExcel(response, list, "预约卡片支付管理数据");
    }

    /**
     * 获取预约卡片支付管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('reservation:cardOrder:query')")
    @GetMapping(value = "/{cardId}")
    public AjaxResult getInfo(@PathVariable("cardId") Long cardId)
    {
        return success(sysCardOrderService.selectSysCardOrderByCardId(cardId));
    }

    /**
     * 新增预约卡片支付管理
     */
    @PreAuthorize("@ss.hasPermi('reservation:cardOrder:add')")
    @Log(title = "预约卡片支付管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCardOrder sysCardOrder)
    {
        return toAjax(sysCardOrderService.insertSysCardOrder(sysCardOrder));
    }

    /**
     * 修改预约卡片支付管理
     */
    @PreAuthorize("@ss.hasPermi('reservation:cardOrder:edit')")
    @Log(title = "预约卡片支付管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCardOrder sysCardOrder)
    {
        return toAjax(sysCardOrderService.updateSysCardOrder(sysCardOrder));
    }

    /**
     * 删除预约卡片支付管理
     */
    @PreAuthorize("@ss.hasPermi('reservation:cardOrder:remove')")
    @Log(title = "预约卡片支付管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cardIds}")
    public AjaxResult remove(@PathVariable Long[] cardIds)
    {
        return toAjax(sysCardOrderService.deleteSysCardOrderByCardIds(cardIds));
    }

    /**
     * 获取礼品卡订单记录详细信息
     */
    @PostMapping(value = "/cardPayAmount")
    public AjaxResult cardPayAmount(@RequestBody SysCardOrder sysCardOrder)
    {
        return success(sysCardOrderService.selectCardPayAmount(sysCardOrder));
    }
}
