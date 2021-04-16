package com.sabang.findMyRoom.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sabang.findMyRoom.member.model.dto.DocumentDTO;
import com.sabang.findMyRoom.member.model.service.DocumentService;


@WebServlet("/document/list")
public class DocumentSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 서류 저장 전.
//		String path = "/WEB-INF/views/document/documentList.jsp";
//		
//		request.getRequestDispatcher(path).forward(request, response);
		
//		DocumentService documentService = new DocumentService();
//		
//		List<DocumentDTO> documentList = documentService.selectDocument();
//		
//		String path = "";
//		if(!documentList.isEmpty()) {
//			path = "/WEB-INF/views/thumbnail/thumbnailList.jsp";
//			request.setAttribute("thumbnailList", documentList);
//		} else {
//			path = "/WEB-INF/views/common/failed.jsp";
//			request.setAttribute("message", "썸네일 게시판 조회 실패!");
//		}
//		
//		request.getRequestDispatcher(path).forward(request, response);
	}

}
