package com.dy.sys.mapper;

import com.dy.common.DataGridView;
import com.dy.sys.entity.Permission;
import com.dy.sys.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
public interface RoleMapper extends BaseMapper<Role> {

    List<Permission> listPermissionByRoleid(Integer roleid);

    int addRolePermission(@Param("rid") Integer roleid, @Param("pid") Integer permissionid);

    int deleteRolePermission(@Param("rid") Integer roleid, @Param("pid") Integer permissionid);
}
