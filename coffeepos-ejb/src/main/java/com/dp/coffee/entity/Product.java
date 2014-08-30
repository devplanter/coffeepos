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
import javax.xml.bind.annotation.XmlRootElement;

import java.util.Date;
import java.util.List;

@XmlRootElement
@Entity
@Table(name = "product")
@NamedQueries({
	@NamedQuery(name = Product.FIND_ALL, query = "SELECT p FROM Product p WHERE p.isActive='Y' and p.isDelete='N'"),
	@NamedQuery(name = Product.QUERY_BY_CATEGORY, query = "SELECT p FROM Product p WHERE p.category.categoryId = ?1")
})

public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "Product.findAll";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private int productId;

	private String barcode;

	@Column(name = "create_by")
	private String createBy;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	private Date createDate;

	private String description;

	private String image;

	@Column(name = "image_url")
	private String imageUrl;

	@Column(name = "is_active")
	private String isActive;

	@Column(name = "is_delete")
	private String isDelete;

	@Column(name = "is_feature")
	private String isFeature;

	@Column(name = "is_hotsale")
	private String isHotsale;

	@Column(name = "product_code")
	private String productCode;

	@Column(name = "product_name")
	private String productName;

	@Column(name = "stock_unit")
	private int stockUnit;

	private String tag;

	@Column(name = "unit_price")
	private float unitPrice;
	
	@Column(name = "cost_price")
	private float costPrice;

	@Column(name = "update_by")
	private String updateBy;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date")
	private Date updateDate;

	@OneToMany(mappedBy = "product")
	private List<BillItem> billItems;

	@ManyToOne
	@JoinColumn(name = "site_id")
	private Site site;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@Column(name = "percent_of_tax")
	private float percentOfTax;
	
	public static final String QUERY_BY_CATEGORY = "Product.byCategoryId";
	
	// Constructor
	public Product() {
	}

	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
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

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImageUrl() {
		return this.imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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

	public String getIsFeature() {
		return this.isFeature;
	}

	public void setIsFeature(String isFeature) {
		this.isFeature = isFeature;
	}

	public String getIsHotsale() {
		return this.isHotsale;
	}

	public void setIsHotsale(String isHotsale) {
		this.isHotsale = isHotsale;
	}

	public String getProductCode() {
		return this.productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getStockUnit() {
		return this.stockUnit;
	}

	public void setStockUnit(int stockUnit) {
		this.stockUnit = stockUnit;
	}

	public String getTag() {
		return this.tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public float getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public List<BillItem> getBillItems() {
		return this.billItems;
	}

	public void setBillItems(List<BillItem> billItems) {
		this.billItems = billItems;
	}

	public BillItem addBillItem(BillItem billItem) {
		getBillItems().add(billItem);
		billItem.setProduct(this);

		return billItem;
	}

	public BillItem removeBillItem(BillItem billItem) {
		getBillItems().remove(billItem);
		billItem.setProduct(null);

		return billItem;
	}

	public Site getSite() {
		return this.site;
	}

	public void setSite(Site site) {
		this.site = site;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public float getPercentOfTax() {
		return percentOfTax;
	}

	public void setPercentOfTax(float percentOfTax) {
		this.percentOfTax = percentOfTax;
	}

	public float getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}
	
	

}