package cn.zhang.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhang.common.pojo.SourceNumber;
import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TOrder;
import cn.zhang.pojo.TSchedule;
import cn.zhang.pojo.TUser;
import cn.zhang.service.OrderManagerService;
import cn.zhang.service.OrderService;
import cn.zhang.service.ScheduleManagerService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderManagerService orderManagerService;
	@Value("${COUNT_PAGE_ORDER}")
	private Integer COUNT_PAGE_ORDER;
	@Value("${DATA_FORMAT_TO_YEAR_MONTH_DAY_HOUR_MINUTE}")
	private String DATA_FORMAT_TO_YEAR_MONTH_DAY_HOUR_MINUTE;

	@RequestMapping("/order/createOrder")
	public String createOrder (TOrder order, HttpServletRequest request, String orderDate1, 
		Long scheduleId) throws ParseException{
		// 获取当前用户信息
		TUser user = (TUser) request.getAttribute("user");
		order.setUserId(user.getId());
		// 创建预约单
		Date orderDate = stringToDate(orderDate1, DATA_FORMAT_TO_YEAR_MONTH_DAY_HOUR_MINUTE);
		order.setOrderDate(orderDate);
		orderService.insertOrder(order, scheduleId);
		return "redirect:/order/orderDetail.html?is_history=false";
	}

	/**
	 * 将字符串转化为指定的格式日期
	 * @param source 源字符串
	 * @param pattern 指定的格式
	 * @return Date 返回一个日期
	 * */
	private Date stringToDate(String source , String pattern) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.parse(source);
	}
	
	@RequestMapping("/order/orderDetail")
	public String orderDetail(HttpServletRequest request, QueryVO queryVO){
		TUser user = (TUser) request.getAttribute("user");
		if(user != null){
			queryVO.setUserId(user.getId());
		}
		queryVO.setPageSize(COUNT_PAGE_ORDER);
		PageBean<TOrder> pageBean = orderManagerService.getPageBean(queryVO);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("isHistory", queryVO.getIs_history());
		request.setAttribute("flag", !queryVO.getIs_history());
		request.setAttribute("currentTime",  new Date());
		return "order";
	}

	@RequestMapping("/order/cancelOrder")
	@ResponseBody
	public E3Result cancelOrder(Long orderId, HttpServletRequest request) throws ParseException{
		return orderService.updateOrder(orderId);
	}

	@RequestMapping("/order/deleteOrder")
	@ResponseBody
	public E3Result deleteOrder(Long orderId){
		E3Result result = orderService.deleteOrder(orderId);
		return result;
	}
	
	
}
