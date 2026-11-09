package com.website.system.domain;

import com.website.common.core.domain.BaseEntity;

/**
 * 客户历史信息
 *
 * @author david
 * @date 2024-01-21
 */
public class CustomerHistoryInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    
    /** 第一次服务日期 */
    private String firstServiceDate;
    
    /** 最近一次服务日期 */
    private String latestServiceDate;
    
    /** 最近一次服务名称 */
    private String latestServiceName;
    
    /** 最近一次服务技师名称 */
    private String latestEmployeeName;

    public String getFirstServiceDate() {
        return firstServiceDate;
    }

    public void setFirstServiceDate(String firstServiceDate) {
        this.firstServiceDate = firstServiceDate;
    }

    public String getLatestServiceName() {
        return latestServiceName;
    }

    public void setLatestServiceName(String latestServiceName) {
        this.latestServiceName = latestServiceName;
    }

    public String getLatestEmployeeName() {
        return latestEmployeeName;
    }

    public void setLatestEmployeeName(String latestEmployeeName) {
        this.latestEmployeeName = latestEmployeeName;
    }

    public String getLatestServiceDate() {
        return latestServiceDate;
    }

    public void setLatestServiceDate(String latestServiceDate) {
        this.latestServiceDate = latestServiceDate;
    }
}
