package com.dy.sys.service.impl;

import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.Role;
import com.dy.sys.entity.User;
import com.dy.sys.mapper.UserMapper;
import com.dy.sys.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dy.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
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
@Service
@Transactional
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public DataGridView loadUser(UserVo userVo) {
        userVo.setPage((userVo.getPage() - 1) * userVo.getLimit());
        List<User> users = userMapper.selectUser(userVo);
        Long count = userMapper.getCountByPage(userVo);
        return new DataGridView(count,users);
    }

    @Override
    public ResultObj removeUser(Integer id) {
        try {
            removeUserRoleByUserid(id);
            userMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
    @Override
    public void removeUserRoleByUserid(Integer id) {
        userMapper.deleteUserRoleByUserid(id);
    }



    @Override
    public ResultObj removeBatchUser(List<Integer> userids) {
        try {
            if(userids.size()==1){
                this.removeUser(userids.get(0));
            }else{
                userMapper.deleteBatchIds(userids);
                userMapper.deleteBatchUserRoleIds(userids);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    @Override
    public List<Role> loadRoleByUserid(Integer userid) {
        List<Role> roles = userMapper.loadRoleByUserid(userid);
        return roles;
    }

    @Override
    public ResultObj saveUserRole(Integer userid, Integer[] roleids) {
        try {
            userMapper.addUserRole(userid,roleids);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }
        return ResultObj.DISPATCH_SUCCESS;
    }
}
