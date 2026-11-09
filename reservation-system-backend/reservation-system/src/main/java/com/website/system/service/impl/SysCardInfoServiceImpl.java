package com.website.system.service.impl;

import java.util.Date;
import java.util.List;

import com.website.common.utils.DateUtils;
import com.website.common.utils.StringUtils;
import com.website.system.domain.ServiceStatistics;
import com.website.system.domain.SysGiftCardSellRecord;
import com.website.system.domain.EmployeeWages;
import com.website.system.mapper.SysCardOrderMapper;
import com.website.system.mapper.SysGiftCardSellRecordMapper;
import com.website.system.mapper.SysServiceInfoMapper;
import com.website.common.core.domain.entity.SysServiceInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.website.system.mapper.SysCardInfoMapper;
import com.website.system.domain.SysCardInfo;
import com.website.system.service.ISysCardInfoService;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;

/**
 * 预约卡片管理Service业务层处理
 *
 * @author david
 * @date 2024-01-21
 */
@Service
public class SysCardInfoServiceImpl implements ISysCardInfoService
{
    @Autowired
    private SysCardInfoMapper sysCardInfoMapper;

    @Autowired
    private SysCardOrderMapper sysCardOrderMapper;

    @Autowired
    private SysGiftCardSellRecordMapper sysGiftCardSellRecordMapper;

    @Autowired
    private SysServiceInfoMapper sysServiceInfoMapper;


    /**
     * 查询预约卡片管理
     *
     * @param cardId 预约卡片管理主键
     * @return 预约卡片管理
     */
    @Override
    public SysCardInfo selectSysCardInfoByCardId(Long cardId)
    {
        return sysCardInfoMapper.selectSysCardInfoByCardId(cardId);
    }

    /**
     * 查询预约卡片管理列表
     *
     * @param sysCardInfo 预约卡片管理
     * @return 预约卡片管理
     */
    @Override
    public List<SysCardInfo> selectSysCardInfoList(SysCardInfo sysCardInfo)
    {
        return sysCardInfoMapper.selectSysCardInfoList(sysCardInfo);
    }

    /**
     * 新增预约卡片管理
     *
     * @param sysCardInfo 预约卡片管理
     * @return 结果
     */
    @Override
    public int insertSysCardInfo(SysCardInfo sysCardInfo)
    {
        sysCardInfo.setCreateTime(DateUtils.getNowDate());
        return sysCardInfoMapper.insertSysCardInfo(sysCardInfo);
    }

    @Transactional
    @Override
    public List<SysCardInfo> insertBatchSysCardInfo(List<SysCardInfo> sysCardInfo) {
        Date nowDate = DateUtils.getNowDate();
        sysCardInfo.stream().forEach(e -> {
            e.setCreateTime(nowDate);
            sysCardInfoMapper.insertSysCardInfo(e);
        });

        return sysCardInfo;
    }

    /**
     * 修改预约卡片管理
     *
     * @param sysCardInfo 预约卡片管理
     * @return 结果
     */
    @Override
    public int updateSysCardInfo(SysCardInfo sysCardInfo)
    {
        return sysCardInfoMapper.updateSysCardInfo(sysCardInfo);
    }

    @Override
    @Transactional
    public int updateCardOrder(SysCardInfo sysCardInfo)
    {
        if(!StringUtils.isEmpty(sysCardInfo.getCardOrder())){
            sysCardInfo.getCardOrder().forEach(e->{
                sysCardOrderMapper.insertSysCardOrder(e);
                // 修改礼品卡使用状态
                if(!StringUtils.isEmpty(e.getGiftCard())){
                  String [] giftCard=e.getGiftCard().split(",");
                  for(int i=0;i<giftCard.length;i++){
                      SysGiftCardSellRecord sysGiftCardSellRecord=new SysGiftCardSellRecord();
                      sysGiftCardSellRecord.setGiftCardCode(giftCard[i]);
                      sysGiftCardSellRecord.setStatus("2");
                      sysGiftCardSellRecordMapper.updateSysGiftCardSellRecordStatus(sysGiftCardSellRecord);
                  }

                }
            });
        }

        return sysCardInfoMapper.updateSysCardInfo(sysCardInfo);
    }




    /**
     * 批量删除预约卡片管理
     *
     * @param cardIds 需要删除的预约卡片管理主键
     * @return 结果
     */
    @Override
    public int deleteSysCardInfoByCardIds(Long[] cardIds)
    {
        return sysCardInfoMapper.deleteSysCardInfoByCardIds(cardIds);
    }

    /**
     * 删除预约卡片管理信息
     *
     * @param cardId 预约卡片管理主键
     * @return 结果
     */
    @Override
    public int deleteSysCardInfoByCardId(Long cardId)
    {
        return sysCardInfoMapper.deleteSysCardInfoByCardId(cardId);
    }

