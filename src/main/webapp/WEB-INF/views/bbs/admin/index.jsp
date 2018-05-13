<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico">
<LINK rel="Shortcut Icon" href="/favicon.ico" />

<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="H-ui.admin_2.3.1/css/H-ui.min.css" rel="stylesheet"
	type="text/css" />
<link href="H-ui.admin_2.3.1/css/H-ui.admin.css" rel="stylesheet"
	type="text/css" />
<link href="H-ui.admin_2.3.1/skin/green/skin.css" rel="stylesheet"
	type="text/css" id="skin" />
<link href="H-ui.admin_2.3.1/lib/Hui-iconfont/1.0.1/iconfont.css"
	rel="stylesheet" type="text/css" />
<link href="H-ui.admin_2.3.1/css/style.css" rel="stylesheet"
	type="text/css" />

</head>

<body>
	<header class="Hui-header cl">
		<a class="Hui-logo l" title="H-ui.admin v2.3" href="/">商职贴吧</a> <a
			class="Hui-logo-m l" href="/" title="商职贴吧">商职贴吧</a> <span
			class="Hui-subtitle l">V1.01</span>
		<nav class="mainnav cl" id="Hui-nav">
			<ul>
				<li class="dropDown dropDown_click"><a href="javascript:;"
					class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i
						class="Hui-iconfont">&#xe6d5;</i> </a>
					<ul class="dropDown-menu radius box-shadow">
						<li><a href="javascript:;"
							onclick="member_add('添加用户','<%=path %>/admin/user-add.do','','410')"><i
								class="Hui-iconfont">&#xe60d;</i> 用户</a>
						</li>
						<li><a href="javascript:;"
							onclick="article_add('添加帖子','<%=path %>/admin/particulars-add.do')"><i
								class="Hui-iconfont">&#xe616;</i> 帖子</a>
						</li>


					</ul></li>
			</ul>
		</nav>
		<ul class="Hui-userbar">
			<li>超级管理员</li>
			<li class="dropDown dropDown_hover"><a href="#"
				class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i> </a>
				<ul class="dropDown-menu radius box-shadow">
					<li><a href="#">个人信息</a>
					</li>
					<li><a href="#">切换账户</a>
					</li>
					<li><a href="#">退出</a>
					</li>
				</ul></li>
			<li id="Hui-msg"><a href="#" title="消息"><span
					class="badge badge-danger">1</span><i class="Hui-iconfont"
					style="font-size:18px">&#xe68a;</i> </a></li>
		</ul>
		<a aria-hidden="false" class="Hui-nav-toggle" href="#"></a>
	</header>
	<aside class="Hui-aside">
		<input runat="server" id="divScrollValue" type="hidden" value="" />
		<div class="menu_dropdown bk_2">
			<dl id="menu-article">
				<dt>
					<i class="Hui-iconfont">&#xe616;</i> 用户管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a _href="<%=path %>/admin/user-list.do" href="javascript:void(0)">用户管理</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe613;</i> 吧务管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a _href="<%=path %>/admin/particulars-list.do"" href="javascript:void(0)">帖子管理</a>
						</li>
						<li><a _href="<%=path %>/admin/column-list.do"" href="javascript:void(0)">栏目管理</a>
						</li>

					</ul>
				</dd>
			</dl>
			<dl id="menu-product">
				<dt>
					<i class="Hui-iconfont">&#xe620;</i> 角色权限管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a _href="admin-role.html" href="javascript:void(0)">角色管理</a>
						</li>
						<li><a _href="admin-permission.html"
							href="javascript:void(0)">权限管理</a></li>
						<li><a _href="admin-list.html" href="javascript:void(0)">管理员列表</a>
						</li>
					</ul>
				</dd>
			</dl>

		</div>
	</aside>
	<div class="dislpayArrow">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em>
					</li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i>
				</a><a id="js-tabNav-next" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i>
				</a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display:none" class="loading"></div>
				<iframe scrolling="yes" frameborder="0" src="<%=path%>/admin/welcome.do"></iframe>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="H-ui.admin_2.3.1/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="H-ui.admin_2.3.1/lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript" src="H-ui.admin_2.3.1/js/H-ui.js"></script>
	<script type="text/javascript" src="H-ui.admin_2.3.1/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		/*资讯-添加*/
		function article_add(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}

		/*用户-添加*/
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
	</script>
</body>
</html>