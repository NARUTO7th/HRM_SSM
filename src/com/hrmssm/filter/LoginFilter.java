package com.hrmssm.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();//获取请求地址
        String contextPath = request.getContextPath();
        if (url.contains("login") || url.contains("register") || url.contains(".css") || url.contains(".js")){
            filterChain.doFilter(servletRequest,servletResponse);//放行请求
        }else{
            HttpSession session = request.getSession();
            if (session.getAttribute("user")!=null){
                filterChain.doFilter(servletRequest,servletResponse);
            }else{
                response.sendRedirect(contextPath+"/index.jsp");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
