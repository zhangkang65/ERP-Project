package com.dy.sys.service;

import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.Permission;
import com.dy.sys.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
public interface IRoleService extends IService<Role> {

    List<Permission> loadPermissionByRoleid(Integer roleid);

    ResultObj dispatchRolePermission(Integer roleid, Integer[] permissionids);

    ResultObj removeRole(Integer id);
}
