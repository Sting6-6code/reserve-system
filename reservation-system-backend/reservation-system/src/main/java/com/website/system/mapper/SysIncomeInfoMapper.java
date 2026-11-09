package com.website.system.mapper;

import java.util.List;
import com.website.system.domain.SysIncomeInfo;

/**
 * 收入管理Mapper接口
 * 
 * @author david
 * @date 2024-01-25
 */
public interface SysIncomeInfoMapper 
{
    /**
     * 查询收入管理
     * 
     * @param id 收入管理主键
     * @return 收入管理
     */
    public SysIncomeInfo selectSysIncomeInfoById(Long id);

    /**
     * 查询收入管理列表
     * 
     * @param sysIncomeInfo 收入管理
     * @return 收入管理集合
     */
    public List<SysIncomeInfo> selectSysIncomeInfoList(SysIncomeInfo sysIncomeInfo);

    /**
     * 新增收入管理
     * 
     * @param sysIncomeInfo 收入管理
     * @return 结果
     */
    public int insertSysIncomeInfo(SysIncomeInfo sysIncomeInfo);

    /**
     * 修改收入管理
     * 
     * @param sysIncomeInfo 收入管理
     * @return 结果
     */
    public int updateSysIncomeInfo(SysIncomeInfo sysIncomeInfo);

    /**
     * 删除收入管理
     * 
     * @param id 收入管理主键
     * @return 结果
     */
    public int deleteSysIncomeInfoById(Long id);

    /**
     * 批量删除收入管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysIncomeInfoByIds(Long[] ids);
}
