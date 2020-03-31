package com.dy.sys.vo;/**
 * ClassName:MenuVo
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/18 11:20
 * @Author:Dong
 */

import com.dy.sys.entity.Permission;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *ClassName:MenuVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PermissionVo extends Permission {
    /**
     * 分页参数
     */
    private Integer page;
    private Integer limit;


}
