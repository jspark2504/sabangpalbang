window.onload = function(){

	if(document.getElementById("writeFreeBoard")) {
		const $writeFreeBoard = document.getElementById("writeFreeBoard");
		$writeFreeBoard.onclick = function(){
			location.href = "/findMyRoom/freeBoard/insert";
		}
	}
	if(document.getElementById("deleteFreeBoard")) {
		const $deleteFreeBoard = document.getElementById("deleteFreeBoard");
		$deleteFreeBoard.onclick = function(){
			location.href = "/findMyRoom/freeBoard/delete";
		}
	}
	if(document.getElementById("writeInfoBoard")) {
		const $writeInfoBoard = document.getElementById("writeInfoBoard");
		$writeInfoBoard.onclick = function(){
			location.href = "/findMyRoom/infoboard/insert";
		}
	}
	if(document.getElementById("deleteInfoBoard")) {
		const $deleteInfoBoard = document.getElementById("deleteInfoBoard");
		$deleteInfoBoard.onclick = function(){
			location.href = "/findMyRoom/InfoBoard/delete";
		}
	}
	
	
}