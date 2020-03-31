package com.dy.bus.vo;/**
 * ClassName:SalesVo
 * Package:com.dy.bus.vo
 * Description:
 *
 * @Date:2020/3/24 10:51
 * @Author:Dong
 */

import com.dy.bus.entity.Sales;
import com.dy.bus.entity.Salesback;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 *ClassName:SalesVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SalesbackVo extends Salesback {
    private Integer page;
    private Integer limit;

    private Date begintime;
    private Date endtime;
}
