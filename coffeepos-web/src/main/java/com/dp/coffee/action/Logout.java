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

		// logout
		loginFacade.destroySession(sessionId, userId);

		// release session
		ServletActionContext.getRequest().getSession().invalidate();

		// clear message
		clearErrorsAndMessages();

		// return flash message
		addActionMessage("User has been logged out");
		return SUCCESS;
	}

}
