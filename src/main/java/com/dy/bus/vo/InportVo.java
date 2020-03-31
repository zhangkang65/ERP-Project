package com.dy.bus.vo;/**
 * ClassName:Inport
 * Package:com.dy.bus.vo
 * Description:
 *
 * @Date:2020/3/23 12:32
 * @Author:Dong
 */

import com.dy.bus.entity.Inport;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 *ClassName:Inport
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InportVo extends Inport {
    private Integer page;
    private Integer limit;

    private Date begintime;
    private Date endtime;

}
