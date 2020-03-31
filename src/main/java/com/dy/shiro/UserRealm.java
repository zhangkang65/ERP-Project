package com.dy.shiro;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dy.sys.entity.Role;
import com.dy.sys.entity.User;
import com.dy.sys.service.IPermissionService;
import com.dy.sys.service.IRoleService;
import com.dy.sys.service.IUserService;
import com.dy.sys.vo.ActiveUser;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserRealm extends AuthorizingRealm {
	
	@Autowired
	private IPermissionService permissionService;
	
	@Autowired
	private IUserService userService;
	
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String loginname = token.getPrincipal().toString();
		QueryWrapper<User> userWarpper = new QueryWrapper<>();
		userWarpper.eq("loginname",loginname);
		User user = userService.getOne(userWarpper);
		if(user!=null) {
			ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
			//查询权限访入activeUser
			List<String> permissions = permissionService.getPermissionStringByUserid(user.getId());
			ActiveUser activeUser= new ActiveUser(user, null,permissions);
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(activeUser, user.getPwd() , credentialsSalt, this.getName());
			return info;
		}
		return null;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		ActiveUser activeUser = (ActiveUser) principals.getPrimaryPrincipal();
		List<String> roles = activeUser.getRoles();
		List<String> permissions = activeUser.getPermissions();
		if(roles!=null && roles.size()>0) {
			info.addRoles(roles);
		}
		if(permissions!=null && permissions.size()>0) {
			info.addStringPermissions(permissions);
		}
		return info;
	}
}
