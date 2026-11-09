package com.website.system.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import com.website.common.core.domain.TreeSelect;
import com.website.common.utils.DateUtils;
import com.website.common.utils.StringUtils;
import com.website.common.utils.spring.SpringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysServiceInfoMapper;
import com.website.common.core.domain.entity.SysServiceInfo;
import com.website.system.service.ISysServiceInfoService;

/**
 * 服务管理Service业务层处理
 *
 * @author david
 * @date 2024-01-21
 */
@Service
public class SysServiceInfoServiceImpl implements ISysServiceInfoService
{
    @Autowired
    private SysServiceInfoMapper sysServiceInfoMapper;

    /**
     * 查询服务管理
     *
     * @param id 服务管理主键
     * @return 服务管理
     */
    @Override
    public SysServiceInfo selectSysServiceInfoById(Long id)
    {
        return sysServiceInfoMapper.selectSysServiceInfoById(id);
    }

    /**
     * 查询服务管理列表
     *
     * @param sysServiceInfo 服务管理
     * @return 服务管理
     */
    @Override
    public List<SysServiceInfo> selectSysServiceInfoList(SysServiceInfo sysServiceInfo)
    {
        return sysServiceInfoMapper.selectSysServiceInfoList(sysServiceInfo);
    }

    /**
     * 新增服务管理
     *
     * @param sysServiceInfo 服务管理
     * @return 结果
     */
    @Override
    public int insertSysServiceInfo(SysServiceInfo sysServiceInfo)
    {
        sysServiceInfo.setCreateTime(DateUtils.getNowDate());
        return sysServiceInfoMapper.insertSysServiceInfo(sysServiceInfo);
    }

    /**
     * 修改服务管理
     *
     * @param sysServiceInfo 服务管理
     * @return 结果
     */
    @Override
    public int updateSysServiceInfo(SysServiceInfo sysServiceInfo)
    {
        return sysServiceInfoMapper.updateSysServiceInfo(sysServiceInfo);
    }

    /**
     * 批量删除服务管理
     *
     * @param ids 需要删除的服务管理主键
     * @return 结果
     */
    @Override
    public int deleteSysServiceInfoByIds(Long[] ids)
    {
        return sysServiceInfoMapper.deleteSysServiceInfoByIds(ids);
    }

    /**
     * 删除服务管理信息
     *
     * @param id 服务管理主键
     * @return 结果
     */
    @Override
    public int deleteSysServiceInfoById(Long id)
    {
        return sysServiceInfoMapper.deleteSysServiceInfoById(id);
    }

    /**
     * 构建前端所需要树结构
     *
     */
    @Override
    public List<SysServiceInfo> buildServiceTree(List<SysServiceInfo> sysServiceInfos)
    {
        List<SysServiceInfo> returnList = new ArrayList<SysServiceInfo>();
        List<Long> tempList = sysServiceInfos.stream().map(SysServiceInfo::getId).collect(Collectors.toList());
        for (SysServiceInfo service : sysServiceInfos)
        {
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(service.getParentId()))
            {
                recursionFn(sysServiceInfos, service);
                returnList.add(service);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = sysServiceInfos;
        }
        return returnList;
    }

    /**
     * 递归列表
     */
    private void recursionFn(List<SysServiceInfo> list, SysServiceInfo t)
    {
        // 得到子节点列表
        List<SysServiceInfo> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysServiceInfo tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<SysServiceInfo> getChildList(List<SysServiceInfo> list, SysServiceInfo t)
    {
        List<SysServiceInfo> tlist = new ArrayList<SysServiceInfo>();
        Iterator<SysServiceInfo> it = list.iterator();
        while (it.hasNext())
        {
            SysServiceInfo n = (SysServiceInfo) it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysServiceInfo> list, SysServiceInfo t)
    {
        return getChildList(list, t).size() > 0;
    }

    /**
     * 构建前端所需要下拉树结构
     *
     */
    @Override
    public List<TreeSelect> buildServiceTreeSelect(List<SysServiceInfo> sysServiceInfos){
        List<SysServiceInfo> serviceTrees = buildServiceTree(sysServiceInfos);
        return serviceTrees.stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    /**
     * 查询部门树结构信息
     *
     */
    @Override
    public List<TreeSelect> selectServiceTreeList(SysServiceInfo sysServiceInfo)
    {
        List<SysServiceInfo> sysServiceInfos = selectSysServiceInfoList(sysServiceInfo);
        return buildServiceTreeSelect(sysServiceInfos);
    }
}
