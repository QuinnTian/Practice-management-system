<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>公司列表</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
	
	//添加
	function add() {
		window.location.href = "addCompany.do";
	}

	/* //删除
	function doDel(id){
	  if(window.confirm("确定删除此条吗?")){
	   window.location.href="deleteCompany.do?id="+id;
	  }
	} */
	//导入企业表
	function importTea() {
		window.location.href = "CompanyImport.do";
	}
	function getCompany() {
		$.ajax({
			type : "get",
			url : "getCompany.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showPractice(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}
	//用来返回前一个页面的数据
	function getCompany2() {
		$.ajax({
			type : "get",
			url : "getCompany.do?",
			data : getSendData2(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showPractice(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}
	function getSendData() {
		var industry = $("#industry").val();
		var xi_id = $("#xi_id").val();
		var content = encodeURI($("#content").val());
		content = encodeURI(content);
		var dataSend = "tiaojian=" + industry + "," + xi_id + "," + content;
		return dataSend;
	}
	function getSendData2() {
		var industry = $("#industry1").val();
		var xi_id = $("#xi_id1").val();
		var content = encodeURI($("#content1").val());
		content = encodeURI(content);
		var dataSend = "tiaojian=" + industry + "," + xi_id + "," + content;
		return dataSend;
	}
	window.onload = function() {
		var industry1 = $("#industry1").val();
		var xi_id1 = $("#xi_id1").val();
		var content = $("#content1").val();
		if ((industry1 != null && industry1 != "")
				|| (xi_id1 != null && xi_id1 != "")
				|| (content != "地址/名称/时间/编码/联系人")) {
			$("#hiddenBtn").click();
		}
	};
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		var ss = ajaxData.split("FENGECOMPANY");
		var infor = $("#content").val();
		if (infor != "地址/名称/时间/编码/联系人") {
			document.getElementById('content').style.color = "black";
		}
		$("table[id='companyTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ss[0]);
		var count = ss[1];
		document.getElementById('countPage').value = count;
		document.getElementById("cou").innerHTML = ss[2];
		if (count == "0") {
			document.getElementById('nowPage').value = "0";
		} else {
			document.getElementById('nowPage').value = "1";
		}
	};
	function editCompany(id, infor_tea_id) {
		var self_tea_id = $("#self_tea_id").val();
		if (self_tea_id == infor_tea_id) {
			window.location.href = "editCompany.do?id=" + id;
		} else {
			alert("你没有其权限，请联系此企业审核人");
			return null;
		}
	}
	//判断 
	$(function() {
		$('.content').bind({
			focus : function() {
				if (this.value == "地址/名称/时间/编码/联系人") {
					this.value = "";
				}
			},
			blur : function() {
				if (this.value == "") {
					this.value = "地址/名称/时间/编码/联系人";
				}
			}
		});
	});
	//跳转到给定的页面page
	function becomePage(page) {
		var toPage;//要跳转的页面
		var countPage;//一共的页数
		countPage = parseInt($("#countPage").val());
		if (page == "toPage") {
			toPage = $("#inpu").val();
		} else {
			var nowPage = $("#nowPage").val();
			toPage = parseInt(nowPage) + parseInt(page);
		}
		if (toPage < 1) {
			alert("超出最小页页码");
			return null;
		} else if (toPage > countPage) {
			alert("超出最大页页码");
			return null;
		}
		document.getElementById('inpu').value = "";
		url = "getCompanyByPage.do?toPage=" + toPage;
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
				var ss = result.split("FENGECOMPANY");
				$("table[id='companyTable'] tr[id!='biaotou']").remove();
				$("#biaotou").after(ss[0]);
				document.getElementById('nowPage').value = ss[1];
			}
		};
		xmlHttp.open("GET", url, false);
		xmlHttp.send(null);
	}
</script>
</head>
<body>
	<input type="hidden" name="self_tea_id" id="self_tea_id" value="${tea_id}">
	<h2>企业管理：</h2><br>
	<p><input id="industry1" value="${industry1}"style="background-color:#666666; display:none;">
		<input id="xi_id1" value="${company_part_id}"style="background-color:#666666; display:none;">
		<input id="content1" value="${companyContent}"style="background-color:#666666; display:none;">
   		<button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="getCompany2();">Hidden
		Button</button>
		<b>条件查询：</b>
		<c:set var="industry1" value="${industry1}" scope="request"></c:set>
		<%
			String industry1 = (String) request.getAttribute("industry1");
		%>
		<c:set var="xi_id1" value="${company_part_id}" scope="request"></c:set>
		<%
			String xi_id1 = (String) request.getAttribute("xi_id1");
		%>
		<span>行业类型：</span>
		<select id="industry" name="industry" style="width:200px">
		<option value="0">请选择行业</option>
			<c:forEach var="industry" items="${mapIndustry}" varStatus="stauts">
				<option value="${industry.key}" <c:if test="${industry.key==industry1}"> selected</c:if>>${industry.value}</option>
			</c:forEach>
		</select>&nbsp;&nbsp;
		<span>选择学院：</span>
		<select id="xi_id" name="xi_id"  style="width:120px">
  			<option value="0">请选择院部</option>
  		<c:forEach var="orgs" items="${orgs}" varStatus="stauts">
  			<option value="${orgs.id}" <c:if test="${orgs.id==xi_id1}"> selected</c:if>>${orgs.org_name}</option>
  		</c:forEach>
  	</select>
  	 <input type="hidden" name="content" id="content" value="${companyContent}" class="content" style="width:160px">
  	 <input type="button" value="查询" id="seacher" onClick="getCompany();"/> 
  	 <input type="button" onClick="javascript:add();" value="新增企业"/>
  	 <input type="button" onclick="javascript:importTea();" value="导入企业"/>
  	 
  	 
  	 <table border="1" width="1300" id="companyTable" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="180">企业名称</th>
			<th width="60">联系人</th>
			<th width="100">联系电话</th>
			<th width="250">企业地址</th>
			<th width="300">适用范围</th>
			<th width="150">行业</th>
			<th width="80">审核人</th>
			<th width="40">状态</th>
			<th width="80">创建时间</th>
			<th width="40">操作</th>
		</tr>
		<c:forEach var="c" items="${result}" varStatus="stauts">
			<tr>
				<td align="center">${c.com_name}</td>
				<td align="center">${c.contacts}</td>
				<td align="center">${c.phone}</td>
				<td align="center">${c.address}</td>
				<td align="center">
				<c:set var="scope" value="${c.applicable_scope}" scope="request"></c:set>
				<% 
				   String scope=(String)request.getAttribute("scope"); 
				   String[] coll_id = scope.split(",");
				   for(int i=0;i<coll_id.length;i++){
				   out.print(DictionaryService.findOrg(coll_id[i]).getOrg_name()+" ");
				   }
	             %>
				</td>
				<td align="center">
				<c:set var="industry" value="${c.industry}" scope="request"></c:set>
				<%
				String industry =(String)request.getAttribute("industry");
				out.print(DictionaryService.getmapIndustryClassificationCode().get(industry));%></td>
				<td align="center">
				<c:set var="tea_id" value="${c.check_man}" scope="request"></c:set>
				<% String tea_id=(String)request.getAttribute("tea_id");
				   if(DictionaryService.findTeacher(tea_id)==null){
				   	out.print("<span><font color='red'>暂无审核</font></span>");
				   }else{
				   out.print(DictionaryService.findTeacher(tea_id).getTrue_name());
				   }
				%>
				</td>
				<td align="center">
				<c:set var="state" value="${c.state}" scope="request"></c:set>
				<% 
					String state=(String)request.getAttribute("state");
					String stateName="有效";
					if(state.equals("0"))
						stateName="无效";
				%>
				 <%=stateName %>
				</td>
				<td align="center">
				<fmt:parseDate value="${c.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td align="center"><input type="button" value="修改" onclick="editCompany('${c.id}','${c.check_man}');"></td>
			<%-- 	<td align="center"><input type="button" value="删除" onClick="doDel('${c.id}');"></td>
			 --%></tr>
		</c:forEach>
	</table>
	<div align="center">
		<input type="button" value="上一页"  onclick="becomePage('-1')">
		<input type="button" value="下一页" onclick="becomePage('1')">
		<input type="text" id="inpu" name="inpu" onkeyup="value=value.replace(/[^\d]/g,'')" style="width:40px;"><input type="button" value="GO" onclick="becomePage('toPage')"/>
		第<input type="text" name="nowPage" id="nowPage" value="${nowPage}" style="width:20px;" disabled="disabled"/>页
		<input type="hidden" name="countPage" id="countPage" value="${count}"><!--  -->
		<b><span id="cou">共  ${count} 页</span></b>
	</div>
	<!-- <div style="margin-top:10px;margin-left:100px;">
		<input type="button" onClick="javascript:add();" value="新增企业"/>
		<input type="button" onclick="javascript:importTea();" value="导入企业"/>
	</div> -->
</body>
</html>
