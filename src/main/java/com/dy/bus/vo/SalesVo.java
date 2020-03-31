package com.dy.bus.vo;/**
 * ClassName:SalesVo
 * Package:com.dy.bus.vo
 * Description:
 *
 * @Date:2020/3/24 10:51
 * @Author:Dong
 */

import com.dy.bus.entity.Sales;
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
public class SalesVo extends Sales {
    private Integer page;
    private Integer limit;

    private Date begintime;
    private Date endtime;
}
