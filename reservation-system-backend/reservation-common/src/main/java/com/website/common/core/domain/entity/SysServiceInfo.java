package com.website.common.core.domain.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.website.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.TreeEntity;

/**
 * 服务管理对象 sys_service_info
 *
 * @author david
 * @date 2024-01-21
 */
public class SysServiceInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 服务ID */
    private Long id;

    private Long parentId;

    /** 服务名称 */
    @Excel(name = "服务名称")
    private String serviceName;

    /** 服务时长 */
    @Excel(name = "服务时长")
    private Long serviceTime;

    /** 服务价格 */
    @Excel(name = "服务价格")
    private BigDecimal servicePrice;

    /** 服务详情 */
    @Excel(name = "服务详情")
    private String serviceDetail;

    @Excel(name = "服务工资")
    private BigDecimal serviceWages;

    /** 子菜单 */
    private List<SysServiceInfo> children = new ArrayList<SysServiceInfo>();


    public List<SysServiceInfo> getChildren() {
        return children;
    }


    public void setChildren(List<SysServiceInfo> children) {
        this.children = children;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setServiceName(String serviceName)
    {
        this.serviceName = serviceName;
    }

    public String getServiceName()
    {
        return serviceName;
    }
    public void setServiceTime(Long serviceTime)
    {
        this.serviceTime = serviceTime;
    }

    public Long getServiceTime()
    {
        return serviceTime;
    }
    public void setServicePrice(BigDecimal servicePrice)
    {
        this.servicePrice = servicePrice;
    }

    public BigDecimal getServicePrice()
    {
        return servicePrice;
    }
    public void setServiceDetail(String serviceDetail)
    {
        this.serviceDetail = serviceDetail;
    }

    public String getServiceDetail()
    {
        return serviceDetail;
    }

    public BigDecimal getServiceWages() {
        return serviceWages;
    }

    public void setServiceWages(BigDecimal serviceWages) {
        this.serviceWages = serviceWages;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("serviceName", getServiceName())
            .append("serviceTime", getServiceTime())
            .append("servicePrice", getServicePrice())
            .append("serviceDetail", getServiceDetail())
            .append("parentId", getParentId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("serviceWages",getServiceWages())
            .toString();
    }
}
