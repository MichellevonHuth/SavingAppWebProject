package org.ics.eao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ics.ejb.SavingSchedule;

/**
 * Session Bean implementation class SavingScheduleEAOImpl
 */
@Stateless
public class SavingScheduleEAOImpl implements SavingScheduleEAORemote, SavingScheduleEAOLocal {
	
	@PersistenceContext(unitName="ISProject")
	private EntityManager em;
	
    public SavingScheduleEAOImpl() { }
    
    public SavingSchedule findBySavingScheduleNbr(String savingScheduleNbr) {
    	return em.find(SavingSchedule.class, savingScheduleNbr);
    }
    
    public SavingSchedule createSavingSchedule(SavingSchedule savingSchedule) {
    	em.persist(savingSchedule);
    	return savingSchedule;
    }
    
    public SavingSchedule updateSavingSchedule(SavingSchedule savingSchedule) {
    	em.merge(savingSchedule);
    	return savingSchedule;
    }
    
    public void deleteSavingSchedule(String savingScheduleNbr) {
    	SavingSchedule s = this.findBySavingScheduleNbr(savingScheduleNbr);
    	if (s!= null) {
    		em.remove(s);
    	}
    }

}
