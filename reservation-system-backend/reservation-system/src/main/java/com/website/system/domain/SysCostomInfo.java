package com.website.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.website.common.annotation.Excel;
import com.website.common.core.domain.BaseEntity;

/**
 * 预约客户管理对象 sys_costom_info
 * 
 * @author david
 * @date 2024-01-29
 */
public class SysCostomInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 客户ID */
    @Excel(name = "客户ID")
    private Long customId;

    /** 客户用户名 */
    @Excel(name = "客户用户名")
    private String customUserName;

    /** 客户姓名 */
    @Excel(name = "客户姓名")
    private String customNickName;

    /** 客户密码 */
    private String customPassword;

    /** 客户头像 */
    @Excel(name = "客户头像")
    private String customAvatar;

    /** 客户地址 */
    @Excel(name = "客户地址")
    private String customAddress;

    /** 客户电话 */
    @Excel(name = "客户电话")
    private String customPhone;

    public void setCustomId(Long customId) 
    {
        this.customId = customId;
    }

    public Long getCustomId() 
    {
        return customId;
    }
    public void setCustomUserName(String customUserName) 
    {
        this.customUserName = customUserName;
    }

    public String getCustomUserName() 
    {
        return customUserName;
    }
    public void setCustomNickName(String customNickName) 
    {
        this.customNickName = customNickName;
    }

    public String getCustomNickName() 
    {
        return customNickName;
    }
    public void setCustomPassword(String customPassword) 
    {
        this.customPassword = customPassword;
    }

    public String getCustomPassword() 
    {
        return customPassword;
    }
    public void setCustomAvatar(String customAvatar) 
    {
        this.customAvatar = customAvatar;
    }

    public String getCustomAvatar() 
    {
        return customAvatar;
    }
    public void setCustomAddress(String customAddress) 
    {
        this.customAddress = customAddress;
    }

    public String getCustomAddress() 
    {
        return customAddress;
    }
    public void setCustomPhone(String customPhone) 
    {
        this.customPhone = customPhone;
    }

    public String getCustomPhone() 
    {
        return customPhone;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("customId", getCustomId())
            .append("customUserName", getCustomUserName())
            .append("customNickName", getCustomNickName())
            .append("customPassword", getCustomPassword())
            .append("customAvatar", getCustomAvatar())
            .append("customAddress", getCustomAddress())
            .append("customPhone", getCustomPhone())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .toString();
    }
}
