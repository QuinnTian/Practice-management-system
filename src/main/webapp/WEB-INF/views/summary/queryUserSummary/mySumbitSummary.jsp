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
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">

<title>提交总结</title>
<style type="text/css">

.fullpage {
  margin: 0 auto;
  max-width: 100%;
}
 .wordCount{ position:relative;/* width: 495px;height: 145px */ }
        .wordCount textarea{ width: 100%; height: 100px;}
        .wordCount .wordwrap{ position:absolute; right: 6px; bottom: 6px;} 
        .wordCount .word{ color: red; padding: 0 4px;;}


</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script>
    $(function(){
        //先选出 textarea 和 统计字数 dom 节点
        var wordCount = $("#wordCount"),
            textArea = wordCount.find("textarea"),
            word = wordCount.find(".word");
        //调用
        statInputNum(textArea,word);
		
    });
    /*
    * 剩余字数统计
    * 注意 最大字数只需要在放数字的节点哪里直接写好即可 如：<var class="word">200</var>
    */
    function statInputNum(textArea,numItem) {
        var max = numItem.text(),
            curLength;
        textArea[0].setAttribute("maxlength", max);
        curLength = textArea.val().length;
        numItem.text(max - curLength);
        textArea.on('input propertychange', function () {
            numItem.text(max - $(this).val().length);
        });
    }
</script>

</head>
<body>
<div class="container fullpage" >
		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<!-- 吴敬国 start 2015-6-24 -->	
		<br />
		<a class="btn btn-info btn-lg" href="javascript:history.go(-1);" >返回</a>
		<h1 align="center">山东商业职业技术学院${orgName}</h1>
		<h2 align="center">${year}年${month}月实习总结</h2>
		
		<div class="row">
			<div>
				<table class="table table-bordered" >
					<thead>
						<tr>
							<th style="width: 20%;background-color:#888888;">姓名</th>
							<th style="width: 20%;background-color:#888888;">手机</th>
							<th style="width: 20%;background-color:#888888;">邮箱</th>
							<th style="width: 20%;background-color:#888888;">具体岗位</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td>${student.true_name}</td>
								<td>${student.phone}</td>
								<td>${student.email}</td>
								<td>${post}</td>
							</tr>
					</tbody>
					<thead>
							<tr>
								<th style="width: 20%;background-color:#888888;">实习单位</th>
								<th style="width: 20%;background-color:#888888;">单位电话</th>
								<th style="width: 20%;background-color:#888888;">单位指导老师姓名</th>
								<th style="width: 20%;background-color:#888888;">单位中指导老师的联系电话</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${com_name}</td>
									<td>${com_phone}</td>
									<td>${com_teacher_name}</td>
									<td>${com_teacher_phone}</td>
								</tr>
						</tbody>
				</table>
		</div>
		</div>
		<!-- 吴敬国 end 2015-6-24 -->
		<div class="row">
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>序号</th>
							<th style="width: 25%">总结问题</th>
							<th style="width: 70%">总结答案</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td>${list.title}</td>
								<td>${list.answertext }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				得分：${summaryQnAnswer.score}<%-- <input type="text"  value="${summaryQnAnswer.score}" readonly="readonly"/> --%>
				<div class="wordCount" id="wordCount">
				<font>教师评价：</font>
				<textarea name="content" id="content" rows="3" style="width:100%;height:100%;" readonly="readonly">${summaryQnAnswer.temp1}</textarea>
				</div>
				<div>
				<a class="btn btn-info btn-lg" href="javascript:history.go(-1);" >返回</a>
				</div>
			</div>
		</div>
</div>	
</body>
</html>
