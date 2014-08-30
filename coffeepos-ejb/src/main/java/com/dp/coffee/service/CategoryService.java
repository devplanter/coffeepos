package com.dp.coffee.service;

import com.dp.coffee.entity.Category;

public class CategoryService extends AbstractService<Category> {

	public CategoryService(Class<Category> entityClass) {
		super(entityClass);
	}
	
	public Category createCategory(Category category){
		return super.create(category);
	}
	
}
