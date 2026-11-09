package com.website.system.mapper;

import java.util.List;
import com.website.system.domain.SysCardOrder;
import com.website.system.domain.GiftCardPayAmount;

/**
 * 预约卡片支付管理Mapper接口
 *
 * @author david
 * @date 2024-01-26
 */
public interface SysCardOrderMapper
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
     * 删除预约卡片支付管理
     *
     * @param cardId 预约卡片支付管理主键
     * @return 结果
     */
    public int deleteSysCardOrderByCardId(Long cardId);

    /**
     * 批量删除预约卡片支付管理
     *
     * @param cardIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCardOrderByCardIds(Long[] cardIds);

    public GiftCardPayAmount selectCardPayAmount(SysCardOrder sysGiftCardOrder);


}
