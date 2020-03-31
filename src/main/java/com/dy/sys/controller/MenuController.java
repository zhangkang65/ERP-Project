package com.dy.sys.controller;/**
 * ClassName:MenuController
 * Package:com.dy.sys.controller
 * Description:
 *
 * @Date:2020/3/17 15:39
 * @Author:Dong
 */

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.constast.SysConstast;
import com.dy.sys.entity.Permission;
import com.dy.sys.entity.User;
import com.dy.sys.service.IPermissionService;
import com.dy.sys.utils.TreeNode;
import com.dy.sys.utils.TreeNodeBuilder;
import com.dy.sys.vo.ActiveUser;
import com.dy.sys.vo.PermissionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * ClassName:MenuController
 */
@RestController
@RequestMapping("sys/menu")
public class MenuController {
    @Autowired
    private IPermissionService permissionService;

    /**
     * 总主体左侧菜单
     *
     * @return
     */
    @RequestMapping("loadMenu")
    public List<TreeNode> loadMenu(HttpSession session) {
        /*QueryWrapper<Permission> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq("type", "menu");
        queryWarpper.eq("available", SysConstast.PERMISSION_AVAILABLE);
        //查询无序菜单
        List<Permission> menuList = permissionService.list(queryWarpper);*/
        User user = ((ActiveUser) session.getAttribute("user")).getUser();
        List<Permission> menuList = permissionService.getMenuByUserid(user.getId());
        //无序菜单转化为层级菜单
        List<TreeNode> treeNodes = TreeNodeBuilder.buildMenuTreeNodeList(menuList);
        return treeNodes;
    }

    /**
     * 菜单页面左侧Dtree树
     *
     * @return
     */
    @RequestMapping("loadMenuManagerLeftTreeJson")
    public DataGridView loadMenuManagerLeftTreeJson() {
        QueryWrapper<Permission> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq("type", "menu");
        //查询无序菜单
        List<Permission> menuList = permissionService.list(queryWarpper);
        //无序菜单转化为层级菜单
        List<TreeNode> treeNodes = TreeNodeBuilder.buildMenuTreeNode(menuList);
        return new DataGridView(treeNodes);
    }

    /**
     * 菜单页面右侧数据表格数据
     *
     * @return
     */
    @RequestMapping("loadMenuManagerRightData")
    public DataGridView loadMenuManagerRightData(PermissionVo permissionVo) {
        QueryWrapper<Permission> queryWarpper = new QueryWrapper<>();
        Integer id = permissionVo.getId();
        queryWarpper.eq("type", "menu")
                .like(StringUtils.isNotBlank(permissionVo.getTitle()), "title", permissionVo.getTitle())
                .orderByAsc("ordernum");
        if(id != null && id != 0){
            queryWarpper.and(warpper ->warpper.eq( "id", id)
                    .or().eq( "pid", id));
        }
        //查询无序菜单
        IPage<Permission> page = new Page<>(permissionVo.getPage(), permissionVo.getLimit());
        IPage<Permission> page2 = permissionService.page(page, queryWarpper);
        List<Permission> menuList = page2.getRecords();
        //无序菜单转化为层级菜单
        return new DataGridView(page2.getTotal(), menuList);
    }

    /**
     * 删除菜单
     * 可一并删除对应的权限,但有子菜单就不可删除
     * @param id
     * @return
     */
    @RequestMapping("deleteMenu")
    public ResultObj deleteMenu(Integer id) {
        //先检查是否有子菜单
        if (!this.checkMenuHasChildern(id)) {
            return permissionService.removeMenuById(id);
        }
        return ResultObj.DELETE_HASCHILDREN;
    }

    /**
     * 删除菜单时检查此菜单的是否有子菜单
     *
     * @param id
     * @return
     */
    public Boolean checkMenuHasChildern(Integer id) {
        QueryWrapper<Permission> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq("pid", id).eq("type", SysConstast.PERMISSION_TYPE_MENU);
        List<Permission> list = permissionService.list(queryWarpper);
        if (list.size() > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("addMenu")
    public ResultObj addMenu(PermissionVo permissionVo) {
        permissionVo.setType(SysConstast.PERMISSION_TYPE_MENU);
        QueryWrapper<Permission> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq("type",SysConstast.PERMISSION_TYPE_MENU);
        int count = permissionService.count(queryWarpper);
        permissionVo.setOrdernum(count+1);
        try {
            permissionService.save(permissionVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    @RequestMapping("updateMenu")
    public ResultObj updateMenu(PermissionVo permissionVo) {
        try {
            permissionService.updateById(permissionVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }

}
