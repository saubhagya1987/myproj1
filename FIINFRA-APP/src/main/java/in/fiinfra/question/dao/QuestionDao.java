package in.fiinfra.question.dao;

import in.fiinfra.question.AnswerData;
import in.fiinfra.question.QuestionData;

import java.util.ArrayList;
import java.util.List;

public interface QuestionDao {

	List<QuestionData> getQuestions(int buId,int sourceSystem, int questionType, int party );
	
	
	AnswerData saveQuestionAnswer(int buId, AnswerData answer);
	
	List<QuestionData> getLatestPolls(int buId,int sourceSystem, int party );
	
	AnswerData savePollsAnswer(int buId, AnswerData answer);
	ArrayList<Integer> insertXray(int partyId,int buId,String XMlString,int lastModifiedBy);
}
