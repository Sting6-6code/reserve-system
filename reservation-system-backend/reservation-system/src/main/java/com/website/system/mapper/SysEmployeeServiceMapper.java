package com.website.system.mapper;

import java.util.List;
import com.website.system.domain.SysEmployeeService;

/**
 * 员工服务Mapper接口
 * 
 * @author david
 * @date 2024-01-21
 */
public interface SysEmployeeServiceMapper 
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
     * 删除员工服务
     * 
     * @param serviceId 员工服务主键
     * @return 结果
     */
    public int deleteSysEmployeeServiceByServiceId(Long serviceId);

    /**
     * 批量删除员工服务
     * 
     * @param serviceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysEmployeeServiceByServiceIds(Long[] serviceIds);
}
