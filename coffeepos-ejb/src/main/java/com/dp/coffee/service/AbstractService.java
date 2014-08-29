/**
 * Copyright (C) 2014 devplanter Inc.
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

package com.dp.coffee.service;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.persistence.Query;

public abstract class AbstractService<T> {

	private final transient Class<T> entityClass;

	@Inject
	private transient EntityManager entityManager;

	public AbstractService(final Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	public T find(final Object id) {
		try {
			return getEntityManager().find(entityClass, id);
		} catch (final EntityNotFoundException e) {
			return null;
		}
	}

	public T create(final T entity) {
		getEntityManager().persist(entity);
		return entity;
	}

	public T update(final T entity) {
		return getEntityManager().merge(entity);
	}

	public void remove(final T entity) {
		getEntityManager().remove(getEntityManager().merge(entity));
	}

	protected EntityManager getEntityManager() {
		return this.entityManager;
	}

	protected T findOne(final String namequery, final Object... param) {
		try {
			final Query q = getEntityManager().createNamedQuery(namequery);
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i + 1, param[i]);
			}
			return (T) q.getSingleResult();
		} catch (final NoResultException e) {
			return null;
		}
	}

	protected List<T> findAll(final String namequery, final Object... param) {
		try {
			final Query q = getEntityManager().createNamedQuery(namequery);
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i + 1, param[i]);
			}
			return q.getResultList();
		} catch (final NoResultException e) {
			return null;
		}
	}

	protected List<T> findRange(final String namequery, final int offset, final int limit, final Object... param) {
		try {
			final Query q = getEntityManager().createNamedQuery(namequery);
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i + 1, param[i]);
			}
			if (limit != 0) {
				q.setMaxResults(limit);
			}
			if (offset != 0) {
				q.setFirstResult(offset);
			}
			return q.getResultList();
		} catch (final NoResultException e) {
			return null;
		}
	}

	public void clearCache() {
		getEntityManager().getEntityManagerFactory().getCache().evict(entityClass);
	}

	public void clearCache(final Object id) {
		getEntityManager().getEntityManagerFactory().getCache().evict(entityClass, id);
	}

	public void clearAllCache() {
		getEntityManager().getEntityManagerFactory().getCache().evictAll();
	}

}
