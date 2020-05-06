package cn.zhang.quartz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.zhang.constant.ScoreConsts;
import cn.zhang.mapper.TCreditMapper;
import cn.zhang.pojo.TCredit;
import cn.zhang.pojo.TCreditExample;

public class TimingRefreshCreditScore {
	@Autowired
	private TCreditMapper creditMapper;
	
	public void run() {
		TCreditExample example = new TCreditExample();
		example.createCriteria().andCreditScoreLessThan(ScoreConsts.INIT_USER_CREDIT_SCORE);
		// 查询所有积分小于100的用户
		List<TCredit> creditList = creditMapper.selectByExample(example);
		if (creditList != null && creditList.size() > 0) {
			// 遍历查到的所有用户，将其积分+10
			for (TCredit tCredit : creditList) {
				tCredit.setCreditScore(tCredit.getCreditScore() + ScoreConsts.ADD_USER_CREDIT_SCORE);
				// 判断当前用户的积分及其状态
				if (tCredit.getCreditScore() >= 80 && tCredit.getState() == 0) {
					// 如果用户积分大于等于80，并且用户的状态为0：不可预约的状态；就将其设置为1：可预约的状态
					tCredit.setState(1);
				}
				creditMapper.updateByPrimaryKeySelective(tCredit);
			}
		}
	}
}
