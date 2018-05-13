<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>添加分组</title>


<style type="text/css">
.div {
	border: 1px solid #F00;
	width: 300px;
}

#div1 {
	width: 600px;
	height: 300px;
	overflow: auto;
}

#div2 {
	width: 600px;
	height: 300px;
	overflow: auto;
}

#div4 {
	width: 600px;
	background: #FFFF66;
	float: left;
}

#div3 {
	width: 600px;
	background: #CCFFFF;
	float: left;
}

#div6 {
	margin-left: 15px;
	margin-right: 15px;
	height: 300px;
	float: left;
	width: 30px;
}

#div7 {
	margin-top: 20px;
}
</style>

<!-- Include jQuery and jQuery UI -->
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.min.js"
	type="text/javascript"></script>
<!-- Include Fancytree skin and library -->
<link href="<%=path%>/js/fancytree/skin-win8/ui.fancytree.min.css"
	rel="stylesheet" type="text/css">
<script src="<%=path%>/js/fancytree/jquery.fancytree-all.min.js"
	type="text/javascript"></script>
<!-- Initialize the tree when page is loaded -->

<script type="text/javascript">
	//组织树
	// Create the tree inside the <div id="tree"> element.
	$(document).ready(
			function() {
				$("#tree").fancytree(
						{
							// Initial node data that sets 'lazy' flag on some leaf nodes
							source : [ {
								title : '${org_name }',
								key : '${dept_id }',
								lazy : true,
								folder : true
							} ],

							activate : function(event, data) {
								// A node was activated: display its title:
								var node = data.node;
								$("#selectedNode").text(
										"您激活了：" + node.title + "-" + node.key);
								$("#orgId").val(node.key);
								ajaxOrg_level();
								ajaxSearchPerson();
							},

							select : function(event, data) {
								var node = data.node;
								var cs = node.children;
								if (cs) {
									for ( var i = 0; i < cs.length; i++) {
										cs[i].setSelected(node.isSelected());
									}
								}

								$("#selectedNode")
										.text(
												"您刚刚选择了：" + node.title + "-"
														+ node.key);

								cs = node.tree.getSelectedNodes();
								if (cs) {
									var s = "";
									for ( var i = 0; i < cs.length; i++) {
										s += cs[i].title + ",";
									}
									$("#region input").val(s);//值自动填写到文本框中sss
									$("#selectedNodes").html("您选择了：<br>" + s);
								}

								//node.tree.generateFormElements(); // 作用未知
							},
							createNode : function(event, data) {
								var node = data.node;
								if (node.parent) {
									node.setSelected(node.parent.isSelected());
								}
							},

							lazyLoad : function(event, data) {
								var node = data.node;
								// Issue an ajax request to load child nodes
								data.result = {
									url : "*/getBranchData.do",
									data : {
										key : node.key
									}
								};
							}
						});
			});
	// 向服务器发送搜索请求
	function ajaxOrg_level() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "teacher/ajaxOrg_level.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				getOrg_level(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	//填写组织级别到输入框
	function getOrg_level(ajaxData) {
		var val = $("#org_level").val(ajaxData);

	}
	//拼接ajax条件
	function getSendData() {
		var val = $("#orgId").val();
		var dataSend = "orgId=" + val;
		return dataSend;
	}

	//展示获取到的信息
	/* $(function() { */
	//获取组织成员
	function ajaxSearchPerson() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "teacher/ajaxSearchPerson.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showStudents(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	//显示组织成员到div
	function showStudents(ajaxData) {
		var stus = eval(ajaxData);//将json数据转为对象

		var stuTab = document.getElementById("pTable");
		var i;
		for (i = stuTab.rows.length - 1; i >= 0; i--) {
			stuTab.deleteRow(i);
			console.log("删除表格中所有的内容");

		}
		//获取div2中所有的人
		var cd = [];
		$('#div2 input[name="ck"]').each(function() {

			cd.push($(this).val());

		});

		if (stus.length > 0) {
			for (i = 0; i < stus.length; i++) {
				var orgId = $("#orgId").val();
				var org_level = $("#org_level").val();
				var biaoShi = org_level + "-" + orgId + "-" + stus[i].id;

				//删除其他级别的数据
				console.log("删除div1里其他级别的数据");
				$('#div1 input[name="ck"]:checked').parent().parent().remove();

				//判断是否在此数组
				if (isInArray(cd, biaoShi)) {
					console.log("div1跟div2有相同数据，不允许插入");//不写log，没有延迟，导致原来的数据没清除
					continue;
				} else {

					//判断显示学生还是老师
					if (org_level == 5) {
						console.log("获取的是学生数据，执行插入学生格式");
						var nextRow = stuTab.insertRow(stuTab.rows.length);
						nextRow.insertCell().innerHTML = "<input type='checkbox' id='stus[i].id' name='ck' value="+biaoShi+"> ";
						nextRow.insertCell().innerHTML = stus[i].true_name;
					} else {
						console.log("获取的是老师数据，执行插入老师格式");
						var nextRow = stuTab.insertRow(stuTab.rows.length);
						nextRow.insertCell().innerHTML = "<input type='checkbox' id='stus[i].id' name='ck' value="+biaoShi+"> ";
						nextRow.insertCell().innerHTML = stus[i].true_name;
					}
				}
			}
		} else {
		}
	}
	//判断变量是否在数组中
	function isInArray(arr, val) {
		var testStr = ',' + arr.join(",") + ",";
		return testStr.indexOf("," + val + ",") != -1;
	}

	//添加分组成员
	function addGroupMember() {

		$('input[name="ck"]:checked').each(function() {
			$(this).parent().parent().appendTo("#div2");
		});

	}
	//移除右侧div2的成员
	function dele() {
		//获取div2中所有选中的人
		var cd = [];
		$('#div2 input[name="ck"]:checked').each(function() {

			cd.push($(this).val());

		});
		//判断是否是同一级别的人
		$('#div2 input[name="ck"]:checked').each(function() {
			var val = $("#orgId").val();
			console.log("val:" + val);
			var str = $('#div2 input[name="ck"]:checked:first').val();
			var s = str.indexOf("-");
			var d = str.lastIndexOf("-");
			var jb = str.substring(s + 1, d);
			console.log("jb:" + jb);
			if (val == jb) {
				$(this).parent().parent().appendTo("#div1");
			} else {
				$(this).parent().parent().remove();
			}

		});

	}

	//查看分组成员是否已在数组，并放到输入框供传值
	function saveGroupMember() {//jquery获取复选框值
		var group_name = $("#group_name").val();
		var nianji = $("#nianji").val();
		var xueyuan = $("#xueyuan").val();
		var renwu = $("#renwu").val();
		var purpose = $("#purpose").val();
		var description = $("#description").val();
		var shuZu=$("#shuZu").val();
		
		if (nianji == "0") {

			alert("请填写年级！");
			return;
		}
		if (xueyuan == "0") {

			alert("请填写院系！");
			return;
		}
		if (renwu == "0") {

			alert("请填写任务！");
			return;
		}
		if (group_name == "") {

			alert("请填写分组名称！");
			return;
		}
		if (purpose == "") {

			alert("请填写分组目的！");
			return;
		}
		if (description == "") {

			alert("请填写分组描述！");
			return;
		}
	
		document.forms[0].submit();
	}

	//ajax 传递条件 获取相应的实践任务
	function ajaxShiJian() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "teacher/ajaxShiJian.do",
			data : getShiJianData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showShiJian(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}
	function getShiJianData() {
		var xi = $("#xueyuan").val();
		var nianji = $("#nianji").val();
		var dataSend = "data=" + xi + "-" + nianji;
		console.log("getShiJianData:" + dataSend);
		return dataSend;
	}

	function showShiJian(ajaxData) {
		var shijian = eval(ajaxData);
		console.log(ajaxData);
		var select = document.getElementById("renwu");
		select.options.length = 1;

		if (shijian.length > 0) {

			for ( var i = 0; i < shijian.length; i++) {
				console.log(shijian[i]);
				select.options.add(new Option(shijian[i].task_name,
						shijian[i].id));
			}
		}

	}
	function setShijianId() {
		var renwu = $("#renwu").val();
		$("#renWuId").val(renwu);
		var rName = $("#renwu").find("option:selected").text();
		$("#group_name").val(rName);
		$("#purpose").val(rName);
		$("#group_name").focus();
	}
