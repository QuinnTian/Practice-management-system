<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>教师列表</title>
	<script type="text/javascript">
	    //添加
		function add(){
		  window.location.href="addTeacher.do";
		}
		
		//删除
		function doDel(id){
		  if(window.confirm("确定删除此教师?")){
           window.location.href="deleteTeacher.do?id="+id;
		  }
		}
		 //修改
		function doEdit(id){
		  window.location.href="editTeacher.do?id="+id;
		}
		//重置密码
		function rePass(id){
		  if(window.confirm("确定重置此教师密码?")){
           window.location.href="resetPassword.do?id="+id;
		  }
		}
		
		
	function ajaxTeacher() {// 向服务器发送搜索请求
			var info=$("#xibu").val();
			if(info=="请选择"){
				alert("请选择范围");
				return null;
			}else{
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "ajaxTeacher.do?",
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
		}
		}
		//用来返回前一个页面的数据
		function ajaxTeacher2() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "ajaxTeacher.do?",
				data : getSendData2(), //设置发送参数，即使参数为空，也需要设置                
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
		}
        function getSendData() {
			var xibu = $("#xibu").val();	
			var dataSend = "xibu=" + xibu;			
			return dataSend;
		}
		function getSendData2() {
			var xibu = $("#xibu1").val();	
			var dataSend = "xibu=" + xibu;			
			return dataSend;
		}
		window.onload = function() {
			var xibu1 = $("#xibu1").val();
			if(xibu1!=null && xibu1 !=""){
				$("#hiddenBtn").click();
			}
		};
		function showPractice(ajaxData) {//根据返回数据显示搜索结果
       		var ss=ajaxData.split("FENGETEACHER");
			$("table[id='teaTable'] tr[id!='biaotou']").remove();
	    	$("#biaotou").after(ss[0]); 
	    	var count=ss[1];
	   	    document.getElementById('countPage').value=count;
	   		 document.getElementById("cou").innerHTML=ss[2];
	    if(count=="0"){
	    	document.getElementById('nowPage').value="0";
		}else{
	    	document.getElementById('nowPage').value="1";
	    }
	    };
		
		
	    //导入teacher
		function importTea(){
		 var xi_id=document.getElementById('xibu').value;
		 if(xi_id =="请选择"){
			alert("请先选择导入部门类型！！");
			return null;
		}else{
		  window.location.href="addTeacherImport.do?xi_id="+xi_id;
			}
		}
		//跳转到给定的页面page
		function becomePage(page){
			var toPage;//要跳转的页面
			var countPage;//一共的页数
			countPage=parseInt($("#countPage").val());
			if(page=="toPage"){
				toPage = $("#inpu").val();
			}else
			{
				var nowPage=$("#nowPage").val();
				toPage=parseInt(nowPage)+parseInt(page);
			}
			if(toPage<1){
				alert("超出最小页页码");
				return null;
			}else if(toPage>countPage){
				alert("超出最大页页码");
				return null;
			}
			document.getElementById('inpu').value="";
			url="getTeacherByPage.do?toPage="+toPage;
			ajaxFunction(url);
		}
		//转ajax
		function ajaxFunction(url) {
		//考虑到不同浏览器的兼容性，所以做出判断。
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveObject) {
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
		//监控和接受后台传的字符串
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var result = xmlHttp.responseText;
				var ss=result.split("FENGETEACHER");
				$("table[id='teaTable'] tr[id!='biaotou']").remove();
	     		$("#biaotou").after(ss[0]);
	     		document.getElementById('nowPage').value=ss[1];
			}
		};
		xmlHttp.open("GET", url, false);
		xmlHttp.send(null);
	}
	function ajaxSearch(){
		var info=$("#name").val();
			if(info == null || info == ""){
				alert("请输入姓名或教工号");
				return null;
			}else{
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "ajaxSearch.do?",
				data :"name=" + info, //设置发送参数，即使参数为空，也需要设置
				contentType:'application/x-www-form-urlencoded; charset=UTF-8',                
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
		}
	
	}
	</script>
