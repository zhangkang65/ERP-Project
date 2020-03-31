package com.dy.sys.mapper;

import com.dy.sys.entity.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
public interface PermissionMapper extends BaseMapper<Permission> {

    /**
     * 根据菜单id删除角色权限表中数据
     * @param menuId
     * @return
     */
    int deletePermissionRoleByMenuid(Integer menuId);
    /**
     * 根据权限id删除角色权限表中数据
     * @param permissionId
     * @return
     */
    int deletePermissionRoleByPermissionid(Integer permissionId);

    /**
     * 根据用户id查询权限编码集合
     * @param id
     * @return
     */
    List<String> getPermissionStringByUserid(Integer id);
    /**
     * 根据用户id查询菜单集合
     * @param id
     * @return
     */
    List<Permission> getMenuByUserid(Integer id);

}
