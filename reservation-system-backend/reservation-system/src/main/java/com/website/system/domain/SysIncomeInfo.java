package com.website.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

/**
 * 收入管理对象 sys_income_info
 * 
 * @author david
 * @date 2024-01-25
 */
public class SysIncomeInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 收入时间 */
    @Excel(name = "收入时间")
    private String date;

    /** pos机收入 */
    @Excel(name = "pos机收入")
    private BigDecimal cc;

    /** 上班前现金余额 */
    @Excel(name = "上班前现金余额")
    private BigDecimal balanceBeforeWork;

    /** 现金收入 */
    @Excel(name = "现金收入")
    private BigDecimal cashIncome;

    /** 礼品卡收入 */
    @Excel(name = "礼品卡收入")
    private BigDecimal giftCardIncome;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDate(String date) 
    {
        this.date = date;
    }

    public String getDate() 
    {
        return date;
    }
    public void setCc(BigDecimal cc) 
    {
        this.cc = cc;
    }

    public BigDecimal getCc() 
    {
        return cc;
    }
    public void setBalanceBeforeWork(BigDecimal balanceBeforeWork) 
    {
        this.balanceBeforeWork = balanceBeforeWork;
    }

    public BigDecimal getBalanceBeforeWork() 
    {
        return balanceBeforeWork;
    }
    public void setCashIncome(BigDecimal cashIncome) 
    {
        this.cashIncome = cashIncome;
    }

    public BigDecimal getCashIncome() 
    {
        return cashIncome;
    }
    public void setGiftCardIncome(BigDecimal giftCardIncome) 
    {
        this.giftCardIncome = giftCardIncome;
    }

    public BigDecimal getGiftCardIncome() 
    {
        return giftCardIncome;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("date", getDate())
            .append("cc", getCc())
            .append("balanceBeforeWork", getBalanceBeforeWork())
            .append("cashIncome", getCashIncome())
            .append("giftCardIncome", getGiftCardIncome())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .toString();
    }
}
