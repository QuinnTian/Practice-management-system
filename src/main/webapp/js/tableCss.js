//表格各行换色
$(document).ready(function() { // 这个就是传说的ready
	$(".sjjx-table tr").mouseover(function() {
		console.log("隔行颜色处理");
		// 如果鼠标移到class为stripe的表格的tr上时，执行函数
		$(this).addClass("over");
	}).mouseout(function() {
		// 给这行添加class值为over，并且当鼠标一出该行时执行函数
		$(this).removeClass("over");
	}) // 移除该行的class
	$(".sjjx-table tr:even").addClass("alt");
	// 给class为stripe的表格的偶数行添加class值为alt
});