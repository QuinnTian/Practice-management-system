//如果存储了年纪，
if (localStorage.grade) {
	$("#year").val(localStorage.grade);
	$("#grade").val(localStorage.year);
	$("#btn").click();
} else {
	//如果不存在，则直接取存储的年份
	localStorage.grade = $("#year").val();
	localStorage.year = $("#grade").val();
}
