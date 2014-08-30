package com.dp.coffee.service;

import java.util.List;

import com.dp.coffee.entity.Site;

public class SiteService extends AbstractService<Site> {
	public SiteService() {
		super(Site.class);
	}

	public List<Site> findAll() {
		return findAll(Site.FIND_ALL);
	}

	public List<Site> find(final String siteName) {
		return findAll(Site.FIND_ALL, siteName);
	}

	public Site findById(final int id) {
		return findOne(Site.FIND_BY_ID, id);
	}
}
