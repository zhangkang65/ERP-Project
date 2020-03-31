package com.dy.sys.vo;/**
 * ClassName:ProcessVo
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/28 18:49
 * @Author:Dong
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *ClassName:ProcessVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProcessVo {

    private String deploymentName;

    private String deploymentId;

    private Integer page;
    private Integer limit;

    private String[] deploymentIds;

    private String assign;

    private String comment;
    private String taskId;
    private String outcome;
    private Integer leavebillId;
}
