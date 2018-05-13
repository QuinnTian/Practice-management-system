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
		<div data-role="header">
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" data-transition="pop"
						data-ajax="false" href="<%=path%>/zxcy/home.htm">返回测验列表</a></li>
				</ul>
			</div>
		</div>

		<div data-role="content">
			
				<input type="hidden" id="id" name="id" value="${otQAnswer.id}">
				<input type="hidden" id="question_id" name="question_id" value="${cy.onlineTestQuestion.id}">
				<input type="hidden" id="qnanswer_id" name="qnanswer_id" value="${otQAnswer.qnanswer_id}">
				
				<!-- 1、多选 -->
				<c:if test="${cy.onlineTestQuestion.type == 1}">
					<h3>测验问题：${cy.onlineTestQuestion.title}</h3>
					<c:forEach var="option" varStatus=""
						items="${cy.onlineTestQuestion.onlineTestOptions}">
						<div class="checkbox">
							<label> <input type="checkbox" id="answertext"
								name="answertext" ${option.checked} value="${option.id}"> ${option.title} <c:if test="${option.answer == 1}">（正确答案）</c:if>
							</label>
						</div>
					</c:forEach>
				</c:if>
				<!-- 2、单选 -->
				<c:if test="${cy.onlineTestQuestion.type == 2}">
					<h3>测验问题：${cy.onlineTestQuestion.title}</h3>
					<c:forEach var="option" varStatus=""
						items="${cy.onlineTestQuestion.onlineTestOptions}">
						<div class="radio">
							<label> <input type="radio" id="answertext"
								name="answertext" ${option.checked} value="${option.id}"> ${option.title} <c:if test="${option.answer == 1}">（正确答案）</c:if>
							</label>
						</div>
					</c:forEach>
				</c:if>

<!-- 				<c:if test="${cy.onlineTestQuestion.other eq 1}"> -->
<!-- 					<c:if test="${cy.onlineTestQuestion.type eq 1}"> -->
<!-- 						<div class="checkbox"> -->
<!-- 							<label><input type="checkbox" id="answertext" -->
<!-- 								name="answertext" value="">其他</label> -->
<!-- 						</div> -->
<!-- 					</c:if> -->
<!-- 					<c:if test="${cy.onlineTestQuestion.type eq 2}"> -->
<!-- 						<div class="radio"> -->
<!-- 							<label><input type="radio" id="answertext" -->
<!-- 								name="answertext" value="">其他</label> -->
<!-- 						</div> -->
<!-- 					</c:if> -->
<!-- 				</c:if> -->

				<!-- 3、文本 -->
				<c:if test="${cy.onlineTestQuestion.type == 3}">
					<h3>测验问题：${cy.onlineTestQuestion.title}</h3>
					<textarea class="form-control input-lg" rows="3" id="answertext"
						name="answertext" placeholder="回答问题">${otQAnswer.answertext}</textarea>
				</c:if>

				<!-- 4、说明 -->
				<c:if test="${cy.onlineTestQuestion.type == 4}">
					<div class="form-group">
						<h3>${cy.onlineTestQuestion.title}</h3>
					</div>
				</c:if>

			<div data-role="controlgroup" data-type="horizontal">
				<c:if test="${page!=0}">
					<a data-role="button" href="<%=path %>/zxcy/onlineTestPreview.htm?page=${page-1}&r=<%=Math.random() %>"
						data-transition="slide" data-direction="reverse">上一页</a>
				</c:if>
				<c:if test="${page+1 !=cy.qNum}">
					<a data-role="button" href="<%=path %>/zxcy/onlineTestPreview.htm?page=${page+1}&r=<%=Math.random() %>"
						data-transition="slide" data-direction="reverse">下一页</a>
				</c:if>
				<c:if test="${page+1 ==cy.qNum}">
					<a data-role="button" href="<%=path %>/zxcy/onlineTestPreview.htm?page=${page+1}&r=<%=Math.random() %>"
						data-transition="slide" data-direction="reverse">完成</a>
				</c:if>



			</div>

			<script>
				function checkaction(v) {
					if (v == 0) {
						document.onlineTestForm.action = "<%=path%>/zxcy/onlineTest.do?page=${page-1}";
					} else if(v == 1) {
						document.onlineTestForm.action = "<%=path%>/zxcy/onlineTest.do?page=${page+1}";
					} else if(v == 2){
						document.onlineTestForm.action = "<%=path%>/zxcy/onlineTest.do?page=sumbit";
					}
					document.onlineTestForm.submit();
				}
			</script>
		</div>
	</div>

</body>
</html>
