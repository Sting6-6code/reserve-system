package com.website.system.domain;

import java.math.BigDecimal;

/**
 * 预约卡片支付管理对象 sys_card_order
 *
 * @author david
 * @date 2024-01-26
 */
public class GiftCardPayAmount
{
    private static final long serialVersionUID = 1L;
    /** 支付金额 */
    private BigDecimal total;
    private BigDecimal xj;
    private BigDecimal fxj;
    private BigDecimal dz;
    private BigDecimal sk;

    public BigDecimal getXj() {
        return xj;
    }

    public void setXj(BigDecimal xj) {
        this.xj = xj;
    }

    public BigDecimal getFxj() {
        return fxj;
    }

    public void setFxj(BigDecimal fxj) {
        this.fxj = fxj;
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

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
}
