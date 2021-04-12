/* 아이디 중복 확인 */
$(function () {
	$("#inputId").keyup(function (e) {
		const inputId = document.getElementById("inputId").value.toLowerCase();
		console.log(inputId);
		$.ajax({
			url: "/findMyRoom/member/regist/checkid",
			type: "get",
			data: { inputId : inputId },
			success: function(data){
				if(data == "true") {
					$(".input-id + p").remove();
					$(".input-id-addon").css("background-color", "#ffd233");
					$(".input-id-addon i").css("color", "white");

				} else {
					$(".input-id + p").remove();
					$(".input-id").after("<p style='color: #ff7c7c; padding-left: 2px;'>중복된 아이디입니다.</p>");
					$(".input-id-addon").css("background-color", "white");
					$(".input-id-addon i").css("color", "#ff7c7c");
				}
			},
			error: function(error){
				console.log(error);
			}
		});
    })
})