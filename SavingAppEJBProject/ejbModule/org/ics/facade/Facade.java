package org.ics.facade;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
// vi kör remote och local nu, kolla om detta behövs

import org.ics.eao.AccountEAOLocal;
import org.ics.eao.AccountEAORemote;
import org.ics.eao.SavingScheduleEAOLocal;
import org.ics.eao.SavingScheduleEAORemote;
import org.ics.ejb.Account;
import org.ics.ejb.SavingSchedule;

@Stateless
public class Facade implements FacadeRemote, FacadeLocal {
	
	@EJB
	AccountEAOLocal accountEAOL;
	AccountEAORemote accountEAOR;
	
	@EJB
	SavingScheduleEAOLocal savingScheduleEAOL;
	SavingScheduleEAORemote savingScheduleEAOR;
	
    public Facade() { }
    
    public Account findByAccountUsername(String username) {
    	return accountEAOL.findByAccountUsername(username); 
    }
    // använder inte remote här!
    
    public Account createAccount(Account account) {
    	return accountEAOL.createAccount(account);
    }
    
    public Account updateAccount(Account account) {
    	return accountEAOL.updateAccount(account);
    }
    
    public void deleteAccount(String username) {
    	accountEAOL.deleteAccount(username);
    }

    public SavingSchedule findBySavingScheduleNbr(String savingScheduleNbr) {
    	return savingScheduleEAOL.findBySavingScheduleNbr(savingScheduleNbr);
    }
    
    public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule) {
    	return savingScheduleEAOL.createSavingSchedule(savingSchedule);
    }
    
    public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule) {
    	return savingScheduleEAOL.updateSavingSchedule(savingSchedule);
    }
    
    public void deleteSavingSchedule(String savingScheduleNbr) {
    	savingScheduleEAOL.deleteSavingSchedule(savingScheduleNbr);
    }
    
    public List<SavingSchedule> findByID(String username) {
    	return savingScheduleEAOL.findByID(username);
    }
}
