package com.website.system.service;

import java.util.List;
import com.website.system.domain.SysCostomInfo;

/**
 * 预约客户管理Service接口
 * 
 * @author david
 * @date 2024-01-29
 */
public interface ISysCostomInfoService 
{
    /**
     * 查询预约客户管理
     * 
     * @param customId 预约客户管理主键
     * @return 预约客户管理
     */
    public SysCostomInfo selectSysCostomInfoByCustomId(Long customId);

    /**
     * 查询预约客户管理列表
     * 
     * @param sysCostomInfo 预约客户管理
     * @return 预约客户管理集合
     */
    public List<SysCostomInfo> selectSysCostomInfoList(SysCostomInfo sysCostomInfo);

    /**
     * 新增预约客户管理
     * 
     * @param sysCostomInfo 预约客户管理
     * @return 结果
     */
    public int insertSysCostomInfo(SysCostomInfo sysCostomInfo);

    /**
     * 修改预约客户管理
     * 
     * @param sysCostomInfo 预约客户管理
     * @return 结果
     */
    public int updateSysCostomInfo(SysCostomInfo sysCostomInfo);

    /**
     * 批量删除预约客户管理
     * 
     * @param customIds 需要删除的预约客户管理主键集合
     * @return 结果
     */
    public int deleteSysCostomInfoByCustomIds(Long[] customIds);

    /**
     * 删除预约客户管理信息
     * 
     * @param customId 预约客户管理主键
     * @return 结果
     */
    public int deleteSysCostomInfoByCustomId(Long customId);
}
