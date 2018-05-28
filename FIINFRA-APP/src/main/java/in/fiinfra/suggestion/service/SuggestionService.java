package in.fiinfra.suggestion.service;

import in.fiinfra.common.diy.models.Suggestion;

public interface SuggestionService {
	
	public boolean saveSuggestionData( Integer partyId, String datafor);
	
	public Suggestion getSuggestionData( Integer partyId, String datafor );
	
	public Suggestion getSuggestionDataForGoal( Integer partyId, Integer goalId );
}
