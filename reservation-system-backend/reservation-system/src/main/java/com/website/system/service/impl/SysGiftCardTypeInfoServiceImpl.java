package com.website.system.service.impl;

import java.util.List;
import com.website.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysGiftCardTypeInfoMapper;
import com.website.system.domain.SysGiftCardTypeInfo;
import com.website.system.service.ISysGiftCardTypeInfoService;

/**
 * 礼品卡类型Service业务层处理
 * 
 * @author david
 * @date 2024-01-26
 */
@Service
public class SysGiftCardTypeInfoServiceImpl implements ISysGiftCardTypeInfoService 
{
    @Autowired
    private SysGiftCardTypeInfoMapper sysGiftCardTypeInfoMapper;

    /**
     * 查询礼品卡类型
     * 
     * @param giftCardTypeId 礼品卡类型主键
     * @return 礼品卡类型
     */
    @Override
    public SysGiftCardTypeInfo selectSysGiftCardTypeInfoByGiftCardTypeId(Long giftCardTypeId)
    {
        return sysGiftCardTypeInfoMapper.selectSysGiftCardTypeInfoByGiftCardTypeId(giftCardTypeId);
    }

    /**
     * 查询礼品卡类型列表
     * 
     * @param sysGiftCardTypeInfo 礼品卡类型
     * @return 礼品卡类型
     */
    @Override
    public List<SysGiftCardTypeInfo> selectSysGiftCardTypeInfoList(SysGiftCardTypeInfo sysGiftCardTypeInfo)
    {
        return sysGiftCardTypeInfoMapper.selectSysGiftCardTypeInfoList(sysGiftCardTypeInfo);
    }

    /**
     * 新增礼品卡类型
     * 
     * @param sysGiftCardTypeInfo 礼品卡类型
     * @return 结果
     */
    @Override
    public int insertSysGiftCardTypeInfo(SysGiftCardTypeInfo sysGiftCardTypeInfo)
    {
        sysGiftCardTypeInfo.setCreateTime(DateUtils.getNowDate());
        return sysGiftCardTypeInfoMapper.insertSysGiftCardTypeInfo(sysGiftCardTypeInfo);
    }

    /**
     * 修改礼品卡类型
     * 
     * @param sysGiftCardTypeInfo 礼品卡类型
     * @return 结果
     */
    @Override
    public int updateSysGiftCardTypeInfo(SysGiftCardTypeInfo sysGiftCardTypeInfo)
    {
        return sysGiftCardTypeInfoMapper.updateSysGiftCardTypeInfo(sysGiftCardTypeInfo);
    }

    /**
     * 批量删除礼品卡类型
     * 
     * @param giftCardTypeIds 需要删除的礼品卡类型主键
     * @return 结果
     */
    @Override
    public int deleteSysGiftCardTypeInfoByGiftCardTypeIds(Long[] giftCardTypeIds)
    {
        return sysGiftCardTypeInfoMapper.deleteSysGiftCardTypeInfoByGiftCardTypeIds(giftCardTypeIds);
    }

    /**
     * 删除礼品卡类型信息
     * 
     * @param giftCardTypeId 礼品卡类型主键
     * @return 结果
     */
    @Override
    public int deleteSysGiftCardTypeInfoByGiftCardTypeId(Long giftCardTypeId)
    {
        return sysGiftCardTypeInfoMapper.deleteSysGiftCardTypeInfoByGiftCardTypeId(giftCardTypeId);
    }
}
