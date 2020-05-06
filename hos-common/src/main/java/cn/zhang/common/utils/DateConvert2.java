package cn.zhang.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

public class DateConvert2 implements Converter<String, Date>{

	@Override
	public Date convert(String arg0) {
		
		if(StringUtils.isBlank(arg0)){
			throw new RuntimeException("请传入参数");
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			return format.parse(arg0);
		} catch (ParseException e) {
			throw new RuntimeException("参数有误");
		}
	}

	
}
