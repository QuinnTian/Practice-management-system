<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
    <title>评分标准表</title>
    <script></script>
    <script type="text/javascript">
    function ajaxEvalStand() {// 向服务器发送搜索请求
    		var year = $("#year").val();
			var scope = $("#scope").val();
			if(year =="0" || scope =="0"){
				if(year =="0" && scope !="0"){
					alert("请选择年级");
					return null;
				}else if(scope =="0" && year !="0"){
					alert("请选择范围");
					return null;
				}else{
					alert("请选择年级和范围");
					return null;
				}			
			}
   			$.ajax({
   				type : "get",
				/* contentType : "application/json", */
				url : "getEvalStand.do?",
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
        function getSendData() {
        	var year = $("#year").val();	
			var scope =$("#scope").val();	
			var dataSend="tiaojian="+year+","+scope;		
			return dataSend;
		}
	
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
			/*    alert(ajaxData);  */
        // $("table[id='teaTable'] tr[id!='biaotou']").remove();
	     $("#table1").html(ajaxData); 
		};
	//用来返回前一个页面的数据
	  function ajaxEvalStand2() {// 向服务器发送搜索请求
   			$.ajax({
   				type : "get",
				/* contentType : "application/json", */
				url : "getEvalStand.do?",
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
        function getSendData2() {
        	var year = $("#year").val();	
			var scope =$("#scope").val();	
			var dataSend="tiaojian="+year+","+scope;		
			return dataSend;
		}
		window.onload = function() {
			var years1 = $("#years1").val();
			var org_id1 = $("#org_id1").val();
			if(years1 !="" && org_id1!=""){
				$("#hiddenBtn").click();
			}
		};
	    //添加
		function add(){
		  window.location.href="addEvaluateStandard.do";
		}
		
		//删除
		function doDel(id){
		if(window.confirm("确定删除此评分标准及所对应的评分指标?")){
           window.location.href="deleteEvaluateStandard.do?id="+id;
		  }
		}
		//导入指标
		function  doImport(id){
			window.location.href="importEvalsIndex.do?standard_id="+id;
		
		}
		//修改指标
		function doEdit(id){
			window.location.href="editEvaluateStandard.do?id="+id;
		}
	</script>
</head>
  
  <body>
  <h2>评分标准表</h2><br>
  <input id="years1" value="${years1}"style="background-color:#666666; display:none;">
  <input id="org_id1" value="${org_id1}"style="background-color:#666666; display:none;">
   <button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="ajaxEvalStand2();">Hidden
		Button</button>
	<c:set var="years1" value="${years1}" scope="request"></c:set>
	<c:set var="org_id1" value="${org_id1}" scope="request"></c:set>
		<%
			String years1 = (String) request.getAttribute("years1");
			String org_id1 = (String) request.getAttribute("org_id1");
		%>
        选择年份：&nbsp;&nbsp;<select name="year" id="year" style="width:80px">
        <option value="0">请选择</option>
        <c:forEach var="year" items="${years}" varStatus="stauts">
        <option value="${year}"<c:if test="${year==years1}"> selected</c:if>>${year}</option>
        </c:forEach>
         </select>&nbsp;&nbsp;
        适用范围：&nbsp;&nbsp;<select name="scope" id="scope" style="width:120px">
    	<option value="0">请选择</option>
    	<c:forEach var="org" items="${orgs}" varStatus="stauts">
        <option value="${org.id}"<c:if test="${org.id==org_id1}"> selected</c:if>>${org.org_name}</option>
        </c:forEach>
        </select>&nbsp;&nbsp;
    <input type="button" value="查询"id="seacher" onclick="ajaxEvalStand();"/>
    &nbsp;&nbsp;
		<input type="button" onclick="javascript:add();" value="添加"/>
    <div id="biaotou"></div>
    <table border="1" width="1200" id="table1" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="200">标准名称</th>
			<th width="150">类型</th>
			<th width="200">描述</th>
			<th width="150">适用范围</th>
			<th width="100">创建时间</th>
			<th width="180">操作</th>
		</tr>
		<c:forEach var="e" items="${result}" varStatus="stauts">
			<tr>
				<td align="center"><a href="getStandardAndevalsIndex.do?id=${e.id}">${e.standard_name}</a></td>				
				<td align="center">${e.type}</td>
				<td align="center">${e.description}</td>
				<td align="center">
				<c:set var="sco" value="${e.scope}" scope="request"></c:set>
				<% String scope=(String)request.getAttribute("sco"); 
				   String[] sco_ids = scope.split(",");
				   for(int i=0;i<sco_ids.length;i++){
				   out.print(DictionaryService.findOrg(sco_ids[i]).getOrg_name()+" ");
				   }
				 %>
				</td>
				<td align="center">
				<fmt:parseDate value="${e.create_time}" var="create_time" />
				<fmt:formatDate value="${e.create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td align="center">
				<input type="button" value="导入指标" onClick="doImport('${e.id}');"/>
				<input type="button" value="删除" onClick="doDel('${e.id}');">
				<input type="button" value="修改" onClick="doEdit('${e.id}');">
				</td>
			</tr>
		</c:forEach>
	</table>

  </body>
</html>
