package com.sabang.findMyRoom.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.sabang.findMyRoom.common.wrapper.EncryptRequestWrapper;

@WebFilter("/member/*")
public class PasswordEncryptFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest hrequest = (HttpServletRequest) request;

		String uri = hrequest.getRequestURI();
		System.out.println("uri : " + uri);

		String intent = uri.substring(uri.lastIndexOf("/"));
		System.out.println("intent : " + intent);

		if(!("/login".equals(intent) || "/regist".equals(intent))) {
			EncryptRequestWrapper wrapper = new EncryptRequestWrapper(hrequest);
			chain.doFilter(wrapper, response);

		} else {
			chain.doFilter(hrequest, response);
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
