<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@ taglib prefix="s" uri="struts-tags"%>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/home.css">
</head>
<body>
	<div id="wrapper">
		<!-- content wrapper -->
		<div id="content-wrapper">
			<!-- navbar -->
			<div class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="#" class="navbar-brand">Startbucks Coffee</a>
					</div>
					
					<div class="collapse navbar-collapse">
						<div class="pull-right">
							<div class="navbar-text">
								<a href="#">John Doe</a>
							</div>
							
							<div class="navbar-text">
								<a href="../logout.action?sessionId=${sessionId}&userId=${userId}"><i class="fa fa-power-off"></i> Logout</a>
							</div>
						</div>
					</div>
				</div>				
			</div>
			<!-- main -->
			<div class="container">
				<div class="app-panel">
					<ul class="app">
						<li><a href="../sales/pos.action?sessionId=${sessionId}&userId=${userId}"><div class="app-icon red"><i class="fa fa-shopping-cart"></i></div><p class="app-label">Point of Sale</p></a></li>
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