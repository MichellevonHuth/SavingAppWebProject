package org.ics.eao;

import java.util.List;

import javax.ejb.Remote;

import org.ics.ejb.SavingSchedule;

@Remote
public interface SavingScheduleEAORemote {
	 public SavingSchedule findBySavingScheduleNbr(long savingScheduleNbr);
	 public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule);
	 public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule);
	 public void deleteSavingSchedule(long savingScheduleNbr);
	 public List<SavingSchedule> findByID(String username);
}
