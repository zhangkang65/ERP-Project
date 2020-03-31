package com.dy.sys.service.impl;

import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.Permission;
import com.dy.sys.entity.Role;
import com.dy.sys.mapper.RoleMapper;
import com.dy.sys.service.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
@Service
@Transactional
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    @Transactional(readOnly = true)
    public List<Permission> loadPermissionByRoleid(Integer roleid) {
        List<Permission> permissions = roleMapper.listPermissionByRoleid(roleid);
        return permissions;
    }

    @Override
    public ResultObj dispatchRolePermission(Integer roleid, Integer[] permissionids) {
        try {
            for (Integer permissionid : permissionids) {
                if(permissionid>0){
                    roleMapper.addRolePermission(roleid,permissionid);
                }else{
                    roleMapper.deleteRolePermission(roleid,-permissionid);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }
        return ResultObj.DISPATCH_SUCCESS;
    }

    @Override
    public ResultObj removeRole(Integer id) {
        try {
            //删除权限角色表
            roleMapper.deleteRolePermission(id,null);
            //删除角色表
            roleMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
}
