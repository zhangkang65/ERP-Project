package com.dy.sys.mapper;

import com.dy.sys.entity.Role;
import com.dy.sys.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dy.sys.vo.UserVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
public interface UserMapper extends BaseMapper<User> {
    List<User> selectUser(UserVo userVo);

    Long getCountByPage(UserVo userVo);

    void deleteUserRoleByUserid(Integer userid);

    void deleteBatchUserRoleIds(List<Integer> userids);

    List<Role> loadRoleByUserid(Integer userid);

    void addUserRole(@Param("uid") Integer userid, @Param("rids") Integer[] roleids);
}
