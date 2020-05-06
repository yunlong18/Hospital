package cn.zhang.mapper;

import cn.zhang.pojo.TOrder;
import cn.zhang.pojo.TOrderExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TOrderMapper {
    int countByExample(TOrderExample example);

    int deleteByExample(TOrderExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TOrder record);

    int insertSelective(TOrder record);

    List<TOrder> selectByExampleWithBLOBs(TOrderExample example);

    List<TOrder> selectByExample(TOrderExample example);

    TOrder selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TOrder record, @Param("example") TOrderExample example);

    int updateByExampleWithBLOBs(@Param("record") TOrder record, @Param("example") TOrderExample example);

    int updateByExample(@Param("record") TOrder record, @Param("example") TOrderExample example);

    int updateByPrimaryKeySelective(TOrder record);

    int updateByPrimaryKeyWithBLOBs(TOrder record);

    int updateByPrimaryKey(TOrder record);
}