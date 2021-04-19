/* 사진 추가 및 삭제 처리 */
const $addBtn = document.getElementById("addImgBtn");

let i = 1;

/* 사진 로드 */

$addBtn.onclick = function () {
    $("input[name='" + fileName + "']").click();
};

/* 이미지 미리보기 생성 */
function loadImg(value) {
    const imgId = "img" + i;

    if (value.files && value.files[0]) {
        const reader = new FileReader();

        reader.onload = function (e) {
            $("figure").append(
                "<div><img id='" +
                    imgId +
                    "'><span class='remove-btn' onclick='removeFile(this);'><img src='data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMi4wMDAwMXB0IiB2aWV3Qm94PSIwIDAgNTEyLjAwMDAxIDUxMi4wMDAwMSIgd2lkdGg9IjUxMi4wMDAwMXB0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Im04MCAxNmgzNTJjMzUuMzQ3NjU2IDAgNjQgMjguNjUyMzQ0IDY0IDY0djM1MmMwIDM1LjM0NzY1Ni0yOC42NTIzNDQgNjQtNjQgNjRoLTM1MmMtMzUuMzQ3NjU2IDAtNjQtMjguNjUyMzQ0LTY0LTY0di0zNTJjMC0zNS4zNDc2NTYgMjguNjUyMzQ0LTY0IDY0LTY0em0wIDAiIGZpbGw9IiNmZmM0NzciLz48ZyBmaWxsPSIjM2UzZDQyIj48cGF0aCBkPSJtNDMyIDBoLTM1MmMtNDQuMTYwMTU2LjA1NDY4NzUtNzkuOTQ1MzEyNSAzNS44Mzk4NDQtODAgODB2MzUyYy4wNTQ2ODc1IDQ0LjE2MDE1NiAzNS44Mzk4NDQgNzkuOTQ1MzEyIDgwIDgwaDM1MmM0NC4xNjAxNTYtLjA1NDY4OCA3OS45NDUzMTItMzUuODM5ODQ0IDgwLTgwdi0zNTJjLS4wNTQ2ODgtNDQuMTYwMTU2LTM1LjgzOTg0NC03OS45NDUzMTI1LTgwLTgwem00OCA0MzJjMCAyNi41MDc4MTItMjEuNDkyMTg4IDQ4LTQ4IDQ4aC0zNTJjLTI2LjUxMTcxOSAwLTQ4LTIxLjQ4ODI4MS00OC00OHYtMzUyYzAtMjYuNTA3ODEyIDIxLjQ4ODI4MS00OCA0OC00OGgzNTJjMjYuNTA3ODEyIDAgNDggMjEuNDg4MjgxIDQ4IDQ4em0wIDAiLz48cGF0aCBkPSJtMzgwLjQ0OTIxOSAxMDguOTI5Njg4LTEyNC40NDkyMTkgMTI0LjQ0NTMxMi0xMjQuNDQ5MjE5LTEyNC40NDUzMTItMjIuNjIxMDkzIDIyLjYyMTA5MyAxMjQuNDQ1MzEyIDEyNC40NDkyMTktMTI0LjQ0NTMxMiAxMjQuNDQ5MjE5IDIyLjYyMTA5MyAyMi42MjEwOTMgMTI0LjQ0OTIxOS0xMjQuNDQ1MzEyIDEyNC40NDkyMTkgMTI0LjQ0NTMxMiAyMi42MjEwOTMtMjIuNjIxMDkzLTEyNC40NDUzMTItMTI0LjQ0OTIxOSAxMjQuNDQ1MzEyLTEyNC40NDkyMTl6bTAgMCIvPjwvZz48L3N2Zz4=' /></span></div>"
            );
            document.getElementById(imgId).src = e.target.result;
        };

        i++;
        fileName = fileName.substr(0, 4) + i;

        reader.readAsDataURL(value.files[0]);
    }
}

function removeFile(btn) {
//    const removedImgId = $(btn).prev().attr("id"); // 삭제된 이미지의 id 속성값
//    const removedImgNo = parseInt(removedImgId.substr(3)); // 삭제된 이미지의 번호
//	const removedFileName = "file" + removedImgNo;

    /* 이미지 삭제 */
    $(btn).closest("div").remove();
	/* 파일 삭제 */
//	$("input[name='" + removedFileName + "']").select();
//	document.selection.clear();

    /* 이미지 ID 및 파일 input name 변경 */
//    for (let j = removedImgNo + 1; j < i; j++) {
//        let imgIdNow = "img" + j;
//        let imgIdNew = "img" + (j - 1);
//        console.log("imgIdNow", imgIdNow);
 //       console.log("imgIdNew", imgIdNew);

//        let fileNameNow = "file" + j;
 //       let fileNameNew = "file" + (j - 1);
 //       console.log("fileNameNow", fileNameNow);
  //      console.log("fileNameNew", fileNameNew);

    //    document.getElementById(imgIdNow).attr("id", imgIdNew);
      //  $("input[name='" + fileNameNow + "']").attr("name", fileNameNew);

        //console.log(imgIdNow, imgIdNew);
        //console.log(fileNameNow, fileNameNew);
    //}

   // i--;
    //fileName = fileName.substr(0, 4) + i;
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

$(function(){
	var addr = $('#address').val();
	geocoder.addressSearch(addr, function(result, status) {
		/* 검색 성공 시 */
	    if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            map.setCenter(coords);
            marker.setPosition(coords)
	    }
	});
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

