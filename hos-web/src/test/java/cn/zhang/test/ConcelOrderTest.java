package cn.zhang.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;

public class ConcelOrderTest {

	@Test
	public void test() throws ParseException{
		Calendar instance = Calendar.getInstance();
		instance.set(2020, 04, 25);
		System.out.println(instance.getTime());
		Boolean concelOrder = getConcelOrder(instance.getTime());
		System.out.println(concelOrder);
	}
	
	public Boolean getConcelOrder(Date orderDate) throws ParseException{
    	// 将预约日期转化为指定的格式，并将其重置到当天的零点
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	String source = format.format(orderDate);
    	Date parse = format.parse(source);
    	System.out.println(parse);
    	System.out.println(new Date());
    	// 创建Calendar实例操作时间对象
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(parse);
    	System.out.println(calendar.getTime());
    	// 获取取消预约的截至时间
    	calendar.add(Calendar.DAY_OF_MONTH, -1);
    	System.out.println(calendar.getTime());
    	// 将其转化为毫秒值，并获取当前时间的毫秒值
    	long timeInMillis = calendar.getTimeInMillis();
    	System.out.println(timeInMillis);
    	long currentTimeMillis = System.currentTimeMillis();
    	System.out.println(currentTimeMillis);
    	// 如果当前时间的毫秒值大于截至时间，则返回false
    	if (currentTimeMillis > timeInMillis) {
    		return false;
    	}
    	return true;
    }
	
	@Test
	public void test1() throws ParseException{
		Date date = new Date();
		SimpleDateFormat fromat = new SimpleDateFormat("yyyy-MM-dd");
		String format = fromat.format(date);
		System.out.println(format);
		Date parse = fromat.parse(format);
		System.out.println(parse);
	}
}
