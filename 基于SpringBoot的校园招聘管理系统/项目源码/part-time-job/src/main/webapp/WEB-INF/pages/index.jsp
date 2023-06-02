<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>校职酷联</title>
	    <link rel="stylesheet" href="${contextPath}/static/css/index.css" />
	    <link rel="stylesheet" href="${contextPath}/static/css/www/footer.css" />
		<link rel="stylesheet" href="${contextPath}/static/css/bootstrap.css">
		<script type="text/javascript" src="${contextPath}/static/js/jquery-1.11.3.js" ></script>
		<script type="text/javascript" src="${contextPath}/static/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="${contextPath}/static/js/sweerAlert2.79.js" ></script>
	</head>
	<body style="text-align:center">
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
							<li><a href="/admin/">后台管理</a></li>
						</shiro:hasRole>
						<li><a href="javascript:void(0);">${username}</a></li>
						<li><a href="/logout">退出</a></li>
					</ul>
				</shiro:authenticated>
		    </div>
		  </div>
        </nav>
        
        <!--广告图和搜索框-->
        <div id="ad">
        	<div class="text">校职酷联</div>
            <!--搜索框-->
            <div class="search">
				<div class="input-group">
				    <input type="text" id="keyWord" class="form-control" placeholder="请选择相应的类型再输入关键词" style="width:
				    300px;height: 50px;"/>
				      <span class="input-group-btn">
				        <button  class="btn btn-danger glyphicon glyphicon-search" type="button" style="width: 50px;height: 50px;"></button>
				      </span>
				</div>
			    <div class="choose">
			    	<ul>
			    		<li><input type="radio" name="r1" value="2" checked>&nbsp;校园兼职</li>
						<li><input type="radio" name="r1" value="1">&nbsp;社会兼职</li>
			    	</ul>
			   	</div>
           </div>
        </div>   
        <!--中心内容-->
        <div id="container">
        	<div class="t1">
        		寻找适合自己的工作，发挥自我人生价值！
        		<br>
        		<p>是金子的你，总会发光！</p>
        	</div>
        	<div>
        		<strong style="">来吧，加入我们!</strong>
        	</div>
        </div>
        
        <div id="category">
        	 <!--社会兼职-->
	        <div class="shehui">
	       		<img src="${contextPath}/static/img/img1.jpg" width="400px" height="400px"/>
	       		<div class="button1"><a href="/position" class="btn btn-danger" value="社会兼职">社会兼职</a></div>
	       		<div class="t2">发挥你的潜能，在这里能够创造属于你的无限可能</div>
	       	</div>
	       	<!--校园兼职-->
	       	<div class="xiaoyuan">
	       		<img src="${contextPath}/static/img/img2.jpg" width="400px" height="400px"/>
	       		<div class="button1"><a href="/school/" class="btn btn-danger" value="校园兼职">校园兼职</a></div>
	            <div class="t2">洞见新知的你，让我们携起手来，创造美好的未来</div>
	       	</div>
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
       		<p>© 2023 校职酷联电商项目. All Rights Reserved. </p>
       	</div>
       </footer>

	<script src="${contextPath}/static/js/index.js"></script>
	</body>
</html>
