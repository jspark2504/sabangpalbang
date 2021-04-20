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
			/* 회원관리 : 중개사 승인 맟 거부, 회원 정지 및 복구, 회원관리 검색 및 리스트 */
			adminPermitList.add("/manage/approval");
			adminPermitList.add("/manage/reject");
			adminPermitList.add("/manage/pause");
			adminPermitList.add("/manage/restore");
			adminPermitList.add("/manage/search");
			adminPermitList.add("/manage/list");
		
			/* 페이지 통계 : 자유, 정보, 메인, 공지, 매물 조회수 */
			adminPermitList.add("/pagecount/freeboard");
			adminPermitList.add("/pagecount/infoboard");
			adminPermitList.add("/pagecount/List");
			adminPermitList.add("/pagecount/notice");
			adminPermitList.add("/pagecount/room");
	
			/* 정보게시판 : 차트, 등록, 수정, 삭제 */
			adminPermitList.add("/chart/infoboard");
			adminPermitList.add("/infoboard/insert");
			adminPermitList.add("/infoboard/update");
			adminPermitList.add("/infoboard/delete");
	
			/* 공지 : 등록, 수정, 삭제 */
			adminPermitList.add("/notice/insert");
			adminPermitList.add("/notice/update");
			adminPermitList.add("/notice/delete");
		
		/* 회원 */
			/* 회원 : 로그인 및 로그아웃, 수정, 탈퇴, 비번찾기 이메일 보내기 관련 */
			memberPermitList.add("/member/login");
			memberPermitList.add("/member/logout");
			memberPermitList.add("/member/update");
			memberPermitList.add("/member/delete");
			memberPermitList.add("/member/MemberFindPw2Servlet");

			/* 전체 게시판 : (자유) 등록,삭제,검색,내용 (정보) 검색,내용 (공지) 내용 */
			memberPermitList.add("/freeBoard/insert");
			memberPermitList.add("/freeBoard/delete");
			memberPermitList.add("/freeBoard/search");
			memberPermitList.add("/freeBoard/detail");
			memberPermitList.add("/freeBoard/update");
			memberPermitList.add("/infoboard/search");
			memberPermitList.add("/infoboard/detail");
			memberPermitList.add("/notice/detail");
			
			/* 자유 게시판 댓글 : 등록, 리스트, 삭제 */
			memberPermitList.add("/reply/insert");
			memberPermitList.add("/reply/list");
			memberPermitList.add("/reply/delete");
			
			/* 내 문서 : 등록, 리스트, 삭제 */
			memberPermitList.add("/document/insert");
			memberPermitList.add("/document/list");
			memberPermitList.add("/document/delete");
	
			/* 매물 : 리스트, 찾기, 내용, 찜, 찜관련리스트 */
			memberPermitList.add("/room/list");
			memberPermitList.add("/room/search");
			memberPermitList.add("/room/detail");
			memberPermitList.add("/room/wish");
			memberPermitList.add("/room/wishlist");
			memberPermitList.add("/room/list/wish");
		
		/* 중개사 */
			/* 매물 관련 : 등록, 수정, 관리, 파일업로드, 수정 */
			officePermitList.add("/room/insert");
			officePermitList.add("/room/change");
			officePermitList.add("/room/management");
			officePermitList.add("/room/update/file");
			officePermitList.add("/room/update");

			/* 결재 : 이용권 목록과 결재내역 */
			officePermitList.add("/payment");
			officePermitList.add("/payment/list");
		
		
		/* 비회원(all) */
			/* 게시판 : 리스트 */
			allPermitList.add("/freeboard/list");
			allPermitList.add("/infoboard/list");
			allPermitList.add("/notice/list");
			
			/* 소개할게요 : 리스트, 정보 */
			allPermitList.add("/introduce/list");
			allPermitList.add("/introduce/detail1");
			allPermitList.add("/introduce/detail2");
			
			/* 회원 : 등록, 아이디 비번 찾기 관련, 회원가입 관련 */
			allPermitList.add("/member/insert");
			allPermitList.add("/member/findId");
			allPermitList.add("/member/findId2");
			allPermitList.add("/member/findPw");
			allPermitList.add("/member/login");
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























