package com.website.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

/**
 * 员工管理对象 sys_employee_info
 *
 * @author ruoyi
 * @date 2024-01-21
 */
public class SysEmployeeInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 员工ID */
    private Long employeeId;
    @Excel(name = "员工姓名")
    private String nickName;

    @Excel(name = "员工电话")
    private String phone;
    @Excel(name = "员工出生")
    private String birth;
    @Excel(name = "是否显示")
    private String activeOrNot;

    /** 封面照片 */
    @Excel(name = "封面照片")
    private String coverImage;

    /** 个人介绍 */
    @Excel(name = "个人介绍")
    private String personalIntroduction;

    private Integer orderNum;

    /** 员工编号 */
    @Excel(name = "员工编号")
    private String employeeCode;

    public void setEmployeeId(Long employeeId)
    {
        this.employeeId = employeeId;
    }

    public Long getEmployeeId()
    {
        return employeeId;
    }
    public void setCoverImage(String coverImage)
    {
        this.coverImage = coverImage;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getCoverImage()
    {
        return coverImage;
    }
    public void setPersonalIntroduction(String personalIntroduction)
    {
        this.personalIntroduction = personalIntroduction;
    }

    public String getPersonalIntroduction()
    {
        return personalIntroduction;
    }
    public void setEmployeeCode(String employeeCode)
    {
        this.employeeCode = employeeCode;
    }

    public String getEmployeeCode()
    {
        return employeeCode;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getActiveOrNot() {
        return activeOrNot;
    }

    public void setActiveOrNot(String activeOrNot) {
        this.activeOrNot = activeOrNot;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("employeeId", getEmployeeId())
            .append("coverImage", getCoverImage())
            .append("personalIntroduction", getPersonalIntroduction())
            .append("employeeCode", getEmployeeCode())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("nickName", getNickName())
            .append("orderNum", getOrderNum())
            .append("activeOrNot",getActiveOrNot())
            .append("birth",getBirth())
            .append("phone",getPhone())
            .toString();
    }
}
