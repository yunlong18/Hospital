package cn.zhang.service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TUser;

public interface UserManagerService {
	
	// 根据id查找用户
	TUser getUserById(int id);
	
	// 获取用户列表
	PageBean<TUser> getList(QueryVO queryVo);
	
	// 保存或更新用户
	E3Result saveOrUpdateUser(TUser user);
	
	// 根据id批量删除数据
	E3Result deleteUserByIds(String ids);
}
