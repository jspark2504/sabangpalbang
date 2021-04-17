package com.sabang.findMyRoom.member.model.service;

import static com.sabang.findMyRoom.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.sabang.findMyRoom.member.model.dao.DocumentDAO;
import com.sabang.findMyRoom.member.model.dto.DocumentDTO;

public class DocumentService {
	
	private final DocumentDAO documentDAO;
	
	public DocumentService() {
		documentDAO = new DocumentDAO();
	}

	public int insertDocument(DocumentDTO document) {
		
		Connection con = getConnection();
		
		int result = 0;
		
		List<DocumentDTO> documentList = document.getDocumentList();
		
		int documentResult = 0;
		for(int i = 0; i < documentList.size(); i++) {
			
			documentResult += documentDAO.insertDocument(con, documentList.get(i));
		}
		
		if(documentResult == documentList.size()) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public List<DocumentDTO> selectDocument(int userNo) {
		
		Connection con = getConnection();
		
		List<DocumentDTO> documentList = documentDAO.selectDocument(con, userNo);
		
		close(con);
		
		System.out.println("서비스 : " + documentList );
		
		return documentList;
		
	}

	public int deleteDocument(int fileNo) {
		
		Connection con = getConnection();
		
		int result = documentDAO.deleteDocument(con, fileNo);
		
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		System.out.println("서비스삭제 : " + result);
		
		return result;
	}

}
