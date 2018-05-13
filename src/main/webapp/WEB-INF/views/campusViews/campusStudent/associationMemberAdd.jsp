<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>添加社团成员</title>
<script type="text/javascript">
	function setValues() {
			var province = document.getElementById("id"); 
			var pindex = province.selectedIndex; 
			var pValue = province.options[pindex].value; 
			var pText = province.options[pindex].text; 
			document.getElementById("org_name").value=pText;
	}
	function check(){
		$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "checkStuCode.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为text                
				success : function(data) { //成功时执行的方法					
					showPractice(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
        function getSendData() {
			var stu_code = $("#stu_code").val();
			var assication_id = $("#id").val();
			var dataSend = "stu_code=" + stu_code+"&assication_id="+assication_id;			
			return dataSend;
		}
	
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		 $("#infor").html(ajaxData); 
		};
	function doAdd(){
	 var teaCode=$("#stu_code").val();
	 //alert(teaCode);
	 if($("#stu_code").val()==""){
	 	alert("教师编码不能为空");
		 return null;
	 }else if(isNaN(teaCode)==true){
	 	alert("教工号只能为数字");
	 }else{
	 	document.form1.submit();
	 };
	}
	</script>
</head>
<body>
	<h2 align='left'>成员添加</h2>
	<form name="form1" id="form1" method="post" action="doSaveAssociationMumber.do">
	<input type="hidden" name="id" value="${id}" id="id"/>
		<table border="0" width="370">
			<tr>
				<td width="70">学号：</td>
				<td width="300"><input type="text" name="stu_code" required="required" onblur="check()" id="stu_code"
						onkeyup="value=value.replace(/[^\d]/g,'')"><font color="read"><span id="infor"></span></font></td>
			</tr>
			<tr>
				<td width="70">姓名：</td>
				<td width="300"><input type="text" required="required" name="true_name"></td>
			</tr>
			<tr>
				<td width="100">性别：</td>
				<td width="300"><select name="sex" required="required" id="sex">
						<option value="男">男</option>
						<option value="女">女</option>
					</select></td>
			</tr>
			<tr>
				<td width="70">职务：</td>
				<td width="300"><select name="duties" required="required">
						<option value="1">会长</option>
						<option value="2">副会长</option>
						<option value="3">会员</option>
					</select>	
			</tr>
			<tr>
				<td width="70">是否具有管理权限：</td>
				<td width="300"><select name="duties" required="required">
						<option value="1">是</option>
						<option value="2">否</option>
					
					</select>	
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd();" value="保存" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./seeAssociationMemberDetail.do?id=${id}'">返回</button>
		</div>
	</form>
</body>
</html>


