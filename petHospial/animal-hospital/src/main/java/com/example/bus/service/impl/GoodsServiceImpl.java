package com.example.bus.service.impl;

import com.example.bus.domain.Goods;
import com.example.bus.mapper.GoodsMapper;
import com.example.bus.service.GoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.io.Serializable;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 小孟
 * @since 2022-02-27
 */
@Service
@Transactional
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {

	
	@Override
	public boolean save(Goods entity) {
		return super.save(entity);
	}
	
	@Override
	public boolean updateById(Goods entity) {
		return super.updateById(entity);
	}
	
	@Override
	public boolean removeById(Serializable id) {
		return super.removeById(id);
	}
	
	@Override
	public Goods getById(Serializable id) {
		return super.getById(id);
	}
}
