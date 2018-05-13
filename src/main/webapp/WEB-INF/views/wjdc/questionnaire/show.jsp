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
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

</head>
<body>
	<div data-role="page" id="pageone">
		<script type="text/javascript">
			function check_div() {
				var qita = document.getElementById("qita");
				var qita_v = qita.checked;
				var div = document.getElementById("div_text");
				if (qita_v) {

					div.style.display = 'block';
				} else {
					document.getElementById("other").value = "";
					div.style.display = 'none';
				}

			}

			function dx_check_div() {
				var div = document.getElementById("div_text");
				div.style.display = 'none';
			}

			function check_syy() {
				document.getElementById("syy").value = "syy";
			}

			function check_sumbit() {
				var r = confirm("问卷题目全部完成，是否进行提交");
				return r;
			}
		</script>
		<div data-role="header">
			<h1>问卷标题：${qn.title}，共${qn.qNum}道题，当前第${now_num+1}道</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" data-ajax="false"
						href="<%=path%>/wjdc/user/home.htm">首页</a>
					</li>
					<li><a data-icon="delete" data-ajax="false"
						href="<%=path%>/user/quit.do">退出</a>
					</li>
				</ul>
			</div>
		</div>

		<div data-role="content">
			<form name='form1' method="post" action="<%=path%>/wjdc/qa/ioru.do">
				<input type="hidden" name="num" id="num" value="${num}"> <input
					type="hidden" name="qn_id" id="qn_id" value="${qn.id}"> <input
					type="hidden" name="q_id" id="q_id" value="${q.id}"> <input
					type="hidden" name="qna_id" id="qna_id" value="${qna_id}">
				<input type="hidden" name="depend" id="depend" value="${depend}">
				<input type="hidden" name="show" id="show" value="${show}">
				<input type="hidden" name="syy" id="syy" value="">
				<input type="hidden" name="page_sumbit" id="page_sumbit" value="">
				<c:if test="${q.type == '多选'}">
					<fieldset data-role="controlgroup">
						<legend>${now_num+1}、${q.title}(${q.type})</legend>
						<c:forEach var="o" items="${q.option}">
							<label for="${o.id}">${o.title}</label>
							<input type="checkbox" name="xx" id="${o.id}"
								${o.checked} value="${o.id}">
						</c:forEach>
						<c:if test="${q.other == '是'}">
							<label for="qita">其他 </label>
							<input type="checkbox" name="xx" id="qita" value="other"
								${otherChecked}
								onclick="check_div()">
							<div style="display: ${otherNone};" id="div_text">
								<input type="text" name="other" id="other"
									value="${otherAnswer}">
							</div>
						</c:if>
					</fieldset>
				</c:if>
				<c:if test="${q.type == '单选'}">
					<fieldset data-role="controlgroup">
						<legend>${now_num+1}、${q.title}(${q.type})</legend>
						<c:forEach var="o" items="${q.option}">
							<label for="${o.id}">${o.title}</label>
							<input type="radio" name="xx" id="${o.id}"
								${o.checked}
								onclick="dx_check_div()" value="${o.id}">
						</c:forEach>
						<c:if test="${q.other == '是'}">
							<label for="qita">其他 </label>
							<input type="radio" name="xx" id="qita" value="other"
								${otherChecked}
								onclick="check_div()">
							<div style="display: ${otherNone};" id="div_text">
								<input type="text" name="other" id="other"
									value="${otherAnswer}">
							</div>

						</c:if>
					</fieldset>
				</c:if>
				<c:if test="${q.type == '文本'}">
					<label for="${q.title}">${now_num+1}、${q.title}</label>
					<input type="text" name="xx" id="${q.title}" value="${textAnswer}">
				</c:if>

				<input type="hidden" value="" name="json_values" id="json_values">
				<div data-role="controlgroup" data-type="horizontal">


					<c:if test="${now_num != 0}">
						<a data-role="button" href='javascript:document.form1.submit();' onclick="page_sumbit_js('previous')"><font color='#000000'>上一页</font></a>  
					</c:if>
					<c:if test="${qn.qNum != now_num+1}">
						<a data-role="button" href='javascript:document.form1.submit();' onclick="page_sumbit_js('next')"><font color='#000000'>下一页</font></a>  
					</c:if>
					<c:if test="${qn.qNum == now_num+1}">
						<input type="submit" data-inline="true"
							onclick="return check_sumbit()" value="完成">
					</c:if>
				</div>

			</form>
		</div>
		<c:if test="${!empty result}">
			<font color="red">${result}</font>
		</c:if>
	</div>

</body>
</html>
