package org.ics.eao;

import java.util.List;

import javax.ejb.Local;

import org.ics.ejb.SavingSchedule;

@Local
public interface SavingScheduleEAOLocal {
	 public SavingSchedule findBySavingScheduleNbr(String savingScheduleNbr);
	 public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule);
	 public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule);
	 public void deleteSavingSchedule(String savingScheduleNbr);
	 public List<SavingSchedule> findByID(String username);
	 
}
