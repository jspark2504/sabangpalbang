function showDetail() {
	const no = $(this).find("#roomNo").val();
	alert(no);
	$.ajax({
		url: "/findMyRoom/room/detail",
		type: "get",
		data: { no : no },
		success: function(data) {
			const price = data.price;
			const area = data.area;
			const address = data.address;
			const createDate = data.createDate;
			const categoryNo = data.category.no;
			const categoryName = data.category.name;
			const officeNo = data.office.no;
			const officeName = data.office.name;
			const officeAddr = data.office.addr;
			const officePhone = data.office.phone;
			const officeRating = data.office.rating;
			const agentNo = data.office.agent.no;
			const agentName = data.office.agent.nickname;
			const floor = data.floor;
			const direction = data.direction;
			const monthCost = data.monthCost;
			const costInclude = data.costInclude;
			const constructionDate = data.constructionDate;
			const availableDate = data.availableDate;
			const explanation = data.explanation;
			const transportationInfo = data.transportationInfo;
			const washingMachine = data.washingMachine;
			const refrigerator = data.refrigerator;
			const airConditioner = data.airConditioner;
			const gasStove = data.gasStove;
			const pet = data.pet;
			const elevator = data.elevator;
			const parking = data.parking;
			const viewNo = data.viewNo;

			$(".room-list ul").css('display', 'none');
			$(".room-list ul").after("<button onclick='showList();'>뒤로가기</button>");
		},
		error: function(error) {
			console.log(error);
		}
	});
}

function showList() {
	$(".room-list button").remove();
	$(".room-list ul").css('display', 'block');
}

function search() {

}