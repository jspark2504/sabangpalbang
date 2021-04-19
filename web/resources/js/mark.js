var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.47837, 126.95149), // 지도의 중심좌표 (관악구청)
        level: 6 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); 	// 지도 생성
var geocoder = new daum.maps.services.Geocoder();		// 주소-좌표 변환 객체 생성

var positions = [
   {
       title: '전세 8,000',
       latlng: new kakao.maps.LatLng(37.473735848420134, 126.92032668829279)
   },
   {
       title: '전세 4,000',
       latlng: new kakao.maps.LatLng(37.4663242403754, 126.93549076218895)
   },
   {
       title: '전세 9,000',
       latlng: new kakao.maps.LatLng(37.480578495258335, 126.94069606371099)
   },
   {
      title: '전세 6,500',
      latlng: new kakao.maps.LatLng(37.47869308657151, 126.94057670568417)
   },
   {
      title: '전세 5,000',
      latlng: new kakao.maps.LatLng(37.478363645206485, 126.9406212182858)
   },
   {
      title: '전세 7,000',
      latlng: new kakao.maps.LatLng(37.47881858463524, 126.94078743679336)
   },
   {
      title: '전세 1억',
      latlng: new kakao.maps.LatLng(37.481164681654576, 126.93213331945347)
   },
   {
      title: '전세 1억',
      latlng: new kakao.maps.LatLng(37.48035476875411, 126.9240520187745)
   },
   {
      title: '전세 2,000',
      latlng: new kakao.maps.LatLng(37.48641803173326, 126.9277632803373)
   },
   {
      title: '전세 6,000',
      latlng: new kakao.maps.LatLng(37.48897363349846, 126.92466097631957)
   },
   {
      title: '전세 7,000',
      latlng: new kakao.maps.LatLng(37.48126652224916, 126.93279009089393)
   },
   {
      title: '전세 4,500',
      latlng: new kakao.maps.LatLng(37.487015236378994, 126.92797653628583)
   },
   {
      title: '전세 8,000',
      latlng: new kakao.maps.LatLng(37.47881858544253, 126.9407337923548)
   },
   {
      title: '전세 1억 5,000',
      latlng: new kakao.maps.LatLng(37.47484157084199, 126.96145836249673)
   },
   {
      title: '전세 3,000',
      latlng: new kakao.maps.LatLng(37.48602725396063, 126.9285104341921)
   },
   {
      title: '전세 9,000',
      latlng: new kakao.maps.LatLng(37.486015333628146, 126.94819279364143)
   },
   {
      title: '전세 4,500',
      latlng: new kakao.maps.LatLng(37.484796683127385, 126.95411902151854)
   },
   {
      title: '전세 9,000',
      latlng: new kakao.maps.LatLng(37.48042861125128, 126.92339296220234)
   },
   {
      title: '전세 1억 5,000',
      latlng: new kakao.maps.LatLng(37.47109428532695, 126.97233883255373)
   },
   {
      title: '전세 5,000',
      latlng: new kakao.maps.LatLng(37.46939451152983, 126.93673779014402)
   },
   {
      title: '전세 7,000',
      latlng: new kakao.maps.LatLng(37.48058805216562, 126.95918727851158)
   },
   {
      title: '전세 9,000',
      latlng: new kakao.maps.LatLng(37.48451127615081, 126.92653170393352)
   },
   {
      title: '전세 6,000',
      latlng: new kakao.maps.LatLng(37.48535362769397, 126.93105202048534)
   },
   {
      title: '전세 8,000',
      latlng: new kakao.maps.LatLng(37.474790288597006, 126.96152191903388)
   },
   {
      title: '전세 7,000',
      latlng: new kakao.maps.LatLng(37.46942005754413, 126.93672706199699)
   },
   {
      title: '전세 1억 5,000',
      latlng: new kakao.maps.LatLng(37.47234158705266, 126.97333774988793)
   },
   {
      title: '전세 1억 2,000',
      latlng: new kakao.maps.LatLng(37.476283619948966, 126.92940883331829)
   },
   {
      title: '전세 1억 3,000',
      latlng: new kakao.maps.LatLng(37.48913972760902, 126.93202258131352)
   },
   {
      title: '전세 1억 2,000',
      latlng: new kakao.maps.LatLng(37.47770150410275, 126.91678949039475)
   },
   {
      title: '전세 1억',
      latlng: new kakao.maps.LatLng(37.46546880547675, 126.93954747655056)
   },
   {
      title: '전세 3억',
      latlng: new kakao.maps.LatLng(37.47745761817143, 126.94541693508246)
   },
   {
      title: '전세 1억 4,000',
      latlng: new kakao.maps.LatLng(37.48934938370302, 126.93528022176632)
   },
   {
      title: '전세 3억 2,000',
      latlng: new kakao.maps.LatLng(37.493007398247094, 126.93140033358938)
   },
   {
      title: '전세 3억',
      latlng: new kakao.maps.LatLng(37.48663167889653, 126.93897330595357)
   },
   {
      title: '전세 1억',
      latlng: new kakao.maps.LatLng(37.489545496937865, 126.94227830646285)
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