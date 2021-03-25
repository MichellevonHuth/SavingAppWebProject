package org.ics.ejb;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="SavingSchedule")
public class SavingSchedule implements Serializable{
	
	private String savingScheduleNbr;
	private double savingGoal;
	private int savingDurationYear;
	private int savingDurationMonth;
	private Account account;
	
	@Id
	@Column(name="savingScheduleNbr")
	public String getSavingScheduleNbr() {
		return savingScheduleNbr;
	}
	public void setSavingScheduleNbr(String savingScheduleNbr) {
		this.savingScheduleNbr = savingScheduleNbr;
	}
	@Column(name="savingGoal")
	public double getSavingGoal() {
		return savingGoal;
	}
	public void setSavingGoal(double savingGoal) {
		this.savingGoal = savingGoal;
	}
	@Column(name="savingDurationYear")
	public int getSavingDurationYear() {
		return savingDurationYear;
	}
	public void setSavingDurationYear(int savingDurationYear) {
		this.savingDurationYear = savingDurationYear;
	}
	@Column(name="savingDurationMonth")
	public int getSavingDurationMonth() {
		return savingDurationMonth;
	}
	public void setSavingDurationMonth(int savingDurationMonth) {
		this.savingDurationMonth = savingDurationMonth;
	}
	
	@ManyToOne
	@JoinColumn(name="acoountID", referencedColumnName="username")
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	
}
