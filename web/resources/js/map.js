var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.47837, 126.95149), // 지도의 중심좌표 (관악구청)
        level: 6 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); 	// 지도 생성
var geocoder = new daum.maps.services.Geocoder();		// 주소-좌표 변환 객체 생성

let positions = [];		// 마커를 표시할 위치와 title 객체 배열
$(function(){
	let count = document.getElementsByName("roomNo").length;	// 매물 목록의 수
	console.log('count : ' + count);

	for(let i = 0 ; i < count ; i++) {
		let price = document.getElementsByName("price")[i].value;
		let address = document.getElementsByName("address")[i].value;

		/* 주소를 좌표로 변환 */
			geocoder.addressSearch(address, function(result, status) {
			/* 검색 성공 시 */
		    if (status === kakao.maps.services.Status.OK) {
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    }
			positions.push({ title: price, latlng: coords });

		});
	}

});


var positions = [
   {
       title: '전세 5,000',
       latlng: new kakao.maps.LatLng(37.46941, 126.93679)
   },
   {
       title: '관악구청',
       latlng: new kakao.maps.LatLng(37.47837, 126.95149)
   },
   {
       title: '텃밭',
       latlng: new kakao.maps.LatLng(33.450879, 126.569940)
   },
   {
       title: '근린공원',
       latlng: new kakao.maps.LatLng(33.451393, 126.570738)
   }
 ];

// 마커 이미지의 이미지 주소
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

for (var i = 0; i < positions.length; i ++) {

    // 마커 이미지의 이미지 크기
    var imageSize = new kakao.maps.Size(24, 35);

    // 마커 이미지를 생성
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

    // 마커를 생성
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지
    });
}