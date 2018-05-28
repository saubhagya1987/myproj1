/**
 * 
 */
package in.fiinfra.common.util;

import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartySearchCriteria;

import java.util.Comparator;

/**
 * @author sony
 *
 */
public class PartyDateComparator<T> implements Comparator<T>{

	private boolean isAscending;

	public boolean isAscending() {
		return isAscending;
	}

	public void setAscending(boolean isAscending) {
		this.isAscending = isAscending;
	}

	public PartyDateComparator(boolean isAscending) {
		super();
		this.isAscending = isAscending;
	}
	
	public int compare(T object1, T object2) {
		
		
		if((null != object1 && object1 instanceof PartySearchCriteria) && (null != object1 && object1 instanceof PartySearchCriteria)){
			PartySearchCriteria party1 = (PartySearchCriteria) object1;
			PartySearchCriteria party2 = (PartySearchCriteria) object2;
			
			if(isAscending)
				return party1.getCreationDate().compareTo(party2.getCreationDate());
			else
				return party2.getCreationDate().compareTo(party1.getCreationDate());
		}else{
			return 0;
		}
	}
}
