package cn.zhang.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import cn.zhang.common.utils.E3Result;
import cn.zhang.constant.ScoreConsts;
import cn.zhang.constant.TipMessageConsts;
import cn.zhang.mapper.TCreditMapper;
import cn.zhang.mapper.TFeedbackMapper;
import cn.zhang.mapper.TUserMapper;
import cn.zhang.pojo.TCredit;
import cn.zhang.pojo.TFeedback;
import cn.zhang.pojo.TUser;
import cn.zhang.pojo.TUserExample;
import cn.zhang.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private TUserMapper userMapper;
	@Autowired
	private TCreditMapper creditMapper;

	@Autowired
	private TFeedbackMapper feedbackMapper;

	@Override
	public E3Result register(TUser user) {
		if(user != null){
			// 判断是否有空属性
			if(StringUtils.isBlank(user.getUserName()) || StringUtils.isBlank(user.getUserPassword()) 
					|| StringUtils.isBlank(user.getUserPassword()) || StringUtils.isBlank(user.getUserTel())
					|| StringUtils.isBlank(user.getUserRealname())){
				return E3Result.build(400, TipMessageConsts.REGISTE_DEFAULT_MESSAGE);
			}
			
			// 对密码进行MD5加密
			String md5UserPassword = DigestUtils.md5DigestAsHex(user.getUserPassword().getBytes());
			user.setUserPassword(md5UserPassword);
			userMapper.insert(user);
			// 为新添加的用户初始化信誉积分
			TCredit credit = new TCredit();
			credit.setUserId(user.getId());
			credit.setCreditScore(ScoreConsts.INIT_USER_CREDIT_SCORE);
			// 是否可以预约：1为可以；0为不可以
			credit.setState(1);
			creditMapper.insert(credit);
			return E3Result.ok(TipMessageConsts.REGISTE_SUCCESS_MESSAGE);
		}else{
			return E3Result.build(400, TipMessageConsts.REGISTE_DEFAULT_MESSAGE);
		}
		
	}

	@Override
	public E3Result checkUserName(String userName) {
		
		TUserExample example = new TUserExample();
		example.createCriteria().andUserNameEqualTo(userName);
		List<TUser> list = userMapper.selectByExample(example);
		if(list != null && list.size() > 0){
			for (TUser user : list) {
				if(user.getUserName().equals(userName)){
					return E3Result.ok(true);
				}
			}
		}
		return E3Result.ok(false);
	}

	@Override
	public E3Result login(String userName, String userPassword) {
		// 检测用户是否输入信息
		if(StringUtils.isBlank(userName) || StringUtils.isBlank(userPassword)){
			return E3Result.build(400, TipMessageConsts.LOGIN_DEFAULT_MESSAGE);
		}
		TUserExample example = new TUserExample();
		// 根据用户名查询该用户是否存在
		example.createCriteria().andUserNameEqualTo(userName);
		List<TUser> list = userMapper.selectByExample(example);
		if(list != null && list.size() > 0){
			// 获取该用户，判断密码是否正确
			TUser user = list.get(0);
			if (DigestUtils.md5DigestAsHex(userPassword.getBytes()).equals(user.getUserPassword())) {
				return E3Result.ok(user);
			}
		}
		// 给出错误提示
		return E3Result.build(400, TipMessageConsts.LOGIN_ERROR_MESSAGE);
	}

	@Override
	public E3Result updateUserPassword(TUser user, String oldPassword, String newPassword) {

		if(StringUtils.isBlank(oldPassword) || StringUtils.isBlank(newPassword)){
			return E3Result.build(400, TipMessageConsts.BLANK_PARAMTE_MESSAGE);
		}
		if (!user.getUserPassword().equals(DigestUtils.md5DigestAsHex(oldPassword.getBytes()))){
			return E3Result.build(400, TipMessageConsts.PASSWORD_ERROR_MESSAGE);
		}
		user.setUserPassword(DigestUtils.md5DigestAsHex(newPassword.getBytes()));
		userMapper.updateByPrimaryKey(user);
		return E3Result.ok(user);
	}

	@Override
	public E3Result insertFeedBack(TFeedback feedback, String REGEX_MOBILE) {
		if (StringUtils.isBlank(feedback.getName()) || StringUtils.isBlank(feedback.getPhone()) ||
				StringUtils.isBlank(feedback.getContent())) {
			return E3Result.build(400, TipMessageConsts.BLANK_PARAMTE_MESSAGE);
		}
		if (feedback.getPhone() == null || !feedback.getPhone().matches(REGEX_MOBILE)) {
			return E3Result.build(400, TipMessageConsts.PHONE_ERROR_MESSAGE);
		}
		feedback.setCreated(new Date());
		feedbackMapper.insert(feedback);
		return E3Result.ok();
	}


}
