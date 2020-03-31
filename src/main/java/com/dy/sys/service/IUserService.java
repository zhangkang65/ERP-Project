package com.dy.sys.service;

import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.Role;
import com.dy.sys.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dy.sys.vo.UserVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
public interface IUserService extends IService<User> {

    DataGridView loadUser(UserVo userVo);

    ResultObj removeUser(Integer id);

    void removeUserRoleByUserid(Integer id);

    ResultObj removeBatchUser(List<Integer> userids);

    List<Role> loadRoleByUserid(Integer userid);

    ResultObj saveUserRole(Integer userid, Integer[] roleids);
}
