package com.website.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

import java.math.BigDecimal;
import java.util.List;

/**
 * 预约卡片管理对象 sys_card_info
 *
 * @author david
 * @date 2024-01-21
 */
public class SysCardInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 预约卡片ID */
    private Long cardId;

    /** 预约卡片名称 */
    @Excel(name = "预约卡片名称")
    private String cardName;

    /** 预约开始时间 */
    @Excel(name = "预约开始时间")
    private String start;

    /** 预约结束时间 */
    @Excel(name = "预约结束时间")
    private String end;

    /** 预约员工ID */
    @Excel(name = "预约员工ID")
    private Long employeeId;

    /** 预约客户ID */
    @Excel(name = "预约客户ID")
    private Long customId;

    /** 预约人数 */
    @Excel(name = "预约人数")
    private Long cardNum;

    /** 预约服务列表 */
    @Excel(name = "预约服务列表")
    private String serviceList;

    /** 订单组 */
    @Excel(name = "订单组")
    private String orderStatus;

    @Excel(name = "支付类型")
    private String payType;

    @Excel(name = "支付金额")
    private BigDecimal payAmount;

    private String serviceGroup;

    private BigDecimal serviceWages;

    private String payTime;

    List<SysCardOrder> cardOrder;

    public void setCardId(Long cardId)
    {
        this.cardId = cardId;
    }

    public Long getCardId()
    {
        return cardId;
    }
    public void setCardName(String cardName)
    {
        this.cardName = cardName;
    }

    public String getCardName()
    {
        return cardName;
    }
    public void setStart(String start)
    {
        this.start = start;
    }

    public String getStart()
    {
        return start;
    }
    public void setEnd(String end)
    {
        this.end = end;
    }

    public String getEnd()
    {
        return end;
    }
    public void setEmployeeId(Long employeeId)
    {
        this.employeeId = employeeId;
    }

    public Long getEmployeeId()
    {
        return employeeId;
    }
    public void setCustomId(Long customId)
    {
        this.customId = customId;
    }

    public Long getCustomId()
    {
        return customId;
    }
    public void setCardNum(Long cardNum)
    {
        this.cardNum = cardNum;
    }

    public Long getCardNum()
    {
        return cardNum;
    }
    public void setServiceList(String serviceList)
    {
        this.serviceList = serviceList;
    }

    public String getServiceList()
    {
        return serviceList;
    }
    public void setOrderStatus(String orderStatus)
    {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatus()
    {
        return orderStatus;
    }

    public String getServiceGroup() {
        return serviceGroup;
    }

    public void setServiceGroup(String serviceGroup) {
        this.serviceGroup = serviceGroup;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    public List<SysCardOrder> getCardOrder() {
        return cardOrder;
    }

    public void setCardOrder(List<SysCardOrder> cardOrder) {
        this.cardOrder = cardOrder;
    }

    public BigDecimal getServiceWages() {
        return serviceWages;
    }

    public void setServiceWages(BigDecimal serviceWages) {
        this.serviceWages = serviceWages;
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
            .append("cardId", getCardId())
            .append("cardName", getCardName())
            .append("start", getStart())
            .append("end", getEnd())
            .append("employeeId", getEmployeeId())
            .append("customId", getCustomId())
            .append("cardNum", getCardNum())
            .append("serviceList", getServiceList())
            .append("orderStatus", getOrderStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("payType", getPayType())
            .append("payAmount", getPayAmount())
            .append("serviceGroup", getServiceGroup())
            .append("serviceWages", getServiceWages())
            .append("payTime",getPayTime())
            .toString();
    }
}
