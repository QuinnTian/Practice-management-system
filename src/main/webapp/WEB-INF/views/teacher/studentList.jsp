<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript"
	src="/springmvc_mybatis/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	//根据年级得到实习任务
	/**
	 *  查出该老师的所选实习任务对应的学生
	 * 	周睿20160406 
	 */
	function changeCK() {
		var practice_id = $("#practice_id").val();
		var dataSend = "practice_id=" + practice_id;
		$.ajax({
			type : "post",
			url : "studentListByPraId.do",
			data : dataSend, //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				$("#stulist").html(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}

	$(function() {
		var lastGroupNmae = $("#lastGroupNmae").val();
		$("#practice_id").val(lastGroupNmae);
		changeCK();
	});

	//修改学生信息
	function doEdit() {
		var stu_id = $("input[name='postName']:checked").val();
		if (stu_id == undefined) {
			alert("请选择学生");
		} else {
			window.location.href = "editStudent.do?id=" + stu_id;
		}
	}
	//进入就业材料
	function doCheckMaterialsList() {
		var stu_id = $("input[name='postName']:checked").val();
		if (stu_id == undefined) {
			alert("请选择学生");
			return null;
		} else {
			window.location.href = "doCheckMaterialsList.do?stu_id=" + stu_id;
		}
	}
	//进入学生照片
	function showStudentPhoto() {
		var stu_id = $("input[name='postName']:checked").val();
		if (stu_id == undefined) {
			alert("请选择学生");
			return null;
		} else {
			window.location.href = "showStudentPhoto.do?stu_id=" + stu_id;
		}
	}
	//业务指导,后台改成了单选按钮，此方法也可用，可以用到复选框上。  方法有问题，暂时注释按钮  周睿
	function instruction() {
		var va = $("input[name='postName']:checked").val();
		if (va == undefined) {
			alert("请选择学生");
			return null;
		}
		var arr = va.split("AAA");
		if (arr[0] == "无") {
			alert("此学生无岗位");
			return null;
		} else {
			if (confirm("确定给此岗位的同学就业指导？")) {
				var practice_id = $("#practice_id").val();
				var post = encodeURI(encodeURI(arr[0]));
				window.location.href = "instruction.do?post=" + post
						+ "&practiceId=" + practice_id + "&stu_id=" + va;

			}
		}
	}
	//点击一行，选中当前行单选按钮   周睿20160504
	function choice(tr) {
		tr.cells[0].children[0].click();
	}
</script>

</head>
<body>
	<h2>学生信息列表</h2>
	<b>条件查询：</b>
	<input type="hidden" id="lastGroupNmae" value="${lastGroupNmae}">
	<input id="group_id" type="hidden" value="${group.id}" />
	<select name="practice_id" id="practice_id" placeholder="实习任务"
		onchange="changeId();">
		<option value="">请选择实习任务</option>
		<c:forEach items="${groupList}" var="group" varStatus="status">
			<option value="${group.group_name}">${group.group_name}</option>
		</c:forEach>

	</select>

	<input type="button" value="查询" id="seacher" onclick="changeCK();" />
	<!--by王磊 2015年5月22日功能：业务指导，每次只能对一个岗位知道  -->
	<input type="button" value="业务指导" id="instruction"
		onclick="instruction();" />


	<input type="button" value="审核就业材料" id="checkMaterialsList"
		onclick="doCheckMaterialsList();" />
	<input type="button" value="查看实习照片" id="studentPhoto"
		onclick="showStudentPhoto();" />
	<input type="button" value="修改学生信息" id="studentEdit"
		onclick="doEdit();" />
	<table border="1" width="1300" id="stulist" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr>
			<th width='30' align='center'>选择</th>
			<th width='70' align='center'>学号</th>
			<th width='70' align="center">姓名</th>
			<th width='80' align='center'>手机号</th>
			<th width='100' align='center'>家庭电话</th>
			<th width='120' align='center'>家庭住址</th>
			<th width='80' align='center'>QQ号</th>
			<th width='80' align='center'>EMAIL</th>
			<th width='70' align='center'>入学年份</th>
			<th width='70' align='center'>实习状态</th>
			<th width='70' align='center'>岗位</th>
		</tr>
	</table>
	<!--by王磊 2015年5月22日功能：业务指导，每次只能对一个岗位知道  二次开发周睿-->
	<input type="button" value="业务指导" id="instruction"
		onclick="instruction();" />
	<input type="button" value="审核就业材料" id="checkMaterialsList"
		onclick="doCheckMaterialsList();" />
	<input type="button" value="查看实习照片" id="studentPhoto"
		onclick="showStudentPhoto();" />
	<input type="button" value="修改学生信息" id="studentEdit"
		onclick="doEdit();" />
</body>
</html>