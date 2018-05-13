//保存验证的方法
	function doAdd() {
		var org_code = document.getElementById("org_code");
		var org_name = document.getElementById("org_name");
		var begin_Time = document.getElementById("begin_Time");
		var par_dept = document.getElementById("par_dept");
		var contactDept = document.getElementById("contactDept");
		var contacts = document.getElementById("contacts");
		var org_level = document.getElementsByName("org_level");
		var phone = $("#phone").val();
		var information = $("#infor").html();
		var orgName_infor = $("#orgName_infor").html();
		
		var a = $("#par_dept").find("option:selected")[0].className;
		var org_value = $("#org_level:checked").val();
		
		var contactss = document.getElementById("contactss");
		
		if (org_code.val == "") {
			alert("组织编码不能为空！");
			org_code.focus();
			return null;
		}
		if (org_name.value == "") {
			alert("组织名称不能为空！");
			org_name.focus();
			return null;
		}
		var p = /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]/;
		if(!p.test(org_code.value)){
			alert("组织编码不可以包含汉字！");
			return null;
		}
		if (information.length >= 7) {
			alert("组织编码重复，请重新输入");
			return null;
		}
		if (orgName_infor.length >= 5) {
			alert("组织名称重复，请重新输入");
			return null;
		}
		
		for (var i = 0; i < org_level.length; i++) {
			if (org_level[i].checked == true) {
				temp = 1;
				break;
			} else {
				temp = 0;
			}
		}
		if (temp == 0) {
			alert("请选择组织级别");
			return false;
		}
		
		var isMobile = /^(?:13\d|17\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //手机号码验证规则    手机验证规则错误178***
		var isPhone = /^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/; //座机验证规则
		if (!isMobile.test(phone) && !isPhone.test(phone)) { //如果用户输入的值不同时满足手机号和座机号的正则
			alert("请正确填写电话号码，例如:13415764179或0321-4816048"); //就弹出提示信息
			$("#phone").focus(); //输入框获得光标
			return false; //返回一个错误，不向下执行
		}
		if (phone == "") {
			alert("请填写手机号！");
			return null;
		}
		
		if (org_value == "5") {//班级的情况下班主任是必须填写的。保存在班主任字段和联系人字段
			if (begin_Time.value == "") {
				alert("请填写班级入学时间！");
				return false;
			}
			if (par_dept.value == "请选择") {
				alert("请选择上级组织！");
				return false;
			}
			if (contactss.value == "") {
				alert("请选择班主任！");
				return false;
			}
			if (contactss.value == "请选择") {
				alert("请选择班主任！");
				return false;
			}
		}
		
		if (org_value == "3") {
			if (contacts.value == "") {
				alert("请选择组织联系人！");
				return false;
			}
			if (contacts.value == "请选择") {
				alert("请选择组织联系人！");
				return false;
			}
			/*if (par_dept.value == "请选择") {
				alert("请选择上级组织！");
				return false;
			}*/
		}
		
		
		
		
		document.forms[0].submit();
	}