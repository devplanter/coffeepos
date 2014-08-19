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

@Entity
@NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p")
public class Payment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "payment_id")
	private int paymentId;

	@Column(name = "bill_no")
	private int billNo;

	@Column(name = "card_bank")
	private String cardBank;

	@Column(name = "card_no")
	private String cardNo;

	@Column(name = "card_type")
	private String cardType;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "payment_date")
	private Date paymentDate;

	@Column(name = "payment_method")
	private String paymentMethod;

	@Column(name = "payment_no")
	private String paymentNo;

	@Column(name = "price_amount")
	private float priceAmount;

	@Column(name = "receive_amount")
	private float receiveAmount;

	@Column(name = "return_amount")
	private float returnAmount;

	@ManyToOne
	@JoinColumn(name = "site_id")
	private Site site;

	@ManyToOne
	@JoinColumn(name = "cust_id")
	private Customer customer;

	@ManyToOne
	@JoinColumn(name = "emp_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "status_id")
	private Status status;

	public Payment() {
	}

	public int getPaymentId() {
		return this.paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public int getBillNo() {
		return this.billNo;
	}

	public void setBillNo(int billNo) {
		this.billNo = billNo;
	}

	public String getCardBank() {
		return this.cardBank;
	}

	public void setCardBank(String cardBank) {
		this.cardBank = cardBank;
	}

	public String getCardNo() {
		return this.cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardType() {
		return this.cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public Date getPaymentDate() {
		return this.paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentMethod() {
		return this.paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPaymentNo() {
		return this.paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public float getPriceAmount() {
		return this.priceAmount;
	}

	public void setPriceAmount(float priceAmount) {
		this.priceAmount = priceAmount;
	}

	public float getReceiveAmount() {
		return this.receiveAmount;
	}

	public void setReceiveAmount(float receiveAmount) {
		this.receiveAmount = receiveAmount;
	}

	public float getReturnAmount() {
		return this.returnAmount;
	}

	public void setReturnAmount(float returnAmount) {
		this.returnAmount = returnAmount;
	}

	public Site getSite() {
		return this.site;
	}

	public void setSite(Site site) {
		this.site = site;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Status getStatus() {
		return this.status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

}