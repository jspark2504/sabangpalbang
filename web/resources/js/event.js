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
}