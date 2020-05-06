package cn.zhang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zhang.mapper.TCreditMapper;
import cn.zhang.pojo.TCredit;
import cn.zhang.pojo.TCreditExample;
import cn.zhang.service.CreditService;

@Service
public class CreditServiceImpl implements CreditService {

	@Autowired
	private TCreditMapper creditMapper;
	@Override
	public TCredit getCreditByUserId(Integer userId) {
		TCreditExample example = new TCreditExample();
		example.createCriteria().andUserIdEqualTo(userId);
		List<TCredit> credits = creditMapper.selectByExample(example);
		if (credits != null && credits.size() > 0) {
			return credits.get(0);
		}
		return null;
	}

}
