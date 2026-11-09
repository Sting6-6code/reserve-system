package com.website.system.service.impl;

import java.util.List;
import com.website.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysEmployeeServiceMapper;
import com.website.system.domain.SysEmployeeService;
import com.website.system.service.ISysEmployeeServiceService;

/**
 * 员工服务Service业务层处理
 * 
 * @author david
 * @date 2024-01-21
 */
@Service
public class SysEmployeeServiceServiceImpl implements ISysEmployeeServiceService 
{
    @Autowired
    private SysEmployeeServiceMapper sysEmployeeServiceMapper;

    /**
     * 查询员工服务
     * 
     * @param serviceId 员工服务主键
     * @return 员工服务
     */
    @Override
    public SysEmployeeService selectSysEmployeeServiceByServiceId(Long serviceId)
    {
        return sysEmployeeServiceMapper.selectSysEmployeeServiceByServiceId(serviceId);
    }

    /**
     * 查询员工服务列表
     * 
     * @param sysEmployeeService 员工服务
     * @return 员工服务
     */
    @Override
    public List<SysEmployeeService> selectSysEmployeeServiceList(SysEmployeeService sysEmployeeService)
    {
        return sysEmployeeServiceMapper.selectSysEmployeeServiceList(sysEmployeeService);
    }

    /**
     * 新增员工服务
     * 
     * @param sysEmployeeService 员工服务
     * @return 结果
     */
    @Override
    public int insertSysEmployeeService(SysEmployeeService sysEmployeeService)
    {
        sysEmployeeService.setCreateTime(DateUtils.getNowDate());
        return sysEmployeeServiceMapper.insertSysEmployeeService(sysEmployeeService);
    }

    /**
     * 修改员工服务
     * 
     * @param sysEmployeeService 员工服务
     * @return 结果
     */
    @Override
    public int updateSysEmployeeService(SysEmployeeService sysEmployeeService)
    {
        return sysEmployeeServiceMapper.updateSysEmployeeService(sysEmployeeService);
    }

    /**
     * 批量删除员工服务
     * 
     * @param serviceIds 需要删除的员工服务主键
     * @return 结果
     */
    @Override
    public int deleteSysEmployeeServiceByServiceIds(Long[] serviceIds)
    {
        return sysEmployeeServiceMapper.deleteSysEmployeeServiceByServiceIds(serviceIds);
    }

    /**
     * 删除员工服务信息
     * 
     * @param serviceId 员工服务主键
     * @return 结果
     */
    @Override
    public int deleteSysEmployeeServiceByServiceId(Long serviceId)
    {
        return sysEmployeeServiceMapper.deleteSysEmployeeServiceByServiceId(serviceId);
    }
}
