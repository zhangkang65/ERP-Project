package com.dy.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.constast.SysConstast;
import com.dy.sys.entity.Permission;
import com.dy.sys.service.IPermissionService;
import com.dy.sys.vo.PermissionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
@RestController
@RequestMapping("sys/permission")
public class PermissionController {
    @Autowired
    private IPermissionService permissionService;


    /**
     * 权限页面右侧数据表格数据
     * 根据权限id,权限编码,权限名称
     *
     * @return
     */
    @RequestMapping("loadPermissionManagerRightData")
    public DataGridView loadPermissionManagerRightData(PermissionVo permissionVo) {
        QueryWrapper<Permission> queryWarpper = new QueryWrapper<>();
        if(permissionVo.getId()!=null&&permissionVo.getId()==1){
            permissionVo.setId(0);
        }
        Integer id = permissionVo.getId();
        queryWarpper.eq("type", "permission")
                .like(StringUtils.isNotBlank(permissionVo.getTitle()), "title", permissionVo.getTitle())
                .like(StringUtils.isNotBlank(permissionVo.getPercode()), "percode", permissionVo.getPercode())
                .orderByAsc("ordernum");
        if (id != null && id != 0) {
            queryWarpper.and(warpper -> warpper.eq("pid", id));
        }
        //查询无序权限
        IPage<Permission> p = new Page<>(permissionVo.getPage(), permissionVo.getLimit());
        IPage<Permission> page = permissionService.page(p, queryWarpper);
        List<Permission> permissionList = page.getRecords();
        //无序权限转化为层级权限
        return new DataGridView(page.getTotal(), permissionList);
    }

    /**
     * 删除权限
     * 删除权限,删除权限角色表
     * @param id
     * @return
     */
    @RequestMapping("deletePermission")
    public ResultObj deletePermission(Integer id) {
        return permissionService.removePermissionById(id);
    }


    @RequestMapping("addPermission")
    public ResultObj addPermission(PermissionVo permissionVo) {
        permissionVo.setType(SysConstast.PERMISSION_TYPE_PERMISSION);
        try {
            permissionService.save(permissionVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    @RequestMapping("updatePermission")
    public ResultObj updatePermission(PermissionVo permissionVo) {
        try {
            permissionService.updateById(permissionVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }


}

