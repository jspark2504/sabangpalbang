package com.sabang.findMyRoom.room.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.sabang.findMyRoom.common.config.ConfigLocation;

public class RoomDAO {

	private final Properties prop;

	public RoomDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "room/room-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
