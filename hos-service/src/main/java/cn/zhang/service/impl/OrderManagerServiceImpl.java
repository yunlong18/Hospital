package cn.zhang.service.impl;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.constant.ScoreConsts;
import cn.zhang.mapper.TCreditMapper;
import cn.zhang.mapper.TOrderMapper;
import cn.zhang.pojo.*;
import cn.zhang.pojo.TOrderExample.Criteria;
import cn.zhang.service.OrderManagerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderManagerServiceImpl implements OrderManagerService {

    @Autowired
    private TOrderMapper orderMapper;
    @Autowired
    private TCreditMapper creditMapper;
    @Override
    public PageBean<TOrder> getPageBean(QueryVO queryVO) {

        TOrderExample example = new TOrderExample();
        Criteria criteria = example.createCriteria();
        example.setOrderByClause("order_date, created");
        if(queryVO != null){
            if (queryVO.getCurrentPage() == null) {
                queryVO.setCurrentPage(1);
            }
            if (queryVO.getPageSize() == null) {
                queryVO.setPageSize(10);
            }
            if (StringUtils.isNotBlank(queryVO.getDoctorRealName())) {
                // 如果医师姓名不为空，则添加查询条件；用于管理员订单页面的查询功能
                criteria.andDoctorRealnameEqualTo(queryVO.getDoctorRealName());
            }
            if (StringUtils.isNotBlank(queryVO.getUserTel())) {
                // 如果用户的手机号不为空则添加条件；用于医师订单页面的查询功能
                criteria.andUserTelEqualTo(queryVO.getUserTel());
            }

            if (queryVO.getDoctorId() != null) {
                // 如果医师id不为空，添加条件；用于医师查询订单列表
                criteria.andDoctorIdEqualTo(queryVO.getDoctorId());
            }
            if (queryVO.getIs_history() != null) {
                // 判断当前订单页面查询的是否为历史订单
                criteria.andHistoryStateEqualTo(queryVO.getIs_history());
            }
            if (queryVO.getUserId() != null) {
            	criteria.andUserIdEqualTo(queryVO.getUserId());
            }

            PageBean<TOrder> pageBean = new PageBean<>(queryVO.getCurrentPage(), queryVO.getPageSize());
            // 设置分页查询
            PageHelper pageHelper = new PageHelper();
            pageHelper.startPage(queryVO.getCurrentPage(), queryVO.getPageSize());
            List<TOrder> orders = orderMapper.selectByExampleWithBLOBs(example);
            pageBean.setList(orders);
            PageInfo<TOrder> pageInfo = new PageInfo<>(orders);
            pageBean.setTotalCount(pageInfo.getTotal());
            pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount()) / pageBean.getPageSize()));
            return pageBean;
        } else {
            PageBean<TOrder> pageBean = new PageBean();
            // 设置默认参数
            pageBean.setCurrentPage(1);
            pageBean.setPageSize(10);

            PageHelper pageHelper = new PageHelper();
            pageHelper.startPage(1, 10);

            List<TOrder> list = orderMapper.selectByExample(example);
            pageBean.setList(list);

            PageInfo<TOrder> pageInfo = new PageInfo<>(list);
            long total = pageInfo.getTotal();
            pageBean.setTotalCount(total);
            pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount()) / pageBean.getPageSize()));
            return pageBean;
        }
    }

    @Override
    public TOrder getOrderById(Long id) {
        TOrder order = orderMapper.selectByPrimaryKey(id);
        return order;
    }

    @Override
    public E3Result deleteOrderByIds(String ids) {
        TOrderExample example = new TOrderExample();
        String[] orderIds = ids.split(",");
        for (String id : orderIds) {
            orderMapper.deleteByPrimaryKey(Long.valueOf(id));
        }
        return E3Result.ok();
    }

    @Override
    public void saveOrder(TOrder order) {
        // 判断当前订单id是否为null
        if (order.getId() == null) {
            // 如果id为null则代表是添加用户
            // 生成主键id
            order.setId(System.currentTimeMillis() + RandomUtils.nextInt(0,1000));
            order.setCreated(new Date());
            orderMapper.insert(order);
        } else {
            // 代表当前操作时修改
            orderMapper.updateByPrimaryKeySelective(order);
        }
    }

    @Override
    public E3Result updateState(Integer state, Long id) {
        TOrder order = orderMapper.selectByPrimaryKey(id);
        order.setState(state);
        orderMapper.updateByPrimaryKeySelective(order);
        return E3Result.ok();
    }

    @Override
    /**
     * 该方法中的数字含义：
     * 		患者的就诊状态：0未就诊；1已就诊；2爽约;
     * 		除去部门长度判断和索引
     * */
    public E3Result updateVisitState(Integer visitState, Long id) {
        TOrder order = orderMapper.selectByPrimaryKey(id);
        order.setVisitState(visitState);
        // 取出用户的信誉积分信息
        TCreditExample example = new TCreditExample();
        example.createCriteria().andUserIdEqualTo(order.getUserId());
        List<TCredit> credits = creditMapper.selectByExample(example);
        if (credits != null && credits.size() > 0) {
        	TCredit credit = credits.get(0);
        	if (order.getVisitState() == 1) {
        		// 获取当前订单用户的信誉积分；如果小于100，则加十分
        		if (credit.getCreditScore() < ScoreConsts.INIT_USER_CREDIT_SCORE) {
        			credit.setCreditScore(credit.getCreditScore() + ScoreConsts.ADD_USER_CREDIT_SCORE);
        		}
        		// 更新数据库中的信誉信息
        		creditMapper.updateByPrimaryKeySelective(credit);
        	}
        	if (order.getVisitState() == 2) {
        		// 由于用户爽约，将其信誉分扣除十分
        		credit.setCreditScore(credit.getCreditScore() - ScoreConsts.SUB_USER_CREDIT_SCORE);
        		// 如果用信誉积分低于指定的分数，将不可再进行预约
        		if (credit.getCreditScore() < ScoreConsts.IS_ORDER_CREDIT_SCORE) {
        			credit.setState(0);
        		}
        		creditMapper.updateByPrimaryKeySelective(credit);
        	}
        } 
        if(visitState == 1 || visitState == 2){
            order.setHistoryState(true);
        }
        orderMapper.updateByPrimaryKeySelective(order);
        return E3Result.ok();
    }

    @Override
    public E3Result updateDoctorMessage(Long id, String doctorMessage) {
        TOrder order = orderMapper.selectByPrimaryKey(id);
        order.setDoctorMessage(doctorMessage);
        orderMapper.updateByPrimaryKeySelective(order);
        return E3Result.ok();
    }
}
