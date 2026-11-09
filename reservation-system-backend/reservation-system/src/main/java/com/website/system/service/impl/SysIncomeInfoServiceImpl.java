package com.website.system.service.impl;

import java.util.List;
import com.website.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysIncomeInfoMapper;
import com.website.system.domain.SysIncomeInfo;
import com.website.system.service.ISysIncomeInfoService;

/**
 * 收入管理Service业务层处理
 * 
 * @author david
 * @date 2024-01-25
 */
@Service
public class SysIncomeInfoServiceImpl implements ISysIncomeInfoService 
{
    @Autowired
    private SysIncomeInfoMapper sysIncomeInfoMapper;

    /**
     * 查询收入管理
     * 
     * @param id 收入管理主键
     * @return 收入管理
     */
    @Override
    public SysIncomeInfo selectSysIncomeInfoById(Long id)
    {
        return sysIncomeInfoMapper.selectSysIncomeInfoById(id);
    }

    /**
     * 查询收入管理列表
     * 
     * @param sysIncomeInfo 收入管理
     * @return 收入管理
     */
    @Override
    public List<SysIncomeInfo> selectSysIncomeInfoList(SysIncomeInfo sysIncomeInfo)
    {
        return sysIncomeInfoMapper.selectSysIncomeInfoList(sysIncomeInfo);
    }

    /**
     * 新增收入管理
     * 
     * @param sysIncomeInfo 收入管理
     * @return 结果
     */
    @Override
    public int insertSysIncomeInfo(SysIncomeInfo sysIncomeInfo)
    {
        sysIncomeInfo.setCreateTime(DateUtils.getNowDate());
        return sysIncomeInfoMapper.insertSysIncomeInfo(sysIncomeInfo);
    }

    /**
     * 修改收入管理
     * 
     * @param sysIncomeInfo 收入管理
     * @return 结果
     */
    @Override
    public int updateSysIncomeInfo(SysIncomeInfo sysIncomeInfo)
    {
        return sysIncomeInfoMapper.updateSysIncomeInfo(sysIncomeInfo);
    }

    /**
     * 批量删除收入管理
     * 
     * @param ids 需要删除的收入管理主键
     * @return 结果
     */
    @Override
    public int deleteSysIncomeInfoByIds(Long[] ids)
    {
        return sysIncomeInfoMapper.deleteSysIncomeInfoByIds(ids);
    }

    /**
     * 删除收入管理信息
     * 
     * @param id 收入管理主键
     * @return 结果
     */
    @Override
    public int deleteSysIncomeInfoById(Long id)
    {
        return sysIncomeInfoMapper.deleteSysIncomeInfoById(id);
    }
}
