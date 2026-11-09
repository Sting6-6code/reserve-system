package com.website.system.service.impl;

import java.util.List;
import com.website.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysEmployeeInfoMapper;
import com.website.system.domain.SysEmployeeInfo;
import com.website.system.service.ISysEmployeeInfoService;

/**
 * 员工管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-21
 */
@Service
public class SysEmployeeInfoServiceImpl implements ISysEmployeeInfoService 
{
    @Autowired
    private SysEmployeeInfoMapper sysEmployeeInfoMapper;

    /**
     * 查询员工管理
     * 
     * @param employeeId 员工管理主键
     * @return 员工管理
     */
    @Override
    public SysEmployeeInfo selectSysEmployeeInfoByEmployeeId(Long employeeId)
    {
        return sysEmployeeInfoMapper.selectSysEmployeeInfoByEmployeeId(employeeId);
    }

    /**
     * 查询员工管理列表
     * 
     * @param sysEmployeeInfo 员工管理
     * @return 员工管理
     */
    @Override
    public List<SysEmployeeInfo> selectSysEmployeeInfoList(SysEmployeeInfo sysEmployeeInfo)
    {
        return sysEmployeeInfoMapper.selectSysEmployeeInfoList(sysEmployeeInfo);
    }

    /**
     * 新增员工管理
     * 
     * @param sysEmployeeInfo 员工管理
     * @return 结果
     */
    @Override
    public int insertSysEmployeeInfo(SysEmployeeInfo sysEmployeeInfo)
    {
        sysEmployeeInfo.setCreateTime(DateUtils.getNowDate());
        return sysEmployeeInfoMapper.insertSysEmployeeInfo(sysEmployeeInfo);
    }

    /**
     * 修改员工管理
     * 
     * @param sysEmployeeInfo 员工管理
     * @return 结果
     */
    @Override
    public int updateSysEmployeeInfo(SysEmployeeInfo sysEmployeeInfo)
    {
        return sysEmployeeInfoMapper.updateSysEmployeeInfo(sysEmployeeInfo);
    }

    /**
     * 批量删除员工管理
     * 
     * @param employeeIds 需要删除的员工管理主键
     * @return 结果
     */
    @Override
    public int deleteSysEmployeeInfoByEmployeeIds(Long[] employeeIds)
    {
        return sysEmployeeInfoMapper.deleteSysEmployeeInfoByEmployeeIds(employeeIds);
    }

    /**
     * 删除员工管理信息
     * 
     * @param employeeId 员工管理主键
     * @return 结果
     */
    @Override
    public int deleteSysEmployeeInfoByEmployeeId(Long employeeId)
    {
        return sysEmployeeInfoMapper.deleteSysEmployeeInfoByEmployeeId(employeeId);
    }
}
