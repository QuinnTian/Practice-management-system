<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
    <title>修改教师</title>
     <script type="text/javascript">
     function doAdd(){
     
     	var true_name=$("#true_name").val();
     	var true_nameLen = true_name.length;
     	var PhoneNumber=$("#phone").val();
     	var phontLength = PhoneNumber.length;
	 	if(phontLength < 7 || phontLength > 12){
	 		alert("电话号码格式有问题");
	 	 	return null;
	 	}else if($("#phone").val()==""){
	 		alert("电话号码不能为空");
	 		 return null;
	 	}else if(isNaN(PhoneNumber) == true){
	 		alert("电话号码只能为数字");
	    }if(true_nameLen>16){
 			alert("您输入的姓名太长，请认真核对！");
 		}else{
	 		document.form1.submit();
		 };
	}
	$(function(){
	var defduties=$("#defduties").val();
	$("#duties").val(defduties);
	var defdept_id=$("#defdept_id").val();
	$("#dept_id").val(defdept_id);
	});
     </script>
  </head> 
  <body>
    <h2 align='left'>教师修改</h2>
    <form name="form1" id="form1" method="post" action="doEditTeacher.do">
      <input type="hidden" name="id" name="id" value="${teacher.id}">
	    <table border="1" width="370">
	        <tr>
		     <td width="70">教工号：</td>
	         <td width="300">${teacher.tea_code}</td>
	      </tr>     
	      
	      <tr>
		     <td width="70">姓名：</td>
	         <td width="300"><input type="text" id = "true_name" name="true_name" value="${teacher.true_name}"></td>
	      </tr>      
		  <tr>
		     <td width="70">性别：</td>
	         <td width="300">
	         <select id="sex" name="sex">
					<c:forEach var="sex" items="${sex}" varStatus="stauts">
					<option value="${sex}">${sex}</option>
					</c:forEach>
					</select>
	         </td>
	      </tr>  
	      <tr>
		    <td width="70">电话：</td>
		    <td width="300"><input type="text" name="phone" id="phone"  value="${teacher.phone}" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
	      </tr>  
	       <tr>
			     <td width="70">部门名称：</td>
			     <td width="300">
			     <input type="hidden" id="defdept_id" value="${teacher.dept_id}"/>
			     <select id="dept_id" name="dept_id" style="width:110px">
					<c:forEach var="o" items="${orgs}" varStatus="stauts">
					<option value="${o.id}">${o.org_name}</option>
					</c:forEach>
					</select></td>
		      </tr>
		   <tr>
				<td width="100">职务：</td>
				<td width="300">
				<input type="hidden" id="defduties" value="${duties}"/>
					<select name="duties" id="duties" >
						<option value="院长">院长</option>
						<option value="副院长">副院长</option>
						<option value="系主任">系主任</option>
						<option value="系副主任">系副主任</option>
						<option value="教师">教师</option>
				</select>
				</td>
			</tr>        
		    <tr>
				<td width="100">状态：</td>
				<td width="300">
					<select name="state" id="state" >
						<c:forEach var="state" items="${state}" varStatus="stauts">
						<option value="${state}">${state}</option>
					</c:forEach>
				</select>
				</td>
			</tr>  
	    </table>
	    
	    <div style="margin-top:20px;">
	      <input type="button" onclick="doAdd();" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
	      <button type="button" onclick="window.location='./teacherList.do'">返回</button>
	    </div>
	</form>
  </body>
</html>