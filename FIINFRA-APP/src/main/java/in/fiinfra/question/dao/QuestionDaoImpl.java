package in.fiinfra.question.dao;

import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.question.AnswerData;
import in.fiinfra.question.OptionData;
import in.fiinfra.question.QuestionData;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("questionDao")
public class QuestionDaoImpl implements QuestionDao{

	@Autowired
	DataSourceProvider dataSourceProvider;
//	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	private static final String SP_GET_QUESTIONS = "{CALL usp_cp_getQuestions(?,?,?,?)}";
	
	private static final String SP_GET_POLLS = "{CALL usp_cp_getLatestPolls(?,?,?)}";
	
	private static final String SP_SAVE_QUESTION_ANSWER= "usp_cp_saveQuestionAnswer";
	
	private static final String SP_SAVE_POLLS_ANSWER= "usp_cp_saveQuestionAnswer";
	
	
	@Override
	public List<QuestionData> getQuestions(int buId,int sourceSystem, int questionType, int party ){
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_GET_QUESTIONS, new Object[]{buId,sourceSystem,questionType,party}, 
			    new QuestionMapper());

	}
	
	@Override
	public List<QuestionData> getLatestPolls(int buId,int sourceSystem, int party ){
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_GET_POLLS, new Object[]{buId,sourceSystem,party}, 
			    new PollMapper());

	}
	
	@Override
	public AnswerData savePollsAnswer(int buId, AnswerData answer) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_SAVE_POLLS_ANSWER);
		StringBuilder optionXML = new StringBuilder();
		optionXML.append("<Root>");
		if(answer.getSelectedOptions() != null){
		for(OptionData  op:answer.getSelectedOptions()){
			optionXML.append("<Option><Id>").append(op.getOptionId()).append("</Id>");
//			optionXML.append("<Value>").append(op.getSelectedOptionText()).append("</Value>");
			optionXML.append("</Option>");
		}
		}
		optionXML.append("</Root>");
		
		sp.setParameters(new SqlParameter[]{
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("questionnaireId", Types.INTEGER),
				new SqlParameter("questionId", Types.INTEGER),
				new SqlParameter("dataXml", Types.VARCHAR),
				new SqlOutParameter("questionScore", Types.INTEGER),
				new SqlOutParameter("score", Types.INTEGER),
				
		} );
		
		sp.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", answer.getPartyId());
		paranValues.put("questionId", answer.getQuestionId());
		paranValues.put("questionnaireId", answer.getQuestionnaireId());
		paranValues.put("dataXml", optionXML.toString());

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		
		answer.setScore((Integer) storedProcResult.get("questionScore"));
		
		
		return answer;
	}
	
	
	@Override
	public AnswerData saveQuestionAnswer(int buId, AnswerData answer) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_SAVE_QUESTION_ANSWER);
		StringBuilder optionXML = new StringBuilder();
		optionXML.append("<Root>");
		for(OptionData op:answer.getSelectedOptions()){
			optionXML.append("<Option><Id>").append(op.getOptionId()).append("</Id>");
//			optionXML.append("<Value>").append(op.getSelectedOptionText()).append("</Value>");
			optionXML.append("</Option>");
		}
		optionXML.append("</Root>");
		
		
		sp.setParameters(new SqlParameter[]{
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("questionnaireId", Types.INTEGER),
				new SqlParameter("questionId", Types.INTEGER),
				new SqlParameter("dataXml", Types.VARCHAR),
				new SqlOutParameter("questionScore", Types.INTEGER),
				new SqlOutParameter("score", Types.INTEGER),
				
		} );
		
		sp.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", answer.getPartyId());
		paranValues.put("questionId", answer.getQuestionId());
		paranValues.put("questionnaireId", answer.getQuestionnaireId());
		paranValues.put("dataXml", optionXML.toString());

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		
		answer.setScore((Integer) storedProcResult.get("questionScore"));
		

		return answer;
	}
	
	public ArrayList<Integer> insertXray(int partyId,int buId,String XMlString,int lastModifiedBy)
	{
		ArrayList<Integer> lstResult = new ArrayList<Integer>();
		int recordCount = 0;
		int score = 0;
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_saveXray");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter xmlStringParam = new SqlParameter("XMlString",
				Types.VARCHAR);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy",
				Types.INTEGER);
		 
		SqlOutParameter questionScoreParam = new SqlOutParameter("questionScore",
				Types.INTEGER);
		SqlOutParameter scoreParam = new SqlOutParameter("score",
				Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount",
				Types.INTEGER);
		SqlParameter[] paramArray = { partyIdParam, 
				 xmlStringParam,lastModifiedByParam,
				 questionScoreParam,scoreParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("XMlString", XMlString);
		paranValues.put("lastModifiedBy", lastModifiedBy);
	

		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		System.out.println("storedProcResult======"+storedProcResult);
		recordCount = ((Integer) storedProcResult.get("recordCount"));
		score = ((Integer) storedProcResult.get("score"));
	 System.out.print("recordCount in APP="+recordCount+"  "+"Score="+score);
	 lstResult.add(recordCount);
	 lstResult.add(score);
		return lstResult;
		
	}
}
