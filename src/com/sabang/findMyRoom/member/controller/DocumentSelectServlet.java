package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.DocumentDTO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.member.model.service.DocumentService;


@WebServlet("/document/list")
public class DocumentSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		
		System.out.println("로그인" + userNo);
		
		DocumentService documentService = new DocumentService();
		
		List<DocumentDTO> documentList = documentService.selectDocument(userNo);
		
		System.out.println("서블릿 : " + documentList);
		
		String path = "";
		if(!documentList.isEmpty()) {
			path = "/WEB-INF/views/document/documentList.jsp";
			request.setAttribute("documentList", documentList);
		} else {
			path = "/WEB-INF/views/document/documentList.jsp";
			request.setAttribute("documentList", documentList);
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
