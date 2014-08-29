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

@Entity
@Table(name = "bill_item")
@NamedQuery(name = "BillItem.findAll", query = "SELECT b FROM BillItem b")
public class BillItem implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "item_id")
	private int itemId;

	private float amount;

	private float discount;

	@Column(name = "line_no")
	private int lineNo;

	@Column(name = "option_text")
	private String optionText;

	private int qty;

	@Column(name = "unit_price")
	private float unitPrice;
	
	@Column(name = "percent_of_tax")
	private float percentOfTax;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	@ManyToOne
	@JoinColumn(name = "bill_id")
	private Bill bill;

	public BillItem() {
	}

	public int getItemId() {
		return this.itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public float getAmount() {
		return this.amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public float getDiscount() {
		return this.discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public int getLineNo() {
		return this.lineNo;
	}

	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}

	public String getOptionText() {
		return this.optionText;
	}

	public void setOptionText(String optionText) {
		this.optionText = optionText;
	}

	public int getQty() {
		return this.qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public float getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Bill getBill() {
		return this.bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public float getPercentOfTax() {
		return percentOfTax;
	}

	public void setPercentOfTax(float percentOfTax) {
		this.percentOfTax = percentOfTax;
	}

}