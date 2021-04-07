package com.sabang.infoboard.service;

import com.sabang.infoboard.dao.InfoBoardDAO;

public class InfoBoardService {
	private final InfoBoardDAO infoBoardDAO;
	
	public InfoBoardService() {
		infoBoardDAO = new InfoBoardDAO();
	}
}
