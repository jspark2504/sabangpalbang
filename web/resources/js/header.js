function nav(){

		let nav = $(".drop-menu").css('display');

		if(nav == 'none') {
			$(".drop-menu").css('display', 'block');

		} else {
			$(".drop-menu").css('display', 'none');
		}
}