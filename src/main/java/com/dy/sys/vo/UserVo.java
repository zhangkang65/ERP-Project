package com.dy.sys.vo;/**
 * ClassName:UserVo
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/17 10:09
 * @Author:Dong
 */

import com.dy.sys.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *ClassName:UserVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVo extends User {
    /**
     * 验证码
     */
    private String validation;

    private Integer page;
    private Integer limit;
    /**
     * 修改密码
     */
    private String oldPwd;
    private String newPwd;
    private String confirmPwd;
}
