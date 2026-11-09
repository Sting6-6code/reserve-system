package com.website.system.mapper;

import java.util.List;
import com.website.common.core.domain.entity.SysServiceInfo;

/**
 * 服务管理Mapper接口
 *
 * @author david
 * @date 2024-01-21
 */
public interface SysServiceInfoMapper
{
    /**
     * 查询服务管理
     *
     * @param id 服务管理主键
     * @return 服务管理
     */
    public SysServiceInfo selectSysServiceInfoById(Long id);

    /**
     * 查询服务管理列表
     *
     * @param sysServiceInfo 服务管理
     * @return 服务管理集合
     */
    public List<SysServiceInfo> selectSysServiceInfoList(SysServiceInfo sysServiceInfo);

    /**
     * 新增服务管理
     *
     * @param sysServiceInfo 服务管理
     * @return 结果
     */
    public int insertSysServiceInfo(SysServiceInfo sysServiceInfo);

    /**
     * 修改服务管理
     *
     * @param sysServiceInfo 服务管理
     * @return 结果
     */
    public int updateSysServiceInfo(SysServiceInfo sysServiceInfo);

    /**
     * 删除服务管理
     *
     * @param id 服务管理主键
     * @return 结果
     */
    public int deleteSysServiceInfoById(Long id);

    /**
     * 批量删除服务管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysServiceInfoByIds(Long[] ids);
}
