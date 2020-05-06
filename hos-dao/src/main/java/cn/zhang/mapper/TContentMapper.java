package cn.zhang.mapper;

import cn.zhang.pojo.TContent;
import cn.zhang.pojo.TContentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TContentMapper {
    int countByExample(TContentExample example);

    int deleteByExample(TContentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TContent record);

    int insertSelective(TContent record);

    List<TContent> selectByExampleWithBLOBs(TContentExample example);

    List<TContent> selectByExample(TContentExample example);

    TContent selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TContent record, @Param("example") TContentExample example);

    int updateByExampleWithBLOBs(@Param("record") TContent record, @Param("example") TContentExample example);

    int updateByExample(@Param("record") TContent record, @Param("example") TContentExample example);

    int updateByPrimaryKeySelective(TContent record);

    int updateByPrimaryKeyWithBLOBs(TContent record);

    int updateByPrimaryKey(TContent record);
}