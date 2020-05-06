package cn.zhang.mapper;

import cn.zhang.pojo.TCredit;
import cn.zhang.pojo.TCreditExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TCreditMapper {
    int countByExample(TCreditExample example);

    int deleteByExample(TCreditExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TCredit record);

    int insertSelective(TCredit record);

    List<TCredit> selectByExample(TCreditExample example);

    TCredit selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TCredit record, @Param("example") TCreditExample example);

    int updateByExample(@Param("record") TCredit record, @Param("example") TCreditExample example);

    int updateByPrimaryKeySelective(TCredit record);

    int updateByPrimaryKey(TCredit record);
}