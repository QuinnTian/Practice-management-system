<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>添加企业</title>

<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
#scope{
border:1px solid;
width:50%;
}
#list{
	margin-left:70px;

}
</style>
<script type="text/javascript">
function check(){
		$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "checkCompanyCode.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
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
        function getSendData() {
			var com_code = $("#com_code").val();	
			var dataSend = "com_code=" + com_code;			
			return dataSend;
		}
	/*先注释掉，以后可能要用到  */
	/* function showInfor(ajaxData) {//根据返回数据显示搜索结果
		 $("#infor").html(ajaxData); 
		}; */
	function doAdd(){
	var phontLength = $("#phone").val().length;
	var emai = $("#email").val();
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	var b = reg.test(emai);
	var obj=document.getElementsByName('orgs'); //选择所有name="'test'"的对象，返回数组 
	//取到对象数组后，我们来循环检测它是不是被选中 
	var s=''; 
	for(var i=0; i<obj.length; i++){ 
	if(obj[i].checked) s+=obj[i].value+','; //如果选中，将value添加到变量s中 
	} 
	if($("#com_name").val()==""){
	  	alert("企业名称不能为空");
	 	return null;
	 }else if($("#contacts").val()==""){
	  	alert("企业联系人不能为空");
		 return null;
	 }else if($("#phone").val()==""){
	  	alert("联系电话不能为空");
	 	return null;
	 }else if(phontLength < 7 || phontLength > 12){
	 	alert("电话号码格式有问题");
	 	 return null;
	 }else if($("#address").val()==""){
	  	alert("企业地址不能为空");
		 return null;
	 }else if($("#email").val()==""){
	  	alert("E-mail不能为空");
	 	return null;
	 }else if(b==false){
	 	alert("E-mail格式错误");
	 	return null;
	 }else if(s.length==0){
    	alert("请选择适用学院");
    	return null;
	 }else{
	 	document.form1.submit();
	 };
	}
	/*else if(document.getElementById(orgs).checked == false){
	  	alert("适用范围不能为空");
	 	return null;
	 }  */
	//全选操作
	function checkAll(flag){
		CBs=document.getElementsByName("orgs");
		for(var i=0;i<CBs.length;i++)
	    CBs[i].checked=flag;
	}
	function ChkOppClick(sonName){
 	var arrSon = document.getElementsByName("orgs");
 	for(i=0;i<arrSon.length;i++) {
  	arrSon[i].click();
 };
}
</script>
</head>
<body>
	<h2>添加企业：</h2>
	<br>
	<form name="form1" id="myform" method="post" action="doAddCompany.do">
		 <table border="0" width="600">
			<tr>
				<td width="100">所属行业：</td>
				<td width="300">
				<select name="industry">
				<c:forEach var="industry" items="${mapIndustry}" varStatus="stauts">
						<option value="${industry.key}">${industry.value}</option>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">企业名称：</td>
				<td width="300"><input type="text"  name="com_name" id="com_name"/>
				</td>
			</tr>
			<!-- <tr>
				<td width="100">企业代码：</td>
				<td width="300"><input type="text" name="com_code" id="com_code" onblur="check()"/><font color="read"><span id="infor"></span></font>
				</td>
			</tr> -->
			<tr>
				<td width="100">企业短名：</td>
				<td width="300"><input type="text" name="short_name"/>
				</td>
			</tr>
			<tr>
				<td width="100">联系人：</td>
				<td width="300"><input type="text" name="contacts" id="contacts"/>
				</td>
			</tr>
			<tr>
				<td width="100">联系电话：</td>
				<td width="500"><input type="text" name="phone" id="phone" onkeyup="value=value.replace(/[^\d]/g,'')" onBlur="value=value.replace(/[^\d]/g,'')"/><br/>
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><font color="read">*必须是数字，05303734179或者15165008693</font></span></td></tr>
			<tr>
				<td width="100">企业地址：</td>
				<td width="300"><input type="text" name="address" id="address"/>
				</td>
			</tr>
			<tr>
				<td width="100">email：</td>
				<td width="300"><input type="text" name="email" id="email"/>
				</td>
			</tr>
		</table>
			<div id="scope">
				<span><b>相关学院：</b></span>
				<div id="list">
				<c:forEach var="org" items="${orgs}" varStatus="stauts">
						<input type="checkbox" name="orgs" id="orgs" value="${org.id}"/>${org.org_name}<br/>
				</c:forEach>
				</div>
				<span>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="全选" onClick="checkAll(this.checked)">全选
				&nbsp;<input type="checkbox" value="反选" onClick="ChkOppClick(this.checked)">反选
				</span>
		</div>
		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd();" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./companyList.do'">返回</button>
		</div>
	</form>
</body>
</html>





















