package cn.zhang.mapper;

import cn.zhang.pojo.TDepDoc;
import cn.zhang.pojo.TDepDocExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TDepDocMapper {
    int countByExample(TDepDocExample example);

    int deleteByExample(TDepDocExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TDepDoc record);

    int insertSelective(TDepDoc record);

    List<TDepDoc> selectByExample(TDepDocExample example);

    TDepDoc selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TDepDoc record, @Param("example") TDepDocExample example);

    int updateByExample(@Param("record") TDepDoc record, @Param("example") TDepDocExample example);

    int updateByPrimaryKeySelective(TDepDoc record);

    int updateByPrimaryKey(TDepDoc record);
}