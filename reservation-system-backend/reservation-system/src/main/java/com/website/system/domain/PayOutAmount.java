package com.website.system.domain;

import java.math.BigDecimal;

/**
 * 预约卡片支付管理对象 sys_card_order
 *
 * @author david
 * @date 2024-01-26
 */
public class PayOutAmount
{
    private static final long serialVersionUID = 1L;
    /** 支付金额 */
    private BigDecimal total;
    private BigDecimal skxf;
    private BigDecimal qtxf;
    private BigDecimal venmoxf;

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public BigDecimal getSkxf() {
        return skxf;
    }

    public void setSkxf(BigDecimal skxf) {
        this.skxf = skxf;
    }

    public BigDecimal getQtxf() {
        return qtxf;
    }

    public void setQtxf(BigDecimal qtxf) {
        this.qtxf = qtxf;
    }

    public BigDecimal getVenmoxf() {
        return venmoxf;
    }

    public void setVenmoxf(BigDecimal venmoxf) {
        this.venmoxf = venmoxf;
    }
}
