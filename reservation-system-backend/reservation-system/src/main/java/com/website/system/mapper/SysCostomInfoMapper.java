package com.website.system.mapper;

import java.util.List;
import com.website.system.domain.SysCostomInfo;
import io.lettuce.core.dynamic.annotation.Param;

/**
 * 预约客户管理Mapper接口
 * 
 * @author david
 * @date 2024-01-29
 */
public interface SysCostomInfoMapper 
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
     * 删除预约客户管理
     * 
     * @param customId 预约客户管理主键
     * @return 结果
     */
    public int deleteSysCostomInfoByCustomId(Long customId);

    /**
     * 批量删除预约客户管理
     * 
     * @param customIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCostomInfoByCustomIds(Long[] customIds);
}
