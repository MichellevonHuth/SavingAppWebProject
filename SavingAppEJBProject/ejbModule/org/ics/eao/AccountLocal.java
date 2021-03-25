package org.ics.eao;

import javax.ejb.Local;

import org.ics.ejb.Account;

@Local
public interface AccountLocal {
	public Account findByAccountNbr(String username);
	public Account createAccount(Account account);
	public Account updateAccount(Account account);
	public void deleteAccount(String username);
}
