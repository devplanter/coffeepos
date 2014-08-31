/**
 * 
 */

$().ready(function(){
	/*$('#bill-slip').modal({
		keyboard: true
	});*/
});

var app = angular.module('app', []);
app.controller('PosController', function($scope, $http) {
	//$scope.netPrice = 0.0;
	//$scope.totalVat = 0.0;
	$scope.bills = [];
	
	/*
	$scope.items = [
	    {productName:"Cuppuccino Cold", price:30, vat:0.07, image:"/img/01.jpg"},
	    {productName:"Latte cream", price:40, vat:0.07, image:"/img/02.jpg"}
	];
	*/
	
	$http({
        method: "get",
        url: "../api/v1/product",
    }).success(function(result) {
    	$scope.items = result.product;
    });
    	
	$scope.addBillItem = function(index){
		var billItem = new Object();
		billItem.productName = $scope.items[index].productName;
		billItem.unitPrice = $scope.items[index].unitPrice;
		billItem.vat = $scope.items[index].percentOfTax;
		$scope.bills.splice($scope.bills.length, 0, billItem);
	};
	
	$scope.removeBillItem = function(index){
		$scope.bills.splice(index, 1);
	}
	
	$scope.totalPrice = function(){
		var total = 0.0;
		for(var i=0; i<$scope.bills.length;i++){
			total += $scope.bills[i].unitPrice*(1.0-$scope.bills[i].vat);
		}
		return total;
	}
	
	$scope.totalVat = function(){
		var vat = 0.0;
		for(var i=0; i<$scope.bills.length;i++){
			vat += $scope.bills[i].unitPrice*($scope.bills[i].vat);
		}
		return vat;
	}
	
	$scope.getTotalVat = function(){
		return $scope.totalVat().toFixed(2);
	}
	
	$scope.netPrice = function(){
		var net = $scope.totalPrice()+$scope.totalVat();
		return net.toFixed(2);
	}
});
