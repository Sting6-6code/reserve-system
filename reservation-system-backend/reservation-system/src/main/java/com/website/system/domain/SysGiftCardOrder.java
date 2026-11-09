package com.website.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

/**
 * 礼品卡订单记录对象 sys_gift_card_order
 *
 * @author david
 * @date 2024-01-26
 */
public class SysGiftCardOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 礼品卡编码 */
    @Excel(name = "礼品卡编码")
    private String giftCardCode;

    /** 礼品卡支付方式 */
    @Excel(name = "礼品卡支付方式")
    private String giftCardPayType;

    /** 礼品卡支付金额 */
    @Excel(name = "礼品卡支付金额")
    private BigDecimal giftCardPayAmount;

    @Excel(name = "支付时间")
    private String payTime;


    public void setGiftCardCode(String giftCardCode)
    {
        this.giftCardCode = giftCardCode;
    }

    public String getGiftCardCode()
    {
        return giftCardCode;
    }
    public void setGiftCardPayType(String giftCardPayType)
    {
        this.giftCardPayType = giftCardPayType;
    }

    public String getGiftCardPayType()
    {
        return giftCardPayType;
    }
    public void setGiftCardPayAmount(BigDecimal giftCardPayAmount)
    {
        this.giftCardPayAmount = giftCardPayAmount;
    }

    public BigDecimal getGiftCardPayAmount()
    {
        return giftCardPayAmount;
    }

    public String getPayTime() {
        return payTime;
    }

    public void setPayTime(String payTime) {
        this.payTime = payTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("giftCardCode", getGiftCardCode())
            .append("giftCardPayType", getGiftCardPayType())
            .append("giftCardPayAmount", getGiftCardPayAmount())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("payTime", getPayTime())
            .toString();
    }
}
