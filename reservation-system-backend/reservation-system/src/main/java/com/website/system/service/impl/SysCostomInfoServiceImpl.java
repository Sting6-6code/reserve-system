package com.website.system.service.impl;

import java.util.List;
import com.website.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysCostomInfoMapper;
import com.website.system.domain.SysCostomInfo;
import com.website.system.service.ISysCostomInfoService;

/**
 * 预约客户管理Service业务层处理
 * 
 * @author david
 * @date 2024-01-29
 */
@Service
public class SysCostomInfoServiceImpl implements ISysCostomInfoService 
{
    @Autowired
    private SysCostomInfoMapper sysCostomInfoMapper;

    /**
     * 查询预约客户管理
     * 
     * @param customId 预约客户管理主键
     * @return 预约客户管理
     */
    @Override
    public SysCostomInfo selectSysCostomInfoByCustomId(Long customId)
    {
        return sysCostomInfoMapper.selectSysCostomInfoByCustomId(customId);
    }

    /**
     * 查询预约客户管理列表
     * 
     * @param sysCostomInfo 预约客户管理
     * @return 预约客户管理
     */
    @Override
    public List<SysCostomInfo> selectSysCostomInfoList(SysCostomInfo sysCostomInfo)
    {

        return sysCostomInfoMapper.selectSysCostomInfoList(sysCostomInfo);
    }

    /**
     * 新增预约客户管理
     * 
     * @param sysCostomInfo 预约客户管理
     * @return 结果
     */
    @Override
    public int insertSysCostomInfo(SysCostomInfo sysCostomInfo)
    {
        sysCostomInfo.setCreateTime(DateUtils.getNowDate());
        return sysCostomInfoMapper.insertSysCostomInfo(sysCostomInfo);
    }

    /**
     * 修改预约客户管理
     * 
     * @param sysCostomInfo 预约客户管理
     * @return 结果
     */
    @Override
    public int updateSysCostomInfo(SysCostomInfo sysCostomInfo)
    {
        return sysCostomInfoMapper.updateSysCostomInfo(sysCostomInfo);
    }

    /**
     * 批量删除预约客户管理
     * 
     * @param customIds 需要删除的预约客户管理主键
     * @return 结果
     */
    @Override
    public int deleteSysCostomInfoByCustomIds(Long[] customIds)
    {
        return sysCostomInfoMapper.deleteSysCostomInfoByCustomIds(customIds);
    }

    /**
     * 删除预约客户管理信息
     * 
     * @param customId 预约客户管理主键
     * @return 结果
     */
    @Override
    public int deleteSysCostomInfoByCustomId(Long customId)
    {
        return sysCostomInfoMapper.deleteSysCostomInfoByCustomId(customId);
    }
}
