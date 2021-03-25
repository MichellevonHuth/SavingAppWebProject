package org.ics.eao;

import javax.ejb.Remote;

import org.ics.ejb.Account;

@Remote
public interface AccountEAORemote {
	 public Account findByAccountNbr(String username);
	 public Account createAccount(Account account);
	 public Account updateAccount(Account account);
	 public void deleteAccount(String username);
}
