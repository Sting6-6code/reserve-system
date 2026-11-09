package com.website.system.mapper;

import java.util.List;

import com.website.system.domain.ServiceStatistics;
import com.website.system.domain.SysCardInfo;
import com.website.system.domain.EmployeeWages;

/**
 * 预约卡片管理Mapper接口
 *
 * @author david
 * @date 2024-01-21
 */
public interface SysCardInfoMapper
{
    /**
     * 查询预约卡片管理
     *
     * @param cardId 预约卡片管理主键
     * @return 预约卡片管理
     */
    public SysCardInfo selectSysCardInfoByCardId(Long cardId);

    /**
     * 查询预约卡片管理列表
     *
     * @param sysCardInfo 预约卡片管理
     * @return 预约卡片管理集合
     */
    public List<SysCardInfo> selectSysCardInfoList(SysCardInfo sysCardInfo);

    /**
     * 新增预约卡片管理
     *
     * @param sysCardInfo 预约卡片管理
     * @return 结果
     */
    public int insertSysCardInfo(SysCardInfo sysCardInfo);

    /**
     * 修改预约卡片管理
     *
     * @param sysCardInfo 预约卡片管理
     * @return 结果
     */
    public int updateSysCardInfo(SysCardInfo sysCardInfo);

    /**
     * 删除预约卡片管理
     *
     * @param cardId 预约卡片管理主键
     * @return 结果
     */
    public int deleteSysCardInfoByCardId(Long cardId);

    /**
     * 批量删除预约卡片管理
     *
     * @param cardIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCardInfoByCardIds(Long[] cardIds);

    public List<EmployeeWages> getEmployeeWages(EmployeeWages employeeWages);

    public List<ServiceStatistics> getServiceStatistics(ServiceStatistics employeeWages);

    /**
     * 查询客户历史信息（第一次服务日期和最近一次服务信息）
     *
     * @param customId 客户ID
     * @return 客户历史信息
     */
    public com.website.system.domain.CustomerHistoryInfo getCustomerHistoryInfo(Long customId);

}
