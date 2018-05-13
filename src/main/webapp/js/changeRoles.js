function toMainPage() {
	var sele = $("#roles option:selected").val();
	// alert(sele);
	setCookie("ck", sele);

	var mainPage = "";
	if (sele.indexOf("ROLE_ADMIN") != -1) {
		mainPage = "/springmvc_mybatis/admin/index.do";
	} else if (sele.indexOf("ROLE_TEACHER") != -1) {
		mainPage = "/springmvc_mybatis/teacher/index.do";
	} else if (sele.indexOf("ROLE_LEADER") != -1) {
		mainPage = "/springmvc_mybatis/leader/index.do";
	} else if (sele.indexOf("ROLE_COMPANY") != -1) {
		mainPage = "/springmvc_mybatis/leader/index.do";
	} else if (sele.indexOf("ROLE_STUDENT") != -1) {
		mainPage = "/springmvc_mybatis/student/index.do";
	}
	/*
	 * else if(sele=="ROLE_ADMIN_EMPLOYMENT") {
	 * mainPage="/springmvc_mybatis/admin/index.do"; }
	 */
	window.location.href = mainPage + "?current_role_selected=" + sele;
}
function setCookie(true_role, role_id) {

	document.cookie = true_role + '=' + role_id+";path=/";
}

function getCookie(role_id) {
	var arr = document.cookie.split('=');

	if (arr[0] == role_id) {
		alert(arr[1]);
	}
}

function removeCookie(true_role) {
	setCookie(true_role, -1);
}