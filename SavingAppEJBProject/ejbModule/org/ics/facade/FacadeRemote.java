package org.ics.facade;

import java.util.List;

import javax.ejb.Remote;

import org.ics.ejb.Account;
import org.ics.ejb.SavingSchedule;

@Remote
public interface FacadeRemote {

	 public Account findByAccountUsername(String username);
	 public Account createAccount(Account account);
	 public Account updateAccount(Account account);
	 public void deleteAccount(String username);
	 
	 public SavingSchedule findBySavingScheduleNbr(long savingScheduleNbr);
	 public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule);
	 public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule);
	 public void deleteSavingSchedule(long savingScheduleNbr);
	 
	 public List<SavingSchedule> findByID(String username);
}
