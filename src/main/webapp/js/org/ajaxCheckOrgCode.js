//ajax 进行组织编码是否重复验证
	function ajaxCheckOrgCode() {
		/*alert("1");*/
		$.ajax({
			type : "get",
			url : "checkOrgCode.do?",
			data : getOrgCode(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showOrgCode(data);
			},
			error : function(result, ocode) { //出错时会执行这里的回调函数                     
				if (ocode == 'error') {
				}
			}
		});
	}
	//得到组织编码
	function getOrgCode() {
		var org_code = document.getElementById("org_code").value;
		var oc = "org_code=" + org_code;
		return oc;
	}
	//显示ajax查询结果
	function showOrgCode(ajaxData) {
		var showOrgCode = eval(ajaxData);
		if (showOrgCode == ("success")) {
			var a = window.document.getElementById("infor");
			a.style.color = "008B00";
			a.innerHTML = "组织编码可用";
		} else {
			var a = window.document.getElementById("infor");
			a.style.color = "#DC143C";
			a.innerHTML = "组织编码在数据库中有重复！";
		}
	}