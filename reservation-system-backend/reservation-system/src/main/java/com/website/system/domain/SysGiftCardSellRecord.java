package com.website.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

/**
 * 会员卡出售记录对象 sys_gift_card_sell_record
 *
 * @author david
 * @date 2024-01-26
 */
public class SysGiftCardSellRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 会员卡类型 */
    @Excel(name = "会员卡类型")
    private String giftCardType;

    /** 会员卡编号 */
    @Excel(name = "会员卡编号")
    private String giftCardCode;

    /** 会员卡出售价格 */
    @Excel(name = "会员卡出售价格")
    private BigDecimal giftCardSellPrice;

    /** 会员卡抵扣价格 */
    @Excel(name = "会员卡抵扣价格")
    private BigDecimal giftCardDeductionPrice;

    private List<SysGiftCardOrder> giftCardOrder;
    @Excel(name = "出售日期")
    private String sellDate;

    @Excel(name = "现金支付")
    private BigDecimal xj;
    @Excel(name = "电子支付")
    private BigDecimal dz;
    @Excel(name = "刷卡支付")
    private BigDecimal sk;

    /** 会员卡使用状态 */
    @Excel(name = "会员卡使用状态")
    private String status;

    private Long customId;

    private String customNickName;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setGiftCardType(String giftCardType)
    {
        this.giftCardType = giftCardType;
    }

    public String getGiftCardType()
    {
        return giftCardType;
    }
    public void setGiftCardCode(String giftCardCode)
    {
        this.giftCardCode = giftCardCode;
    }

    public String getGiftCardCode()
    {
        return giftCardCode;
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
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }


    public List<SysGiftCardOrder> getGiftCardOrder() {
        return giftCardOrder;
    }

    public void setGiftCardOrder(List<SysGiftCardOrder> giftCardOrder) {
        this.giftCardOrder = giftCardOrder;
    }

    public String getSellDate() {
        return sellDate;
    }

    public void setSellDate(String sellDate) {
        this.sellDate = sellDate;
    }

    public BigDecimal getXj() {
        return xj;
    }

    public void setXj(BigDecimal xj) {
        this.xj = xj;
    }

    public BigDecimal getDz() {
        return dz;
    }

    public void setDz(BigDecimal dz) {
        this.dz = dz;
    }

    public BigDecimal getSk() {
        return sk;
    }

    public void setSk(BigDecimal sk) {
        this.sk = sk;
    }

    public Long getCustomId() {
        return customId;
    }

    public void setCustomId(Long customId) {
        this.customId = customId;
    }

    public String getCustomNickName() {
        return customNickName;
    }

    public void setCustomNickName(String customNickName) {
        this.customNickName = customNickName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("giftCardType", getGiftCardType())
            .append("giftCardCode", getGiftCardCode())
            .append("giftCardSellPrice", getGiftCardSellPrice())
            .append("giftCardDeductionPrice", getGiftCardDeductionPrice())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("sellDate", getSellDate())
            .append("sk", getSk())
            .append("xj", getXj())
            .append("dz", getDz())
            .append("customId",getCustomId())
            .append("customNickName",getCustomNickName())
            .toString();
    }
}
