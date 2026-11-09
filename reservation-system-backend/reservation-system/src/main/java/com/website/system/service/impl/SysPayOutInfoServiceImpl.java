package com.website.system.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.website.common.utils.DateUtils;
import com.website.system.domain.PayOutAmount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysPayOutInfoMapper;
import com.website.system.domain.SysPayOutInfo;
import com.website.system.service.ISysPayOutInfoService;

/**
 * 支出管理Service业务层处理
 *
 * @author ruoyi
 * @date 2024-01-25
 */
@Service
public class SysPayOutInfoServiceImpl implements ISysPayOutInfoService
{
    @Autowired
    private SysPayOutInfoMapper sysPayOutInfoMapper;

    /**
     * 查询支出管理
     *
     * @param id 支出管理主键
     * @return 支出管理
     */
    @Override
    public SysPayOutInfo selectSysPayOutInfoById(Long id)
    {
        return sysPayOutInfoMapper.selectSysPayOutInfoById(id);
    }

    /**
     * 查询支出管理列表
     *
     * @param sysPayOutInfo 支出管理
     * @return 支出管理
     */
    @Override
    public List<SysPayOutInfo> selectSysPayOutInfoList(SysPayOutInfo sysPayOutInfo)
    {
        return sysPayOutInfoMapper.selectSysPayOutInfoList(sysPayOutInfo);
    }

    /**
     * 新增支出管理
     *
     * @param sysPayOutInfo 支出管理
     * @return 结果
     */
    @Override
    public int insertSysPayOutInfo(SysPayOutInfo sysPayOutInfo)
    {
        sysPayOutInfo.setCreateTime(DateUtils.getNowDate());
        return sysPayOutInfoMapper.insertSysPayOutInfo(sysPayOutInfo);
    }

    /**
     * 修改支出管理
     *
     * @param sysPayOutInfo 支出管理
     * @return 结果
     */
    @Override
    public int updateSysPayOutInfo(SysPayOutInfo sysPayOutInfo)
    {
        return sysPayOutInfoMapper.updateSysPayOutInfo(sysPayOutInfo);
    }

    /**
     * 批量删除支出管理
     *
     * @param ids 需要删除的支出管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPayOutInfoByIds(Long[] ids)
    {
        return sysPayOutInfoMapper.deleteSysPayOutInfoByIds(ids);
    }

    /**
     * 删除支出管理信息
     *
     * @param id 支出管理主键
     * @return 结果
     */
    @Override
    public int deleteSysPayOutInfoById(Long id)
    {
        return sysPayOutInfoMapper.deleteSysPayOutInfoById(id);
    }

    /**
     * 获取支出数据
     *
     * @param sysPayOutInfo 支出管理主键
     * @return 结果
     */
    public PayOutAmount selectPayOutAmount(SysPayOutInfo sysPayOutInfo){
        PayOutAmount payOutAmount = sysPayOutInfoMapper.selectPayOutAmount(sysPayOutInfo);
        if(payOutAmount==null){
            payOutAmount=new PayOutAmount();
            payOutAmount.setTotal(BigDecimal.ZERO);
            payOutAmount.setQtxf(BigDecimal.ZERO);
            payOutAmount.setTotal(BigDecimal.ZERO);
            payOutAmount.setSkxf(BigDecimal.ZERO);
            payOutAmount.setVenmoxf(BigDecimal.ZERO);
        }
        return payOutAmount;
    }
}
