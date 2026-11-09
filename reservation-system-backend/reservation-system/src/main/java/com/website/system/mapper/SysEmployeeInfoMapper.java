package com.website.system.mapper;

import java.util.List;
import com.website.system.domain.SysEmployeeInfo;

/**
 * 员工管理Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-21
 */
public interface SysEmployeeInfoMapper 
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
     * 删除员工管理
     * 
     * @param employeeId 员工管理主键
     * @return 结果
     */
    public int deleteSysEmployeeInfoByEmployeeId(Long employeeId);

    /**
     * 批量删除员工管理
     * 
     * @param employeeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysEmployeeInfoByEmployeeIds(Long[] employeeIds);
}