</head>
<body>
  <h2 align='left'>教师列表</h2>
  <!-- 1月19日   添加过滤条件  吴敬国 -->
  <p>
   <input id="xibu1" value="${teacher_dept_id}"style="background-color:#666666; display:none;">
   <button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="ajaxTeacher2();">Hidden
		Button</button>
  	<b>条件查询：</b>
  	<c:set var="xibu1" value="${teacher_dept_id}" scope="request"></c:set>
		<%
			String xibu1 = (String) request.getAttribute("xibu1");
		%>
	请选择系部：
  	<select id="xibu" name="xibu"  style="width:100px">
  	<option value="请选择">请选择</option>
  	<c:forEach var="x" items="${xi}" varStatus="stauts">
  	<option value="${x.id}"<c:if test="${x.id==xibu1}"> selected</c:if>>${x.org_name}</option>
  	</c:forEach>
  	</select>
  	 <input type="button" value="查询" id="seacher" onclick="ajaxTeacher();"/> 
  	 <input type="button" onclick="javascript:add();" value="新增教师"/>
  	 <input type="button" onclick="javascript:importTea();" value="导入教师"/>
  	 请输入姓名或教工号：<input type="text" id="name"/><button onclick="ajaxSearch()">详细搜索</button>
  </p>
  <!-- 1月19日   td改为th  吴敬国 -->
  <!-- 修改王磊添加院直属教师 -->
  	<table border="1" width="1300" id="teaTable" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150" align="center">教工号</th>
			<th width="150" align="center">姓名</th>
			<th width="150" align="center">性别</th>
			
			<th width="150" align="center">电话 <th width="150" align="center">部门名称</th></th><!-- 修改 -->
			<!-- <th width="150" align="center"> 电话<th > -->
			<th width="150" align="center">职务</th>
			<th width="150" align="center">QQ号</th><!-- 新添加 -->
			<th width="150" align="center">邮箱</th><!-- 新添加 -->
			<th width="150" align="center">专长</th>
			<th width="150" align="center">状态</th>
			<th width="100" align="center">重置密码</th>
			<th width="50" 	align="center">修改</th>
			<th width="50" 	align="center">操作</th>
		</tr>
			
		<c:forEach var="t" items="${result}" varStatus="stauts">
			<tr>
				<td align="center">${t.tea_code}</td>
				<td align="center">${t.true_name}</td>
				<td align="center">${t.sex}</td>
				<td align="center">
				<c:choose>
				<c:when test="${empty t.phone}">
				<%="无" %>
				</c:when>
				<c:otherwise>
			    ${t.phone}
				</c:otherwise>
				</c:choose></td>
				<td align="center">
				<c:set var="dept_id" value="${t.dept_id}" scope="request"></c:set>
				<c:set var="state" value="${t.state}" scope="request"></c:set>
				<% 
					String dept_id=(String)request.getAttribute("dept_id");
					String state=(String)request.getAttribute("state");
					String stateName="有效";
					if(state.equals("0"))
						stateName="无效";
				 %>
				<%=DictionaryService.findOrg(dept_id).getOrg_name() %>
				</td>
				<td align="center">${t.duties}</td>
				<td align="center">${t.qqnum}</td><!-- 新添加 -->
				<td align="center">${t.email}</td><!-- 新添加 -->
				<td align="center">
				<c:choose>
				<c:when test="${empty t.expertise}">
				<%="无" %>
				</c:when>
				<c:otherwise>
			    ${t.expertise}
				</c:otherwise>
				</c:choose></td>
				<td align="center"><%=stateName %></td>
				<td align="center"><input type="button" value="重置密码" onclick="rePass('${t.id}');"></td>
				<td align="center"><input type="button" value="修改" onclick="doEdit('${t.id}');"></td>
				<td align="center"><input type="button" value="删除" onclick="doDel('${t.id}');"></td>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
		<input type="button" value="上一页"  onclick="becomePage('-1')">
		<input type="button" value="下一页" onclick="becomePage('1')">
		<input type="text" id="inpu" name="inpu" onkeyup="value=value.replace(/[^\d]/g,'')" style="width:40px;"><input type="button" value="GO" onclick="becomePage('toPage')"/>
		第<input type="text" name="nowPage" id="nowPage" value="${nowPage}" style="width:40px;"/>页
		<input type="hidden" name="countPage" id="countPage" value="${count}"><!--  -->
		<b><span id="cou">共  ${count} 页</span></b>
	</div>
	<!-- <div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:add();" value="添加教师"/>
	</div> -->
</body>
</html>
