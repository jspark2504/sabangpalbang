package com.sabang.findMyRoom.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;


@WebFilter(urlPatterns={"/manage/*","/pagecount/*","/freeBoard/*","/freeboard/*","/reply/**","/chart/*","/infoboard/*","/introduce/*","/document/*","/member/*","/payment/*","/notice/*","/room/*"})
public class AuthenticationFilter implements Filter {

	Map<String, List<String>> permitURIList;
	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest hrequest = (HttpServletRequest) request;
		String uri = hrequest.getRequestURI();
		String intent = uri.replace(hrequest.getContextPath(), "");
		
//		System.out.println(uri);
		/* 주소의 필요한 부분만 추출 */
		System.out.println("intent : " + intent);
		
		/* 세션에 권한이 있는지 확인하여 허용된 url에만 접근 가능하도록 설정한다. */
		HttpSession requestSession = hrequest.getSession();
		MemberDTO loginMember = (MemberDTO) requestSession.getAttribute("loginMember");
		
		/* 허용 여부 변수 지정 */
		boolean isAuthorized = false;
		if(loginMember != null) {	// 로그인을 했다면
			
			boolean isPermitAdmin = permitURIList.get("adminPermitList").contains(intent);
			boolean isPermitMember = permitURIList.get("memberPermitList").contains(intent);
			boolean isPermitOffice = permitURIList.get("officePermitList").contains(intent);
			boolean isPermitAll = permitURIList.get("allPermitList").contains(intent);
			
//			System.out.println("admin : " + isPermitAdmin);
//			System.out.println(" member : " + isPermitMember);
//			System.out.println(" office : " + isPermitOffice);
//			System.out.println("all : " + isPermitAll);
		
			/* 로그인 한 사람이 관리자인지 */
			if("ADMIN".equals(loginMember.getRole())) {
				if(isPermitAdmin || isPermitMember || isPermitOffice || isPermitAll) {
					 isAuthorized = true;
				}
			/* 로그인 한 사람이 일반 회원인지 */
			} else if ("MEMBER".equals(loginMember.getRole())) {
				if((isPermitMember || isPermitAll) && !isPermitAdmin && !isPermitOffice) {
					 isAuthorized = true;
				}
			} else if ("OFFICE".equals(loginMember.getRole())) {
				if((isPermitMember || isPermitAll || isPermitOffice) && !isPermitAdmin) {
					 isAuthorized = true;
				}
			}
			/* 허용 여부값에 따른 처리 */
			if(isAuthorized) {
				chain.doFilter(request, response);
			} else {
				((HttpServletResponse) response).sendError(403);
			}
			
		}else {		// 로그인을 안했다면
			if(permitURIList.get("allPermitList").contains(intent)) {
				chain.doFilter(request, response);
			} else {
				request.setAttribute("message", "로그인이 필요한 서비스 입니다.");
				request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(hrequest, response);
			}
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		permitURIList = new HashMap<>();
		List<String> adminPermitList = new ArrayList<>();
		List<String> memberPermitList = new ArrayList<>();
		List<String> officePermitList = new ArrayList<>();
		List<String> allPermitList = new ArrayList<>();
		
		/* 관리자 */
		adminPermitList.add("/manage/approval");
		adminPermitList.add("/manage/pause");
		adminPermitList.add("/manage/reject");
		adminPermitList.add("/manage/restore");
		adminPermitList.add("/manage/search");
		adminPermitList.add("/manage/list");

		adminPermitList.add("/pagecount/freeboard");
		adminPermitList.add("/pagecount/infoboard");
		adminPermitList.add("/pagecount/List");
		adminPermitList.add("/pagecount/notice");
		adminPermitList.add("/pagecount/room");

		adminPermitList.add("/chart/infoboard");
		adminPermitList.add("/infoboard/delete");
		adminPermitList.add("/infoboard/insert");
		adminPermitList.add("/infoboard/update");

		adminPermitList.add("/notice/insert");
		adminPermitList.add("/notice/update");
		adminPermitList.add("/notice/delete");
		
		
		/* 회원 */
		memberPermitList.add("/freeBoard/delete");
		memberPermitList.add("/freeBoard/insert");
		memberPermitList.add("/freeBoard/search");
		memberPermitList.add("/freeBoard/detail");
		memberPermitList.add("/freeBoard/update");
		memberPermitList.add("/infoboard/detail");
		memberPermitList.add("/infoboard/search");
		memberPermitList.add("/notice/detail");
		
		memberPermitList.add("/reply/delete");
		memberPermitList.add("/reply/insert");
		memberPermitList.add("/reply/list");
		
		memberPermitList.add("/document/delete");
		memberPermitList.add("/document/insert");
		memberPermitList.add("/document/list");

		memberPermitList.add("/member/delete");
		memberPermitList.add("/member/login");
		memberPermitList.add("/member/logout");
		memberPermitList.add("/member/update");
		memberPermitList.add("/member/MemberFindPw2Servlet");
		
		
		memberPermitList.add("/room/wish");
		
		memberPermitList.add("/room/search");
		memberPermitList.add("/room/detail");
		memberPermitList.add("/room/detail");
		memberPermitList.add("/room/list");
		memberPermitList.add("/room/list");
		memberPermitList.add("/room/list/wish");
		memberPermitList.add("/room/wishlist");
		
		
		/* 중개사 */
		officePermitList.add("/room/change");
		officePermitList.add("/room/insert");
		officePermitList.add("/room/management");
		officePermitList.add("/room/update/file");
		officePermitList.add("/room/update");
		
		officePermitList.add("/payment/list");
		
		
		/* 비회원(all) */
		
		allPermitList.add("/freeboard/list");
		allPermitList.add("/infoboard/list");
		allPermitList.add("/infoboard/search");
		allPermitList.add("/notice/list");
		
		allPermitList.add("/introduce/detail1");
		allPermitList.add("/introduce/detail2");
		allPermitList.add("/introduce/list");
		
		
		
		allPermitList.add("/member/findId");
		allPermitList.add("/member/findId2");
		allPermitList.add("/member/findPw");
		allPermitList.add("/member/login");
		allPermitList.add("/member/insert");
		allPermitList.add("/member/regist");
		allPermitList.add("/member/regist/checkEmail");
		allPermitList.add("/member/regist/checkId");
		allPermitList.add("/member/regist/checkNickname");
		allPermitList.add("/member/regist/checkPhone");
		
		
		
		
		
		permitURIList.put("adminPermitList", adminPermitList);
		permitURIList.put("memberPermitList", memberPermitList);
		permitURIList.put("officePermitList", officePermitList);
		permitURIList.put("allPermitList", allPermitList);
		
	}

}























