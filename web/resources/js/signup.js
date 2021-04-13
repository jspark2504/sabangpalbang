/* 아이디 중복 확인 */
$(function () {
	$("#inputId").keyup(function (e) {
		const inputId = document.getElementById("inputId").value.toLowerCase();
		$.ajax({
			url: "/findMyRoom/member/regist/checkId",
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

				if(inputId == ""){
					$(".input-id + p").remove();
					$(".input-id-addon").css("background-color", "white");
					$(".input-id-addon i").css("color", "black");
				}
			},
			error: function(error){
				console.log(error);
			}
		});
    })
})

/* 닉네임 중복 확인 */
$(function () {
	$("#inputNickname").keyup(function (e) {
		const inputNickname = document.getElementById("inputNickname").value;
		console.log(inputNickname);
		$.ajax({
			url: "/findMyRoom/member/regist/checkNickname",
			type: "get",
			data: { inputNickname : inputNickname },
			success: function(data){
				if(data == "true") {
					$(".input-nickname + p").remove();
					$(".input-nickname-addon").css("background-color", "#ffd233");
					$(".input-nickname-addon i").css("color", "white");

				} else {
					$(".input-nickname + p").remove();
					$(".input-nickname").after("<p style='color: #ff7c7c; padding-left: 2px;'>중복된 닉네임입니다.</p>");
					$(".input-nickname-addon").css("background-color", "white");
					$(".input-nickname-addon i").css("color", "#ff7c7c");
				}

				if(inputNickname == ""){
					$(".input-nickname + p").remove();
					$(".input-nickname-addon").css("background-color", "white");
					$(".input-nickname-addon i").css("color", "black");
				}
			},
			error: function(error){
				console.log(error);
			}
		});
    })
})

/* 이메일 중복 확인 */
$(function () {
	$("#inputEmail").keyup(function (e) {
		const inputEmail = document.getElementById("inputEmail").value.toLowerCase();
		$.ajax({
			url: "/findMyRoom/member/regist/checkEmail",
			type: "get",
			data: { inputEmail : inputEmail },
			success: function(data){
				if(data == "true") {
					$(".input-email + p").remove();
					$(".input-email-addon").css("background-color", "#ffd233");
					$(".input-email-addon i").css("color", "white");

				} else {
					$(".input-email + p").remove();
					$(".input-email").after("<p style='color: #ff7c7c; padding-left: 2px;'>이미 가입되어 있는 이메일입니다.</p>");
					$(".input-email-addon").css("background-color", "white");
					$(".input-email-addon i").css("color", "#ff7c7c");
				}

				if(inputEmail == ""){
					$(".input-email + p").remove();
					$(".input-email-addon").css("background-color", "white");
					$(".input-email-addon i").css("color", "black");
				}
			},
			error: function(error){
				console.log(error);
			}
		});
    })
})

/* 휴대폰 중복 확인 */
$(function () {
	$("#inputPhone").keyup(function (e) {
		const inputPhone = document.getElementById("inputPhone").value;
		$.ajax({
			url: "/findMyRoom/member/regist/checkPhone",
			type: "get",
			data: { inputPhone : inputPhone },
			success: function(data){
				if(data == "true") {
					$(".input-phone + p").remove();
					$(".input-phone-addon").css("background-color", "#ffd233");
					$(".input-phone-addon i").css("color", "white");

				} else {
					$(".input-phone + p").remove();
					$(".input-phone").after("<p style='color: #ff7c7c; padding-left: 2px;'>이미 가입되어 있는 번호입니다.</p>");
					$(".input-phone-addon").css("background-color", "white");
					$(".input-phone-addon i").css("color", "#ff7c7c");
				}

				if(inputPhone == ""){
					$(".input-phone + p").remove();
					$(".input-phone-addon").css("background-color", "white");
					$(".input-phone-addon i").css("color", "black");
				}
			},
			error: function(error){
				console.log(error);
			}
		});
    })
})