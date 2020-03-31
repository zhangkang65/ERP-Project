package com.dy.sys.vo;/**
 * ClassName:ActiveUser
 * Package:com.dy.sys.vo
 * Description:
 *
 * @Date:2020/3/17 10:33
 * @Author:Dong
 */

import com.dy.sys.entity.Permission;
import com.dy.sys.entity.Role;
import com.dy.sys.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 *ClassName:ActiveUser
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActiveUser{
    private User user;
    private List<String> roles;
    private List<String> permissions;
}
