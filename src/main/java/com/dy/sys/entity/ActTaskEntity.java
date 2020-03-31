package com.dy.sys.entity;/**
 * ClassName:ActTaskEntity
 * Package:com.dy.sys.entity
 * Description:
 *
 * @Date:2020/3/30 11:51
 * @Author:Dong
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 *ClassName:ActTaskEntity
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActTaskEntity {
    private String id;
    private String name;
    private Date createTime;
    private String assignee;
    private String assigneeName;
    private String processDefinitionId;
}
