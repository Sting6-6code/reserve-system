package com.website.system.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.website.common.utils.DateUtils;
import com.website.system.domain.GiftCardPayAmount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysCardOrderMapper;
import com.website.system.domain.SysCardOrder;
import com.website.system.service.ISysCardOrderService;

/**
 * 预约卡片支付管理Service业务层处理
 *
 * @author david
 * @date 2024-01-26
 */
@Service
public class SysCardOrderServiceImpl implements ISysCardOrderService
{
    @Autowired
    private SysCardOrderMapper sysCardOrderMapper;

    /**
     * 查询预约卡片支付管理
     *
     * @param cardId 预约卡片支付管理主键
     * @return 预约卡片支付管理
     */
    @Override
    public SysCardOrder selectSysCardOrderByCardId(Long cardId)
    {
        return sysCardOrderMapper.selectSysCardOrderByCardId(cardId);
    }

    /**
     * 查询预约卡片支付管理列表
     *
     * @param sysCardOrder 预约卡片支付管理
     * @return 预约卡片支付管理
     */
    @Override
    public List<SysCardOrder> selectSysCardOrderList(SysCardOrder sysCardOrder)
    {
        return sysCardOrderMapper.selectSysCardOrderList(sysCardOrder);
    }

    /**
     * 新增预约卡片支付管理
     *
     * @param sysCardOrder 预约卡片支付管理
     * @return 结果
     */
    @Override
    public int insertSysCardOrder(SysCardOrder sysCardOrder)
    {
        sysCardOrder.setCreateTime(DateUtils.getNowDate());
        return sysCardOrderMapper.insertSysCardOrder(sysCardOrder);
    }

    /**
     * 修改预约卡片支付管理
     *
     * @param sysCardOrder 预约卡片支付管理
     * @return 结果
     */
    @Override
    public int updateSysCardOrder(SysCardOrder sysCardOrder)
    {
        return sysCardOrderMapper.updateSysCardOrder(sysCardOrder);
    }

    /**
     * 批量删除预约卡片支付管理
     *
     * @param cardIds 需要删除的预约卡片支付管理主键
     * @return 结果
     */
    @Override
    public int deleteSysCardOrderByCardIds(Long[] cardIds)
    {
        return sysCardOrderMapper.deleteSysCardOrderByCardIds(cardIds);
    }

    /**
     * 删除预约卡片支付管理信息
     *
     * @param cardId 预约卡片支付管理主键
     * @return 结果
     */
    @Override
    public int deleteSysCardOrderByCardId(Long cardId)
    {
        return sysCardOrderMapper.deleteSysCardOrderByCardId(cardId);
    }

    /**
     * 获取某天的礼品卡收入数据
     *
     * @param sysGiftCardOrder 支付日期
     * @return 结果
     */
    @Override
    public GiftCardPayAmount selectCardPayAmount(SysCardOrder sysGiftCardOrder){
        GiftCardPayAmount giftCardPayAmount = sysCardOrderMapper.selectCardPayAmount(sysGiftCardOrder);


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
