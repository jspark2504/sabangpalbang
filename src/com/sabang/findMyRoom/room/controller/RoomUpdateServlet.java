package com.sabang.findMyRoom.room.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sabang.findMyRoom.member.model.dto.MemberDTO;
import com.sabang.findMyRoom.room.model.dto.OfficeDTO;
import com.sabang.findMyRoom.room.model.dto.RoomCategoryDTO;
import com.sabang.findMyRoom.room.model.dto.RoomDTO;
import com.sabang.findMyRoom.room.model.dto.RoomFileDTO;
import com.sabang.findMyRoom.room.model.service.RoomService;

import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/room/update")
public class RoomUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String rootLocation;
	private String fileUploadDirectory;
	private String thumbnailDirectory;
	private int maxFileSize;
	private String encodingType;

	@Override
	public void init() throws ServletException {

		ServletContext context = getServletContext();

		rootLocation = context.getRealPath("/");
		fileUploadDirectory = rootLocation + context.getInitParameter("file-upload-directory") + "room/original/";
		thumbnailDirectory = rootLocation + context.getInitParameter("thumbnail-directory") + "room/thumbnail/";
		maxFileSize = Integer.valueOf(context.getInitParameter("max-file-size"));
		encodingType = context.getInitParameter("encoding-type");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.valueOf(request.getParameter("no"));
		System.out.println("doGet no : " + no);

		RoomDTO room = new RoomService().selectRoomDetail(no);

		String path = "";
		if(room != null) {
			path = "/WEB-INF/views/room/roomUpdateForm.jsp";

			/* ?????? ?????? */
			room.setPrice(room.getPrice()/10000);
			room.setMonthCost(room.getMonthCost()/10000);

			request.setAttribute("room", room);

		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "????????? ????????? ????????? ????????? ??? ????????????.");
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {

			File directory = new File(fileUploadDirectory);
			File directory2 = new File(thumbnailDirectory);

			/* ?????? ????????? ???????????? ?????? ?????? ???????????? ?????? */
			if(!directory.exists() || !directory2.exists()) {
				System.out.println("?????? ?????? : " + directory.mkdirs());
				System.out.println("?????? ?????? : " + directory2.mkdirs());
			}

			Map<String, String> parameter = new HashMap<>();	 	// ?????? ?????? ???????????? ??????
			List<Map<String, String>> fileList = new ArrayList<>();	// ????????? ?????? ??????

			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(directory);
			fileItemFactory.setSizeThreshold(maxFileSize);

			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

			try {
				/* parameter ???????????? */
				List<FileItem> fileItems = fileUpload.parseRequest(request);

				/* ?????? FileItem ?????? */
				for(int i = 0 ; i < fileItems.size() ; i++) {
					FileItem item = fileItems.get(i);
					System.out.println(item);

					if(!item.isFormField()) {		// ?????? input????????? ??????

						if(item.getSize() > 0) {		// ??????????????? ???????????? ??????
							String originFileName = item.getName();

							/* ????????? ???????????? */
							int dot = originFileName.lastIndexOf(".");
							String ext = originFileName.substring(dot);

							/* ????????? ?????? ?????? ?????? */
							String randomFileName = UUID.randomUUID().toString().replace("-", "") + ext;

							/* ????????? ?????? ????????? ?????? ???????????? ?????? */
							File storeFile = new File(fileUploadDirectory + randomFileName);

							/* ?????? ?????? */
							item.write(storeFile);

							/* ????????? ?????? ?????? */
							Map<String, String> fileMap = new HashMap<>();
							fileMap.put("originFileName", originFileName);
							fileMap.put("savedFileName", randomFileName);
							fileMap.put("savePath", "/resources/upload/room/original/" + randomFileName);

							/* ????????? ????????? ?????? */
							int width = 500;
							int height = 400;

							/* ??? ?????? ????????? ?????? ???????????? ???????????? ?????? */
							if(fileList.isEmpty()) {
								fileMap.put("fileType", "TITLE");
							} else {
								fileMap.put("fileType", "BODY");
							}

							/* ???????????? ?????? ??? ?????? */
							Thumbnails.of(fileUploadDirectory + randomFileName).size(width, height).toFile(thumbnailDirectory + "thumbnail_" + randomFileName);

							fileMap.put("thumbnailPath", "/resources/upload/room/thumbnail/thumbnail_" + randomFileName);

							fileList.add(fileMap);
						}

					} else {						// ?????? input????????? ?????? ??????
						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), encodingType));
					}

				} // for??? ??????

				System.out.println("parameter : " + parameter);
				System.out.println("fileList : " + fileList);

				/* ????????? RoomDTO??? ?????? */
				RoomDTO room = new RoomDTO();
				RoomCategoryDTO category = new RoomCategoryDTO();
				OfficeDTO office = new OfficeDTO();
				List<RoomFileDTO> files = new ArrayList<>();

				/* ???????????? ?????? */
				room.setCategory(category);
				room.setOffice(office);
				room.setFileList(files);

				/* ????????? ????????? ???????????? ???????????? ???????????? */
				int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
				System.out.println("memberNo : " + memberNo);

				/* parameter?????? ??? ???????????? */
				room.setNo(Integer.valueOf(parameter.get("roomNo")));
				room.setPrice(Integer.valueOf(parameter.get("price"))*10000);
				room.setArea(Double.valueOf(parameter.get("area")));
				room.setAddress(parameter.get("address"));
				category.setNo(Integer.valueOf(parameter.get("category")));
				room.setFloor(parameter.get("roomFloor") + "???/" + parameter.get("buildingFloor") + "???");
				room.setDirection(parameter.get("direction"));
				room.setMonthCost(Integer.valueOf(parameter.get("monthCost"))*10000);
				room.setElectricity(parameter.get("electricity"));
				room.setGas(parameter.get("gas"));
				room.setWater(parameter.get("water"));
				room.setInternet(parameter.get("internet"));
				room.setTv(parameter.get("tv"));
				room.setConstructionDate(parameter.get("constructionDate"));
				room.setAvailableDate(parameter.get("availableDate"));
				room.setTitle(parameter.get("title"));
				room.setExplanation(parameter.get("explanation"));
				room.setTransportationInfo(parameter.get("transportationInfo"));
				room.setWashingMachine(parameter.get("washingMachine"));
				room.setRefrigerator(parameter.get("refrigerator"));
				room.setAirConditioner(parameter.get("airConditioner"));
				room.setGasStove(parameter.get("gasStove"));
				room.setElevator(parameter.get("elevator"));
				room.setPet(parameter.get("pet"));
				room.setParking(parameter.get("parking"));

				System.out.println("room :" + room);

				for(Map<String, String> file : fileList) {
					RoomFileDTO roomFile = new RoomFileDTO();
					roomFile.setOriginName(file.get("originFileName"));
					roomFile.setSaveName(file.get("savedFileName"));
					roomFile.setSavePath(file.get("savePath"));
					roomFile.setThumbnailPath(file.get("thumbnailPath"));

					files.add(roomFile);
				}

				/* ????????? ????????? ?????? */
				int result = new RoomService().updateRoom(room, memberNo);

				String path = "";
				if(result > 0) {
					path = "/WEB-INF/views/common/success.jsp";
					request.setAttribute("successCode", "updateRoom");
				} else {
					path = "/WEB-INF/views/common/failed.jsp";
					request.setAttribute("message", "?????? ?????? ????????? ?????????????????????.");
				}

				request.getRequestDispatcher(path).forward(request, response);

			} catch (Exception e) {		// ?????? ????????? ?????? ??? ?????? ??????
				e.printStackTrace();

				int cnt = 0;
				for(Map<String, String> file : fileList) {
					File deleteFile = new File(fileUploadDirectory + file.get("savedFileName"));
					boolean isDeleted = deleteFile.delete();

					if(isDeleted) {
						cnt++;
					}
				}
				if(cnt == fileList.size()) {
					System.out.println("???????????? ????????? ?????? ?????? ?????? ??????!");
				} else {
					System.out.println("???????????? ????????? ?????? ?????? ?????? ??????!");
				}
			} // try-catch
		} // if

