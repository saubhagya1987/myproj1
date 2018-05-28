package in.fiinfra.question.service;

import in.fiinfra.question.AnswerData;
import in.fiinfra.question.QuestionData;

import java.util.ArrayList;
import java.util.List;

public interface QuestionService {

	List<QuestionData> getQuestions(int buId,int sourceSystem, int questionType, int party );
	
	AnswerData saveQuestionAnswer(int buId,AnswerData answer );
	
	List<QuestionData> getPolls(int buId,int sourceSystem,  int party );
	
	AnswerData savePollsAnswer(int buId,AnswerData answer );
	ArrayList<Integer> insertXray(int partyId,int buId,String XMlString,int lastModifiedBy);
	
}
