package com.example.sys.service.impl;

import com.example.sys.domain.Permission;
import com.example.sys.mapper.PermissionMapper;
import com.example.sys.service.PermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.io.Serializable;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

	
	@Override
	public boolean removeById(Serializable id) {
		PermissionMapper permissionMapper = this.getBaseMapper();
		//根据权限或菜单ID删除权限表各和角色的关系表里面的数据
		permissionMapper.deleteRolePermissionByPid(id);
		return super.removeById(id);//删除 权限表的数据
	}
}
