<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
	<head>
		<meta charset="utf-8" />
		<title>是云开源兼职筛选</title>
		<link rel="stylesheet" href="${contextPath}/static/css/www/shoucan.css" />
	    <link rel="stylesheet" href="${contextPath}/static/css/www/footer.css" />
		<link rel="stylesheet" href="${contextPath}/static/css/bootstrap.css">
		<script type="text/javascript" src="${contextPath}/static/js/jquery-1.11.3.js" ></script>
		<script type="text/javascript" src="${contextPath}/static/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="${contextPath}/static/js/sweerAlert2.79.js"></script>
		<script type="text/javascript" src="${contextPath}/static/js/jquery.twbsPagination.min.js"></script>
	</head>
	<body>
	<!--头部导航条-->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<img src="${contextPath}/static/img/logo.png" width="100" height="50"/>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/index1">首页<span class="sr-only">(current)</span></a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">兼职选择<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/school/">校园兼职</a></li>
							<li><a href="/position">社会兼职</a></li>
						</ul>
					</li>
					<li><a href="/question">问答管理</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/resume">简历管理</a></li>
							<li><a href="/collection">兼职收藏</a></li>
							<li><a href="/apply">兼职申请进度</a></li></li>
						</ul>
					</li>
				</ul>

				<shiro:notAuthenticated>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/login1">登录</a></li>
						<li><a href="/register">注册</a></li>
					</ul>
				</shiro:notAuthenticated>

				<shiro:authenticated>
					<ul class="nav navbar-nav navbar-right">
						<shiro:hasRole name="admin">
							<li><a href="/admin/">管理员</a></li>
						</shiro:hasRole>
						<li><a href="javascript:void(0);">${username}</a></li>
						<li><a href="/logout">退出</a></li>
					</ul>
				</shiro:authenticated>
			</div>
		</div>
	</nav>
        
       <h4><span>收藏兼职</span></h4>
	   <div id="count">一共收藏了${collection.list[0].count}个兼职</div>
       <div id="table">
        	<ul>
        		<li style="display: none;">id</li>
        		<li>兼职描述</li>
        		<li>工作地点</li>
        		<li>类别</li>
        		<li>企业名称</li>
        		<li>操作</li>
        	</ul>
        	<ul id="ulPosition">
                <c:forEach items="${collection.list}" var="p" step="1">
        		<li class="positionList">
        			<span style="display:none;">${p.id}</span>
					<span style="display:none;">${p.flag}</span>
        			<span class="PName">${p.pName}</span>
        			<span>${p.workSpace}</span>
        			<span>${p.pClassify}</span>
        			<span>${p.department}</span>
        			<span><a href="javascript:void(0)">取消收藏</a></span>
        			<p style="width: 800px;height:31px;overflow: hidden">${p.pRequest}</p>
        		</li>
				</c:forEach>
        	</ul>
        </div>
        
         <!--分页-->
        <div id="page" style="float: right;margin-right: 145px;position: relative;top: -15px;">
				<span id="totalPage" style="display: none">${collection.pages}</span>
				<ul class="pagination" id="pagination-demo"></ul>
        </div>
        
         <!--尾部-->
       <footer>
		   <div class="left_1">
			   <ul>
				  <li><a href="" target="_blank">官方网站</a></li>

				   <li><a  href="http://www.baidu.com/" target="_blank">百度一下</a></li>

			   </ul>
		   </div>


		   <div id="desc">
			   <p>© 2022 是云开源. All Rights Reserved. </p>
		   </div>
       </footer>
	<script src="${contextPath}/static/js/www/collection.js"></script>
	<script src="${contextPath}/static/js/www/collectionPage.js"></script>
	</body>
</html>
