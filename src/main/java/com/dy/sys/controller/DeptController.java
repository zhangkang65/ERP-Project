package com.dy.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.Dept;
import com.dy.sys.service.IDeptService;
import com.dy.sys.utils.TreeNode;
import com.dy.sys.utils.TreeNodeBuilder;
import com.dy.sys.vo.DeptVo;
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
 * @since 2020-03-18
 */
@RestController
@RequestMapping("sys/dept")
public class DeptController {

    @Autowired
    private IDeptService deptService;


    /**
     * 菜单页面左侧Dtree树
     *
     * @return
     */
    @RequestMapping("loadDeptManagerLeftTreeJson")
    public DataGridView loadDeptManagerLeftTreeJson() {
        //查询无序菜单
        List<Dept> deptList = deptService.list();
        //无序菜单转化为TreeNode菜单,不需要层级
        List<TreeNode> treeNodes = TreeNodeBuilder.buildDeptTreeNode(deptList);
        return new DataGridView(treeNodes);
    }

    /**
     * 菜单页面右侧数据表格数据
     *
     * @return
     */
    @RequestMapping("loadDeptManagerRightData")
    public DataGridView loadDeptManagerRightData(DeptVo deptVo) {
        QueryWrapper<Dept> queryWarpper = new QueryWrapper<>();

        /**
         * 右侧顶部的查询
         */
        //名称 地址 备注
        String title = deptVo.getTitle();
        String address = deptVo.getAddress();
        String remark = deptVo.getRemark();
        queryWarpper.like(title!=null&&!"".equals(title),"title",title)
                .like(address!=null&&!"".equals(address),"address",address)
                .like(remark!=null&&!"".equals(remark),"remark",remark)
                .orderByAsc("ordernum");
        /**
         * 通过左侧树点击查询右侧数据表数据
         */
        if(deptVo.getId()!=null&&deptVo.getId()>0){
            queryWarpper.and(warpper -> warpper.eq("id", deptVo.getId()).or().eq("pid", deptVo.getId()));
        }

        //查询无序菜单
        IPage<Dept> page = new Page<>(deptVo.getPage(), deptVo.getLimit());
        IPage<Dept> page2 = deptService.page(page, queryWarpper);
        List<Dept> deptList = page2.getRecords();
        //无序菜单转化为层级菜单
        return new DataGridView(page2.getTotal(), deptList);
    }

    /**
     * 删除部门
     *有子部门就不可删除此
     * @param id
     * @return
     */
    @RequestMapping("deleteDept")
    public ResultObj deleteDept(Integer id) {
        //先检查是否有子菜单
        if (!this.checkDeptHasChildern(id)) {
            try {
                deptService.removeById(id);
            } catch (Exception e) {
                e.printStackTrace();
                return ResultObj.DELETE_ERROR;
            }
            return ResultObj.DELETE_SUCCESS;
        }
        return ResultObj.DELETE_HASCHILDREN;
    }

    /**
     * 删除菜单时检查此菜单的是否有子菜单
     *
     * @param id
     * @return
     */
    public Boolean checkDeptHasChildern(Integer id) {
        QueryWrapper<Dept> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq("pid", id);
        List<Dept> list = deptService.list(queryWarpper);
        if (list.size() > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("addDept")
    public ResultObj addDept(DeptVo deptVo) {
        deptVo.setCreatetime(new Date());
        try {
            deptService.save(deptVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    @RequestMapping("updateDept")
    public ResultObj updateDept(DeptVo deptVo) {
        try {
            deptService.updateById(deptVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }

    @RequestMapping("getDept")
    public List<Dept> getDept(){
        return deptService.list();
    }
}

