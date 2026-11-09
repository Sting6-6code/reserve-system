package com.website.system.service;

import java.util.List;
import com.website.system.domain.SysEmployeeInfo;

/**
 * 员工管理Service接口
 * 
 * @author ruoyi
 * @date 2024-01-21
 */
public interface ISysEmployeeInfoService 
{
    /**
     * 查询员工管理
     * 
     * @param employeeId 员工管理主键
     * @return 员工管理
     */
    public SysEmployeeInfo selectSysEmployeeInfoByEmployeeId(Long employeeId);

    /**
     * 查询员工管理列表
     * 
     * @param sysEmployeeInfo 员工管理
     * @return 员工管理集合
     */
    public List<SysEmployeeInfo> selectSysEmployeeInfoList(SysEmployeeInfo sysEmployeeInfo);

    /**
     * 新增员工管理
     * 
     * @param sysEmployeeInfo 员工管理
     * @return 结果
     */
    public int insertSysEmployeeInfo(SysEmployeeInfo sysEmployeeInfo);

    /**
     * 修改员工管理
     * 
     * @param sysEmployeeInfo 员工管理
     * @return 结果
     */
    public int updateSysEmployeeInfo(SysEmployeeInfo sysEmployeeInfo);

    /**
     * 批量删除员工管理
     * 
     * @param employeeIds 需要删除的员工管理主键集合
     * @return 结果
     */
    public int deleteSysEmployeeInfoByEmployeeIds(Long[] employeeIds);

    /**
     * 删除员工管理信息
     * 
     * @param employeeId 员工管理主键
     * @return 结果
     */
    public int deleteSysEmployeeInfoByEmployeeId(Long employeeId);
}
