package cn.zhang.mapper;

import cn.zhang.pojo.TContentCategory;
import cn.zhang.pojo.TContentCategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TContentCategoryMapper {
    int countByExample(TContentCategoryExample example);

    int deleteByExample(TContentCategoryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TContentCategory record);

    int insertSelective(TContentCategory record);

    List<TContentCategory> selectByExample(TContentCategoryExample example);

    TContentCategory selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TContentCategory record, @Param("example") TContentCategoryExample example);

    int updateByExample(@Param("record") TContentCategory record, @Param("example") TContentCategoryExample example);

    int updateByPrimaryKeySelective(TContentCategory record);

    int updateByPrimaryKey(TContentCategory record);
}