//		/* ????????? ????????? ???????????? ???????????? ???????????? */
//		int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
//		System.out.println("memberNo : " + memberNo);
//
//		RoomDTO room = new RoomDTO();
//		RoomCategoryDTO category = new RoomCategoryDTO();
//
//		room.setCategory(category);
//
//		/* parameter?????? ??? ???????????? */
//		room.setNo(Integer.valueOf(request.getParameter("no")));
//		room.setPrice(Integer.valueOf(request.getParameter("price"))*10000);
//		room.setArea(Double.valueOf(request.getParameter("area")));
//		room.setAddress(request.getParameter("address"));
//		category.setNo(Integer.valueOf(request.getParameter("category")));
//		room.setFloor(request.getParameter("roomFloor") + "???/" + request.getParameter("buildingFloor") + "???");
//		room.setDirection(request.getParameter("direction"));
//		room.setMonthCost(Integer.valueOf(request.getParameter("monthCost"))*10000);
//		room.setElectricity(request.getParameter("electricity"));
//		room.setGas(request.getParameter("gas"));
//		room.setWater(request.getParameter("water"));
//		room.setInternet(request.getParameter.get("internet"));
//		room.setTv(request.getParameter.get("tv"));
//		room.setConstructionDate(request.getParameter.get("constructionDate"));
//		room.setAvailableDate(request.getParameter.get("availableDate"));
//		room.setTitle(request.getParameter.get("title"));
//		room.setExplanation(request.getParameter.get("explanation"));
//		room.setTransportationInfo(request.getParameter.get("transportationInfo"));
//		room.setWashingMachine(request.getParameter.get("washingMachine"));
//		room.setRefrigerator(request.getParameter.get("refrigerator"));
//		room.setAirConditioner(request.getParameter.get("airConditioner"));
//		room.setGasStove(request.getParameter.get("gasStove"));
//		room.setElevator(request.getParameter.get("elevator"));
//		room.setPet(request.getParameter.get("pet"));
//		room.setParking(request.getParameter.get("parking"));


	} // doPost

} // class
