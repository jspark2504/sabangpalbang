var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.47837, 126.95149), // 지도의 중심좌표 (관악구청)
        level: 6 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); 	// 지도 생성
var geocoder = new daum.maps.services.Geocoder();		// 주소-좌표 변환 객체 생성
var addressArray = [];
var priceArray = [];
var count = $('#count').val();



console.log('count : ' + count);

for (var i = 0 ; i < count ; i++) {
	addressArray.push({
		'groupAddress' : $("input[name='map-address']").eq(i).val()
	});
	priceArray.push({
		'groupPrice' : $("input[name='map-price']").eq(i).val()
	});
}

// 마커 이미지의 이미지 주소
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

for (var i = 0 ; i < count ; i++) {
	let price = priceArray[i].groupPrice
	geocoder.addressSearch(
		addressArray[i].groupAddress,
		function(result, status, data) {

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
					title : price
				});

				/* 지도에 마커 표시 */
				marker.setMap(map);
			}
	});
}
