package com.dp.coffee.action;

import org.apache.struts2.ServletActionContext;

import com.dp.coffee.facade.LoginFacade;
import com.google.inject.Inject;

public class Logout extends BaseAction {

	@Inject
	private LoginFacade loginFacade;

	public String execute() {
		if (checkSession() == null) {
			return LOGIN;
		}

		loginFacade.destroySession(sessionId, userId);
		ServletActionContext.getRequest().getSession().invalidate();

		addActionMessage("User has been logged out");
		return SUCCESS;
	}

}
