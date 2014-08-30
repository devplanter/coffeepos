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
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@Entity
@NamedQueries({ 
	@NamedQuery(name = Site.FIND_ALL, query = "SELECT s FROM Site s WHERE s.isActive='Y' and s.isDelete='N'"), 
	@NamedQuery(name = Site.FIND_BY_ID, query = "SELECT s FROM Site s WHERE s.isActive='Y' and s.isDelete='N' and s.siteId=?1"), 
	@NamedQuery(name = Site.FIND_BY_NAME, query = "SELECT s FROM Site s WHERE s.isActive='Y' and s.isDelete='N' and s.siteName=?1")
})
public class Site implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public static final String FIND_ALL = "Site.findAll";
	public static final String FIND_BY_ID = "Site.findById";
	public static final String FIND_BY_NAME = "Site.findByName";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "site_id")
	private int siteId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	private Date createDate;

	private String description;

	@Column(name = "is_active")
	private String isActive;

	@Column(name = "is_delete")
	private String isDelete;

	@Column(name = "site_name")
	private String siteName;

	private String url;

	public Site() {
	}

	public int getSiteId() {
		return this.siteId;
	}

	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIsActive() {
		return this.isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public String getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getSiteName() {
		return this.siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}