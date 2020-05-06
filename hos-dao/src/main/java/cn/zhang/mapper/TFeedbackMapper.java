package cn.zhang.mapper;

import cn.zhang.pojo.TFeedback;
import cn.zhang.pojo.TFeedbackExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TFeedbackMapper {
    int countByExample(TFeedbackExample example);

    int deleteByExample(TFeedbackExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TFeedback record);

    int insertSelective(TFeedback record);

    List<TFeedback> selectByExampleWithBLOBs(TFeedbackExample example);

    List<TFeedback> selectByExample(TFeedbackExample example);

    TFeedback selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TFeedback record, @Param("example") TFeedbackExample example);

    int updateByExampleWithBLOBs(@Param("record") TFeedback record, @Param("example") TFeedbackExample example);

    int updateByExample(@Param("record") TFeedback record, @Param("example") TFeedbackExample example);

    int updateByPrimaryKeySelective(TFeedback record);

    int updateByPrimaryKeyWithBLOBs(TFeedback record);

    int updateByPrimaryKey(TFeedback record);
}