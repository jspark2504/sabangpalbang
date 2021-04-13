/* 각 입력 항목의 이벤트 발생에 따른 중복확인, 비밀번호 재입력 확인, 정규표현식 검사 */

/* 아이디 */
/* 입력 안내 문구 */
$("#inputId").focus(function() {
	/* 안내 문구가 표시되어 있지 않고 입력한 값이 없을 때만 안내 문구 추가 */
	if(!$(".input-id + p").length && $(this).val() == ""){
		$(".input-id").after("<p style='color: black;'>* 6자 이상의 영문 혹은 영문과 숫자를 조합</p>");
	}
}).blur(function() {
	/* 포커스 사라진 경우 사용자가 입력한 값이 없을 때만 안내 문구 삭제 */
	if($(this).val() == ""){
		$(".input-id + p").remove();
	}
})

/* 정규표현식 검사 및 중복확인 */
$("#inputId").keyup(function(e) {
	const inputId = $(this).val();		// 사용자가 입력한 아이디
	const regExp = /^(?!(?:[0-9]+)$)([a-zA-Z]|[0-9a-zA-Z]){6,}$/;	// 6자 이상의 영문 혹은 영문과 숫자를 조합

	/* 정규표현식 검사 */
	if(!regExp.test(inputId)) {			// 정규표현식 불일치
		$(".input-id + p").remove();
		$(".input-id").after("<p style='color: #ff5959;'>* 6자 이상의 영문 혹은 영문과 숫자를 조합</p>");
		$(".input-id-addon i").attr("class", "fas fa-times").css("color", "#ff5959");

		/* 사용자가 입력한 내용을 모두 지운 경우 */
		if(inputId == "") {
			$(".input-id + p").css("color", "black");
			$(".input-id-addon i").attr("class", "fas fa-minus").css("color", "black");
		}

		check();

	} else {							// 정규표현식 일치
		/* 정규표현식 만족하는 경우에만 ajax를 통해 아이디 중복확인 */
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
					$(".input-id").after("<p style='color: #ff5959;'>중복된 아이디입니다.</p>");
					$(".input-id-addon i").attr("class", "fas fa-times").css("color", "#ff5959");
				}

				check();
			},
			error: function(error){
				console.log(error);
			}
		});
	}

});

/* 비밀번호 */
/* 입력 안내 문구 */
$("#inputPassword").focus(function() {
	/* 안내 문구가 표시되어 있지 않고 입력한 값이 없을 때만 안내 문구 추가 */
	if(!$(".input-pwd + p").length && $(this).val() == ""){
		$(".input-pwd").after("<p style='color: black;'>* 영문, 숫자 포함 8자 ~ 20자</p>");
	}
}).blur(function() {
	/* 포커스 사라진 경우 사용자가 입력한 값이 없을 때만 안내 문구 삭제 */
	if($(this).val() == ""){
		$(".input-pwd + p").remove();
	}
})

/* 비밀번호 정규 표현식 검사 */
$("#inputPassword").keyup(function(e) {
	const inputPwd = $(this).val();
	const regExp = /^(?=.*[a-zA-Z])(?=.*\d).{8,20}$/;	// 영문, 숫자 포함 8자 이상 20자 이하

	if(regExp.test(inputPwd)) {		// 정규표현식 일치
		$(".input-pwd + p").remove();
		$(".input-pwd-addon i").attr("class", "fas fa-check").css("color", "#ffd233");

	} else {						// 정규표현식 불일치
		$(".input-pwd + p").remove();
		$(".input-pwd").after("<p style='color: #ff5959;'>* 영문, 숫자 포함 8자 ~ 20자</p>");
		$(".input-pwd-addon i").attr("class", "fas fa-times").css("color", "#ff5959");
	}

	/* 사용자가 입력한 내용을 모두 지운 경우 */
	if(inputPwd == ""){
		$(".input-pwd + p").remove();
		$(".input-pwd-addon i").attr("class", "fas fa-minus").css("color", "black");
	}

	check();
})

/* 비밀번호 재입력 검사 */
$("#inputPasswordCheck").keyup(function(e) {
	const inputPwd1 = $("#inputPassword").val();	// 비밀번호
	const inputPwd2 = $(this).val();				// 비밀번호 재입력

	if(inputPwd1 === inputPwd2) {		// 비밀번호 입력값 일치
		$(".input-pwd-check + p").remove();
		$(".input-pwd-check-addon i").attr("class", "fas fa-check").css("color", "#ffd233");

	} else {							// 비밀번호 입력값 불일치
		$(".input-pwd-check + p").remove();
		$(".input-pwd-check").after("<p style='color: #ff5959;'>비밀번호가 일치하지 않습니다.</p>");
		$(".input-pwd-check-addon i").attr("class", "fas fa-times").css("color", "#ff5959");
	}

	/* 사용자가 입력한 내용을 모두 지운 경우 */
	if(inputPwd2 == ""){
		$(".input-pwd-check + p").remove();
		$(".input-pwd-check-addon i").attr("class", "fas fa-minus").css("color", "black");
	}

	check();
})


