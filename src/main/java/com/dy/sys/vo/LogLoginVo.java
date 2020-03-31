package com.dy.sys.vo;/**
 * ClassName:LogLoginVo
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/18 16:36
 * @Author:Dong
 */

import com.dy.sys.entity.LogLogin;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 *ClassName:LogLoginVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LogLoginVo extends LogLogin {

    private Date begintime;
    private Date endtime;

    private Integer page;
    private Integer limit;

    private List<Integer> ids;
}
