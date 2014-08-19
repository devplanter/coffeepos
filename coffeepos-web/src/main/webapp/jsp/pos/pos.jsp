<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@ taglib prefix="s" uri="struts-tags"%>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/pos.css">
</head>
<body>
	<div class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<div class="col-md-7">
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
			<div class="col-md-5">
				<!-- date timer -->
				<div class="timer">
					<div class="date"><i class="fa fa-clock-o"></i> Sun 12th Apr 2014</div>
					<p class="time">13:01 PM</p>
				</div>
				<!-- profile -->
				<div class="navbar-text pull-left">
					<a href="#">John Doe</a>
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

	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<div class="product-box">
					<ul class="product">
						<li>
							<img src="../img/01.jpg">
							<div class="detail">
								<div class="price">35$</div>
								<div class="title">Cuppuccino Cold</div>
							</div>
						</li>
						<li>
							<img src="../img/02.jpg">
							<div class="detail">
								<div class="price">40$</div>
								<div class="title">Latte Cream</div>
							</div>
						</li>
						<li>
							<img src="../img/03.jpg">
							<div class="detail">
								<div class="price">55$</div>
								<div class="title">Ice Coffee</div>
							</div>
						</li>
						<li>
							<img src="../img/04.jpg">
							<div class="detail">
								<div class="price">35$</div>
								<div class="title">Chocko Ship</div>
							</div>
						</li>
						<li>
							<img src="../img/05.jpg">
							<div class="detail">
								<div class="price">50$</div>
								<div class="title">Coffee Rum</div>
							</div>
						</li>
						<li>
							<img src="../img/06.jpg">
							<div class="detail">
								<div class="price">70$</div>
								<div class="title">Coffee Ice</div>
							</div>
						</li>
						<li>
							<img src="../img/07.jpg">
							<div class="detail">
								<div class="price">180$</div>
								<div class="title">Rum Rasin (S)</div>
							</div>
						</li>
						<li>
							<img src="../img/08.jpg">
							<div class="detail">
								<div class="price">120$</div>
								<div class="title">Almond Rotta</div>
							</div>
						</li>
						<li>
							<img src="../img/09.jpg">
							<div class="detail">
								<div class="price">40$</div>
								<div class="title">Rosetta Creame</div>
							</div>
						</li>
						<li>
							<img src="../img/10.jpg">
							<div class="detail">
								<div class="price">42$</div>
								<div class="title">Chock Ship</div>
							</div>
						</li>
						<li>
							<img src="../img/11.jpg">
							<div class="detail">
								<div class="price">40$</div>
								<div class="title">Vanilla Creme</div>
							</div>
						</li>
						<li>
							<img src="../img/07.jpg">
							<div class="detail">
								<div class="price">180$</div>
								<div class="title">Rum Rasin (XL)</div>
							</div>
						</li>
						<li>
							<img src="../img/08.jpg">
							<div class="detail">
								<div class="price">120$</div>
								<div class="title">Almond Rotta</div>
							</div>
						</li>
						<li>
							<img src="../img/09.jpg">
							<div class="detail">
								<div class="price">40$</div>
								<div class="title">Rosetta Creame</div>
							</div>
						</li>
						<li>
							<img src="../img/08.jpg">
							<div class="detail">
								<div class="price">42$</div>
								<div class="title">Chock Duo</div>
							</div>
						</li>
						<li>
							<img src="../img/03.jpg">
							<div class="detail">
								<div class="price">40$</div>
								<div class="title">Vanilla Creme</div>
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
							<tr>
								<td>Cappuccino Hot</td>
								<td>1</td>
								<td class="bill-price">$35</td>
								<td><a href="#" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
							</tr>
							<tr>
								<td>Rum Rasin (S)</td>
								<td>2</td>
								<td class="bill-price">$125</td>
								<td><a href="#" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
							</tr>
							<tr>
								<td>Almond Rotta</td>
								<td>2</td>
								<td class="bill-price">$50</td>
								<td><a href="#" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
							</tr>
							<tr>
								<td>Rosetta Creme (L)</td>
								<td>1</td>
								<td class="bill-price">$35</td>
								<td><a href="#" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
							</tr>
						</tbody>
					</table>
					<!-- bill total -->
					<table id="bill-total">
						<tr>
							<td>Tax (7%)</td>
							<td>12.50</td>
						</tr>
						<tr>
							<td>Discount (10%)</td>
							<td>100.75</td>
						</tr>
						<tr>
							<td>Total (Baht)</td>
							<td>1,500.60</td>
						</tr>
					</table>
				</div>

				<!-- command buttons -->
				<div class="command-box">
					<a href="#" class="btn btn-danger"><i class="fa fa-trash-o"></i> Delete</a>
					<a href="#" class="btn btn-success"><i class="fa fa-save"></i> Save</a>
					<a href="#" class="btn btn-primary btn-lg pull-right">Checkout</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>