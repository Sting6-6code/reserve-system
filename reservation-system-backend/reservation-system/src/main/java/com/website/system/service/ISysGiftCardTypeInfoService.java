package com.website.system.service;

import java.util.List;
import com.website.system.domain.SysGiftCardTypeInfo;

/**
 * 礼品卡类型Service接口
 * 
 * @author david
 * @date 2024-01-26
 */
public interface ISysGiftCardTypeInfoService 
{
    /**
     * 查询礼品卡类型
     * 
     * @param giftCardTypeId 礼品卡类型主键
     * @return 礼品卡类型
     */
    public SysGiftCardTypeInfo selectSysGiftCardTypeInfoByGiftCardTypeId(Long giftCardTypeId);

    /**
     * 查询礼品卡类型列表
     * 
     * @param sysGiftCardTypeInfo 礼品卡类型
     * @return 礼品卡类型集合
     */
    public List<SysGiftCardTypeInfo> selectSysGiftCardTypeInfoList(SysGiftCardTypeInfo sysGiftCardTypeInfo);

    /**
     * 新增礼品卡类型
     * 
     * @param sysGiftCardTypeInfo 礼品卡类型
     * @return 结果
     */
    public int insertSysGiftCardTypeInfo(SysGiftCardTypeInfo sysGiftCardTypeInfo);

    /**
     * 修改礼品卡类型
     * 
     * @param sysGiftCardTypeInfo 礼品卡类型
     * @return 结果
     */
    public int updateSysGiftCardTypeInfo(SysGiftCardTypeInfo sysGiftCardTypeInfo);

    /**
     * 批量删除礼品卡类型
     * 
     * @param giftCardTypeIds 需要删除的礼品卡类型主键集合
     * @return 结果
     */
    public int deleteSysGiftCardTypeInfoByGiftCardTypeIds(Long[] giftCardTypeIds);

    /**
     * 删除礼品卡类型信息
     * 
     * @param giftCardTypeId 礼品卡类型主键
     * @return 结果
     */
    public int deleteSysGiftCardTypeInfoByGiftCardTypeId(Long giftCardTypeId);
}
