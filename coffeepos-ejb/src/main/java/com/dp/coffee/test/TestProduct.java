package com.dp.coffee.test;

import com.dp.coffee.entity.Product;
import com.dp.coffee.service.ProductService;

public class TestProduct {

	public static void main(String[] args) {
		Product p = new Product();
		p.setProductName("Hot Java");
		p.setUnitPrice((float) 100.0);
		ProductService productService = new ProductService(Product.class);
		if(productService.create(p)!=null){
			System.out.println("YES");
		}
		else{
			System.out.println("Not created.");
		}

	}

}
