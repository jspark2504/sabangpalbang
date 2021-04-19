/* 사진 추가 및 삭제 처리 */
const $addBtn = document.getElementById("addImgBtn");

let i = 1;	// 추가할 파일의 id 번호

$addBtn.onclick = function () {

	/* 사진 최대 개수 제한 */
	if(document.getElementsByName('files').length >= 10) {
		alert('최대 등록 개수를 초과하였습니다.');

	} else {
		$(".file-area").append("<input type='file' name='files' id='file" + i + "' onchange='loadImg(this," + i + ")'>")
	    $(".file-area input:last-of-type").click();
	}
};

/* 이미지 미리보기 생성 */
function loadImg(value) {

    if (value.files && value.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            $("figure").append("<div><img name='imgs' id='img" + i + "'><span class='remove-btn' onclick='removeFile(this," + i + ");'><img src='data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMi4wMDAwMXB0IiB2aWV3Qm94PSIwIDAgNTEyLjAwMDAxIDUxMi4wMDAwMSIgd2lkdGg9IjUxMi4wMDAwMXB0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Im04MCAxNmgzNTJjMzUuMzQ3NjU2IDAgNjQgMjguNjUyMzQ0IDY0IDY0djM1MmMwIDM1LjM0NzY1Ni0yOC42NTIzNDQgNjQtNjQgNjRoLTM1MmMtMzUuMzQ3NjU2IDAtNjQtMjguNjUyMzQ0LTY0LTY0di0zNTJjMC0zNS4zNDc2NTYgMjguNjUyMzQ0LTY0IDY0LTY0em0wIDAiIGZpbGw9IiNmZmM0NzciLz48ZyBmaWxsPSIjM2UzZDQyIj48cGF0aCBkPSJtNDMyIDBoLTM1MmMtNDQuMTYwMTU2LjA1NDY4NzUtNzkuOTQ1MzEyNSAzNS44Mzk4NDQtODAgODB2MzUyYy4wNTQ2ODc1IDQ0LjE2MDE1NiAzNS44Mzk4NDQgNzkuOTQ1MzEyIDgwIDgwaDM1MmM0NC4xNjAxNTYtLjA1NDY4OCA3OS45NDUzMTItMzUuODM5ODQ0IDgwLTgwdi0zNTJjLS4wNTQ2ODgtNDQuMTYwMTU2LTM1LjgzOTg0NC03OS45NDUzMTI1LTgwLTgwem00OCA0MzJjMCAyNi41MDc4MTItMjEuNDkyMTg4IDQ4LTQ4IDQ4aC0zNTJjLTI2LjUxMTcxOSAwLTQ4LTIxLjQ4ODI4MS00OC00OHYtMzUyYzAtMjYuNTA3ODEyIDIxLjQ4ODI4MS00OCA0OC00OGgzNTJjMjYuNTA3ODEyIDAgNDggMjEuNDg4MjgxIDQ4IDQ4em0wIDAiLz48cGF0aCBkPSJtMzgwLjQ0OTIxOSAxMDguOTI5Njg4LTEyNC40NDkyMTkgMTI0LjQ0NTMxMi0xMjQuNDQ5MjE5LTEyNC40NDUzMTItMjIuNjIxMDkzIDIyLjYyMTA5MyAxMjQuNDQ1MzEyIDEyNC40NDkyMTktMTI0LjQ0NTMxMiAxMjQuNDQ5MjE5IDIyLjYyMTA5MyAyMi42MjEwOTMgMTI0LjQ0OTIxOS0xMjQuNDQ1MzEyIDEyNC40NDkyMTkgMTI0LjQ0NTMxMiAyMi42MjEwOTMtMjIuNjIxMDkzLTEyNC40NDUzMTItMTI0LjQ0OTIxOSAxMjQuNDQ1MzEyLTEyNC40NDkyMTl6bTAgMCIvPjwvZz48L3N2Zz4=' /></span></div>");
            document.getElementById("img" + i).src = e.target.result;
			i++;
        };

        reader.readAsDataURL(value.files[0]);
    }
}

/* 사진 삭제 기능 */
function removeFile(btn, no) {
 	const removedFileId = "file" + no;
    /* 이미지 삭제 */
    $(btn).closest("div").remove();
	/* 파일 삭제 */
	$("#" + removedFileId).remove();
}



/* 주소 검색 api */
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(37.47837, 126.95149), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

//지도를 미리 생성
var map = new kakao.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.47837, 126.95149),
    map: map
});


function search() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.jibunAddress;	// 지번 주소 가져오기

            document.getElementById("address").value = addr;	// 가져온 주소를 input태그에 넣기
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(addr, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open();
}

