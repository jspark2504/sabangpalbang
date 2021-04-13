/* 각 입력 항목의 이벤트 발생에 따른 중복확인, 비밀번호 재입력 확인, 정규표현식 검사 */

/* 아이디 */
/* focus 이벤트 */
$("#inputId").focus(function() {
	/* 안내 문구가 표시되어 있지 않고 입력한 값이 없을 때만 안내 문구 추가 */
	if(!$(".input-id + p").length && document.getElementById("inputId").value == ""){
		$(".input-id").after("<p style='color: black;'>* 6자 이상의 영문 혹은 영문과 숫자를 조합</p>");
	}
}).blur(function() {
	/* 포커스 사라진 경우 사용자가 입력한 값이 없을 때만 안내 문구 삭제 */
	if(document.getElementById("inputId").value == ""){
		$(".input-id + p").remove();
	}
})

/* keyup 이벤트 */
$("#inputId").keyup(function(e) {
	const inputId = document.getElementById("inputId").value;		// 사용자가 입력한 아이디
	const regExp = /^(?!(?:[0-9]+)$)([a-zA-Z]|[0-9a-zA-Z]){6,}$/;	// 6자 이상의 영문 혹은 영문과 숫자를 조합

	/* 정규표현식 검사 */
	if(!regExp.test($(this).val())) {		// 정규표현식 불합치
		$(".input-id + p").remove();
		$(".input-id").after("<p style='color: #ff7c7c;'>* 6자 이상의 영문 혹은 영문과 숫자를 조합</p>");
		$(".input-id-addon i").attr("class", "fas fa-times").css("color", "#ff7c7c");

		/* 사용자가 입력한 내용을 모두 지운 경우 */
		if(inputId == "") {
			$(".input-id + p").css("color", "black");
			$(".input-id-addon i").attr("class", "fas fa-minus").css("color", "black");
		}

	} else {								// 정규표현식 합치
		$(".input-id + p").remove();
		$(".input-id-addon i").attr("class", "fas fa-check").css("color", "#ffd233");

		/* 정규표현식에 합치된 경우에만 ajax를 통해 아이디 중복확인 */
		$.ajax({
			url: "/findMyRoom/member/regist/checkId",
			type: "get",
			data: { inputId : inputId },
			success: function(data){
				if(data == "true") {		// 아이디가 사용 가능한 경우
					$(".input-id + p").remove();
					$(".input-id-addon i").attr("class", "fas fa-check").css("color", "#ffd233");

				} else {					// 아이디가 사용 불가능한 경우
					$(".input-id + p").remove();
					$(".input-id").after("<p style='color: #ff7c7c;'>중복된 아이디입니다.</p>");
					$(".input-id-addon i").attr("class", "fas fa-times").css("color", "#ff7c7c");
				}
			},
			error: function(error){
				console.log(error);
			}
		});
	}
})


/* 닉네임 */
$("#inputNickname").keyup(function (e) {
	const inputNickname = document.getElementById("inputNickname").value;

	/* ajax를 이용한 닉네임 중복확인 */
	$.ajax({
		url: "/findMyRoom/member/regist/checkNickname",
		type: "get",
		data: { inputNickname : inputNickname },
		success: function(data){
			if(data == "true") {		// 닉네임이 사용 가능한 경우
				$(".input-nickname + p").remove();
				$(".input-nickname-addon i").attr("class", "fas fa-check").css("color", "#ffd233");

			} else {					// 닉네임이 사용 불가능한 경우
				$(".input-nickname + p").remove();
				$(".input-nickname").after("<p style='color: #ff7c7c;'>중복된 닉네임입니다.</p>");
				$(".input-nickname-addon i").attr("class", "fas fa-times").css("color", "#ff7c7c");
			}

			/* 사용자가 입력한 내용을 모두 지운 경우 */
			if(inputNickname == ""){
				$(".input-nickname + p").remove();
				$(".input-nickname-addon i").attr("class", "fas fa-minus").css("color", "black");
			}
		},
		error: function(error){
			console.log(error);
		}
	});
})


/* 이메일 */
$("#inputEmail").keyup(function (e) {
	const inputEmail = document.getElementById("inputEmail").value;

	/* ajax를 이용한 이메일 중복확인 */
	$.ajax({
		url: "/findMyRoom/member/regist/checkEmail",
		type: "get",
		data: { inputEmail : inputEmail },
		success: function(data){
			if(data == "true") {		// 사용 가능한 이메일인 경우
				$(".input-email + p").remove();
				$(".input-email-addon i").attr("class", "fas fa-check").css("color", "#ffd233");

			} else {					// 사용 불가능한 이메일인 경우
				$(".input-email + p").remove();
				$(".input-email").after("<p style='color: #ff7c7c;'>이미 가입되어 있는 이메일입니다.</p>");
				$(".input-email-addon i").attr("class", "fas fa-times").css("color", "#ff7c7c");
			}

			/* 사용자가 입력한 내용을 모두 지운 경우 */
			if(inputEmail == ""){
				$(".input-email + p").remove();
				$(".input-email-addon i").attr("class", "fas fa-minus").css("color", "black");
			}
		},
		error: function(error){
			console.log(error);
		}
	});
})


/* 휴대폰 */
$("#inputPhone").keyup(function (e) {
	const inputPhone = document.getElementById("inputPhone").value;

	/* ajax를 이용한 휴대폰 중복확인 */
	$.ajax({
		url: "/findMyRoom/member/regist/checkPhone",
		type: "get",
		data: { inputPhone : inputPhone },
		success: function(data){
			if(data == "true") {		// 사용 가능한 전화번호인 경우
				$(".input-phone + p").remove();
				$(".input-phone-addon i").attr("class", "fas fa-check").css("color", "#ffd233");

			} else {					// 사용 불가능한 전화번호인 경우
				$(".input-phone + p").remove();
				$(".input-phone").after("<p style='color: #ff7c7c; padding-left: 2px;'>이미 가입되어 있는 번호입니다.</p>");
				$(".input-phone-addon i").attr("class", "fas fa-times").css("color", "#ff7c7c");
			}

			if(inputPhone == ""){
				$(".input-phone + p").remove();
				$(".input-phone-addon i").attr("class", "fas fa-minus").css("color", "black");
			}
		},
		error: function(error){
			console.log(error);
		}
	});
})
