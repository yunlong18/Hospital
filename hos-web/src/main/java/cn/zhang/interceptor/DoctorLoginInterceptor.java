package cn.zhang.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoctorLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
    	// 从session中获取doctor对象
        Object doctor = request.getSession().getAttribute("doctorUser");
        // 判断是否存在
        if (doctor == null){
        	// 不存在将其拦截，跳转到登录页面
            response.sendRedirect(request.getContextPath() + "/doctor/login.html");
            return false;
        }
        // 存在，直接放行
        return  true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
