package com.website.system.mapper;

import java.util.List;
import com.website.system.domain.SysGiftCardSellRecord;

/**
 * 礼品卡出售记录Mapper接口
 *
 * @author david
 * @date 2024-01-26
 */
public interface SysGiftCardSellRecordMapper
{
    /**
     * 查询礼品卡出售记录
     *
     * @param id 礼品卡出售记录主键
     * @return 礼品卡出售记录
     */
    public SysGiftCardSellRecord selectSysGiftCardSellRecordById(Long id);

    /**
     * 查询礼品卡出售记录
     *
     * @param id 礼品卡出售记录主键
     * @return 礼品卡出售记录
     */
    public List<SysGiftCardSellRecord> selectSysGiftCardSellRecordByIds(Long[] ids);


    /**
     * 查询礼品卡出售记录列表
     *
     * @param sysGiftCardSellRecord 礼品卡出售记录
     * @return 礼品卡出售记录集合
     */
    public List<SysGiftCardSellRecord> selectSysGiftCardSellRecordList(SysGiftCardSellRecord sysGiftCardSellRecord);

    /**
     * 新增礼品卡出售记录
     *
     * @param sysGiftCardSellRecord 礼品卡出售记录
     * @return 结果
     */
    public int insertSysGiftCardSellRecord(SysGiftCardSellRecord sysGiftCardSellRecord);

    /**
     * 修改礼品卡出售记录
     *
     * @param sysGiftCardSellRecord 礼品卡出售记录
     * @return 结果
     */
    public int updateSysGiftCardSellRecord(SysGiftCardSellRecord sysGiftCardSellRecord);

    public int updateSysGiftCardSellRecordStatus(SysGiftCardSellRecord sysGiftCardSellRecord);


    /**
     * 删除礼品卡出售记录
     *
     * @param id 礼品卡出售记录主键
     * @return 结果
     */
    public int deleteSysGiftCardSellRecordById(Long id);

    /**
     * 批量删除礼品卡出售记录
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysGiftCardSellRecordByIds(Long[] ids);
}
