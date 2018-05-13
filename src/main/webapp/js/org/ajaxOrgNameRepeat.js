
	//ajax验证组织名是否重复
	function ajaxOrgNameRepeat() {
		$.ajax({
			type : "get",
			url : "ajaxOrgNameRepeat.do?",
			data : getOrgName(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为text                
			success : function(data) { //成功时执行的方法					
				showInfor(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getOrgName() {
		var a = $("#org_name").val();
		var org_name = encodeURI(a);
		content = encodeURI(org_name);
		var dataSend = "content=" + content;
		return dataSend;
	}
	function showInfor(ajaxData) {
		$("#orgName_infor").html(ajaxData);
	}
