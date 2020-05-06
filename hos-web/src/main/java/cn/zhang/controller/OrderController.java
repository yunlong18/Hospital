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
	@Autowired
	private ScheduleManagerService scheduleManagerService;
	@Value("${COUNT_PAGE_ORDER}")
	private Integer COUNT_PAGE_ORDER;
	@Value("${DOCTOR_SCHEDULE_PREFIX}")
	private String DOCTOR_SCHEDULE_PREFIX;
	@Value("${DELETE_DOCTOR_SCHEDULE_PREFIX}")
	private String DELETE_DOCTOR_SCHEDULE_PREFIX;
	@Value("${DATA_FORMAT_TO_HOUR_MINUTE}")
	private String DATA_FORMAT_TO_HOUR_MINUTE;
	@Value("${DATA_FORMAT_TO_YEAR_MONTH_DAY}")
	private String DATA_FORMAT_TO_YEAR_MONTH_DAY;
	@Value("${DATA_FORMAT_TO_YEAR_MONTH_DAY_HOUR_MINUTE}")
	private String DATA_FORMAT_TO_YEAR_MONTH_DAY_HOUR_MINUTE;
	@Value("${JUDGE_SOURCE_NUMBER_RANGE}")
	private String JUDGE_SOURCE_NUMBER_RANGE;

	@RequestMapping("/order/createOrder")
	public String createOrder (TOrder order, HttpServletRequest request, String orderDate1, 
		Long scheduleId) throws ParseException{
		// 获取当前用户信息
		TUser user = (TUser) request.getAttribute("user");
		order.setUserId(user.getId());
		// 创建预约单
		Date orderDate = stringToDate(orderDate1, DATA_FORMAT_TO_YEAR_MONTH_DAY_HOUR_MINUTE);
		order.setOrderDate(orderDate);
		orderService.insertOrder(order);
		// 获取session中该排班的时间段集合
		List<SourceNumber> sourceNumbers = (List<SourceNumber>) request.getSession()
			.getAttribute(DOCTOR_SCHEDULE_PREFIX + scheduleId);
		// 获取被预约的号源
		List<SourceNumber> deleteSourceNumbers = (List<SourceNumber>) request.getSession()
			.getAttribute(DELETE_DOCTOR_SCHEDULE_PREFIX + scheduleId);
		if (deleteSourceNumbers == null) {
			// 如果不存在，则创建一个
			deleteSourceNumbers = new ArrayList<>();
		}
		for (SourceNumber sourceNumber : sourceNumbers) {
			String format2 = dateToString(orderDate, DATA_FORMAT_TO_HOUR_MINUTE);
			if (sourceNumber.getStartTime_x().equals(format2)){
				// 移除该号源，并将其添加到被删除号源的集合中
				sourceNumbers.remove(sourceNumber);
				deleteSourceNumbers.add(sourceNumber);
				break;
			}
		}
		request.getSession().setAttribute(DOCTOR_SCHEDULE_PREFIX + scheduleId, sourceNumbers);
		request.getSession().setAttribute(DELETE_DOCTOR_SCHEDULE_PREFIX + scheduleId, deleteSourceNumbers);
		return "redirect:/order/orderDetail.html?is_history=false";
	}
	
	private Date stringToDate(String source , String pattern) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.parse(source);
	}
	
	private String dateToString(Date date , String pattern) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(date);
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
		// 恢复当前号源信息
		TOrder order = orderManagerService.getOrderById(orderId);
		// 根据当前订单所属医生的排班表
		List<TSchedule> scheduelList = scheduleManagerService.listScheduleByDoctorId(order.getDoctorId());
		if(scheduelList != null && scheduelList.size() > 0) {
			for (TSchedule tSchedule : scheduelList) {
				// 遍历排班表，查找和当前订单匹配的排班信息，首先通过日期来缩小范围
				if (dateToString(tSchedule.getWorkDate(), DATA_FORMAT_TO_YEAR_MONTH_DAY)
						.equals(dateToString(order.getOrderDate(), DATA_FORMAT_TO_YEAR_MONTH_DAY))) {
					// 判断当前订单是上午还是下午，精确到唯一一个排班表
					if (dateToString(order.getOrderDate(), DATA_FORMAT_TO_HOUR_MINUTE)
							.compareTo(JUDGE_SOURCE_NUMBER_RANGE) < 0 && !tSchedule.getWorkTime()) {
						// 查询缓存中为预定的号源列表和已经预约的号源列表
						List<SourceNumber> deleteSourceNumbers = (List<SourceNumber>) request.getSession()
							.getAttribute(DELETE_DOCTOR_SCHEDULE_PREFIX + tSchedule.getId());
						List<SourceNumber> sourceNumbers = (List<SourceNumber>) request.getSession()
							.getAttribute(DOCTOR_SCHEDULE_PREFIX + tSchedule.getId());
						// 如果已删除的列表不为空
						if (deleteSourceNumbers != null && deleteSourceNumbers.size() > 0) {
							// 遍历已预约的列表，查询符合条件的号源
							for(int i = 0; i < deleteSourceNumbers.size(); i++) {
								SourceNumber sourceNumber = deleteSourceNumbers.get(i);
								if (sourceNumber.getStartTime_x().equals(dateToString(order.getOrderDate(), 
										DATA_FORMAT_TO_HOUR_MINUTE))) {
									// 将其从已预约的号源中删除，并将其添加到为预约的号源中
									deleteSourceNumbers.remove(sourceNumber);
									sourceNumbers.add(sourceNumber);
									// 并对为预约的号源进行排序，按照字符串的排序规则进行排序
									Collections.sort(sourceNumbers);
								}
							}
						}
					} else {
						// 同if下相同
						List<SourceNumber> deleteSourceNumbers = (List<SourceNumber>) request.getSession()
							.getAttribute(DELETE_DOCTOR_SCHEDULE_PREFIX + tSchedule.getId());
						List<SourceNumber> sourceNumbers = (List<SourceNumber>) request.getSession()
							.getAttribute(DOCTOR_SCHEDULE_PREFIX + tSchedule.getId());
						if (deleteSourceNumbers != null && deleteSourceNumbers.size() > 0) {
							for(int i = 0; i < deleteSourceNumbers.size(); i++) {
								SourceNumber sourceNumber = deleteSourceNumbers.get(i);
								if (sourceNumber.getStartTime_x().equals(dateToString(order.getOrderDate(), 
										DATA_FORMAT_TO_HOUR_MINUTE))) {
									deleteSourceNumbers.remove(sourceNumber);
									sourceNumbers.add(sourceNumber);
									Collections.sort(sourceNumbers);
								}
							}
						}
					}
				}
			}
		}
		return orderService.updateOrder(orderId);
	}

	@RequestMapping("/order/deleteOrder")
	@ResponseBody
	public E3Result deleteOrder(Long orderId){
		E3Result result = orderService.deleteOrder(orderId);
		return result;
	}
	
	
}
