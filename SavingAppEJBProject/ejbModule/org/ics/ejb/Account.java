package org.ics.ejb;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Account")
public class Account implements Serializable{
	
	private String username;
	private String firstName;
	private String surname;
	private double totalIncome;
	private double fixedCost;
	private double variableCost;
	private Set<SavingSchedule> savingschedules;
	
	@Id
	@Column(name="username")
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name="firstName")
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	@Column(name="surname")
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	@Column(name="totalIncome")
	public double getTotalIncome() {
		return totalIncome;
	}
	public void setTotalIncome(double totalIncome) {
		this.totalIncome = totalIncome;
	}
	@Column(name="fixedCost")
	public double getFixedCost() {
		return fixedCost;
	}
	public void setFixedCost(double fixedCost) {
		this.fixedCost = fixedCost;
	}
	@Column(name="variableCost")
	public double getVariableCost() {
		return variableCost;
	}
	public void setVariableCost(double variableCost) {
		this.variableCost = variableCost;
	}
	@OneToMany(mappedBy="account", fetch=FetchType.EAGER)
	public Set<SavingSchedule> getSavingschedules() {
		return savingschedules;
	}
	public void setSavingschedules(Set<SavingSchedule> savingschedules) {
		this.savingschedules = savingschedules;	
	}
}
