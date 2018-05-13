<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>


</head>
<body>


	<div data-role="page">
		<c:if test="${page+1 !=summary.questionNum}">
		<div data-role="header">
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" data-transition="pop"
						data-ajax="false" href="<%=path%>/summary/user/home.htm">返回总结列表</a></li>
				</ul>
			</div>
		</div>
		</c:if>
		<div data-role="content">
			<form name="onlineTestForm" action="" method="post">
				<input type="hidden" id="page1" name="page1" value="${page}">
				<input type="hidden" id="ABCD" name="ABCD" value="${ABCD}">
			    <input type="hidden" id="id" name="id" value="${summaryQAnswer.id}">
				<input type="hidden" id="question_id" name="question_id" value="${summary.summaryQuestion.id}">
				<input type="hidden" id="qnanswer_id" name="qnanswer_id" value="${summaryQAnswer.qnanswer_id}">
				
				<!-- 1、多选 -->
				<c:if test="${summary.summaryQuestion.type == 1}">
					<h3>总结问题：${summary.summaryQuestion.title}</h3>
					<c:forEach var="option" varStatus=""
						items="${summary.summaryQuestion.summaryOptions}">
						<div class="checkbox">
							<label> <input type="checkbox" id="answertext"
								name="answertext" ${option.checked} value="${option.id}"> ${option.title}
							</label>
						</div>
					</c:forEach>
				</c:if>
				<!-- 2、单选 -->
				<c:if test="${summary.summaryQuestion.type == 2}">
					<h3>总结问题：${summary.summaryQuestion.title}</h3>
					<c:forEach var="option" varStatus=""
						items="${summary.summaryQuestion.summaryOptions}">
						<div class="radio">
							<label> <input type="radio" id="answertext"
								name="answertext" ${option.checked} value="${option.id}"> ${option.title}
							</label>
						</div>
					</c:forEach>
				</c:if>

<!-- 				<c:if test="${summary.summaryQuestion.other eq 1}"> -->
<!-- 					<c:if test="${summary.summaryQuestion.type eq 1}"> -->
<!-- 						<div class="checkbox"> -->
<!-- 							<label><input type="checkbox" id="answertext" -->
<!-- 								name="answertext" value="">其他</label> -->
<!-- 						</div> -->
<!-- 					</c:if> -->
<!-- 					<c:if test="${summary.summaryQuestion.type eq 2}"> -->
<!-- 						<div class="radio"> -->
<!-- 							<label><input type="radio" id="answertext" -->
<!-- 								name="answertext" value="">其他</label> -->
<!-- 						</div> -->
<!-- 					</c:if> -->
<!-- 				</c:if> -->

				<!-- 3、文本 -->
				<c:if test="${summary.summaryQuestion.type == 3}">
					<h3>总结问题：${summary.summaryQuestion.title}</h3>
					<textarea class="form-control input-lg" rows="3" id="answertext"
						name="answertext" placeholder="回答问题">${summaryQAnswer.answertext}</textarea>
				</c:if>

				<!-- 4、说明 -->
				<c:if test="${summary.summaryQuestion.type == 4}">
					<div class="form-group">
						<h3>${summary.summaryQuestion.title}</h3>
					</div>
				</c:if>

			</form>
			<div data-role="controlgroup" data-type="horizontal">
				<c:if test="${page!=0}">
					<a data-role="button" onclick="checkaction(0);"
						data-transition="slide" data-direction="reverse">上一页</a>
				</c:if>
				<c:if test="${page+1 !=summary.questionNum}">
					<a data-role="button" onclick="checkaction(1);"
						data-transition="slide" data-direction="reverse">下一页</a>
				</c:if>
				<c:if test="${page+1 ==summary.questionNum}">
					<a data-role="button" onclick="checkaction(2);"
						data-transition="slide" data-direction="reverse">提交</a>
				</c:if>

			</div>
			<script>
				function checkaction(v) {
					if (v == 0) {
						document.onlineTestForm.action = "<%=path%>/summary/summary.do?page=${page-1}";
					} else if(v == 1) {
					var radio = $('input:radio[name="answertext"]:checked').val();
					var checkbox = $('input:checkbox[name="answertext"]:checked').val();
					var answertext=$("#answertext").val();
					if(radio==undefined&&checkbox==undefined&&answertext==""){
					alert("请填写相应内容");
					return;
					}else{
					    var page1=$("#page1").val();
						var ABCD=$("#ABCD").val();
					    if(page1==0){
					    	if(radio!=ABCD){
					    		alert("您选择的实习状态不正确，请关闭当前页面修改完实习状态在进行实习总结。");
					    		/* WeixinJSBridge.call('closeWindow'); */
					    		window.close();
					    	}else{
					    	 document.onlineTestForm.action = "<%=path%>/summary/summary.do?page=${page+1}";
					    	}
					    }else{
					       document.onlineTestForm.action = "<%=path%>/summary/summary.do?page=${page+1}";
					    }
					
					}} else if(v == 2){
						document.onlineTestForm.action = "<%=path%>/summary/summary.do?page=sumbit";
					}
					document.onlineTestForm.submit();
				}
			</script>
		</div>
	</div>

</body>
</html>
