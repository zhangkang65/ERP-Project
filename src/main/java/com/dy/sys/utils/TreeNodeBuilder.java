package com.dy.sys.utils;/**
 * ClassName:TreeNodeBuilder
 * Package:com.dy.sys.utils
 * Description:
 *
 * @Date:2020/3/17 15:37
 * @Author:Dong
 */

import com.dy.constast.SysConstast;
import com.dy.sys.entity.Dept;
import com.dy.sys.entity.Permission;

import java.util.LinkedList;
import java.util.List;

/**
 *ClassName:TreeNodeBuilder
 */
public class TreeNodeBuilder{
    /**
     * 将没有层级关系的菜单集合转换为有层级关系的treeNode
     * @param menuList
     * @return
     */
    public static List<TreeNode> buildMenuTreeNodeList(List<Permission> menuList) {
        //先将Permission转换为TreeNode
        List<TreeNode> treeNodeList = buildMenuTreeNode(menuList);
        //再转换层级关系
        return buildSortedTreeNode(treeNodeList,1);
    }

    /**
     * 将TreeNode无层级集合转换为层级集合
     * @param treeNodeList
     * @param topId 顶层id
     * @return
     */
    private static List<TreeNode> buildSortedTreeNode(List<TreeNode> treeNodeList,Integer topId) {
        LinkedList<TreeNode> nodes = new LinkedList<>();
        for (TreeNode t1 : treeNodeList) {
            if(t1.getPid()==topId){
                nodes.add(t1);
                LinkedList<TreeNode> children = new LinkedList<>();
                for (TreeNode t2 : treeNodeList) {
                    if(t2.getPid()==t1.getId()){
                        children.add(t2);
                    }
                }
                t1.setChildren(children);
            }
        }
        return nodes;
    }

    /**
     * 将菜单数据转化为TreeNode数据
     * @param menuList
     * @return
     */
    public static List<TreeNode> buildMenuTreeNode(List<Permission> menuList){
        LinkedList<TreeNode> treeNodeList = new LinkedList<>();
        for (Permission m : menuList) {
            TreeNode t = new TreeNode();
            t.setTitle(m.getTitle());
            t.setId(m.getId());
            t.setPid(m.getPid());
            t.setIcon(m.getIcon());
            t.setHref(m.getHref());
            if(t.getPid()>1){
                t.setSpread(false);
            }else{
                t.setSpread(m.getOpen()== SysConstast.MENU_SPREAD_OPEN ?true:false);
            }
            //
            treeNodeList.add(t);
        }
        return treeNodeList;
    }
    /**
     * 将部门数据转化为TreeNode数据
     * @param deptList
     * @return
     */
    public static List<TreeNode> buildDeptTreeNode(List<Dept> deptList){
        LinkedList<TreeNode> treeNodeList = new LinkedList<>();
        for (Dept  d: deptList) {
            TreeNode t = new TreeNode();
            t.setTitle(d.getTitle());
            t.setId(d.getId());
            t.setPid(d.getPid());
            t.setSpread(d.getOpen()== SysConstast.MENU_SPREAD_OPEN ?true:false);
            treeNodeList.add(t);
        }
        return treeNodeList;
    }
}
