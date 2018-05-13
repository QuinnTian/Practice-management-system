<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加评分标准表</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}

.div {
	border: 1px solid #F00;
	width: 300px;
}
</style>
<script>//全选操作
	function getName() {// 向服务器发送搜索请求
		if($("#scope").val() !="1" && $("#type").val() !="1"){
			$.ajax({
				type : "get",
				url : "getEvalStandName.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showPractice(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
			}else if($("#scope").val()=="1"){
				alert("请选择范围");
			
			}else{
				alert("请选择类型");
			}
		}
		function getSendData() {
			var scope = $("#scope").val();
			var type =	$("#type").val();
			var dataSend = "tiaojian=" + scope+","+type;			
			return dataSend;
		}
		function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#name").val(ajaxData);
		$("input[type='hidden']").attr('type','text');
		$("#name").show();;//隐藏 
	    };
	    function doAdd(){
	    	var description=$("#description").val();
	    	if(description==""){
	    		alert("描述不能为空");
	    		return null;
	    	}else if($("#scope").val() =="1"){
	    		alert("请选择范围");
	    		return null;
	    	}else if($("#type").val() =="1"){
	    		alert("请选择类型");
	    		return null;
	    	}else{
	    		document.form1.submit();
	    	}
	    }
	    function setType(){
	    	$("#type").find("option[value='1']").attr("selected",true);
	    	if($("#type").val() =="1" && $("#name").val() !=""){
	    		$("#name").hide();//隐藏 
	   		}
	     }
</script>
</head>

<body>
	<h2>添加评分标准</h2>
	<form name="form1" method="post" action="doAddEvaluateStandard.do">
		<table border="0" width="400">
			<tr>
				<th width="100">适用范围：</th>
				<td width="300">
					<select name="scope" id="scope"  style="width:200" onchange="setType()">
							<option value="1">请选择范围：</option>
						<c:forEach var="os" items="${os}" varStatus="stauts">
							<option value="${os.id}">${os.org_name}</option>
					</c:forEach>
			</select>
			</td>
			</tr>
			<tr>
				<th width="100">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</th>
				<td width="300">
					<select id="type" name="type"  style="width:200" onchange="getName()" >
					<option value="1">请选择类型</option>
					<option value="XWSX">校外实习</option>
					<option value="ZZXS">整周实训</option>
					<option value="ZC">早操</option>
					<option value="WZX">晚自习</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="100">生成名称：</th>
				<td width="300"><input type="text" id="name"disabled="disabled" style="width:200;" value=""></td>
			</tr>
			<tr>
				<th width="100">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</th>
				<td width="300">
				<textarea rows="4" cols="40" id="description" name="description" style="height:100%; width:100%;"></textarea>
				</td>
			</tr>
		</table>
			<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doAdd()">&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button"
				onclick="window.location='evaluateStandardList.do'">返回</button>
		</div>
	</form>
</body>
</html>

