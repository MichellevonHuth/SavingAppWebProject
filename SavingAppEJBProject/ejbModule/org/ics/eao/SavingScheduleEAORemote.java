package org.ics.eao;

import javax.ejb.Remote;

import org.ics.ejb.SavingSchedule;

@Remote
public interface SavingScheduleEAORemote {
	 public SavingSchedule findBySavingScheduleNbr(String savingScheduleNbr);
	 public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule);
	 public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule);
	 public void deleteSavingSchedule(String savingScheduleNbr);
}
