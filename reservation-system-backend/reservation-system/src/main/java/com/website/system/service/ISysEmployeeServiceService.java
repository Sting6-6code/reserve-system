package com.website.system.service;

import java.util.List;
import com.website.system.domain.SysEmployeeService;

/**
 * 员工服务Service接口
 * 
 * @author david
 * @date 2024-01-21
 */
public interface ISysEmployeeServiceService 
{
    /**
     * 查询员工服务
     * 
     * @param serviceId 员工服务主键
     * @return 员工服务
     */
    public SysEmployeeService selectSysEmployeeServiceByServiceId(Long serviceId);

    /**
     * 查询员工服务列表
     * 
     * @param sysEmployeeService 员工服务
     * @return 员工服务集合
     */
    public List<SysEmployeeService> selectSysEmployeeServiceList(SysEmployeeService sysEmployeeService);

    /**
     * 新增员工服务
     * 
     * @param sysEmployeeService 员工服务
     * @return 结果
     */
    public int insertSysEmployeeService(SysEmployeeService sysEmployeeService);

    /**
     * 修改员工服务
     * 
     * @param sysEmployeeService 员工服务
     * @return 结果
     */
    public int updateSysEmployeeService(SysEmployeeService sysEmployeeService);

    /**
     * 批量删除员工服务
     * 
     * @param serviceIds 需要删除的员工服务主键集合
     * @return 结果
     */
    public int deleteSysEmployeeServiceByServiceIds(Long[] serviceIds);

    /**
     * 删除员工服务信息
     * 
     * @param serviceId 员工服务主键
     * @return 结果
     */
    public int deleteSysEmployeeServiceByServiceId(Long serviceId);
}
