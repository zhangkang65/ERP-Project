package com.dy.sys.vo;/**
 * ClassName:LeavebillVo
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/28 12:08
 * @Author:Dong
 */

import com.dy.sys.entity.Leavebill;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 *ClassName:LeavebillVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LeavebillVo extends Leavebill {
    private Date begintime;
    private Date endtime;

    private Integer page = 1;
    private Integer limit = 10;

    private Integer[] ids;
}
