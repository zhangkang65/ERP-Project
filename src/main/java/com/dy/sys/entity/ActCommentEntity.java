package com.dy.sys.entity;/**
 * ClassName:ActCommentEntity
 * Package:com.dy.sys.entity
 * Description:
 *
 * @Date:2020/3/30 18:30
 * @Author:Dong
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 *ClassName:ActCommentEntity
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActCommentEntity {
    private String userId;
    private String userName;
    private Date time;
    private String message;
}
