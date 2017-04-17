package com.bbs.utils;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.bbs.entity.User;
import com.bbs.service.UserService;

public class MyRealm extends AuthorizingRealm {

@Autowired
private UserService userService;
			
		@Override
		protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
			String loginName = (String)principalCollection.fromRealm(this.getName()).iterator().next();
			User user = userService.findByName(loginName);
			if(user!=null){
				SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
				System.out.println(user.getRolesName().toString());
				info.setRoles(user.getRolesName());
				return info;
			}
			return null;
			
		}

		@Override
		protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
			// TODO Auto-generated method stub
			UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
			User user = userService.findByName(token.getUsername());
			if(user!=null){
				return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName()); 
			}

			return null;
		}

}
