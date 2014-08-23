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

package com.dp.coffee.facade;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dp.coffee.entity.SessionBean;
import com.dp.coffee.entity.User;
import com.dp.coffee.entity.UserSession;
import com.dp.coffee.global.Constant;
import com.dp.coffee.service.UserService;
import com.dp.coffee.service.UserSessionService;
import com.dp.coffee.util.SerializeUtil;
import com.google.inject.Inject;
import com.google.inject.persist.Transactional;

public class LoginFacade {
	private static Log log = LogFactory.getLog(LoginFacade.class);

	@Inject
	private UserService userService;

	@Inject
	private UserSessionService userSessionService;

	/**
	 * Login authentication
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@Transactional
	public User authenticate(final String username, final String password) {
		return userService.findByUsername(username, password);
	}

	/**
	 * Create user session and serialize into database
	 * 
	 * @param sessionId
	 * @param user
	 * @return
	 */
	@Transactional
	public SessionBean createSession(final String sessionId, final User user, String ipAddress) {
		int userId = user.getUserId();
		String userName = user.getUsername();
		String password = user.getPassword();

		int groupId = user.getGroup().getGroupId();
		String groupName = user.getGroup().getGroupName();
		String firstName = user.getFirstname();
		String lastName = user.getLastname();

		SessionBean beans = new SessionBean();
		beans.setPassword(password);
		beans.setSessionId(sessionId);
		beans.setUserId(userId);
		beans.setUserName(userName);
		beans.setGroupId(groupId);
		beans.setGroupName(groupName);
		beans.setFirstName(firstName);
		beans.setLastName(lastName);

		String sessionBeanData = SerializeUtil.serialize(beans);
		if (sessionBeanData != null) {
			UserSession us = new UserSession();
			us.setIpAddress(ipAddress);
			us.setIsActive("Y");
			us.setLoginDate(new Date());
			us.setAliveDate(new Date());
			us.setSessionData(sessionBeanData);
			us.setSessionId(sessionId);
			us.setUserId(userId);
			userSessionService.create(us);
		}

		return beans;
	}

	/**
	 * Retrieve the user session that stored from database
	 * 
	 * @param sessionId
	 * @param userId
	 * @return
	 */
	@Transactional
	public SessionBean getSession(final String sessionId, final int userId) {
		UserSession userSession = userSessionService.findBySession(sessionId, userId);
		if (userSession != null) {
			if (!"Y".equalsIgnoreCase(userSession.getIsActive())) {
				log.debug("session is invalidated");
				return null;
			}

			if (userSession.getLogoutDate() != null) {
				log.debug("session is logged out");
				return null;
			}

			Date currentDate = new Date();
			long sessionDiffTime = currentDate.getTime() - userSession.getAliveDate().getTime();
			if (sessionDiffTime > Constant.SESSION_TIMEOUT_MS) {
				log.debug("session has been timed out");
				return null;
			}
			userSession.setAliveDate(currentDate);
			userSessionService.update(userSession);

			return SerializeUtil.deSerialize(userSession.getSessionData());
		}

		return null;
	}

	/**
	 * Destroying a session
	 * 
	 * @param sessionId
	 * @param userId
	 */
	@Transactional
	public void destroySession(final String sessionId, final int userId) {
		UserSession userSession = userSessionService.findBySession(sessionId, userId);
		if (userSession != null) {
			userSession.setIsActive("N");
			userSession.setLogoutDate(new Date());
			userSessionService.update(userSession);
			log.debug("session is logged out");
		}
	}
}
