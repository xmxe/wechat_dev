package com.example.sys.service.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.sys.domain.User;
import com.example.sys.mapper.RoleMapper;
import com.example.sys.mapper.UserMapper;
import com.example.sys.service.UserService;


@Service
@Transactional
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public boolean save(User entity) {
		return super.save(entity);
	}
	
	@Override
	public boolean updateById(User entity) {
		return super.updateById(entity);
	}
	
	@Override
	public User getById(Serializable id) {
		return super.getById(id);
	}
	
	@Override
	public boolean removeById(Serializable id) {
		//根据用户ID删除用户角色中间表的数据
		roleMapper.deleteRoleUserByUid(id);
		//删除用户头[如果是默认头像不删除  否则删除]
		return super.removeById(id);
	}

	@Override
	public void saveUserRole(Integer uid, Integer[] ids) {
		//根据用户ID删除sys_role_user里面的数据
		this.roleMapper.deleteRoleUserByUid(uid);
		if(null!=ids&&ids.length>0) {
			for (Integer rid : ids) {
				this.roleMapper.insertUserRole(uid,rid);
			}
		}
	}

}
