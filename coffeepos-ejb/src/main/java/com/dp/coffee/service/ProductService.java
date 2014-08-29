package com.dp.coffee.service;

import java.util.List;

import com.dp.coffee.entity.Category;
import com.dp.coffee.entity.Product;

public class ProductService extends AbstractService<Product>{

	public ProductService(Class<Product> entityClass) {
		super(entityClass);
	}

	public List<Product>findByCategory(Category category){
		return null;
	}
	
	public Product findById(int id){
		return find(id);
	}
	
	// This method has not passed the unit testing yet.
	public List<Product>findByCategoryId(String id){
		return findAll(Product.QUERY_BY_CATEGORY, id);
	}
	
	public Product createProduct(Product product){
		return create(product);
	}
}
