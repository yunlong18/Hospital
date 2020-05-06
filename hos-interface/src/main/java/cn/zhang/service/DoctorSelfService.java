package cn.zhang.service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TDoctor;

public interface DoctorSelfService {

    E3Result login(String userName, String userPassword);

    E3Result changePassword(TDoctor doctor, String oldPassword, String newPassword);
}
