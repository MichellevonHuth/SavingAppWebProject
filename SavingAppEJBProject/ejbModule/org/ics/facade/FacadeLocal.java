package org.ics.facade;

import java.util.List;

import javax.ejb.Local;

import org.ics.ejb.Account;
import org.ics.ejb.SavingSchedule;

@Local
public interface FacadeLocal {
	 public Account findByAccountUsername(String username);
	 public Account createAccount(Account account);
	 public Account updateAccount(Account account);
	 public void deleteAccount(String username);
	 
	 public SavingSchedule findBySavingScheduleNbr(String savingScheduleNbr);
	 public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule);
	 public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule);
	 public void deleteSavingSchedule(String savingScheduleNbr);
	 
	 public List<SavingSchedule> findByID(String username);
}
