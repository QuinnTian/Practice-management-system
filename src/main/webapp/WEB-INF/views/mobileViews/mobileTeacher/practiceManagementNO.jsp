<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<title>实践教学管理</title>
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">

</head>
<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>实习申请详情</h1>
				</div>
			</header>
			<article data-role="article" id="normal_article"
				data-scroll="verticle" class="active" style="top:45px;bottom:50px;">
				<div class="scroller">
					<form id="form1" name="form1" method="post" action=""
						autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<input type="hidden" name="nostate" id="nostate" value="">
						<input type="hidden" name="nonote" id="nonote" value=""> <input
							type="hidden" id="id" name="id" value="${practicerecord.id}">
						<c:set var="si" value="${practicerecord.stu_id}" scope="request"></c:set>
						<%
							String stu_id = (String) request.getAttribute("si");
						%>
						<c:set var="ai" value="${practicerecord.com_teacher}"
							scope="request"></c:set>
						<%
							String com_teacher = (String) request.getAttribute("ai");
						%>
						<c:set var="ci" value="${practicerecord.company_id}"
							scope="request"></c:set>
						<%
							String company_id = (String) request.getAttribute("ci");
						%>
						<c:set var="createStuId" value="${createStu_id}" scope="request"></c:set>
						<%
							String createStu_id = (String) request.getAttribute("createStuId");
						%>

						<label class="label-left" for="user">学号</label> <label
							class="label-right"> <%
 	out.println(DictionaryService.findStudent(stu_id).getStu_code());
 %>
						</label>
						<hr />
						<label class="label-left" for="email">姓名</label> <label
							class="label-right"> <%
 	out.println(DictionaryService.findStudent(stu_id).getTrue_name());
 %>
						</label>
						<hr />
						<label class="label-left" for="email">企业名称</label> <label
							class="label-right" id="color"> <c:if
								test="${company.check_state==0}">
								<font color="red" id="changecolor">${company.com_name}</font>
							</c:if> <c:if test="${company.check_state!=0}">
					             ${company.com_name} 
					        </c:if> <c:if test="${company.com_name=='未添加'}">
								<font color="red">未申请企业，不应通过申请</font>
							</c:if></label>
						<hr />
						<label class="label-left" for="email">岗位名称</label> <label
							class="label-right"> <output id="email" type="text"
								value="${practicerecord.post_id}">${practicerecord.post_id}</output>
						</label>
						<hr />
						<label class="label-left" for="email">部门领导</label> <label
							class="label-right"> <c:if
								test="${practicerecord.leader==''}">
					未填写
					</c:if> <c:if test="${practicerecord.leader==null}">
					未填写
					</c:if> <c:if test="${practicerecord.leader!=null}">
					${practicerecord.leader}
				</c:if>
						</label>
						<hr />
						<label class="label-left" for="email">可否网签</label> <label
							class="label-right"> <c:if
								test="${practicerecord.is_netsign==1}">
					可以
					</c:if> <c:if test="${practicerecord.is_netsign==2}">
					不可以
					</c:if>
						</label>
						<hr />
						<label class="label-left" for="email">可否签合同</label> <label
							class="label-right"> <c:if
								test="${practicerecord.is_contract==1}">
					可以
					</c:if> <c:if test="${practicerecord.is_contract==2}">
					不可以
					</c:if>
						</label>
						<hr />
						<label class="label-left" for="email">企业老师</label> <label
							class="label-right"> <c:if
								test="${empty practicerecord.com_teacher}">
					无</c:if> <c:if test="${not empty practicerecord.com_teacher}">
								<%
									out.println(DictionaryService.findTeacher(com_teacher)
												.getTrue_name());
								%>
							</c:if>
						</label>
						<hr />
						<label class="label-left" for="email">老师电话</label> <label
							class="label-right"> <c:if
								test="${empty practicerecord.com_teacher}">
					无</c:if> <c:if test="${not empty practicerecord.com_teacher}">
								<%
									out.println(DictionaryService.findTeacher(com_teacher)
												.getPhone());
								%>
							</c:if>
						</label>
						<hr />
						<label class="label-left" for="email">到岗时间</label> <label
							class="label-right"> <c:if
								test="${practicerecord.work_time==null}">
					无
					</c:if> <c:if test="${practicerecord.work_time!=null}">
					${practicerecord.work_time}
					</c:if>
						</label>
						<hr />
						<label class="label-left" for="email">协议时间</label> <label
							class="label-right"> <c:if
								test="${practicerecord.prct_contract_time==null}">
					无
					</c:if> <c:if test="${practicerecord.prct_contract_time!=null}">
					${practicerecord.work_time}
					</c:if>
						</label>
						<hr />
						<label class="label-left" for="email">公司地区</label> <label
							class="label-right"> <output id="email" type="text"
								value="${practicerecord.com_orgion}">${practicerecord.com_orgion}
							</output></label>
						<hr />
						<label class="label-left" for="email">工作地区</label> <label
							class="label-right"> <output id="email" type="text"
								value="${practicerecord.work_orgion}">${practicerecord.work_orgion}</output>
						</label>
						<hr />
						<label class="label-left" for="email">申请时间</label> <label
							class="label-right"> <output id="email" type="text"
								value="${practicerecord.apply_time}">${practicerecord.apply_time}</output>
						</label>
						<hr />
						<tr>
							<td><input type="hidden" name="compayCheckState"
								id="compayCheckState" value="${state}" /> <input type="hidden"
								name="compayCheckNote" id="compayCheckNote" value="${CheckNote}" />
								<input type="hidden" name="checkTeaID" id="checkTeaID"
								value="${CheckManName}" /> <input type="hidden"
								name="check_state" id="check_state" value="${check_state}" /> <input
								type="hidden" id="companyId" name="companyId"
								value="${company.id }" /></td>
							<!-- 用来获取审核老师id -->
						</tr>

					</form>
				</div>
				<!-- 审批失败后弹出输入框 -->
			</article>
			<footer>
				<nav class="menubar"
					style="width: 100% ; background-color: #FFFFFF; text-align:center;">
					<div>
						<button class="" style="margin-right: 10px;" data-toggle="modal"
							id="checkpass">
							<i class="iconfont iconline-rdo-tick"></i> <span>审批通过</span>
						</button>
					</div>
				</nav>
			</footer>
			<div id="textareaDiv"
				style="top: 30%;left: 10%; background-color: #E8E8E8 ;display: none">
				<div id="login_template" style="padding:10px 20px;">
					<div
						style="text-align:center;font-size:20px;color:#3498DB;font-weight:600;margin:5px 0;">
						请输入审批失败的原因</div>
					<textarea id="note" rows="5" cols="4" name="note"
						value="${practicerecord.note}"></textarea>
					<button class="width-full" id="test">确定</button>
				</div>
			</div>
		</section>
	</div>
	<div id="index_modal" data-role="modal" class="modal bg-carrot">
		<header>
			<div class="titlebar">
				<a data-toggle="back" href="#"><i
					class="iconfont iconline-arrow-left"></i> </a>
				<h1>公司审核</h1>
			</div>
		</header>
		<article data-role="article" id="modal_article" data-scroll="verticle"
			class="active" style="top:44px;bottom:0px;">
			<div class="scroller">

				<ul class="listitem">
					<li class="sliver">公司信息</li>
				</ul>
				<form autocomplete="off"
					oninput="range_output.value=parseInt(range.value)"
					class="form-common">

					<label class="label-left"> 企业名称</label>
					<div style="height:auto;" class="label-right">
						<output>
							<c:if test="${company.com_name=='未添加'}">
								<font color="red">未申请企业，不应通过申请</font>
							</c:if>
							<c:if test="${company.com_name!='未添加'}">
					${company.com_name} </c:if>

						</output>
					</div>
					<hr>
					<label class="label-left"> 创建人 </label>
					<div style="height:auto;" class="label-right">
						<output>
							<%
								out.println(DictionaryService.findStudent(createStu_id)
										.getTrue_name());
							%>
						</output>
					</div>
					<hr>


					<label class="label-left"> 企业短名</label>
					<div style="height:auto;" class="label-right">
						<output> ${company.short_name} </output>
					</div>
					<hr>
					<label class="label-left"> 企业地址</label>
					<div style="height:auto;" class="label-right">
						<output>${company.address} </output>
					</div>
					<hr>
					<label class="label-left">联系人</label>
					<div style="height:auto;" class="label-right">
						<output> ${company.contacts} </output>
					</div>
					<hr>
					<label class="label-left"> 联系电话</label>
					<div style="height:auto;" class="label-right">
						<output> ${company.phone} </output>
					</div>
					<hr>
					<label class="label-left"> EMAIL</label>
					<div style="height:auto;" class="label-right">
						<output> ${company.email} </output>
					</div>
					<hr>
					<label class="label-left"> 审核教师</label>
					<div style="height:auto;" class="label-right">
						<output> ${CheckManName} </output>
					</div>
					<hr>
					<label class="label-left">创建时间</label>
					<div style="height:auto;" class="label-right">
						<output> ${company.create_time} </output>
					</div>
					<hr>
					<label class="label-left">审核状态</label>
					<div style="height:auto;" class="label-right">
						<output>
							<c:if test="${company.check_state==0}">
								<font color="red">未审核</font>
							</c:if>
							<c:if test="${company.check_state ==2}">
								<font color="red">已审核失败</font>
							</c:if>
							<input type="hidden" name="checkCompanyTeaID"
								id="checkCompanyTeaID" value="${tea_id}" />
						</output>
					</div>
					<hr>

					<div class="listitem">
						<label>备注：</label>

					</div>
					<div class="card">
						<textarea rows="5" class="noborder" class="sliver" id="CheckNote"
							name="CheckNote" value="${company.check_note }"></textarea>
					</div>
				</form>
				<nav class="menubar"
					style="width: 100% ; background-color: #FFFFFF; text-align:center;">
					<div>
						<button class="" style="margin-right: 10px;" data-toggle="modal"
							id="pass">
							<i class="iconfont iconline-rdo-tick"></i> <span>通过</span>
						</button>
					</div>
				</nav>
			</div>
		</article>
	</div>

	<!--- third --->
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
	<!-- agile -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script>
	<!--- bridge --->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	<script>
		/* 	function doCheck(state) {
				if (document.getElementById("compayCheckState").value == 1) {

					var url = "check.do?check_state=" + state;
					document.form1.action = url;
					document.form1.submit();
				} else {
					alert("请先点击审核企业，审核企业信息！");
				}

			} */

		//点击申请成功 丁乐晓20151224
		$('#checkpass').on(A.options.clickEvent, function() {
			if (document.getElementById("compayCheckState").value == 1) {
				var state = 1;
				$.ajax({
					type : "post",
					url : "check.do?check_state=" + state,
					data : $('#form1').serialize(),//设置发送参数，即使参数为空，也需要设置                
					dataType : "text", //返回的类型为json                
					success : function(data) { //成功时执行的方法					
						A.confirm("提示", "申请成功！", function() {
							location.href = "internshipApproval.do";
						}, function() {
							return false;
						});
					},
					error : function(result, status) { //出错时会执行这里的回调函数                     
						if (status == 'error') {
							A.alert("申请错误！");
						}
					}
				});
				/* var state=1;
				A.alert("申请成功！");
				var url = "check.do?check_state=" + state;
				document.form1.action = url;
				document.form1.submit(); */
			} else if (document.getElementById("compayCheckState").value == 2) {
				A.alert("该学生申请的公司已经有人审核且公司审核失败!");
			} else {
				A.confirm("提示", "请先点击审核企业，审核企业信息！", function() {
					A.Controller.modal('#index_modal');
				}, function() {
					return false;
				});

			}
		});
		//确定时隐藏
		$('#test').on(A.options.clickEvent, function() {
			var a = $("#note").val();
			if (a != "") {
				var state = 2;
				document.getElementById("textareaDiv").style.display = "none";
				$("#nostate").attr("value", state);
				$("#nonote").attr("value", a);
				var url = "check.do?check_state=" + state;
				document.form1.action = url;
				document.form1.submit();
			} else {
				A.alert("请输入不通过的原因!");
			}
		});
		//点击申请不成功
		$('#checknopass').on(A.options.clickEvent, function() {
			var a = $("#note").val();
			if (a == "") {
				document.getElementById("textareaDiv").style.display = "";
			} else if (a != "") {
				window.location.href = "internshipApproval.do";
			}

		});
		//点击公司审核通过
		$('#pass').on(A.options.clickEvent, function() {
			A.confirm("提示", "审核通过", function() {
				var state = 1;
				document.getElementById("compayCheckNote").value = "";
				document.getElementById("compayCheckState").value = state;
				var TeaID = document.getElementById("checkCompanyTeaID").value;
				document.getElementById("checkTeaID").value = TeaID;
				A.Controller.modal('#index_modal');
				$("#changecolor").css("color", "black");
			}, function() {
				return false;
			});
			return false;
		});
		//点击审核不通过
		$('#nopass').on(A.options.clickEvent, function() {
			if (document.getElementById("CheckNote").value == "") {
				A.alert("请在备注填写不通过原因！");
			} else {
				var state = 2;
				document.getElementById("compayCheckState").value = state;
				var note = document.getElementById("CheckNote").value;
				document.getElementById("compayCheckNote").value = note;
				A.Controller.modal('#index_modal');
				$("#changecolor").css("color", "black");
			}
		});
	</script>
</body>
</html>
