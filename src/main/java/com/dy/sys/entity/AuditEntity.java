package com.dy.sys.entity;/**
 * ClassName:AuditEntity
 * Package:com.dy.sys.entity
 * Description:
 *
 * @Date:2020/3/31 19:13
 * @Author:Dong
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 *ClassName:AuditEntity
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuditEntity {
    /**
     * 审核事件
     */
    private String auditSomething;//某人+事件(用户名+请假几天)
    /**
     * 审核批注
     */
    private String auditComment;
    /**
     * 审核时间
     */
    private Date auditDate;
}
