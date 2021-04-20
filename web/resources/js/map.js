var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.47837, 126.95149), // 지도의 중심좌표 (관악구청)
        level: 6 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); 	// 지도 생성
var geocoder = new daum.maps.services.Geocoder();		// 주소-좌표 변환 객체 생성
var addressArray = [];
var priceArray = [];
var roomNoArray = [];

$(function(){
	showMarker($('#count').val(), $("input[name='map-address']"), $("input[name='map-price']"), $("input[name='map-roomNo']"));
});

function showMarker (count, groupAddress, groupPrice, groupRoomNo) {

	console.log('count : ' + count);

	for (var i = 0 ; i < count ; i++) {
		addressArray.push({
			'groupAddress' : groupAddress.eq(i).val()
		});
		priceArray.push({
			'groupPrice' : groupPrice.eq(i).val()
		});
		roomNoArray.push({
			'groupRoomNo' : groupRoomNo.eq(i).val()
		});
	}

	// 마커 이미지의 이미지 주소
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

	for (var i = 0 ; i < count ; i++) {

		let roomNo = roomNoArray[i].groupRoomNo;
		let price = priceArray[i].groupPrice;
		let address = addressArray[i].groupAddress;

		geocoder.addressSearch(address, function(result, status, data) {

				// 검색 성공 시
				if(status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					// 마커 이미지의 이미지 크기
					var imageSize = new kakao.maps.Size(24, 35);

				    // 마커 이미지를 생성
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

					/* 마커 생성 */
					var marker = new daum.maps.Marker({
						map : map,
						position : coords,
						image : markerImage,
						title : roomNo
					});

					/* 지도에 마커 표시 */
					marker.setMap(map);

					var iwContent = '<div style="padding:5px; width:110px; margin-left:20px;">등록번호' + roomNo + '<br>' + price + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    				iwPosition = coords; //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition,
					    content : iwContent
					});

					kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    			kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					// 마커 위에 인포윈도우를 표시
					//infowindow.open(map, marker);
				}
		});
	}

}


// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
