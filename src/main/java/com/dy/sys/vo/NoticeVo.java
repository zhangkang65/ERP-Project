package com.dy.sys.vo;/**
 * ClassName:NoticeVo
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/18 17:29
 * @Author:Dong
 */

import com.dy.sys.entity.Notice;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 *ClassName:NoticeVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVo extends Notice {

    private Date begintime;
    private Date endtime;

    private Integer page = 1;
    private Integer limit = 10;

    private List<Integer> ids;
}
