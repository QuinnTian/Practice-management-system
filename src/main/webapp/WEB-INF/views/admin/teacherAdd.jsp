<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
    <title>添加教员</title>
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
				url : "checkTeaCode.do?",
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
			var tea_code = $("#tea_code").val();	
			var dataSend = "tea_code=" + tea_code;			
			return dataSend;
		}
	
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		 $("#infor").html(ajaxData); 
		};
	function doAdd(){
	 var information=$("#infor").html();
	 var phoneNumber = $("#phone").val();
	 var phontLength = phoneNumber.length;
	 var true_name=$("#true_name").val();
     var true_nameLen = true_name.length;
	 var teaCode=$("#tea_code").val();
	 //alert(teaCode);
	 if(information.length >=5){
	 	alert("请重新输入教工编号");
	 	return null;
	 }else if($("#tea_code").val()==""){
	 	alert("教师编码不能为空");
		 return null;
	 }else if(true_name ==""){
	 	alert("教师姓名不能为空");
		return null;
	}else if(phontLength < 7 || phontLength > 12){
	 	alert("电话号码格式有问题");
	 	 return null;
	 }else if(isNaN(teaCode)==true){
	 	alert("教工号只能为数字");
	 }else if(isNaN(phoneNumber) == true){
	 	alert("电话号码只能为数字");
	 }else if($("#phone").val()==""){
	 	alert("电话号码不能为空");
	 	 return null;
	 }else if(true_nameLen>16){
 			alert("您输入的姓名太长，最多允许填写16位！");
 	 }else{
	 	document.form1.submit();
	 };
	}
	</script>
</head> 
  <body>
    <h2 align='left'>教师添加</h2>
	  <form name="form1" id="form1" method="post" action="doAddTeacher.do">
		 <table border="0" width="370">
		     <tr>
		     <td width="70">教工号：</td>
	         <td width="300"><input type="text" name="tea_code" onblur="check()" id="tea_code" onkeyup="value=value.replace(/[^\d]/g,'')"><font color="read"><span id="infor"></span></font></td>
	      </tr>     
		      <tr>
			     <td width="70">姓名：</td>
		         <td width="300"><input type="text" id = "true_name" name="true_name"></td>
		      </tr>    
		      <tr>
				<td width="100">性别：</td>
				<td width="300"><select name="sex" id="sex">
						<option value="男">男</option>
						<option value="女">女</option>
				</select></td>
			</tr>
		      <tr>
			     <td width="70">电话：</td>
			     <td width="300"><input type="text" name="phone" id="phone" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
		      </tr>   
		     <tr>
			     <td width="70">所属部门:</td>
			     <td width="300">
		    <select name="dept_id" id="dept_id" style="font-family: sans-serif" onchange="setValues()">
						<c:forEach var="o" items="${teachers}" varStatus="stauts">		         	
		            	<option value="${o.id}">${o.org_name}</option>  
	            	</c:forEach>
				</select></td>
		      </tr>  
		          <tr>
			     <td width="70">职务：</td>
			     <td width="300">
			     <select name="duties">
			     	<option value="院长">院长</option>
			     	<option value="副院长">副院长</option>
			     	<option value="书记">书记</option>
			     	<option value="系主任">系主任</option>
			     	<option value="系副主任">系副主任</option>
			     	<option value="教师">教师</option>
			     </select>
			  </tr> 
		    <tr>
				<td width="100">状态：</td>
				<td width="300"><select name="state" id="state">
						<option value="1">有效</option>
						<option value="0">无效</option>
				</select></td>
			</tr>
	    </table>
	    <div style="margin-top:20px;">
	      <input type="button" onclick="doAdd();" value="保存" />
	      &nbsp;&nbsp;&nbsp;&nbsp;
	      <button type="button" onclick="window.location='./teacherList.do'">返回</button>
	    </div>
	</form>
  </body>
</html>
 

