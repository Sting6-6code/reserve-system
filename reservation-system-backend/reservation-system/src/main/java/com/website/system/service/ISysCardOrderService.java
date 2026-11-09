package com.website.system.service;

import java.util.List;
import com.website.system.domain.SysCardOrder;
import com.website.system.domain.GiftCardPayAmount;

/**
 * 预约卡片支付管理Service接口
 *
 * @author david
 * @date 2024-01-26
 */
public interface ISysCardOrderService
{
    /**
     * 查询预约卡片支付管理
     *
     * @param cardId 预约卡片支付管理主键
     * @return 预约卡片支付管理
     */
    public SysCardOrder selectSysCardOrderByCardId(Long cardId);

    /**
     * 查询预约卡片支付管理列表
     *
     * @param sysCardOrder 预约卡片支付管理
     * @return 预约卡片支付管理集合
     */
    public List<SysCardOrder> selectSysCardOrderList(SysCardOrder sysCardOrder);

    /**
     * 新增预约卡片支付管理
     *
     * @param sysCardOrder 预约卡片支付管理
     * @return 结果
     */
    public int insertSysCardOrder(SysCardOrder sysCardOrder);

    /**
     * 修改预约卡片支付管理
     *
     * @param sysCardOrder 预约卡片支付管理
     * @return 结果
     */
    public int updateSysCardOrder(SysCardOrder sysCardOrder);

    /**
     * 批量删除预约卡片支付管理
     *
     * @param cardIds 需要删除的预约卡片支付管理主键集合
     * @return 结果
     */
    public int deleteSysCardOrderByCardIds(Long[] cardIds);

    /**
     * 删除预约卡片支付管理信息
     *
     * @param cardId 预约卡片支付管理主键
     * @return 结果
     */
    public int deleteSysCardOrderByCardId(Long cardId);

    public GiftCardPayAmount selectCardPayAmount(SysCardOrder sysGiftCardOrder);
}
