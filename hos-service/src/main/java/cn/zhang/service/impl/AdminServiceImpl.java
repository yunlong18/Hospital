package cn.zhang.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import cn.zhang.common.utils.E3Result;
import cn.zhang.mapper.TAdminMapper;
import cn.zhang.pojo.TAdmin;
import cn.zhang.pojo.TAdminExample;
import cn.zhang.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private TAdminMapper adminMapper;
    @Override
    public E3Result login(String userName, String userPassword) {
        if(StringUtils.isBlank(userName) || StringUtils.isBlank(userPassword))
            return E3Result.build(400, "用户名或密码不能为空");
        TAdminExample example = new TAdminExample();
        example.createCriteria().andUserNameEqualTo(userName);
        List<TAdmin> list = adminMapper.selectByExample(example);
        TAdmin admin = null;
        if(list != null && list.size() > 0)
            admin = list.get(0);
        if(admin == null)
            return E3Result.build(400, "用户名或密码错误");
        if(!DigestUtils.md5DigestAsHex(userPassword.getBytes()).equals(admin.getUserPassword()))
            return E3Result.build(400, "用户名或密码错误");
        return E3Result.ok(admin);
    }

    @Override
    public E3Result changePassword(TAdmin admin, String oldPassword, String newPassword) {
        if (StringUtils.isBlank(oldPassword) || StringUtils.isBlank(newPassword)) {
        	return E3Result.build(400, "密码不能为空");
        }
        if(!DigestUtils.md5DigestAsHex(oldPassword.getBytes()).equals(admin.getUserPassword())) {
        	return E3Result.build(400, "原密码错误");
        }
        admin.setUserPassword(DigestUtils.md5DigestAsHex(newPassword.getBytes()));
        adminMapper.updateByPrimaryKeySelective(admin);
        return E3Result.ok();
    }
}
