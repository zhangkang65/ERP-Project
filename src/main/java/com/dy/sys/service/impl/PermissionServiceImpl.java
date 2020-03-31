package com.dy.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dy.common.ResultObj;
import com.dy.sys.entity.Permission;
import com.dy.sys.mapper.PermissionMapper;
import com.dy.sys.service.IPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
@EnableAspectJAutoProxy
@Transactional
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    /**
     * 根据菜单id删除菜单,对应权限,权限角色表内容
     *
     * @param id
     * @return
     */
    public ResultObj removeMenuById(Integer id) {
        try {
            //根据菜单id删除角色权限表
            PermissionMapper permissionMapper = this.getBaseMapper();
            //1.删除权限角色表中-权限id=此菜单id的子权限
            permissionMapper.deletePermissionRoleByMenuid(id);
            //2.删除权限表中pid=菜单id-->前面已经判断了pid=菜单id不是菜单而是对应权限
            QueryWrapper<Permission> queryWarpper = new QueryWrapper<>();
            queryWarpper.eq("pid", id);
            permissionMapper.delete(queryWarpper);
            //3.删除权限表中id=菜单id
            permissionMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    public ResultObj removePermissionById(Integer id){
        //删除权限角色表中数据
        this.baseMapper.deletePermissionRoleByMenuid(id);
        //删除权限表中权限
        this.baseMapper.deleteById(id);

        return ResultObj.DELETE_SUCCESS;
    }

    /**
     * 根据用户id查询权限字符串集合
     * @param id
     * @return
     */
    @Override
    public List<String> getPermissionStringByUserid(Integer id) {
        List<String> permissionsStrings= permissionMapper.getPermissionStringByUserid(id);
        return permissionsStrings;
    }
    /**
     * 根据用户id查询菜单集合
     * @param id
     * @return
     */
    @Override
    public List<Permission> getMenuByUserid(Integer id) {
        List<Permission> menus = permissionMapper.getMenuByUserid(id);
        return menus;
    }
}
