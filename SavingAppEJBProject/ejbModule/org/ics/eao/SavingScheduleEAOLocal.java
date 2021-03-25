package org.ics.eao;

import javax.ejb.Local;

import org.ics.ejb.Account;
import org.ics.ejb.SavingSchedule;

@Local
public interface SavingScheduleEAOLocal {
	 public SavingSchedule findBySavingScheduleNbr(String savingScheduleNbr);
	 public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule);
	 public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule);
	 public void deleteSavingSchedule(String savingScheduleNbr);
	 
}
