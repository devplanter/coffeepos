package com.dp.coffee.action;

import org.apache.struts2.ServletActionContext;

public class Logout extends BaseAction {

	public String execute() {
		clearErrorsAndMessages();
		ServletActionContext.getRequest().getSession().invalidate();
		addActionMessage("Logout has been successfully");
		return SUCCESS;
	}

}
