package org.ics.ejb;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="SavingSchedule")
@SequenceGenerator(name="ID", allocationSize=1)
public class SavingSchedule implements Serializable{
	//testing
	private String savingScheduleName;
	private double savingGoal;
	private int savingDurationYear;
	private int savingDurationMonth;
	private double budget;
	private long savingScheduleNbr;
	private Account account;


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="savingScheduleNbr")
	public long getSavingScheduleNbr() {
		return savingScheduleNbr;
	}
	public void setSavingScheduleNbr(long savingScheduleNbr) {
		this.savingScheduleNbr = savingScheduleNbr;
	}
	
	@Column(name="savingScheduleName")
	public String getSavingScheduleName() {
		return savingScheduleName;
	}
	public void setSavingScheduleName(String savingScheduleName) {
		this.savingScheduleName = savingScheduleName;
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
	@Column(name="budget")
	public double getBudget() {
		return budget;
	}
	public void setBudget(double budget) {
		this.budget = budget;
	}
	
	@ManyToOne
	@JoinColumn(name="username", referencedColumnName="username")
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}

}
