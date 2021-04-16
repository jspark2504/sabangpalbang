package com.sabang.findMyRoom.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sabang.findMyRoom.member.model.dto.DocumentDTO;
import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.member.model.service.DocumentService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Servlet implementation class DocumentInsertServlet
 */
@WebServlet("/document/insert")
public class DocumentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = "/WEB-INF/views/document/documentInsertForm.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 파일 업로드를 하기 위해서는
		 * 1. 파일이 저장 될 경로
		 * 2. 업로드 할 파일의 최대 용량
		 * 3. 인코딩 방식
		 */
		if(ServletFileUpload.isMultipartContent(request)) {
			
			String rootLocation = request.getServletContext().getRealPath("/");
			String fileUploadDirectory = rootLocation + "/resources/upload/original/";
			String thumbnailDirectory = rootLocation + "/resources/upload/thumbnail/";
			
			int maxFileSize = 1024 * 1024 * 10;
			String encodingType = "UTF-8";
			
			File directory = new File(fileUploadDirectory);
			File directory2 = new File(thumbnailDirectory);
			
			/* 파일 경로가 존재하지 않는 경우 디렉토리 생성 */
			if(!directory.exists() || !directory2.exists()) {
				System.out.println("폴더 생성 : " + directory.mkdirs());
				System.out.println("폴더 생성 : " + directory2.mkdirs());
			}
			
			/* 파일에 대한 정보는 리스트에, 다른 파라미터의 정보는 맵에 담자 */
			Map<String, String> parameter = new HashMap<>();
			List<Map<String, String>> fileList = new ArrayList<>();
			
			/* commons 패키지에 있는 클래스를 임포트 해야 함 */
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(directory);
			fileItemFactory.setRepository(directory2);
			fileItemFactory.setSizeThreshold(maxFileSize);
			
			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
			
			try {
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				
				
				/* 모든 FileItem들을 다 처리해 보자 */
				for(int i = 0 ; i < fileItems.size(); i++) {
					FileItem item = fileItems.get(i);
					
					/* isFormField가 true이면 일반 input태그의 값,
					 * isFormField가 false이면 파일 input태그의 값
					 */
					if(!item.isFormField()) {
						
						if(item.getSize() > 0) {
							
							String fieldName = item.getFieldName();
							String originFileName = item.getName();
							
							int dot = originFileName.lastIndexOf(".");
							String ext = originFileName.substring(dot);
							
							String randomFileName = UUID.randomUUID().toString().replace("-","") + ext;
							
							File storeFile = new File(fileUploadDirectory + randomFileName);
							
							/* 파일을 지정된 경로에 rename한 이름의 파일로 저장한다. */
							item.write(storeFile);
							
							/* 필요한 정보를 Map에 담자 */
							Map<String, String> fileMap = new HashMap<>();
							fileMap.put("fieldName", fieldName);
							fileMap.put("originFileName", originFileName);
							fileMap.put("savedFileName", randomFileName);
							fileMap.put("savePath", fileUploadDirectory);
							
							/* 대표 사진과 나머지 사진을 구분하고 썸네일(이미지 리사이징)도 생성하자. */
							int width = 0;
							int height = 0;
							if(!"????".equals(fieldName)) {
								width = 183;
								height = 244;	
							} 
							
							/* 썸네일로 변환 후 저장한다. */
							Thumbnails.of(fileUploadDirectory + randomFileName)
							          .size(width,height)
							          .toFile(thumbnailDirectory + "thumbnail_" + randomFileName);
							
							fileMap.put("thumbnailPath", "/resources/upload/thumbnail/thumbnail_" + randomFileName);
							
							fileList.add(fileMap);
							
						}
						
					} else {
						
						parameter.put(item.getFieldName(), 
								new String(item.getString().getBytes("ISO-8859-1"), encodingType));		
					}
				}
				
				DocumentDTO document = new DocumentDTO();
				document.setDocumentList(new ArrayList<DocumentDTO>());
				List<DocumentDTO> list = document.getDocumentList();
				for(int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					document.setUserNo(((MemberDTO)request.getSession().getAttribute("loginMember")).getNo());
					document.setOriginName(file.get("originFileName"));
					document.setSaveName(file.get("savedFileName"));
					document.setSavePath(file.get("savePath"));
					document.setThumbnailPath(file.get("thumbnailPath"));
					
					list.add(document);
				}
				System.out.println("값 뭐있어?" + document);
				/* 서비스 메소드를 요청하며 비지니스 로직을 처리한다. */
				int result = new DocumentService().insertDocument(document);
				
				/* 성공 실패 여부를 파악 후 처리 */
				String path = "";
				if(result > 0) {
					path = "/WEB-INF/views/common/success.jsp";
					request.setAttribute("successCode", "insertDocument");
				} else {
					path = "/WEB-INF/views/common/failed.jsp";
					request.setAttribute("message", "서류 등록 실패!");
				}
				
				request.getRequestDispatcher(path).forward(request, response);	
								
			} catch (Exception e) {
				int cnt = 0;
				/* 어떤 종류의 Exception이 발생 하더라도 실패 시 올라간 파일은 삭제해야 한다. */
				for(int i = 0 ; i < fileList.size() ; i++) {
					Map<String, String> file = fileList.get(i);
					
					File deleteFile = new File(fileUploadDirectory + file.get("savedFileName"));
					boolean isDeleted = deleteFile.delete();
					
					if(isDeleted) {
						cnt++;
					}
				}
				if(cnt == fileList.size()) {
					System.out.println("업로드에 실패한 모든 사진 삭제 완료!");
				}else {
					System.out.println("업로드에 실패한 모든 사진 삭제 실패!");
				}
			}
			
		} else {
			
		}
	
	}

}
