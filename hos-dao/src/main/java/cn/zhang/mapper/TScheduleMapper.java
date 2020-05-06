package cn.zhang.mapper;

import cn.zhang.pojo.TSchedule;
import cn.zhang.pojo.TScheduleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TScheduleMapper {
    int countByExample(TScheduleExample example);

    int deleteByExample(TScheduleExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TSchedule record);

    int insertSelective(TSchedule record);

    List<TSchedule> selectByExample(TScheduleExample example);

    TSchedule selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TSchedule record, @Param("example") TScheduleExample example);

    int updateByExample(@Param("record") TSchedule record, @Param("example") TScheduleExample example);

    int updateByPrimaryKeySelective(TSchedule record);

    int updateByPrimaryKey(TSchedule record);
}