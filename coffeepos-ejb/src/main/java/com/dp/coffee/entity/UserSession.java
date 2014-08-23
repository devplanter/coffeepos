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

package com.dp.coffee.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.util.Date;

@Entity
@Table(name = "user_session")
@NamedQuery(name = UserSession.FIND_BY_SESSION, query = "SELECT u FROM UserSession u where u.sessionId=?1 and u.userId=?2")
public class UserSession implements Serializable {
	private static final long serialVersionUID = 1L;

	public static final String FIND_BY_SESSION = "UserSession.FindBySession";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "ip_address")
	private String ipAddress;

	@Column(name = "is_active")
	private String isActive;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "login_date")
	private Date loginDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "alive_date")
	private Date aliveDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "logout_date")
	private Date logoutDate;

	@Lob
	@Column(name = "session_data")
	private String sessionData;

	@Column(name = "session_id")
	private String sessionId;

	@Column(name = "user_id")
	private int userId;

	public UserSession() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIpAddress() {
		return this.ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getIsActive() {
		return this.isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public Date getLoginDate() {
		return this.loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public Date getLogoutDate() {
		return this.logoutDate;
	}

	public void setLogoutDate(Date logoutDate) {
		this.logoutDate = logoutDate;
	}

	public String getSessionData() {
		return this.sessionData;
	}

	public void setSessionData(String sessionData) {
		this.sessionData = sessionData;
	}

	public String getSessionId() {
		return this.sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getAliveDate() {
		return aliveDate;
	}

	public void setAliveDate(Date aliveDate) {
		this.aliveDate = aliveDate;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(ToStringStyle.MULTI_LINE_STYLE);
	}
}