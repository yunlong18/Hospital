package cn.zhang.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import cn.zhang.common.utils.E3Result;
import cn.zhang.mapper.TDoctorMapper;
import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TDoctorExample;
import cn.zhang.service.DoctorSelfService;

@Service
public class DoctorSelfServiceImpl implements DoctorSelfService {

    @Autowired
    private TDoctorMapper doctorMapper;

    @Override
    public E3Result login(String userName, String userPassword) {
        if(StringUtils.isBlank(userName) || StringUtils.isBlank(userPassword))
            return E3Result.build(400,"用户名或密码不能为空");
        TDoctorExample example = new TDoctorExample();
        example.createCriteria().andUserNameEqualTo(userName);
        List<TDoctor> doctors = doctorMapper.selectByExample(example);
        TDoctor doctor = null;
        if(doctors != null && doctors.size() > 0){
            doctor = doctors.get(0);
        }
        if(doctor == null)
            return E3Result.build(400,"用户名或密码错误");
        if (!DigestUtils.md5DigestAsHex(userPassword.getBytes()).equals(doctor.getUserPassword()))
            return E3Result.build(400,"用户名或密码错误");
        return E3Result.ok(doctor);
    }

    @Override
    public E3Result changePassword(TDoctor doctor, String oldPassword, String newPassword) {

        if(StringUtils.isBlank(oldPassword) || StringUtils.isBlank(newPassword))
            return E3Result.build(400, "密码不能为空");
        if(!DigestUtils.md5DigestAsHex(oldPassword.getBytes()).equals(doctor.getUserPassword()))
            return E3Result.build(400,"原始密码错误");
        // 对新密码进行MD5加密并更新到医生信息中
        doctor.setUserPassword(DigestUtils.md5DigestAsHex(newPassword.getBytes()));
        doctorMapper.updateByPrimaryKeySelective(doctor);
        return E3Result.ok();
    }

}
