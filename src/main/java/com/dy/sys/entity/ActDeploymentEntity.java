package com.dy.sys.entity;/**
 * ClassName:ActiDeploymentEntity
 * Package:com.dy.sys.entity
 * Description:
 *
 * @Date:2020/3/29 11:16
 * @Author:Dong
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 *ClassName:ActiDeploymentEntity
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActDeploymentEntity {
    private String id;
    private String name;
    private String category;
    private Date deploymentTime;
}
