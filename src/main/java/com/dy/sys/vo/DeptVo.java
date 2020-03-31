package com.dy.sys.vo;/**
 * ClassName:DeptVo
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/18 22:19
 * @Author:Dong
 */

import com.dy.sys.entity.Dept;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *ClassName:DeptVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeptVo extends Dept {
    private Integer page;
    private Integer limit;
}
