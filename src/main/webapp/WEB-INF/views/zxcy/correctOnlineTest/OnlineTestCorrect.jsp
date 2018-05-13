<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../../titlebar.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>

		<br />
		<h3>
			问卷标题：<small>${cy.title}</small>
		</h3>
		<a class="btn btn-lg btn-info" style="width: 12%"
			href="<%=path%>/zxcy/home.htm">返回控制面板</a>


		<div class="row">
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>测验问题</th>
							<th>问题答案</th>
							<th>打分</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ot" items="${otQAnswers}" varStatus="stauts">
								<input type="hidden" id="id" name="id" value="${ot.id }" />
								<tr>
									<td>${stauts.index+1}</td>
									<td>${otQuestions[stauts.count-1].title}</td>
									<td><textarea class="form-control" rows="3">${ot.answertext}</textarea></td>
									<td><input type="number" id="${ot.id}" <c:if test="${otQnAnswer.temp1 == '2'}">disabled</c:if> name="score" value="${ot.score}" />分</td>
									<td><button class="btn" type="submit" <c:if test="${otQnAnswer.temp1 == '2'}">disabled</c:if> onclick="return dafen('${otQuestions[stauts.count-1].score}','${ot.id}')">保存</button></td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
				<p align="right">
				<button <c:if test="${otQnAnswer.temp1 == '2'}">disabled</c:if> onclick="sumbit()" class="btn btn-info">提交测验结果</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function dafen(score,otid) {

			var fen = document.getElementById(otid).value;
			if (parseInt(fen) > parseInt(score)) {
				alert("得分不能大于问题的分数,问题的分数是:" + score);
				document.getElementById(otid).value = score;
				return false;
			} else if (parseInt(fen) < 0) {
				alert("得分不能小于0分");
				document.getElementById(otid).value = '0';
				return false;
			} else {
				save(otid);
			}
		}

		function save(otid) {

			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "<%=path%>/zxcy/onlineTestCorrect.do?",
				data : getSendData(otid), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					if(data==0){
						alert("保存失败");
					}else{
						alert("保存成功");
					}
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});

		}

		function getSendData(otid) {
			var score = $("#"+otid).val();
			var dataSend = "score=" + score +"&otid=" +otid;
			return dataSend;
		}
		
		
		function sumbit() {

			$.ajax({
				type : "post",
				/* contentType : "application/json", */
				url : "<%=path%>/zxcy/sumbitOnlineTestCorrect.do?",
				data : "otQnAnswer_id=${otQnAnswer.id}", //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					if(data==0){
						alert("提交失败");
					}else if(data==1){
						alert("提交成功");
						history.go(-1);
					}else if(data==2){
						alert("测验已提交，不能再进行修改");
					}
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});

		}
	</script>
</body>
</html>