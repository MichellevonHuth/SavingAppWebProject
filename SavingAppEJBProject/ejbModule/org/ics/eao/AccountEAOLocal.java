package org.ics.eao;

import javax.ejb.Local;

import org.ics.ejb.Account;

@Local
public interface AccountEAOLocal {
	 public Account findByAccountUsername(String username);
	 public Account createAccount(Account account);
	 public Account updateAccount(Account account);
	 public void deleteAccount(String username);
}
