package com.website.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

/**
 * 支出管理对象 sys_pay_out_info
 *
 * @author ruoyi
 * @date 2024-01-25
 */
public class SysPayOutInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 支出时间 */
    @Excel(name = "支出时间")
    private String payOutTime;

    /** 支出金额 */
    @Excel(name = "支出金额")
    private String payOutAmount;

    @Excel(name = "支出原因")
    private String reason;


    /** 支出类型 */
    @Excel(name = "支出类型")
    private String payOutType;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setPayOutTime(String payOutTime)
    {
        this.payOutTime = payOutTime;
    }

    public String getPayOutTime()
    {
        return payOutTime;
    }
    public void setPayOutAmount(String payOutAmount)
    {
        this.payOutAmount = payOutAmount;
    }

    public String getPayOutAmount()
    {
        return payOutAmount;
    }
    public void setPayOutType(String payOutType)
    {
        this.payOutType = payOutType;
    }

    public String getPayOutType()
    {
        return payOutType;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("payOutTime", getPayOutTime())
            .append("payOutAmount", getPayOutAmount())
            .append("payOutType", getPayOutType())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("reason", getReason())
            .toString();
    }
}
