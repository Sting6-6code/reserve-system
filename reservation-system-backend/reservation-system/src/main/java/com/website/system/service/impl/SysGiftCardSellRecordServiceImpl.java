package com.website.system.service.impl;

import java.util.Date;
import java.util.List;
import com.website.common.utils.DateUtils;
import com.website.system.domain.SysGiftCardOrder;
import com.website.system.mapper.SysGiftCardOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysGiftCardSellRecordMapper;
import com.website.system.domain.SysGiftCardSellRecord;
import com.website.system.service.ISysGiftCardSellRecordService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 礼品卡出售记录Service业务层处理
 *
 * @author david
 * @date 2024-01-26
 */
@Service
public class SysGiftCardSellRecordServiceImpl implements ISysGiftCardSellRecordService
{
    @Autowired
    private SysGiftCardSellRecordMapper sysGiftCardSellRecordMapper;

    @Autowired
    private SysGiftCardOrderMapper sysGiftCardOrderMapper;

    /**
     * 查询礼品卡出售记录
     *
     * @param id 礼品卡出售记录主键
     * @return 礼品卡出售记录
     */
    @Override
    public SysGiftCardSellRecord selectSysGiftCardSellRecordById(Long id)
    {
        return sysGiftCardSellRecordMapper.selectSysGiftCardSellRecordById(id);
    }

    /**
     * 查询礼品卡出售记录列表
     *
     * @param sysGiftCardSellRecord 礼品卡出售记录
     * @return 礼品卡出售记录
     */
    @Override
    public List<SysGiftCardSellRecord> selectSysGiftCardSellRecordList(SysGiftCardSellRecord sysGiftCardSellRecord)
    {
        return sysGiftCardSellRecordMapper.selectSysGiftCardSellRecordList(sysGiftCardSellRecord);
    }

    /**
     * 新增礼品卡出售记录
     *
     * @param sysGiftCardSellRecord 礼品卡出售记录
     * @return 结果
     */
    @Override
    @Transactional
    public int insertSysGiftCardSellRecord(SysGiftCardSellRecord sysGiftCardSellRecord)
    {
        sysGiftCardSellRecord.setCreateTime(DateUtils.getNowDate());
        int result = sysGiftCardSellRecordMapper.insertSysGiftCardSellRecord(sysGiftCardSellRecord);
        // 新增卡片支付记录
        sysGiftCardSellRecord.getGiftCardOrder().stream().forEach(e->{
            e.setCreateTime(new Date());
            e.setPayTime(sysGiftCardSellRecord.getSellDate());
            sysGiftCardOrderMapper.insertSysGiftCardOrder(e)  ;
        });

        return  result;
    }

    /**
     * 修改礼品卡出售记录
     *
     * @param sysGiftCardSellRecord 礼品卡出售记录
     * @return 结果
     */
    @Override
    @Transactional
    public int updateSysGiftCardSellRecord(SysGiftCardSellRecord sysGiftCardSellRecord)
    {
        int result = sysGiftCardSellRecordMapper.updateSysGiftCardSellRecord(sysGiftCardSellRecord);
        // 直接清空订单表重新加载进去
        sysGiftCardOrderMapper.deleteSysGiftCardOrderByGiftCardCode(sysGiftCardSellRecord.getGiftCardCode());
        // 新增卡片支付记录
        sysGiftCardSellRecord.getGiftCardOrder().stream().forEach(e->{
            e.setCreateTime(new Date());
            sysGiftCardOrderMapper.insertSysGiftCardOrder(e)  ;
        });
        return result;
    }

    /**
     * 批量删除礼品卡出售记录
     *
     * @param ids 需要删除的礼品卡出售记录主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysGiftCardSellRecordByIds(Long[] ids)
    {
        List<SysGiftCardSellRecord> sysGiftCardSellRecords = sysGiftCardSellRecordMapper.selectSysGiftCardSellRecordByIds(ids);
        sysGiftCardSellRecords.forEach(e->{
            sysGiftCardOrderMapper.deleteSysGiftCardOrderByGiftCardCode(e.getGiftCardCode());
        });

        return sysGiftCardSellRecordMapper.deleteSysGiftCardSellRecordByIds(ids);
    }

    /**
     * 删除礼品卡出售记录信息
     *
     * @param id 礼品卡出售记录主键
     * @return 结果
     */
    @Override
    public int deleteSysGiftCardSellRecordById(Long id)
    {
        return sysGiftCardSellRecordMapper.deleteSysGiftCardSellRecordById(id);
    }
}
