package cn.zhang.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.mapper.TUserMapper;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TUser;
import cn.zhang.pojo.TUserExample;
import cn.zhang.service.UserManagerService;

@Service
public class UserManagerServiceImpl implements UserManagerService {

	@Autowired
	private TUserMapper tUserMapper;

	@Override
	public TUser getUserById(int id) {
		TUser user = tUserMapper.selectByPrimaryKey(id);
		return user;
	}

	@Override
	/**
	 * 封装分页显示用户的数据
	 * @param queryVo 用户封装所有的查询条件
	 * @return 返回封装好的对象
	 * */
	public PageBean<TUser> getList(QueryVO queryVo) {
		TUserExample example = new TUserExample();
		// 非空判断
		if (queryVo != null) {
			if (queryVo.getCurrentPage() == null || "".equals(queryVo.getCurrentPage())) {
				queryVo.setCurrentPage(1);
			}
			if (queryVo.getPageSize() == null || "".equals(queryVo.getPageSize())) {
				queryVo.setPageSize(10);
			}
			if (StringUtils.isNotBlank(queryVo.getUserTel())) {
				example.createCriteria().andUserTelEqualTo(queryVo.getUserTel());
			}

			PageBean<TUser> pageBean = new PageBean(queryVo.getCurrentPage(), queryVo.getPageSize());

			PageHelper pageHelper = new PageHelper();
			pageHelper.startPage(queryVo.getCurrentPage(), queryVo.getPageSize());

			List<TUser> list = tUserMapper.selectByExample(example);
			pageBean.setList(list);

			PageInfo<TUser> pageInfo = new PageInfo<>(list);
			long total = pageInfo.getTotal();

			pageBean.setTotalCount(total);
			pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount()) / pageBean.getPageSize()));

			return pageBean;
		} else {
			PageBean<TUser> pageBean = new PageBean();
			// 设置默认参数
			pageBean.setCurrentPage(1);
			pageBean.setPageSize(10);

			PageHelper pageHelper = new PageHelper();
			pageHelper.startPage(1, 10);

			List<TUser> list = tUserMapper.selectByExample(example);
			pageBean.setList(list);

			PageInfo<TUser> pageInfo = new PageInfo<>(list);
			long total = pageInfo.getTotal();

			pageBean.setTotalCount(total);
			pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount()) / pageBean.getPageSize()));

			return pageBean;
		}
	}

	@Override
	public E3Result saveOrUpdateUser(TUser user) {
		// 判断当前用户id是否为null
		if (user.getId() == null) {
			// 如果id为null则代表是添加用户
			tUserMapper.insert(user);
			return E3Result.ok();
		} else {
			// 代表当前操作时修改
			tUserMapper.updateByPrimaryKeySelective(user);
			return E3Result.ok();
		}
	}

	@Override
	public E3Result deleteUserByIds(String ids) {

		TUserExample example = new TUserExample();
		String[] userIds = ids.split(",");
		for (String id : userIds) {
			tUserMapper.deleteByPrimaryKey(Integer.valueOf(id));
		}
		return E3Result.ok();
	}

}
