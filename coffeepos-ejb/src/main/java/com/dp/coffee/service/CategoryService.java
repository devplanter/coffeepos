package com.dp.coffee.service;

import java.util.List;

import com.dp.coffee.entity.Category;

public class CategoryService extends AbstractService<Category> {

	public CategoryService(Class<Category> entityClass) {
		super(entityClass);
	}
	
	public Category createCategory(Category category){
		return super.create(category);
	}

	public CategoryService() {
		super(Category.class);
	}

	public List<Category> findAll() {
		return findAll(Category.FIND_ALL);
	}

	public List<Category> find(final String categoryName) {
		return findAll(Category.FIND_BY_NAME, categoryName);
	}

	public Category findById(final int id) {
		return findOne(Category.FIND_BY_ID, id);
	}
}
