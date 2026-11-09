package com.website.system.domain;

import com.website.common.core.domain.BaseEntity;

import java.math.BigDecimal;

/**
 * 员工工资表
 *
 * @author david
 * @date 2024-01-26
 */
public class ServiceStatistics extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    private String payTime;
    private String cardId;
    private String serviceGroup;
    private String payType;
    private BigDecimal payAmount;
    private String payTimeType;

    private String nickName;

    private Long employeeId;

    private Long count;

    private BigDecimal serviceWages;


    public String getPayTime() {
        return payTime;
    }

    public void setPayTime(String payTime) {
        this.payTime = payTime;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
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

    public String getPayTimeType() {
        return payTimeType;
    }

    public void setPayTimeType(String payTimeType) {
        this.payTimeType = payTimeType;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }


    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public BigDecimal getServiceWages() {
        return serviceWages;
    }

    public void setServiceWages(BigDecimal serviceWages) {
        this.serviceWages = serviceWages;
    }
}
