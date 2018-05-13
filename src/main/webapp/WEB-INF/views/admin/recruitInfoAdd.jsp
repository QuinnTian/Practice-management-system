<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>招聘信息添加</title>

<style type="text/css">
.div {
	border: 1px solid #F00;
	width: 300px;
}

h2 {
	text-align: left;
}
</style>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript">
	function getCompany() {

		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "admin/ajaxgetCompanyByIndustry.do?",
			data : getTeaData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法

				showCom(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}

	function getTeaData() {
		var val = $("#industry").val();
		var dataSend = "industry=" + val;
		return dataSend;
	}

	function showCom(ajaxData) {
		var com = eval(ajaxData);
		console.log(ajaxData);
		var select = document.getElementById("com_id");
		select.options.length = 1;

		if (com.length > 0) {

			for ( var i = 0; i < com.length; i++) {
				console.log(com[i]);
				select.options.add(new Option(com[i].com_name, com[i].id));
			}
		}

	}

	function saveCommany() {//jquery获取复选框值

		var industry = $("#industry").val();
		var com_id = $("#com_id").val();
		var post_id = $("#post_id").val();
		var recruit_prof = $("#recruit_prof").val();
		var recruit_desc = $("#content").val();
		var recruit_num = $("#recruit_num").val();
		var recruit_eff = $("#recruit_eff").val();
		var recruit_end = $("#recruit_end").val();

		if (industry == "0") {

			alert("请选择所属行业！");
			return;
		}
		if (com_id == "0") {

			alert("请选择企业！");
			return;
		}
		if (post_id == "") {

			alert("请填写岗位名称！");
			return;
		}
		if (recruit_prof == "") {

			alert("请填写招聘的专业！");
			return;
		}
		if (recruit_desc == "") {

			alert("请填写招聘描述！");
			return;
		}
	
		if (recruit_num == "") {

			alert("请填写招聘人数！");
			return;
		}
		if (isNaN(recruit_num)) {

			alert("招聘人数必须是数字！");
			return;
		}
		if (recruit_eff == "") {

			alert("请选择生效时间！");
			return;
		}
		if (recruit_end == "") {

			alert("请选择结束时间！");
			return;
		}
		if (recruit_end < recruit_eff) {
			alert("结束时间不能够早于开始时间，请重新选择！");
			return null;
		}

		document.forms[0].submit();
	}
</script>
</head>
<body>
	<h2>招聘信息添加</h2>
	<form name="form1" id="myform" method="post"
		action="admin/doAddRecruitInfo.do">
		<table border="0" width="500">
			<tr>
				<td width="100">所属行业：</td>
				<td width="300"><select id="industry" name="industry"
					style=" width:200px" onChange="getCompany()"><option
							value="0">请选择行业</option>
						<c:forEach var="industry" items="${mapIndustry}"
							varStatus="stauts">
							<option value="${industry.key}">${industry.value}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">企业名称：</td>
				<td width="300"><select name="com_id" id="com_id"
					style="width:200px;font-family: sans-serif">
						<option value="0">请选择</option>
				</select>
			</tr>

			<tr>
				<td width="100">岗位名称：</td>
				<td width="300"><input type="text" id="post_id" name="post_id"
					style=" width: 200px">
			</tr>
			<tr>
				<td width="100">招聘专业：</td>
				<td width="300"><input type="text" id="recruit_prof"
					name="recruit_prof" style=" width: 200px" />
				</td>
			</tr>
			
			<tr>
				<td width="100">招聘人数：</td>
				<td width="300"><input type="text" id="recruit_num"
					name="recruit_num" style=" width: 200px" />
				</td>
			</tr>
			<tr>
				<td width="100">生效时间：</td>
				<td width="300"><input type="text" id="recruit_eff"
					name="recruit_eff" style=" width: 200px" class="Wdate"
					onClick="WdatePicker()" />
				</td>
			</tr>
			<tr>
				<td width="100">截至时间：</td>
				<td width="300"><input type="text" id="recruit_end"
					name="recruit_end" style=" width: 200px" class="Wdate"
					onClick="WdatePicker()" />
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="300"><select name="state" id="state"
					style=" width: 200px">
						<option value="1">有效</option>
						<option value="2">无效</option>
				</select></td>
			</tr>
			<tr>
				<td width="100">招聘描述：</td>
				<!-- <td width="300"><textarea type="text" id="recruit_desc"
						name="recruit_desc" style=" width: 200px">
				</textarea>
				</td> -->
				<td width="300">
				<textarea  style="resize:none" onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" 
  				name="recruit_desc"  id="content" cols="45" rows="5"  style="overflow-y: scroll; width: 200px"></textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div>
				</td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="saveCommany()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button"
				onclick="window.location='admin/recruitInfoList.do'">返回</button>
		</div>
	</form>
</body>
</html>

