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

@WebServlet("/room/insert")
public class RoomInsertServlet extends HttpServlet {
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

		String path = "/WEB-INF/views/room/roomInsertForm.jsp";

		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {

			File directory = new File(fileUploadDirectory);
			File directory2 = new File(thumbnailDirectory);

			/* 파일 경로가 존재하지 않는 경우 디렉토리 생성 */
			if(!directory.exists() || !directory2.exists()) {
				System.out.println("폴더 생성 : " + directory.mkdirs());
				System.out.println("폴더 생성 : " + directory2.mkdirs());
			}

			Map<String, String> parameter = new HashMap<>();	 	// 파일 외의 파라미터 정보
			List<Map<String, String>> fileList = new ArrayList<>();	// 파일에 대한 정보

			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(directory);
			fileItemFactory.setSizeThreshold(maxFileSize);

			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

			try {
				/* parameter 꺼내오기 */
				List<FileItem> fileItems = fileUpload.parseRequest(request);

				/* 모든 FileItem 처리 */
				for(int i = 0 ; i < fileItems.size() ; i++) {
					FileItem item = fileItems.get(i);
//					System.out.println(item);

					if(!item.isFormField()) {		// 파일 input태그인 경우

						if(item.getSize() > 0) {		// 첨부파일이 존재하는 경우
							String originFileName = item.getName();

							/* 확장자 뽑아내기 */
							int dot = originFileName.lastIndexOf(".");
							String ext = originFileName.substring(dot);

							/* 저장될 파일 이름 생성 */
							String randomFileName = UUID.randomUUID().toString().replace("-", "") + ext;

							/* 저장할 파일 정보를 담은 인스턴스 생성 */
							File storeFile = new File(fileUploadDirectory + randomFileName);

							/* 파일 저장 */
							item.write(storeFile);

							/* 필요한 정보 담기 */
							Map<String, String> fileMap = new HashMap<>();
							fileMap.put("originFileName", originFileName);
							fileMap.put("savedFileName", randomFileName);
							fileMap.put("savePath", "/resources/upload/room/original/" + randomFileName);

							/* 썸네일 이미지 크기 */
							int width = 500;
							int height = 400;

							/* 첫 번째 사진인 경우 미리보기 사진으로 설정 */
							if(fileList.isEmpty()) {
								width = 172;
								height = 120;

								i--;
							}

							/* 썸네일로 변환 후 저장 */
							Thumbnails.of(fileUploadDirectory + randomFileName).size(width, height).toFile(thumbnailDirectory + "thumbnail_" + randomFileName);

							fileMap.put("thumbnailPath", "/resources/upload/room/thumbnail/thumbnail_" + randomFileName);

							fileList.add(fileMap);
						}

					} else {						// 파일 input태그가 아닌 경우
						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), encodingType));
					}

				} // for문 종료

				System.out.println("parameter : " + parameter);
				System.out.println("fileList : " + fileList);

				/* 하나의 RoomDTO에 담기 */
				RoomDTO room = new RoomDTO();
				RoomCategoryDTO category = new RoomCategoryDTO();
				OfficeDTO office = new OfficeDTO();
				List<RoomFileDTO> files = new ArrayList<>();

				/* 인스턴스 담기 */
				room.setCategory(category);
				room.setOffice(office);
				room.setFileList(files);

				/* 매물을 등록한 중개사의 회원번호 가져오기 */
				int memberNo = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
				System.out.println("memberNo : " + memberNo);

				/* parameter에서 값 가져오기 */
				room.setPrice(Integer.valueOf(parameter.get("price"))*10000);
				room.setArea(Double.valueOf(parameter.get("area")));
				room.setAddress(parameter.get("address"));
				category.setNo(Integer.valueOf(parameter.get("category")));
				room.setFloor(parameter.get("roomFloor") + "층/" + parameter.get("buildingFloor") + "층");
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

				/* 서비스 메소드 호출 */
				int result = new RoomService().insertRoom(room, memberNo);

				String path = "";
				if(result > 0) {
					path = "/WEB-INF/views/common/success.jsp";
					request.setAttribute("successCode", "insertRoom");
				} else {
					path = "/WEB-INF/views/common/failed.jsp";
					request.setAttribute("message", "매물 등록 실패!");
				}

				request.getRequestDispatcher(path).forward(request, response);

			} catch (Exception e) {		// 파일 업로드 실패 시 삭제 처리
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
					System.out.println("업로드에 실패한 모든 사진 삭제 완료!");
				} else {
					System.out.println("업로드에 실패한 모든 사진 삭제 실패!");
				}
			} // try-catch
		} // if

	} // doPost

} // class
