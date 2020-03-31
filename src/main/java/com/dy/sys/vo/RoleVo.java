package com.dy.sys.vo;/**
 * ClassName:RoleVo
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/19 19:30
 * @Author:Dong
 */

import com.dy.sys.entity.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *ClassName:RoleVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleVo extends Role {
    /**
     * 分页参数
     */
    private Integer page;
    private Integer limit;
}
