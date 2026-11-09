package com.website.system.domain;

import com.website.common.core.domain.BaseEntity;

import java.math.BigDecimal;

/**
 * 员工工资表
 *
 * @author david
 * @date 2024-01-26
 */
public class EmployeeWages extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    private String wagesTime;
    private Long employeeId;
    private String nickName;
    private BigDecimal wagesMoney;
    private String wagesTimeType;

    public String getWagesTime() {
        return wagesTime;
    }

    public void setWagesTime(String wagesTime) {
        this.wagesTime = wagesTime;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public BigDecimal getWagesMoney() {
        return wagesMoney;
    }

    public void setWagesMoney(BigDecimal wagesMoney) {
        this.wagesMoney = wagesMoney;
    }

    public String getWagesTimeType() {
        return wagesTimeType;
    }

    public void setWagesTimeType(String wagesTimeType) {
        this.wagesTimeType = wagesTimeType;
    }
}
