<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>企业岗位审核</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->	
	<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
	<script type="text/javascript">
	function doCheck(state) {
		 var url="check11.do?check_state="+state;
		 document.form1.action = url;   
		 document.form1.submit();
	}
</script>

  </head>
  
  <body>
  	<h2>企业岗位审核：</h2>
    <form name="form1" method="post" action="">
 		<input type="hidden" id="id" name="id" value="${position.id}">
		<table border="0" width="870">
			<tr>
				<td>职位类别：<input type="text" name="post_type"
					value="${position.post_type}"></td>
				<td>岗位编码：<input type="text" name="post_code"
					value="${position.post_code}"></td>
			</tr>
			<tr>

				<td>父岗位&nbsp;id：<input type="text" name="parent_id"
					value="${position.parent_id}"></td>
				<td>审核备注：<input type="text" name="check_note"
					value="${position.check_note}"></td>
			</tr>
			<tr>
				<td>岗位名称：<input type="text" name="post_name"
					value="${position.post_name}"></td>
				<td>岗位职责：<input type="text" name="post_duties"
					value="${position.post_duties}"></td>
			</tr>
		</table>
		<br><br>
		<br><br>
		<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onClick="window.location='./positionList.do'">返回</button>&nbsp;&nbsp;&nbsp;
		<input type="button" value="通过" onClick="doCheck('1');">&nbsp;&nbsp;&nbsp;
		<input type="button" value="不通过" onClick="doCheck('2');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状&nbsp;&nbsp;态&nbsp;&nbsp;：<input type="text" name="check_state"
					value="${position.state}">
	</form>
  </body>
</html>
