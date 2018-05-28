package in.fiinfra.question.service;

import in.fiinfra.question.AnswerData;
import in.fiinfra.question.QuestionData;
import in.fiinfra.question.dao.QuestionDao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	QuestionDao dao;
	
	@Override
	public List<QuestionData> getQuestions(int buId,int sourceSystem, int questionType, int party ){
		return dao.getQuestions(buId, sourceSystem, questionType, party);
	}

	@Override
	public AnswerData saveQuestionAnswer(int buId,AnswerData answer ){
		return dao.saveQuestionAnswer(buId, answer);
	}
	
	@Override
	public List<QuestionData> getPolls(int buId,int sourceSystem,  int party ){
		return dao.getLatestPolls(buId, sourceSystem, party);
	}
	
	@Override
	public AnswerData savePollsAnswer(int buId,AnswerData answer ){
		return dao.savePollsAnswer(buId, answer);
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Integer> insertXray(int partyId,int buId,String XMlString,int lastModifiedBy)
	{
		return dao.insertXray(partyId,buId,XMlString,lastModifiedBy);
	}

}
