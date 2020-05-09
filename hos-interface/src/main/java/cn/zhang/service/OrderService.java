package cn.zhang.service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TOrder;

import java.util.List;

public interface OrderService {

	E3Result insertOrder(TOrder order, Long scheduleId);
	
	List<TOrder> listOrderByUserId(Integer id, Boolean isHistory);

	E3Result updateOrder(Long orderId);

	E3Result deleteOrder(Long orderId);
}
