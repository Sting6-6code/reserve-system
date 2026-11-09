package com.website.system.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.website.common.utils.DateUtils;
import com.website.system.domain.GiftCardPayAmount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysGiftCardOrderMapper;
import com.website.system.domain.SysGiftCardOrder;
import com.website.system.service.ISysGiftCardOrderService;

/**
 * 礼品卡订单记录Service业务层处理
 *
 * @author david
 * @date 2024-01-26
 */
@Service
public class SysGiftCardOrderServiceImpl implements ISysGiftCardOrderService
{
    @Autowired
    private SysGiftCardOrderMapper sysGiftCardOrderMapper;

    /**
     * 查询礼品卡订单记录
     *
     * @param giftCardCode 礼品卡订单记录主键
     * @return 礼品卡订单记录
     */
    @Override
    public SysGiftCardOrder selectSysGiftCardOrderByGiftCardCode(String giftCardCode)
    {
        return sysGiftCardOrderMapper.selectSysGiftCardOrderByGiftCardCode(giftCardCode);
    }

    /**
     * 查询礼品卡订单记录列表
     *
     * @param sysGiftCardOrder 礼品卡订单记录
     * @return 礼品卡订单记录
     */
    @Override
    public List<SysGiftCardOrder> selectSysGiftCardOrderList(SysGiftCardOrder sysGiftCardOrder)
    {
        return sysGiftCardOrderMapper.selectSysGiftCardOrderList(sysGiftCardOrder);
    }

    /**
     * 新增礼品卡订单记录
     *
     * @param sysGiftCardOrder 礼品卡订单记录
     * @return 结果
     */
    @Override
    public int insertSysGiftCardOrder(SysGiftCardOrder sysGiftCardOrder)
    {
        sysGiftCardOrder.setCreateTime(DateUtils.getNowDate());
        return sysGiftCardOrderMapper.insertSysGiftCardOrder(sysGiftCardOrder);
    }

    /**
     * 修改礼品卡订单记录
     *
     * @param sysGiftCardOrder 礼品卡订单记录
     * @return 结果
     */
    @Override
    public int updateSysGiftCardOrder(SysGiftCardOrder sysGiftCardOrder)
    {
        return sysGiftCardOrderMapper.updateSysGiftCardOrder(sysGiftCardOrder);
    }

    /**
     * 批量删除礼品卡订单记录
     *
     * @param giftCardCodes 需要删除的礼品卡订单记录主键
     * @return 结果
     */
    @Override
    public int deleteSysGiftCardOrderByGiftCardCodes(String[] giftCardCodes)
    {
        return sysGiftCardOrderMapper.deleteSysGiftCardOrderByGiftCardCodes(giftCardCodes);
    }

    /**
     * 删除礼品卡订单记录信息
     *
     * @param giftCardCode 礼品卡订单记录主键
     * @return 结果
     */
    @Override
    public int deleteSysGiftCardOrderByGiftCardCode(String giftCardCode)
    {
        return sysGiftCardOrderMapper.deleteSysGiftCardOrderByGiftCardCode(giftCardCode);
    }

    /**
     * 获取某天的礼品卡收入数据
     *
     * @param sysGiftCardOrder 支付日期
     * @return 结果
     */
    @Override
    public GiftCardPayAmount selectGiftCardPayAmount(SysGiftCardOrder sysGiftCardOrder){
        GiftCardPayAmount giftCardPayAmount = sysGiftCardOrderMapper.selectGiftCardPayAmount(sysGiftCardOrder);
        if(giftCardPayAmount==null){
            giftCardPayAmount=new GiftCardPayAmount();
            giftCardPayAmount.setTotal(BigDecimal.ZERO);
            giftCardPayAmount.setDz(BigDecimal.ZERO);
            giftCardPayAmount.setFxj(BigDecimal.ZERO);
            giftCardPayAmount.setSk(BigDecimal.ZERO);
            giftCardPayAmount.setDz(BigDecimal.ZERO);
        }
        return giftCardPayAmount;
    }
}
