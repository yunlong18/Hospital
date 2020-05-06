package cn.zhang.test;

import org.junit.Test;

public class SplitTest {

	
	@Test
	public void test(){
		StringBuffer requestURL = new StringBuffer("http://localhost:8080/hehe/haha");
		String protal = requestURL.substring(0, 7);
		String path = protal + requestURL.substring(7).split("/")[0] + "/upload/";
	}
}
