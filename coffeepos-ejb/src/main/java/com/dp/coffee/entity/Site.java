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
import java.util.Date;
import java.util.List;

@Entity
@NamedQuery(name = "Site.findAll", query = "SELECT s FROM Site s")
public class Site implements Serializable {
	private static final long serialVersionUID = 1L;

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

	@OneToMany(mappedBy = "site")
	private List<Bill> bills;

	@OneToMany(mappedBy = "site")
	private List<Category> categories;

	@OneToMany(mappedBy = "site")
	private List<Group> groups;

	@OneToMany(mappedBy = "site")
	private List<Organize> organizes;

	@OneToMany(mappedBy = "site")
	private List<Payment> payments;

	@OneToMany(mappedBy = "site")
	private List<Product> products;

	@OneToMany(mappedBy = "site")
	private List<User> users;

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

	public List<Bill> getBills() {
		return this.bills;
	}

	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}

	public Bill addBill(Bill bill) {
		getBills().add(bill);
		bill.setSite(this);

		return bill;
	}

	public Bill removeBill(Bill bill) {
		getBills().remove(bill);
		bill.setSite(null);

		return bill;
	}

	public List<Category> getCategories() {
		return this.categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Category addCategory(Category category) {
		getCategories().add(category);
		category.setSite(this);

		return category;
	}

	public Category removeCategory(Category category) {
		getCategories().remove(category);
		category.setSite(null);

		return category;
	}

	public List<Group> getGroups() {
		return this.groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	public Group addGroup(Group group) {
		getGroups().add(group);
		group.setSite(this);

		return group;
	}

	public Group removeGroup(Group group) {
		getGroups().remove(group);
		group.setSite(null);

		return group;
	}

	public List<Organize> getOrganizes() {
		return this.organizes;
	}

	public void setOrganizes(List<Organize> organizes) {
		this.organizes = organizes;
	}

	public Organize addOrganize(Organize organize) {
		getOrganizes().add(organize);
		organize.setSite(this);

		return organize;
	}

	public Organize removeOrganize(Organize organize) {
		getOrganizes().remove(organize);
		organize.setSite(null);

		return organize;
	}

	public List<Payment> getPayments() {
		return this.payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}

	public Payment addPayment(Payment payment) {
		getPayments().add(payment);
		payment.setSite(this);

		return payment;
	}

	public Payment removePayment(Payment payment) {
		getPayments().remove(payment);
		payment.setSite(null);

		return payment;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setSite(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setSite(null);

		return product;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User addUser(User user) {
		getUsers().add(user);
		user.setSite(this);

		return user;
	}

	public User removeUser(User user) {
		getUsers().remove(user);
		user.setSite(null);

		return user;
	}

}