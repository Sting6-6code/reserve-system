package com.website.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

/**
 * 礼品卡类型对象 sys_gift_card_type_info
 * 
 * @author david
 * @date 2024-01-26
 */
public class SysGiftCardTypeInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long giftCardTypeId;

    /** 礼品卡类型名称 */
    @Excel(name = "礼品卡类型名称")
    private String giftCardTypeName;

    /** 礼品卡出售价格 */
    @Excel(name = "礼品卡出售价格")
    private BigDecimal giftCardSellPrice;

    /** 礼品卡抵扣价格 */
    @Excel(name = "礼品卡抵扣价格")
    private BigDecimal giftCardDeductionPrice;

    public void setGiftCardTypeId(Long giftCardTypeId) 
    {
        this.giftCardTypeId = giftCardTypeId;
    }

    public Long getGiftCardTypeId() 
    {
        return giftCardTypeId;
    }
    public void setGiftCardTypeName(String giftCardTypeName) 
    {
        this.giftCardTypeName = giftCardTypeName;
    }

    public String getGiftCardTypeName() 
    {
        return giftCardTypeName;
    }
    public void setGiftCardSellPrice(BigDecimal giftCardSellPrice) 
    {
        this.giftCardSellPrice = giftCardSellPrice;
    }

    public BigDecimal getGiftCardSellPrice() 
    {
        return giftCardSellPrice;
    }
    public void setGiftCardDeductionPrice(BigDecimal giftCardDeductionPrice) 
    {
        this.giftCardDeductionPrice = giftCardDeductionPrice;
    }

    public BigDecimal getGiftCardDeductionPrice() 
    {
        return giftCardDeductionPrice;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("giftCardTypeId", getGiftCardTypeId())
            .append("giftCardTypeName", getGiftCardTypeName())
            .append("giftCardSellPrice", getGiftCardSellPrice())
            .append("giftCardDeductionPrice", getGiftCardDeductionPrice())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .toString();
    }
}
