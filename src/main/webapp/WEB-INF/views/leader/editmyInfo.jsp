<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  <!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
  <link href="/springmvc_mybatis/css/pageStyle.css" rel="stylesheet"
	type="text/css"> 
    <title>个人信息维护</title> 
   <script>
	function update() {
		window.document.userLoginForm.action = "doeditmyInfo.do";
		window.document.userLoginForm.submit();
         alert("信息修改成功");
	} 
	function back() {
	 	alert("确定退出吗？");
		window.document.userLoginForm.action = "myInfo.do";
		window.document.userLoginForm.submit();
	}
	 </script>
  </head> 
  <body>
  <form id="userLoginForm" name="userLoginForm" method="post" class="sjjx-form">
       <h1>个人信息维护</h1>
	    <table width="300" border="0" style="font-size:20px;" cellpadding="4">	
	    <c:forEach var="t" items="${teaList}" varStatus="stauts">
	      	 <tr>  
	         <td width="300"><input type="hidden" name="id" value="${t.id}"></td>
	      </tr> 
	      <tr>
		    <td width="70">电话：</td>
		    <td width="300"><input type="text" name="phone" value="${t.phone}"></td>
	      </tr>  
		       <tr>
			     <td width="70">专长：</td>
			     <td width="300"><input type="text" name="expertise" value="${t.expertise}"/></td>
		      </tr> 
		      </c:forEach>
	    </table>
	    
	    <div style="margin-top:20px;margin-left:100px">
			<input type="button" value="修  改" onclick="update()" class="sjjx-button"> 
			<!-- <input type="button" value="退 出" onclick="back()" class="sjjx-button"> -->
		
		</div>
	</form>
  </body>
</html>





















