package org.ics.eao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ics.ejb.Account;

/**
 * Session Bean implementation class AccountEAOImpl
 */
@Stateless
public class AccountEAOImpl implements AccountEAORemote, AccountEAOLocal {

	@PersistenceContext(unitName="ISProject")
	private EntityManager em;
	
    public AccountEAOImpl() {}
    
    public Account findByAccountUsername(String username) {
    	return em.find(Account.class, username);
    }
    
    public Account createAccount(Account account) {
    	em.persist(account);
    	return account;
    }
    
    public Account updateAccount(Account account) {
    	em.merge(account);
    	return account;
    }
    
    public void deleteAccount(String username) {
    	Account a = this.findByAccountUsername(username);
    	if(a != null) {
    		em.remove(a);
    	}
    }

}


