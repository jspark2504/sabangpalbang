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

import com.sabang.findMyRoom.admin.model.service.PageCountService;


@WebFilter("/*")
public class PageCountFilter implements Filter {
	private final String all = "/";
	private final String notice = "/notice/list";
	private final String info = "/infoboard/list";
	private final String free = "/freeboard/list";
	private final String room = "/room/list";
	private final int allNo = 1;
	private final int noticeNo = 2;
	private final int infoNo = 3;
	private final int freeNo = 4;
	private final int roomNo = 5;
	

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest hrequest = (HttpServletRequest) request;
		String uri = hrequest.getRequestURI();
		String intent = uri.replace(hrequest.getContextPath(), "");

		/* 주소의 필요한 부분만 추출 */
		System.out.println("intent 필터 확인중 : " + intent);
		PageCountService pageCountService = new PageCountService();

		if(intent.equals(room)) {	
			int no = pageCountService.incrementPageCount(roomNo);
			System.out.println("사이트 조회수 결과 확인 : " + no);
		} else if(intent.equals(notice)) {
			int no = pageCountService.incrementPageCount(noticeNo);
			System.out.println("사이트 조회수 결과 확인 : " + no);
		} else if(intent.equals(info)) {
			int no = pageCountService.incrementPageCount(infoNo);
			System.out.println("사이트 조회수 결과 확인 : " + no);
		} else if(intent .equals(free)) {
			int no = pageCountService.incrementPageCount(freeNo);
			System.out.println("사이트 조회수 결과 확인 : " + no);
		}
		
		if(intent.equals(all)) {
			int no = pageCountService.incrementPageCount(allNo);
			System.out.println("사이트 조회수 결과 확인 : " + no);
		}	
		
		request.setAttribute("intent", intent);
		chain.doFilter(request, response);

	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}























