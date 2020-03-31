package com.dy.sys.service;

import com.dy.common.ResultObj;
import com.dy.sys.entity.Permission;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Doris
 * @since 2020-03-17
 */
public interface IPermissionService extends IService<Permission> {

    ResultObj removeMenuById(Integer id);

    ResultObj removePermissionById(Integer id);

    List<String> getPermissionStringByUserid(Integer id);

    List<Permission> getMenuByUserid(Integer id);
}
