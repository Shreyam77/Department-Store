package com.deloitte;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 *
 * @author Mini Project - Group 6
 */

@Entity
@Table(name = "ITEM_TB")
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	@Column(length = 20, name = "code")
	private String invtCode;

	@Column(length = 100, name = "name")
	private String invtName;

	@Column(length = 10, name = "qty")
	private Float qty;

	@Column(length = 10, name = "price")
	private Float unitPrice;

	public Item() {

	}
	
	/**
	 * 
	 * @param id
	 * @param invtCode
	 * @param invtName
	 * @param qty
	 * @param unitPrice
	 */
	public Item(int id, String invtCode, String invtName, Float qty, Float unitPrice) {
		super();
		this.id = id;
		this.invtCode = invtCode;
		this.invtName = invtName;
		this.qty = qty;
		this.unitPrice = unitPrice;
	}

	public Item(String invtCode, String invtName, Float qty, Float unitPrice) {
		super();
		this.invtCode = invtCode;
		this.invtName = invtName;
		this.qty = qty;
		this.unitPrice = unitPrice;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the invtCode
	 */
	public String getInvtCode() {
		return invtCode;
	}

	/**
	 * @param invtCode the invtCode to set
	 */
	public void setInvtCode(String invtCode) {
		this.invtCode = invtCode;
	}

	/**
	 * @return the invtName
	 */
	public String getInvtName() {
		return invtName;
	}

	/**
	 * @param invtName the invtName to set
	 */
	public void setInvtName(String invtName) {
		this.invtName = invtName;
	}

	/**
	 * @return the qty
	 */
	public Float getQty() {
		return qty;
	}

	/**
	 * @param qty the qty to set
	 */
	public void setQty(Float qty) {
		this.qty = qty;
	}

	/**
	 * @return the unitPrice
	 */
	public Float getUnitPrice() {
		return unitPrice;
	}

	/**
	 * @param unitPrice the unitPrice to set
	 */
	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", invtCode=" + invtCode + ", invtName=" + invtName + ", qty=" + qty + ", unitPrice="
				+ unitPrice + "]";
	}

}
