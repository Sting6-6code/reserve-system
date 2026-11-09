package com.website.system.service;

import java.util.List;

import com.website.system.domain.ServiceStatistics;
import com.website.system.domain.SysCardInfo;
import com.website.system.domain.EmployeeWages;

/**
 * 预约卡片管理Service接口
 *
 * @author david
 * @date 2024-01-21
 */
public interface ISysCardInfoService
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

    public List<SysCardInfo> insertBatchSysCardInfo(List<SysCardInfo> sysCardInfo);


    /**
     * 修改预约卡片管理
     *
     * @param sysCardInfo 预约卡片管理
     * @return 结果
     */
    public int updateSysCardInfo(SysCardInfo sysCardInfo);

    /**
     * 修改预约卡片管理
     *
     * @param sysCardInfo 预约卡片管理
     * @return 结果
     */
    public int updateCardOrder(SysCardInfo sysCardInfo);

    /**
     * 批量删除预约卡片管理
     *
     * @param cardIds 需要删除的预约卡片管理主键集合
     * @return 结果
     */
    public int deleteSysCardInfoByCardIds(Long[] cardIds);

    /**
     * 删除预约卡片管理信息
     *
     * @param cardId 预约卡片管理主键
     * @return 结果
     */
    public int deleteSysCardInfoByCardId(Long cardId);

    /**
     * 获取员工工资列表（wagesTimeType=M 按月统计 其它按天统计）
     *
     * @param
     * @return 结果
     */
    public List<EmployeeWages> getEmployeeWages(EmployeeWages employeeWages);

    /**
     * 获取服务统计列表（wagesTimeType=M 按月统计 其它按天统计）
     *
     * @param
     * @return 结果
     */
    public List<ServiceStatistics> getServiceStatistics(ServiceStatistics employeeWages);

    /**
     * 查询客户历史信息（第一次服务日期和最近一次服务信息）
     *
     * @param customId 客户ID
     * @return 客户历史信息
     */
    public com.website.system.domain.CustomerHistoryInfo getCustomerHistoryInfo(Long customId);
}
