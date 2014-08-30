package com.dp.coffee.facade;

import java.util.Date;
import java.util.List;

import com.dp.coffee.entity.Category;
import com.dp.coffee.service.CategoryService;
import com.google.inject.Inject;
import com.google.inject.persist.Transactional;

public class CategoryFacade {

	@Inject
	private CategoryService categoryService;

	public List<Category> findAll() {
		return categoryService.findAll();
	}

	public List<Category> findByName(final String categoryName) {
		return categoryService.find("%" + categoryName + "%");
	}

	public Category find(final int id) {
		return categoryService.findById(id);
	}

	@Transactional
	public Category create(final Category category) {
		category.setCreateDate(new Date());
		category.setUpdateDate(new Date());
		return categoryService.create(category);
	}

	@Transactional
	public Category update(final Category category) {
		category.setUpdateDate(new Date());
		return categoryService.update(category);
	}

	@Transactional
	public void inactive(final int categoryId, final String inactiveBy) {
		Category category = categoryService.findById(categoryId);
		if (category != null) {
			category.setIsActive("N");
			category.setUpdateBy(inactiveBy);
			category.setUpdateDate(new Date());
			categoryService.update(category);
		}
	}

	@Transactional
	public void delete(final int categoryId, final String deleteBy) {
		Category category = categoryService.findById(categoryId);
		if (category != null) {
			category.setIsDelete("Y");
			category.setUpdateBy(deleteBy);
			category.setUpdateDate(new Date());
			categoryService.update(category);
		}
	}
}
