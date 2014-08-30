package com.dp.coffee.action.test;

import com.dp.coffee.action.BaseAction;
import com.dp.coffee.test.TestProduct;
import com.google.inject.Inject;

public class TestProductAction extends BaseAction{
	
	@Inject
	private TestProduct testProduct;
	
	public String execute(){
		//testProduct.main(null);
		return SUCCESS;
	}
}
