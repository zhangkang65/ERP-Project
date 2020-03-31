package com.dy.sys.controller;


import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dy.common.AppFileUtils;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.constast.SysConstast;
import com.dy.sys.entity.Role;
import com.dy.sys.entity.User;
import com.dy.sys.service.IRoleService;
import com.dy.sys.service.IUserService;
import com.dy.sys.utils.PinYinUtils;
import com.dy.sys.vo.ActiveUser;
import com.dy.sys.vo.UserVo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
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
@RequestMapping("sys/user")
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;

    /**
     * 加载用户信息
     * 需要完成:所属部门-->根据deptid查询deptname
     * 领导名称-->根据mrg(用户id)查询用户名称
     * 领导部门-->根据用户id查询用户部门名称
     * 模糊查询:员工姓名,员工职位
     */
    @RequestMapping("loadUser")
    public DataGridView loadUser(UserVo userVo) {
        return userService.loadUser(userVo);
    }

    @RequestMapping("deleteUser")
    public ResultObj deleteUser(Integer id) {
        return userService.removeUser(id);
    }

    @RequestMapping("getUserByDeptid")
    public List<User> getUserByDeptid(Integer deptid) {
        QueryWrapper<User> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq("deptid", deptid);
        return userService.list(queryWarpper);
    }

    @RequestMapping("deleteBatchUser")
    public ResultObj deleteBatchUser(Integer[] userids) {
        return userService.removeBatchUser(Arrays.asList(userids));
    }

    /**
     * 查询用户角色数据
     * 有分页数据,所以使用UserVo
     *
     * @param userid
     * @return
     */
    @RequestMapping("loadRoleByUserid")
    public DataGridView loadRoleByUserid(Integer userid) {
        List<Role> allRole = roleService.list();
        List<Role> userRole = userService.loadRoleByUserid(userid);
        for (Role role : allRole) {
            if (userRole.contains(role)) {
                role.setLAY_CHECKED(SysConstast.LAY_CHECKED);
            }
        }
        return new DataGridView(allRole);
    }

    @RequestMapping("getLoginname")
    public String getLoginName(String name) {
        return PinYinUtils.getPinYin(name);
    }

    @RequestMapping("addUser")
    public ResultObj addUser(UserVo userVo) {
        if (userVo.getMgr() != null && userVo.getMgr() == 0) {
            userVo.setMgr(null);
        }
        String defaultpwd = SysConstast.DEFAULT_USER_PWD;
        //设置盐
        String sault = IdUtil.simpleUUID().toUpperCase();
        userVo.setSalt(sault);
        //设置密码
        String pwd = new Md5Hash(defaultpwd, sault, 2).toString();
        userVo.setPwd(pwd);
        //设置默认用户图片
        userVo.setImgpath(SysConstast.DEFAULT_USER_HEADIMG);
        //设置用户类型
        userVo.setType(SysConstast.USER_TYPE_NORMALUSER);
        try {
            userService.save(userVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    @RequestMapping("updateUser")
    public ResultObj updateUser(UserVo userVo) {
        if (userVo.getMgr() != null && userVo.getMgr() == 0) {
            userVo.setMgr(null);
        }
        try {
            userService.updateById(userVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    @RequestMapping("dispatchUserRole")
    public ResultObj dispatchUserRole(Integer userid, Integer[] roleids) {
        try {
            //删除已有的角色数据
            userService.removeUserRoleByUserid(userid);
            //判断新增角色数量,>0才进行新增
            if (roleids != null && roleids.length > 0) {
                userService.saveUserRole(userid, roleids);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }
        return ResultObj.DISPATCH_SUCCESS;
    }

    @RequestMapping("changePwd")
    public ResultObj changePwd(UserVo userVo, HttpSession session) {
        try {
            //验证两次输入的密码是否一致
            if (!userVo.getNewPwd().equals(userVo.getConfirmPwd())) {
                return ResultObj.CHANGEPWD_COMFIRMPWD_ERROR;
            }
            //验证旧密码输入是否正确
            ActiveUser activeUser = (ActiveUser) session.getAttribute("user");
            //1.获取旧密码
            String truePwd = activeUser.getUser().getPwd();
            System.out.println("正确密码:" + truePwd);
            System.out.println("输入的密码:" + userVo.getOldPwd());
            //2.获取当前用户对应的盐
            String sault = activeUser.getUser().getSalt();
            //3.以当前输入的密码与盐构造密码
            String inputPwd = new Md5Hash(userVo.getOldPwd(), sault, 2).toString();
            System.out.println("输入的密码构造后" + inputPwd);
            //4.对照密码
            if (!inputPwd.equals(truePwd)) {
                return ResultObj.CHANGEPWD_OLDPWD_ERROR;
            }
            //构造修改的密码
            String newPwd = new Md5Hash(userVo.getNewPwd(), sault, 2).toString();
            //修改当前用户数据
            User newUser = activeUser.getUser();
            newUser.setPwd(newPwd);
            //修改session中user的数据
            activeUser.setUser(newUser);
            session.setAttribute("user", activeUser);
            userService.updateById(newUser);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.CHANGEPWD_ERROR;
        }
        return ResultObj.CHANGEPWD_SUCCESS;
    }

    //更改用户信息
    @RequestMapping("updateUserInfo")
    public ResultObj updateUserInfo(UserVo userVo, HttpSession session) {
        try {
            //判断图片后缀名是否是临时文件
            String imgpath = userVo.getImgpath();
            User user = ((ActiveUser) session.getAttribute("user")).getUser();
            if (imgpath.endsWith(SysConstast.UPLOAD_FILE_TEMPSUFFIX)) {
                //是临时文件,改变文件为正式文件
                imgpath = AppFileUtils.updateFileName(imgpath, SysConstast.UPLOAD_FILE_TEMPSUFFIX);
                //删除原有的头像
                //查到原来地址,删除
                String oldImgpath = user.getImgpath();
                AppFileUtils.deleteFileUsePath(oldImgpath);
            }
            //将原本信息获取,并更新session中用户数据
            user.setName(userVo.getName());
            user.setSex(userVo.getSex());
            user.setRemark(userVo.getRemark());
            user.setImgpath(imgpath);
            userService.updateById(user);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }

}

