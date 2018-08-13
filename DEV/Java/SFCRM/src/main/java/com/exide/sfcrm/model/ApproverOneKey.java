package com.exide.sfcrm.model;

import java.io.Serializable;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Transient;

@Embeddable
public class ApproverOneKey implements Serializable{

	private static final long serialVersionUID = 1452421363766475904L;
	
	@Column(name="makertime")
	private Date makerTime;
	
	@Transient
	private String makerTimeActual;
	
	@Column(name="prfno")
	private String prfNo;

	/**
	 * @return the makerTime
	 */
	public Date getMakerTime() {
		return makerTime;
	}

	/**
	 * @param makerTime the makerTime to set
	 */
	public void setMakerTime(Date makerTime) {
		this.makerTime = makerTime;
		
		
	}

	/**
	 * @return the prfNo
	 */
	public String getPrfNo() {
		return prfNo;
	}

	/**
	 * @param prfNo the prfNo to set
	 */
	public void setPrfNo(String prfNo) {
		this.prfNo = prfNo;
	}
	
	@Override
	public int hashCode() {
		return (int) (this.makerTime.getTime()+prfNo.hashCode());
	}
	
	@Override
	public boolean equals(Object obj) {
		ApproverOneKey key = (ApproverOneKey) obj;
		if (key.prfNo.equals(this.prfNo) && key.makerTime.equals(this.makerTime)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * @return the makerTimeActual
	 */
	public String getMakerTimeActual() {
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		this.makerTimeActual = df.format(makerTime);
		return this.makerTimeActual;
	}

	/**
	 * @param makerTimeActual the makerTimeActual to set
	 */
	public void setMakerTimeActual(String makerTimeActual) {
		this.makerTimeActual = makerTimeActual;
	}


}
