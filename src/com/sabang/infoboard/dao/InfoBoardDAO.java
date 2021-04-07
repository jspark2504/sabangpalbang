package com.sabang.infoboard.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.sabang.findMyRoom.common.config.ConfigLocation;

public class InfoBoardDAO {
	
	private final Properties prop;
	
	public InfoBoardDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "board/board-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
