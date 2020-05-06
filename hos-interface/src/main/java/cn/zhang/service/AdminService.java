package cn.zhang.service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TAdmin;

import javax.servlet.http.HttpServletRequest;

public interface AdminService {
    E3Result login(String userName, String userPassword);
    E3Result changePassword(TAdmin admin, String oldPassword, String newPassword);
}
