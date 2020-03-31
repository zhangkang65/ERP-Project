package com.dy.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.constast.SysConstast;
import com.dy.sys.entity.Permission;
import com.dy.sys.entity.Role;
import com.dy.sys.service.IPermissionService;
import com.dy.sys.service.IRoleService;
import com.dy.sys.utils.TreeNode;
import com.dy.sys.utils.TreeNodeBuilder;
import com.dy.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
@RestController
@RequestMapping("sys/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("loadRole")
    public DataGridView loadRole(RoleVo roleVo){
        //名称 备注
        QueryWrapper<Role> queryWarpper = new QueryWrapper<>();
        queryWarpper.like(StringUtils.isNotBlank(roleVo.getName()),"name",roleVo.getName())
                    .like(StringUtils.isNotBlank(roleVo.getRemark()),"remark",roleVo.getRemark());
        IPage<Role> page = new Page<>(roleVo.getPage(),roleVo.getLimit());
        IPage<Role> pageResult = roleService.page(page, queryWarpper);
        return new DataGridView(pageResult.getTotal(),pageResult.getRecords());
    }

    @RequestMapping("addRole")
    public ResultObj addRole(RoleVo roleVo){
        try {
            roleService.save(roleVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }
    @RequestMapping("updateRole")
    public ResultObj updateRole(RoleVo roleVo){
        try {
            roleService.updateById(roleVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }
    @RequestMapping("deleteRole")
    public ResultObj deleteRole(Integer id){
        try {
            roleService.removeRole(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }


    /**
     * 角色管理中加载分配权限树中使用
     * @return
     */
    @RequestMapping("loadPermissionTreeJson")
    public DataGridView loadPermissionTreeJson(Integer roleid){
        //查询所有权限
        List<Permission> permissions = permissionService.list();
        //转化为TreeNodeList
        List<TreeNode> treeNodes = TreeNodeBuilder.buildMenuTreeNode(permissions);
        //查询角色id对应的所有权限
        List<Permission> oldPermissions = roleService.loadPermissionByRoleid(roleid);
        //循环对比,本来角色拥有的权限改变权限的属性checkedArr
        for (int i = 0; i < permissions.size(); i++) {
            if(oldPermissions.contains(permissions.get(i))){
                //改变选中属性
                treeNodes.get(i).setCheckArr(SysConstast.TREENODE_CHECKED);
                //标记原本选中,原本有此权限
                treeNodes.get(i).setChecked(SysConstast.TREENODE_CHECKED);
            }
        }
        //返回数据
        return new DataGridView(treeNodes);
    }

    /**
     * 给角色分配权限
     * @param roleid
     * @param permissionids
     * @return
     */
    @RequestMapping("dispatchRolePermission")
    public ResultObj dispatchRolePermission(Integer roleid,Integer[] permissionids){
        return roleService.dispatchRolePermission(roleid,permissionids);
    }
}