    /**
     * 获取员工工资列表（wagesTimeType=M 按月统计 其它按天统计）
     *
     * @param
     * @return 结果
     */
    @Override
    public List<EmployeeWages> getEmployeeWages(EmployeeWages employeeWages){
        return sysCardInfoMapper.getEmployeeWages(employeeWages);
    }

    /**
     * 获取服务统计列表（wagesTimeType=M 按月统计 其它按天统计）
     *
     * @param
     * @return 结果
     */
    @Override
    public List<ServiceStatistics> getServiceStatistics(ServiceStatistics employeeWages){
        return sysCardInfoMapper.getServiceStatistics(employeeWages);
    }

    /**
     * 查询客户历史信息（第一次服务日期和最近一次服务信息）
     *
     * @param customId 客户ID
     * @return 客户历史信息
     */
    @Override
    public com.website.system.domain.CustomerHistoryInfo getCustomerHistoryInfo(Long customId){
        com.website.system.domain.CustomerHistoryInfo historyInfo = sysCardInfoMapper.getCustomerHistoryInfo(customId);
        
        // 如果查询结果为空，创建新对象
        if (historyInfo == null) {
            historyInfo = new com.website.system.domain.CustomerHistoryInfo();
            historyInfo.setLatestServiceName("无服务记录");
            historyInfo.setLatestEmployeeName("NAN");
            return historyInfo;
        }
        
        // 处理技师信息：如果为null或空，设置为NAN
        if (historyInfo.getLatestEmployeeName() == null || historyInfo.getLatestEmployeeName().trim().isEmpty()) {
            historyInfo.setLatestEmployeeName("NAN");
        }
        
        // 解析服务列表JSON，获取服务名称
        try {
            String serviceListJson = historyInfo.getLatestServiceName();
            
            // 如果serviceListJson为空或null，设置为无服务记录
            if (serviceListJson == null || serviceListJson.isEmpty() || serviceListJson.trim().equals("null")) {
                historyInfo.setLatestServiceName("无服务记录");
                return historyInfo;
            }
            
            // 解析JSON数组，提取服务ID或服务名称
            java.util.List<String> serviceNames = new java.util.ArrayList<>();
            
            if (serviceListJson.startsWith("[")) {
                // 解析JSON数组
                JSONArray jsonArray = JSON.parseArray(serviceListJson);
                
                if (jsonArray != null && jsonArray.size() > 0) {
                    for (int i = 0; i < jsonArray.size(); i++) {
                        Object item = jsonArray.get(i);
                        
                        // 如果是对象，尝试提取serviceName或id
                        if (item instanceof com.alibaba.fastjson2.JSONObject) {
                            com.alibaba.fastjson2.JSONObject serviceObj = (com.alibaba.fastjson2.JSONObject) item;
                            
                            // 优先使用serviceName字段（如果存在）
                            String serviceName = serviceObj.getString("serviceName");
                            if (serviceName != null && !serviceName.isEmpty()) {
                                serviceNames.add(serviceName);
                            } else {
                                // 如果没有serviceName，使用id查询服务名称
                                Long serviceId = serviceObj.getLong("id");
                                if (serviceId != null) {
                                    SysServiceInfo serviceInfo = sysServiceInfoMapper.selectSysServiceInfoById(serviceId);
                                    if (serviceInfo != null && serviceInfo.getServiceName() != null) {
                                        serviceNames.add(serviceInfo.getServiceName());
                                    }
                                }
                            }
                        } else if (item instanceof Number) {
                            // 如果是数字，直接作为ID查询
                            Long serviceId = ((Number) item).longValue();
                            SysServiceInfo serviceInfo = sysServiceInfoMapper.selectSysServiceInfoById(serviceId);
                            if (serviceInfo != null && serviceInfo.getServiceName() != null) {
                                serviceNames.add(serviceInfo.getServiceName());
                            }
                        }
                    }
                }
            } else {
                // 如果不是JSON格式，尝试直接解析为数字ID
                String[] ids = serviceListJson.split(",");
                for (String id : ids) {
                    try {
                        Long serviceId = Long.parseLong(id.trim());
                        SysServiceInfo serviceInfo = sysServiceInfoMapper.selectSysServiceInfoById(serviceId);
                        if (serviceInfo != null && serviceInfo.getServiceName() != null) {
                            serviceNames.add(serviceInfo.getServiceName());
                        }
                    } catch (NumberFormatException e) {
                        // 忽略无效的ID
                    }
                }
            }
            
            // 设置服务名称
            if (serviceNames.isEmpty()) {
                historyInfo.setLatestServiceName("无服务记录");
            } else {
                historyInfo.setLatestServiceName(String.join(", ", serviceNames));
            }
        } catch (Exception e) {
            // 解析失败，设置为默认值
            historyInfo.setLatestServiceName("无服务记录");
            // 记录错误日志用于调试
            System.err.println("解析服务列表失败，customId=" + customId + ", error=" + e.getMessage());
            e.printStackTrace();
        }
        
        return historyInfo;
    }

}
