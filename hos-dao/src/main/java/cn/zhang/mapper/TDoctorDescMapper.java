package cn.zhang.mapper;

import cn.zhang.pojo.TDoctorDesc;
import cn.zhang.pojo.TDoctorDescExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TDoctorDescMapper {
    int countByExample(TDoctorDescExample example);

    int deleteByExample(TDoctorDescExample example);

    int deleteByPrimaryKey(Long doctorId);

    int insert(TDoctorDesc record);

    int insertSelective(TDoctorDesc record);

    List<TDoctorDesc> selectByExampleWithBLOBs(TDoctorDescExample example);

    List<TDoctorDesc> selectByExample(TDoctorDescExample example);

    TDoctorDesc selectByPrimaryKey(Long doctorId);

    int updateByExampleSelective(@Param("record") TDoctorDesc record, @Param("example") TDoctorDescExample example);

    int updateByExampleWithBLOBs(@Param("record") TDoctorDesc record, @Param("example") TDoctorDescExample example);

    int updateByExample(@Param("record") TDoctorDesc record, @Param("example") TDoctorDescExample example);

    int updateByPrimaryKeySelective(TDoctorDesc record);

    int updateByPrimaryKeyWithBLOBs(TDoctorDesc record);

    int updateByPrimaryKey(TDoctorDesc record);
}