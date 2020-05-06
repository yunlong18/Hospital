package cn.zhang.mapper;

import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TDoctorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TDoctorMapper {
    int countByExample(TDoctorExample example);

    int deleteByExample(TDoctorExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TDoctor record);

    int insertSelective(TDoctor record);

    List<TDoctor> selectByExampleWithBLOBs(TDoctorExample example);

    List<TDoctor> selectByExample(TDoctorExample example);

    TDoctor selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TDoctor record, @Param("example") TDoctorExample example);

    int updateByExampleWithBLOBs(@Param("record") TDoctor record, @Param("example") TDoctorExample example);

    int updateByExample(@Param("record") TDoctor record, @Param("example") TDoctorExample example);

    int updateByPrimaryKeySelective(TDoctor record);

    int updateByPrimaryKeyWithBLOBs(TDoctor record);

    int updateByPrimaryKey(TDoctor record);
}