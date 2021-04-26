package org.ics.java;

import java.util.Set;



public class Account {
	
	private String username;
	private String firstName;
	private String surname;
	private double totalIncome;
	private double fixedCost;
	private double variableCost;
	
	public Account(String username, String firstName, String surname, double totalIncome, double fixedCost, double variableCost) {
		this.username = username;
		this.firstName = firstName;
		this.surname = surname;
		this.totalIncome = totalIncome;
		this.fixedCost = fixedCost;
		this.variableCost = variableCost;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public double getTotalIncome() {
		return totalIncome;
	}
	public void setTotalIncome(double totalIncome) {
		this.totalIncome = totalIncome;
	}
	public double getFixedCost() {
		return fixedCost;
	}
	public void setFixedCost(double fixedCost) {
		this.fixedCost = fixedCost;
	}
	public double getVariableCost() {
		return variableCost;
	}
	public void setVariableCost(double variableCost) {
		this.variableCost = variableCost;
	}

}
