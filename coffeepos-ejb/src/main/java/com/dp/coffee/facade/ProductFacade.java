package com.dp.coffee.facade;

import java.util.List;

import com.dp.coffee.entity.Product;
import com.dp.coffee.service.ProductService;
import com.google.inject.Inject;

public class ProductFacade {

	@Inject
	private ProductService productService;
	
	public Product findById(final int productId) {
		return productService.findById(productId);
	}
	
	public List<Product> findByCategory(final int categoryId) {
		return productService.findByCategoryId(categoryId);
	}
	
	public List<Product> findAll() {
		return productService.findAll();
	}
}
