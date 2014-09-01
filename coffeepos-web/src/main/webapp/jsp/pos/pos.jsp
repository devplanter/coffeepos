<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@ taglib prefix="s" uri="struts-tags"%>

<html>
<head>
	<title>Test</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/pos.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/pos.js"></script>
</head>
<body>
	<div ng-app="app">
	<div class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<div class="col-md-6">
				<!-- navbar list -->
				<ul class="navbar-section">
					<li>
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">Current</a></li>
							<li><a href="#">12:00 pm</a></li>
							<li><a href="#">11:30 pm</a></li>
							<li><a href="#">10:20 pm</a></li>
						</ul>
					</li>
					<li><a href="#" class="btn btn-success"><i class="fa fa-plus"></i></a></li>
				</ul>
			</div>
			<div class="col-md-6">
				<!-- date timer -->
				<div class="timer pull-left">
					<div class="date"><i class="fa fa-clock-o"></i> Sun 12th Apr 2014</div>
					<p class="time">13:01 PM</p>
				</div>
				<!-- profile -->
				<div class="pull-right">
					<div class="navbar-text">
						<a href="../home/home.action?sessionId=${sessionId}&userId=${userId}"><i class="fa fa-home"></i></a>
					</div>
				
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
	<div class="navbar-toolbar">
		<div class="container">
			<div class="col-md-7">
				<ul class="category">
					<li class="active"><a href="#">All</a></li>
					<li><a href="#">Coffee</a></li>
					<li><a href="#">Food</a></li>
					<li><a href="#">Beverage</a></li>
					<li><a href="#">Snack</a></li>
					<li><a href="#">Icecream</a></li>
				</ul>
			</div>

			<div class="col-md-5">
				<table border="0" style="width: 100%">
					<tr>
						<td>
							<div class="form-inline">
								<span>Bill #</span>
								<input type="text" name="no" class="form-control" style="width: 80px" value="001/2014">
							</div>
						</td>
						<td style="width: 15px"></td>
						<td>
							<div class="form-inline">
								<span>Customer</span>
								<div class="input-group">
									<input type="text" name="customer" class="form-control" style="width: 175px" value="(001) Jake Livermore">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<div class="container" ng-controller="PosController">
		<div class="row">
			<div class="col-md-7">
				<div class="product-box" >
					<ul class="product">
						<li  ng-repeat="item in items" ng-click="addBillItem($index)">
							<img ng-src="${pageContext.request.contextPath}{{item.image}}">
							<div class="detail">
								<div class="price">{{item.unitPrice}}$</div>
								<div class="title">{{item.productName}}</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-5">
				<!-- search box -->
				<div class="search-box">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-inbox"></i></span>
						<input type="text" name="product" class="form-control" placeholder="Product Code or Barcode">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
					</div>
				</div>
				<!-- bill box -->
				<div class="bill-box">
					<!-- bill -->
					<table id="bill">
						<thead>
							<tr>
								<td>Item</td>
								<td>Qty</td>
								<td align="right">Price</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="billitem in bills">
								<td>{{billitem.productName}}</td>
								<td>1</td>
								<td class="bill-price">{{billitem.unitPrice}}</td>
								<td><a href="#" class="btn btn-danger" ng-click="removeBillItem($index)"><i class="fa fa-times"></i></a></td>
							</tr>
						</tbody>
					</table>
					<!-- bill total -->
					<table id="bill-total">
						<tr>
							<td>Tax</td>
							<td>{{getTotalVat()}}</td>
						</tr>
						<tr>
							<td>Discount</td>
							<td>0</td>
						</tr>
						<tr>
							<td>Total (Baht)</td>
							<td>{{netPrice()}}</td>
						</tr>
					</table>
				</div>

				<!-- command buttons -->
				<div class="command-box">
					<a href="#" class="btn btn-danger"><i class="fa fa-trash-o"></i> Delete</a>
					<a href="#" class="btn btn-success"><i class="fa fa-save"></i> Save</a>
					<a href="#" class="btn btn-primary btn-lg pull-right" data-toggle="modal" data-target="#bill-slip">Checkout</a>
				</div>
			</div>
		</div>
		<div class="modal fade" id="bill-slip" rolw="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			       	 	<h4 class="modal-title" id="myModalLabel">{{bill_no}}</h4>
			      	</div>
			     	<div class="modal-body">
			     		<!-- <table class="table">
			     			<thead></thead>
			     			<tbody>
			     				<tr>
			     					<td><h2 >Total</h2></td>
			     					<td><h2 align="right"> {{netPrice()}}</h2></td>
			     				</tr>
			     				<tr>
			     					<td><h2>Changes</h2></td>
			     					<td><h2 align="right"> {{money - netPrice()}}</h2></td>
			     				</tr>
			     				<tr>
			     					<td><h2>Amount</h2></td>
			     					<td align="right"><input type="number" class="input-large" ng-model="money"/></td>
			     				</tr>
			     			</tbody>
			     		</table> -->
			     		<div class="row">
			     			<div class="col-md-4"><h2>Total</h2></div>
			     			<div class="col-md-4"><h2 align="right"> {{netPrice()}}</h2></div>
			     		</div>
			     		<div class="row">
			     			<div class="col-md-6"><h2>Changes</h2></div>
			     			<div class="col-md-6"><h2 align="right"> {{change.toFixed(2)}}</h2></div>
			     		</div>
			     		<div class="row ">
			     			<div class="col-md-6"><h2>Amount</h2></div>
			     			<div class="col-md-6"><h2 align="right"><input type="number" name="input-money" class="money-amount form-control input-large" placeholder="" ng-change="updateChanges()" ng-model="money"/></h2></div>
			     		</div>
			        	
			      	</div>
			      	<div class="modal-footer">
			        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        	<button type="button" class="btn btn-primary">Print</button>
			      	</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>