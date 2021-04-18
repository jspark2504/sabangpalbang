function nav(){

		let nav = $(".drop-menu").css('display');

		if(nav == 'none') {
			$(".drop-menu").css('display', 'block');

		} else {
			$(".drop-menu").css('display', 'none');
		}
}

const toggleBtn = document.querySelector('.navbar_toggleBtn');
const menu = document.querySelector('.navbar_menu');

toggleBtn.addEventListener('click', () => {
  menu.classList.toggle('active');
});

