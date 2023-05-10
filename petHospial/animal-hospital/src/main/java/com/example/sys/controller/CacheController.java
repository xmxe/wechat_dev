package com.example.sys.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.sys.cache.CachePool;
import com.example.sys.common.CacheBean;
import com.example.sys.common.DataGridView;
import com.example.sys.common.ResultObj;

/**
 * 缓存管理控制器
 * @author LJH
 *
 */
@RestController
@RequestMapping("cache")
public class CacheController {

	public static volatile Map<String, Object> CACHE_CONTAINER = CachePool.CACHE_CONTAINER;
	
	/**
	 * 查询所有缓存
	 */
	@RequestMapping("loadAllCache")
	public DataGridView loadAllCache() {
		List<CacheBean> list=new ArrayList<>();
		
		Set<Entry<String, Object>> entrySet = CACHE_CONTAINER.entrySet();
		for (Entry<String, Object> entry : entrySet) {
			list.add(new CacheBean(entry.getKey(), entry.getValue()));
		}
		return new DataGridView(list);
	}
	
	/**
	 * 删除缓存
	 */
	@RequestMapping("deleteCache")
	public ResultObj deleteCache(String key) {
		CachePool.removeCacheByKey(key);
		return ResultObj.DELETE_SUCCESS;
	}
	
	/**
	 * 清空缓存
	 */
	@RequestMapping("removeAllCache")
	public ResultObj removeAllCache() {
		CachePool.removeAll();
		return ResultObj.DELETE_SUCCESS;
	}
	/**
	 * 同步缓存
	 */
	@RequestMapping("syncCache")
	public ResultObj syncCache() {
		CachePool.syncData();
		return ResultObj.OPERATE_SUCCESS;
	}
	
	
	
	
	
}
