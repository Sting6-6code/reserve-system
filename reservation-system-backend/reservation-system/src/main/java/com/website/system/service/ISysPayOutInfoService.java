package com.website.system.service;

import java.util.List;

import com.website.system.domain.PayOutAmount;
import com.website.system.domain.SysPayOutInfo;

/**
 * 支出管理Service接口
 *
 * @author ruoyi
 * @date 2024-01-25
 */
public interface ISysPayOutInfoService
{
    /**
     * 查询支出管理
     *
     * @param id 支出管理主键
     * @return 支出管理
     */
    public SysPayOutInfo selectSysPayOutInfoById(Long id);

    /**
     * 查询支出管理列表
     *
     * @param sysPayOutInfo 支出管理
     * @return 支出管理集合
     */
    public List<SysPayOutInfo> selectSysPayOutInfoList(SysPayOutInfo sysPayOutInfo);

    /**
     * 新增支出管理
     *
     * @param sysPayOutInfo 支出管理
     * @return 结果
     */
    public int insertSysPayOutInfo(SysPayOutInfo sysPayOutInfo);

    /**
     * 修改支出管理
     *
     * @param sysPayOutInfo 支出管理
     * @return 结果
     */
    public int updateSysPayOutInfo(SysPayOutInfo sysPayOutInfo);

    /**
     * 批量删除支出管理
     *
     * @param ids 需要删除的支出管理主键集合
     * @return 结果
     */
    public int deleteSysPayOutInfoByIds(Long[] ids);

    /**
     * 删除支出管理信息
     *
     * @param id 支出管理主键
     * @return 结果
     */
    public int deleteSysPayOutInfoById(Long id);

    public PayOutAmount selectPayOutAmount(SysPayOutInfo sysPayOutInfo);
}
