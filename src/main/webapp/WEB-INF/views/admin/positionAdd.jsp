<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加企业岗位</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
	function getParentId() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getParentId.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showParentIds(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function getSendData() {
			var post_type = $("#post_type").val();	
			var dataSend = "post_type=" + post_type;			
			return dataSend;
		}
		function showParentIds(ajaxData) {//根据返回数据显示搜索结果
			$("#parent_id").html(ajaxData);
	    };
</script>
</head>
<body>
	<h2>添加企业：</h2>
	<form name="form1" id="myform" method="post" action="doAddPosition.do">
		 <table border="0" width="400">

			<tr>
				<td width="100">职位级别：</td>
				<td width="300">
				<select name="post_type" id="post_type" onChange=getParentId()>
					<option value="0">请选择级别</option>
					<option value="1">一级别</option>
					<option value="2">二级别</option>
					<option value="3">三级别</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">岗位编码：</td>
				<td width="300"><input type="text" name="post_code"/>
				</td>
			</tr>
			<tr>
				<td width="100">岗位名称：</td>
				<td width="300"><input type="text" name="post_name"/>
				</td>
			</tr>
			<tr>
				<td width="100">岗位职责：</td>
				<td width="300"><input type="text" name="post_duties"/>
				</td>
			</tr>
			<tr>
				<td width="100">父岗位id：</td>
				<td width="300">
				<select name="parent_id" id="parent_id" Style="width:100px;">
				<option value="1">请选择父ID</option>
				</select>
				<!-- <input type="text" name="parent_id"/> -->
				</td>
			</tr>
			<tr>
				<td width="100">审核备注：</td>
				<td width="300"><input type="text" name="check_note"/>
				</td>
			<tr>
				<td width="100">状态：</td>
				<td width="300"><select name="state" id="state">
						<option value="1">有效</option>
						<option value="2">无效</option>
				</select></td>

			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./positionList.do'">返回</button>
		</div>
	</form>
</body>
</html>





















