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
import org.apache.struts2.ServletActionContext;

import com.dp.coffee.entity.User;
import com.dp.coffee.facade.LoginFacade;
import com.dp.coffee.util.StringUtil;
import com.dp.coffee.util.UniqueId;
import com.google.inject.Inject;

public class LoginAction extends BaseAction {
	private Log log = LogFactory.getLog(LoginAction.class);

	@Inject
	private LoginFacade loginFacade;

	private String username;
	private String password;

	public String execute() {
		return SUCCESS;
	}

	public String authen() {
		log.debug("username=" + username);
		log.debug("password=" + password);

		User user = loginFacade.authenticate(username, password);
		if (user == null) {
			addActionError("Incorrect Username or Password!");
			return LOGIN;
		}

		this.userId = user.getUserId();
		this.sessionId = UniqueId.generateUniqueId(new String[] { this.username });
		log.debug("sessionId=" + this.sessionId);

		String ipAddress = ServletActionContext.getRequest().getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = ServletActionContext.getRequest().getRemoteAddr();
		}
		log.debug("client ip address=" + ipAddress);

		loginFacade.createSession(sessionId, user, ipAddress);
		log.debug("create session is completed successfully");

		this.sessionBean = loginFacade.getSession(sessionId, userId);
		log.debug("sessionBean=" + sessionBean);

		if (this.sessionBean == null) {
			addActionError("User session is invalidated.");
			return LOGIN;
		}

		return HOME;
	}

	public void validate() {
		if ((StringUtil.isEmpty(this.username)) || (StringUtil.isEmpty(this.password))) {
			addActionError("Invalid Username or Password!");
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
