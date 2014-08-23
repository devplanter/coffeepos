/**
 * Copyright (C) 2014 DevPlanter Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.dp.coffee.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dp.coffee.entity.SessionBean;
import com.dp.coffee.facade.LoginFacade;
import com.google.inject.Inject;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {
	@Inject
	private LoginFacade loginFacade;

	private static Log log = LogFactory.getLog(BaseAction.class);

	public static final String HOME = "home";
	public static final String LOGIN = "login";
	public static final String ADMIN = "admin";

	public SessionBean sessionBean;
	public String sessionId;
	public int userId;

	public BaseAction() {
		clearErrorsAndMessages();
	}

	public SessionBean checkSession() {
		log.debug("check session of sessionId=" + sessionId + " userid=" + userId);
		SessionBean bean = loginFacade.getSession(sessionId, userId);
		if (bean != null) {
			log.debug("session is valid");
			sessionBean = bean;
		} else {
			addActionError("Session is invalidate");
		}
		return bean;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public SessionBean getSessionBean() {
		return sessionBean;
	}

	public void setSessionBean(SessionBean sessionBean) {
		this.sessionBean = sessionBean;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
