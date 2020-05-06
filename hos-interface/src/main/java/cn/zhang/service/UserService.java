package cn.zhang.service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TFeedback;
import cn.zhang.pojo.TUser;

public interface UserService {

	E3Result register(TUser user);
	E3Result checkUserName(String userName);
	E3Result login(String userName, String userPassword);
	E3Result updateUserPassword(TUser user, String oldPassword, String newPassword);
	E3Result insertFeedBack(TFeedback feedback, String REGEX_MOBILE);
}
