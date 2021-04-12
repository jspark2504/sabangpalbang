package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.member.model.service.MemberService;

@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/updateMemberForm.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* 세션에서 정보 가져오기 (입력하지 않은 값도 가져옴) object라서 dto로 다운케스팅 -> get으로 로그인한 사용자 정보 가져오기 */
		int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone").replace("-", "");

		
		MemberDTO updateMember = new MemberDTO();
		updateMember.setId(userId);
		updateMember.setPwd(userPwd);
		updateMember.setNickname(nickname);
		updateMember.setEmail(email);
		updateMember.setPhone(phone);

		
		System.out.println("memberController requestMember : " + updateMember);

		/* 정상적으로 회원 정보를 업데이트 한 경우에는 변경된 회원 정보를 DB에서 다시 조회해 온다.
		 * 조회한 회원 정보를 session에 동일한 key로 담아준 후 success.jsp로 updateMember라는 코드를
		 * 보내 alert를 띄운 후 회원 정보를 수정하는 페이지로(/member/update)경로를 이동시킨다.
		 */

		int result = new MemberService().updateMember(updateMember);
		MemberDTO udmember = (MemberDTO)(request.getSession().getAttribute("loginMember"));
		udmember.setId(userId);
		udmember.setPwd(userPwd);
		udmember.setNickname(nickname);
		udmember.setEmail(email);
		udmember.setPhone(phone);
		
		String path = "";
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("successCode", updateMember);
			response.sendRedirect(request.getContextPath());
			request.getSession().setAttribute("loginMember", udmember);
			
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "회원 정보 수정 실패!");
			request.getRequestDispatcher(path).forward(request, response);
		}
	
	}

}