/* 닉네임 */
/* 중복확인 */
$("#inputNickname").keyup(function(e) {
	const inputNickname = $(this).val();

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
				$(".input-nickname").after("<p style='color: #ff5959;'>중복된 닉네임입니다.</p>");
				$(".input-nickname-addon i").attr("class", "fas fa-times").css("color", "#ff5959");
			}

			/* 사용자가 입력한 내용을 모두 지운 경우 */
			if(inputNickname == ""){
				$(".input-nickname + p").remove();
				$(".input-nickname-addon i").attr("class", "fas fa-minus").css("color", "black");
			}

			check();
		},
		error: function(error){
			console.log(error);
		}
	});
})


/* 이메일 */
/* 정규표현식 검사 및 중복확인 */
$("#inputEmail").keyup(function(e) {
	const inputEmail = $(this).val();
	const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;	// _@_.__

	/* 정규표현식 검사 */
	if(!regExp.test(inputEmail)) {		// 정규표현식 불일치
		$(".input-email + p").remove();
		$(".input-email").after("<p style='color: #ff5959;'>이메일 형식이 올바르지 않습니다.</p>");
		$(".input-email-addon i").attr("class", "fas fa-times").css("color", "#ff5959");

		/* 사용자가 입력한 내용을 모두 지운 경우 */
		if(inputEmail == ""){
			$(".input-email + p").remove();
			$(".input-email-addon i").attr("class", "fas fa-minus").css("color", "black");
		}

		check();

	} else {							// 정규표현식 일치
		/* 정규표현식 만족하는 경우에만 ajax를 통해 이메일 중복확인 */
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
					$(".input-email").after("<p style='color: #ff5959;'>이미 가입되어 있는 이메일입니다.</p>");
					$(".input-email-addon i").attr("class", "fas fa-times").css("color", "#ff5959");
				}

				check();
			},
			error: function(error){
				console.log(error);
			}
		});
	}
})


/* 휴대폰 */
/* 입력 안내 문구 */
$("#inputPhone").focus(function() {
	/* 안내 문구가 표시되어 있지 않고 입력한 값이 없을 때만 안내 문구 추가 */
	if(!$(".input-phone + p").length && $(this).val() == ""){
		$(".input-phone").after("<p style='color: black;'>* '-'를 제외한 숫자만 입력</p>");
	}
}).blur(function() {
	/* 포커스 사라진 경우 사용자가 입력한 값이 없을 때만 안내 문구 삭제 */
	if($(this).val() == ""){
		$(".input-phone + p").remove();
	}
})

/* 정규표현식 검사 및 중복확인 */
$("#inputPhone").keyup(function(e) {
	const inputPhone = $(this).val();
	const regExp = /^01([0|1|6|7|8|9])([0-9]{7,8})$/;		// 숫자만 입력, 01 + 0,1,6,7,8,9 중 하나 + 숫자 7-8개

	if(!regExp.test(inputPhone)) {		// 정규표현식 불일치
		$(".input-phone + p").remove();
		$(".input-phone").after("<p style='color: #ff5959;'>* '-'를 제외한 숫자만 입력</p>");
		$(".input-phone-addon i").attr("class", "fas fa-times").css("color", "#ff5959");

		/* 사용자가 입력한 내용을 모두 지운 경우 */
		if(inputPhone == ""){
			$(".input-phone + p").css("color", "black");
			$(".input-phone-addon i").attr("class", "fas fa-minus").css("color", "black");
		}

		check();

	} else {							// 정규표현식 일치
		/* 정규표현식 만족하는 경우에만 ajax를 통해 휴대폰 중복확인 */
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
					$(".input-phone").after("<p style='color: #ff5959;'>이미 가입되어 있는 번호입니다.</p>");
					$(".input-phone-addon i").attr("class", "fas fa-times").css("color", "#ff5959");
				}

				check();
			},
			error: function(error){
				console.log(error);
			}
		});
	}
})

/* 버튼 활성화 여부 체크 */
function check() {
	if($(".input-group-addon i").hasClass("fa-minus") || $(".input-group-addon i").hasClass("fa-times")){
		$(".okbtn").css('background','#bcbcbc').css('color','black').prop('disabled', true);
	} else {
		$(".okbtn").css('background','#ffd233').css('color','white').prop('disabled', false);
	}
}