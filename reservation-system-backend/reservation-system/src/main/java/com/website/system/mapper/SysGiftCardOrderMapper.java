package com.website.system.mapper;

import java.util.List;
import com.website.system.domain.SysGiftCardOrder;
import com.website.system.domain.GiftCardPayAmount;

/**
 * 礼品卡订单记录Mapper接口
 *
 * @author david
 * @date 2024-01-26
 */
public interface SysGiftCardOrderMapper
{
    /**
     * 查询礼品卡订单记录
     *
     * @param giftCardCode 礼品卡订单记录主键
     * @return 礼品卡订单记录
     */
    public SysGiftCardOrder selectSysGiftCardOrderByGiftCardCode(String giftCardCode);

    /**
     * 查询礼品卡订单记录列表
     *
     * @param sysGiftCardOrder 礼品卡订单记录
     * @return 礼品卡订单记录集合
     */
    public List<SysGiftCardOrder> selectSysGiftCardOrderList(SysGiftCardOrder sysGiftCardOrder);

    /**
     * 新增礼品卡订单记录
     *
     * @param sysGiftCardOrder 礼品卡订单记录
     * @return 结果
     */
    public int insertSysGiftCardOrder(SysGiftCardOrder sysGiftCardOrder);

    /**
     * 修改礼品卡订单记录
     *
     * @param sysGiftCardOrder 礼品卡订单记录
     * @return 结果
     */
    public int updateSysGiftCardOrder(SysGiftCardOrder sysGiftCardOrder);

    /**
     * 删除礼品卡订单记录
     *
     * @param giftCardCode 礼品卡订单记录主键
     * @return 结果
     */
    public int deleteSysGiftCardOrderByGiftCardCode(String giftCardCode);

    /**
     * 批量删除礼品卡订单记录
     *
     * @param giftCardCodes 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysGiftCardOrderByGiftCardCodes(String[] giftCardCodes);

    public GiftCardPayAmount selectGiftCardPayAmount(SysGiftCardOrder sysGiftCardOrder);
}
