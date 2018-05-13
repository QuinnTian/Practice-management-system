<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>招聘信息列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen"
		type="text/css" />
		<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<style type="text/css">
h2 {
	text-align: left;
}
</style>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addRecruitInfo.do";
	}

	//关闭
	function doDel(id) {
		if (window.confirm("确定关闭此招聘信息吗?")) {
			window.location.href = "closeRecruitInfo.do?id=" + id;
		}
	}
	//开启
	function doOpen(id) {
		if (window.confirm("确定开启此招聘信息吗?")) {
			window.location.href = "openRecruitInfo.do?id=" + id;
		}
	}
</script>
<script type="text/javascript">
	function serchRec() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "serchRec.do?",
			data : getTeaData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showRec(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
		}
		function getTeaData() {
		var val = $("#industry").val();
		var dataSend = "industry=" + val;
		return dataSend;
	}
		function showRec(ajaxData) {
		console.log(ajaxData);
		$("table[id='table'] tr[id!='tr']").remove();
		$("#tr").after(ajaxData);
	}


</script>

<script type="text/javascript">
function dimQuery() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "dimQuery.do?",
			data : getData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showRec(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
		}
		function getData() {
		var val = $("#content").val();
		var queryType=$("#queryType").val();
		
		if(queryType=="请选择"){
	  	alert("请选择岗位类型！");
	 	return null;
		}else if(val==""){
		alert("请输入搜索内容！");
	 	return null;
		}else{
		var dataSend = "content=" + val+"&&queryType="+queryType;
		return dataSend;
		}
		
	}
		function showRec(ajaxData) {
		console.log(ajaxData);
		$("table[id='table'] tr[id!='tr']").remove();
		$("#tr").after(ajaxData);
	}


</script>
</head>
<body>
	<h2>招聘信息列表</h2>
	选择行业：<select id="industry" name="industry"
					style=" width:200px"><option
							value="0">请选择行业</option>
						<c:forEach var="industry" items="${mapIndustry}"
							varStatus="stauts">
							<option value="${industry.key}">${industry.value}</option>
						</c:forEach>
	</select>
	<input type="button" onclick="serchRec()" value="查询">
	请输入搜索关键字：
	<input type="text" id="content" name="content">
	<input type="button" onclick="dimQuery()" value="查询">
	&nbsp;&nbsp;
	<input type="button" onclick="add()" value="添加" />
	<table id="table" border="1" width="1300" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="tr">
			<th width="200">企业名称</th>
			<th width="250">岗位名称</th>
			<th width="280">招聘专业</th>
			<th width="300">招聘描述</th>
			<th width="150">招聘人数</th>
			<th width="120">生效时间</th>
			<th width="120">结束时间</th>
			<th width="120">发布时间</th>
			<th width="200">状态</th>
			<th width="90">操作</th>
			<th width="90">操作</th>
		</tr>

		<c:forEach var="r" items="${result}" varStatus="stauts">


			<tr>
			<c:set var="com_id" value="${r.com_id}" scope="request"></c:set>
			<c:set var="pos_id" value="${r.post_id}" scope="request"></c:set>
			<%
				String com_id = (String) request.getAttribute("com_id");
			%>
			<%
				String pos_id = (String) request.getAttribute("pos_id");
			%>
			<td><a href="editRecruitInfo.do?id=${r.id}" > 
				<c:if test="${r.com_id==null}">
				${r.com_id}
				</c:if>
				<c:if test="${r.com_id!=null}">
				<%out.println(DictionaryService.findCompany(com_id).getCom_name());%>
				</c:if>
				</a>
				</td>
				<td>
				<c:if test="${r.post_id==null}">
				暂时未指定
				</c:if>
				<c:if test="${r.post_id!=null}">
				${r.post_id}
				</c:if>
				</td>
				<td>${r.recruit_prof}</td>
				<td>${r.recruit_desc}</td>
				<td>${r.recruit_num}</td>
				<td>
				<c:set var="effect_time" value="${r.effect_time}" scope="request"></c:set>
				<%
					String e_time=(String) request.getAttribute("effect_time").toString().subSequence(0, 10);
					out.println(e_time);
				 %>
				</td>
				<td>
				<c:set var="end_time" value="${r.end_time}" scope="request"></c:set>
				<%
					String en_time=(String) request.getAttribute("end_time").toString().subSequence(0, 10);
					out.println(en_time);
				 %>
				</td>
				<td>
				<c:set var="create_time" value="${r.create_time}" scope="request"></c:set>
				<%
					String c_time=(String) request.getAttribute("create_time").toString().subSequence(0, 10);
					out.println(c_time);
				 %>
				</td>
				<td>
				<c:if test="${r.state ==1 }">
				<b >有效</b>
				</c:if>
				<c:if test="${r.state ==2 }">
				<b style="color: red">无效</b>
				</c:if>
				</td>
				<td>
				<input type="button" value="修改" onclick="location.href='editRecruitInfo.do?id=${r.id}'">
				</td>
				<td>
				<c:if test="${r.state ==1 }">
				<input type="button" value="关闭" onclick="doDel('${r.id}');">
				</c:if>
				<c:if test="${r.state ==2 }">
				<input type="button" value="开启" onclick="doOpen('${r.id}');">
				</c:if>
				
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
