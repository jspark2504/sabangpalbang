package com.sabang.findMyRoom.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.admin.model.service.AdminService;
import com.sabang.findMyRoom.common.paging.Pagenation;
import com.sabang.findMyRoom.infoboard.model.dto.PageInfoDTO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;

@WebServlet("/manage/list")
public class MemberManageSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String currentPage = request.getParameter("currentPage");
	      
	      /* 페이징 처리를 위한 처리 */
	      /* 1. 현재 보여질 페이지를 담을 변수 선언 (현재 페이지 설정)
	       * 처음에는 1페이지가 보여져야 하므로 1로 초기화 한다.
	       */
	      int pageNo = 1;
	      
	      /* 현재 페이지에 대한 정보가 파라미터로 전달 될 경우 현재 페이지 변수를 갱신한다. */
	      if(currentPage != null && !"".equals(currentPage)) {
	         pageNo = Integer.valueOf(currentPage);
	         
	         /* 0보다 작은 숫자가 넘어오면 1페이지를 보여준다. */
	         if(pageNo <= 0) {
	            pageNo = 1;
	         }
	      }
	      
	      /* 2. 전체 게시물 갯수 조회 */
	      /* DB를 조회하여 게시 가능한 게시물의 총 갯수를 조회한다. */
	      AdminService adminService = new AdminService();
	      int totalCount = adminService.selectTotalCount();
	      System.out.println("회원의 총 인원  : " + totalCount);
	      
	      /* 3. 한 페이지에 보여 줄 회원 수 */
	      int limit = 10;
	      /* 4. 한 번에 보여질 페이징 버튼의 수 */
	      int buttonAmount = 5;
	      
	      /* 5. 지금까지 만든 변수들을 가지고 페이징 처리를 한 후 페이징 처리에 관한 정보를 담고 있는
	       * 인스턴스를 반환 받기(feat.Pagenation.getPageInfo()메소드, PageInfoDTO)
	       */
	      PageInfoDTO pageInfo = Pagenation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
	      
	      System.out.println("페이징 처리와 관련된 정보들 : " + pageInfo);
	      
	      /* 조회해 온다. */
	      List<MemberDTO> manageList = adminService.selectMemberList(pageInfo);
	      for(MemberDTO bDto : manageList) {
	         System.out.println("한페이지에 보여질 회원 : " + bDto);
	      }
	      
	      String path = "";
	         path = "/WEB-INF/views/admin/memberManage.jsp";
	         request.setAttribute("manageList", manageList);
	         request.setAttribute("pageInfo", pageInfo);
	      
	      request.getRequestDispatcher(path).forward(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
