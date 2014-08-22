<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@ taglib prefix="s" uri="struts-tags"%>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css">
	
	<style>
		.message {
			width: 480px;
			margin: 0 auto;
			margin-top: 40px;
			height: 40px;
		}
	</style>
</head>
<body>
	<div class="logo-box">
		<div class="head-text">CoffeePOS</div>
		<div class="subl-text">A Superb Point of Sale Platform</div>
	</div>

	<div class="message">
		<s:if test="hasActionErrors()">
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">x<span class="sr-only">Close</span></button>
  				<s:actionerror/>
			</div>
		</s:if>
		
		<s:if test="hasActionMessages()">
		   <div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">x<span class="sr-only">Close</span></button>
				<s:actionmessage/>
		   </div>
		</s:if>
	</div>
	
	<div class="login-box">
		<form name="form" method="post" onsubmit="submitform()">
		<div class="login-form">
			<table class="table-form">
				<tr>
					<td>
						<div class="caption">Username</div> <input type="text" id="username" name="username" class="form-control">
					</td>
				</tr>
				<tr>
					<td>
						<div class="caption">Password</div> <input type="password" id="password" name="password" class="form-control">
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-primary" style="width: 100%" id="btn-login">Login</button>
					</td>
				</tr>
			</table>
			<div class="login-label">
				<a href="#">Forgot your password?</a>
			</div>
		</div>
		</form>
		<div class="numpad-form">
			<div class="callout border-callout">
				<table class="table-numpad">
					<tr>
						<td><a href="javascript:numpad(1)" class="btn btn-default" style="width: 100%">1</a></td>
						<td><a href="javascript:numpad(2)" class="btn btn-default" style="width: 100%">2</a></td>
						<td><a href="javascript:numpad(3)" class="btn btn-default" style="width: 100%">3</a></td>
					</tr>
					<tr>
						<td><a href="javascript:numpad(4)" class="btn btn-default" style="width: 100%">4</a></td>
						<td><a href="javascript:numpad(5)" class="btn btn-default" style="width: 100%">5</a></td>
						<td><a href="javascript:numpad(6)" class="btn btn-default" style="width: 100%">6</a></td>
					</tr>
					<tr>
						<td><a href="javascript:numpad(7)" class="btn btn-default" style="width: 100%">7</a></td>
						<td><a href="javascript:numpad(8)" class="btn btn-default" style="width: 100%">8</a></td>
						<td><a href="javascript:numpad(9)" class="btn btn-default" style="width: 100%">9</a></td>
					</tr>
					<tr>
						<td><a href="javascript:numpad(0)" class="btn btn-default" style="width: 100%">0</a></td>
						<td><a href="#" class="btn btn-success" style="width: 100%" id="btn-ok">OK</a></td>
						<td><a href="#" class="btn btn-danger" style="width: 100%" id="btn-clear">Clear</a></td>
					</tr>
				</table>
				<b class="border-notch notch"></b> <b class="notch"></b>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var usernameFocused = true;
	
		$(function() {
			$('#username').focus(function() {
				if($('.notch').hasClass('notch-password')) {
					$('.notch').removeClass('notch-password');
				}
				$('.notch').addClass('notch-username');
				usernameFocused = true;
			});
			
			
			$('#password').focus(function() {
				if($('.notch').hasClass('notch-username')) {
					$('.notch').removeClass('notch-username');
				}				
				$('.notch').addClass('notch-password');
				usernameFocused = false;
			});
			
			$('#btn-ok').click(function() {
				if(usernameFocused) {
					$('#password').focus();	
				} else {
					submitform();
				}
			});
			
			$('#btn-clear').click(function() {
				if(usernameFocused) {
					$('#username').val('');
					$('#username').focus();
				} else {
					$('#password').val('');	
					$('#password').focus();
				}
			});
			
			$('#btn-login').click(function() {
				submitform();	
			});
		});
		
		
		function numpad(n) {
			if(usernameFocused) {
				$('#username').val($('#username').val() + '' + n);
			} else {
				$('#password').val($('#password').val() + '' + n);
			}
		}
		
		function submitform() {
			document.form.action = "authen.action";
			document.form.submit();
		}
	</script>
</body>
</html>