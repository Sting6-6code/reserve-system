package com.website.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

/**
 * 预约卡片支付管理对象 sys_card_order
 *
 * @author david
 * @date 2024-01-26
 */
public class SysCardOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 预约卡片ID */
    @Excel(name = "预约卡片ID")
    private Long cardId;

    /** 支付金额 */
    @Excel(name = "支付金额")
    private BigDecimal payAmount;

    /** 支付类型 */
    @Excel(name = "支付类型")
    private String payType;

    /** 支付时间 */
    @Excel(name = "支付时间")
    private String payTime;

    private String giftCard;

    public void setCardId(Long cardId)
    {
        this.cardId = cardId;
    }

    public Long getCardId()
    {
        return cardId;
    }
    public void setPayAmount(BigDecimal payAmount)
    {
        this.payAmount = payAmount;
    }

    public BigDecimal getPayAmount()
    {
        return payAmount;
    }
    public void setPayType(String payType)
    {
        this.payType = payType;
    }

    public String getPayType()
    {
        return payType;
    }
    public void setPayTime(String payTime)
    {
        this.payTime = payTime;
    }

    public String getPayTime()
    {
        return payTime;
    }

    public String getGiftCard() {
        return giftCard;
    }

    public void setGiftCard(String giftCard) {
        this.giftCard = giftCard;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("cardId", getCardId())
            .append("payAmount", getPayAmount())
            .append("payType", getPayType())
            .append("payTime", getPayTime())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("giftCard",getGiftCard())
            .toString();
    }
}
