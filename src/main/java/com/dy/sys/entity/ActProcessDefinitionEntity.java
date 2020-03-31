package com.dy.sys.entity;/**
 * ClassName:ActProcessDefinitionEntity
 * Package:com.dy.sys.entity
 * Description:
 *
 * @Date:2020/3/29 11:19
 * @Author:Dong
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *ClassName:ActProcessDefinitionEntity
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActProcessDefinitionEntity {
    private String id;
    private String name;
    private String key;
    private int version;
    private String deploymentId;
    private String resourceName;
    private String diagramResourceName;
}