</script>

<script type="text/javascript">
function back(){
history.back(); 
}

</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#tooltips").show();
	});
	function changeCK() {

	}
</script>

<script type="text/javascript">
	//全选未分组的成员
	function selectAll() {
			var i=1;
			$('#div1 input[name="ck"]').each(function() {
				$(this).attr("checked", true);
			});
	}

</script>

<script type="text/javascript">
	//判断分组名可不可用
	function checkGroupName() {
			
			$.ajax({
			type : "get",
			contentType : "application/json",
			url : "teacher/checkGroupName.do",
			data :getGroupName(), //设置发送参数，即使参数为空，也需要设置      
			dataType : "text", //返回的类型为json   
			success : function(data) { //成功时执行的方法					
				showHint(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getGroupName() {
		var group_name=$('#group_name').val();
		return "group_name="+group_name;
	}
	function showHint(ajaxData) {
		console.log(ajaxData);
		document.getElementById("span").innerHTML=ajaxData;
	}
	
</script>
<!-- 字数限制 -->
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
	<form name="Form2" action="teacher/doAddGroups.do" method="post">
		<h1>添加分组${node.key}</h1>
		<table border="0" width="900">
			<tr>
				<td width="100">任务选择：</td>
				<td width="800">年级:<select name="nianji" id="nianji"
					onchange="ajaxShiJian()">
						<option value="0">请选择</option>
						<c:forEach var="g" items="${Grade }" varStatus="stauts">
							<option value="${g.grade}">${g.grade}</option>
						</c:forEach>
				</select>
		&nbsp;&nbsp;实践任务:<select name="renwu" id="renwu"
		onchange="setShijianId()">
		<option value="0" selected="selected">请选择</option>
		</select></td>
			</tr>

			<tr>

				<td width="100">分组名称：</td>
				<td width="900"><input type="text" name="group_name"
					style="width:500px;" id="group_name" onblur="checkGroupName()" ><span id="span"></span>
					<br> <font color="red"
					size="2"><-推荐分组命名格式：**级-**(老师)-**(所带班级)</font></td>
					<td></td>
			</tr>
			<tr>
				<td width="100">分组目的：</td>
				<td width="800"><input type="text" name="purpose" id="purpose"
					style="width:500px;"></td>
			</tr>
			<tr>
				<td width="100">分组描述：</td>
				<td width="800">
				<div class="wordCount" id="wordCount">
				<textarea  style="resize:none" name="description" id="description" cols="60" rows="4" style="overflow-y: scroll;width:500px;">无</textarea> 
  				<span class="wordwrap"><var class="word">70</var>/70</span>	
				</div>
				</td>
			</tr>

		</table>
		<textarea id="shuZu" name="shuZu" style="display: none;"> </textarea>
		<input type="hidden" id="orgId" name="orgId" value=""> <input
			type="hidden" id="org_level" name="org_level" value=""> <input
			type="hidden" id="renWuId" name="renWuId" value="">
			<!-- 测试按钮不提交，判断分组成员是否正确 -->
			<input type="button" value="保存" onclick="saveGroupMember();" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="back()">返回</button>

		</div>
	</form>
</body>
</html>