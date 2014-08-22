<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@ taglib prefix="s" uri="struts-tags"%>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/home.css">
</head>
<body>
	<div id="wrapper">
		<!-- sidebar wrapper -->
		<div id="sidebar-wrapper">
			<!-- company logo -->
			<div class="sidebar-logo">
				<a href="#">Startbucks Coffee</a>
			</div>
			<!-- user information -->
			<div class="sidebar-profile">
				<img src="${pageContext.request.contextPath}/assets/img/photo.jpg">
				<div class="profile-head"><a href="#">(0012) John Doe</a></div>
				<div class="profile-subl">Sale Manager</div>
			</div>
			<!-- sidebar menu -->
			<ul class="sidebar-menu">
				<li><a href="../logout.action"><i class="fa fa-power-off"></i>Logout</a></li>
			</ul>
		</div>
		
		<!-- content wrapper -->
		<div id="content-wrapper">
			<!-- navbar -->
			<div class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-icon"><a href="#"><i class="fa fa-bars"></i></a></div>
					<div class="navbar-title">Your Applications</div>
				</div>
			</div>
			<!-- main -->
			<div class="container">
				<div class="app-panel">
					<ul class="app">
						<li><a href="pos/pos.action"><div class="app-icon red"><i class="fa fa-shopping-cart"></i></div><p class="app-label">Point of Sale</p></a></li>
						<li><a href="#"><div class="app-icon black"><i class="fa fa-inbox"></i></div><p class="app-label">Products</p></a></li>
						<li><a href="#"><div class="app-icon blue"><i class="fa fa-users"></i></div><p class="app-label">Customers</p></a></li>
					</ul>
				</div>
	
				<div class="line">
					<span>Administration</span>
				</div>

				<div class="app-panel">
					<ul class="app">
						<li><a href="#"><div class="app-icon blue"><i class="fa fa-cog"></i></div><p class="app-label">Settings</p></a></li>
						<li><a href="#"><div class="app-icon green"><i class="fa fa-bar-chart-o"></i></div><p class="app-label">Reports</p></a></li>
						<li><a href="#"><div class="app-icon black"><i class="fa fa-user"></i></div><p class="app-label">Users</p></a></li>
						<li><a href="#"><p class="ballon">1</p><div class="app-icon gray"><i class="fa fa-refresh"></i></div><p class="app-label">Software Update</p></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>