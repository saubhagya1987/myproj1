package in.fiinfra.question.dao;

import in.fiinfra.question.OptionData;
import in.fiinfra.question.QuestionData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

  public class QuestionMapper implements ResultSetExtractor<List<QuestionData>>{
	 @Override
	public List<QuestionData> extractData(ResultSet rs) throws SQLException,
			DataAccessException {
		Map<Integer,QuestionData> map = new HashMap<Integer, QuestionData>();
		List<QuestionData> lst = new ArrayList<QuestionData>();
		
		while(rs.next()){
		int qId =  rs.getInt("QuestionId");
		QuestionData bean = map.get(qId);
		if(bean ==null){
			bean = new QuestionData();
			mapQuestion(rs, bean);
			lst.add(bean);
			map.put(qId, bean);
		}
		//options
		int opId = rs.getInt("OptionId");
		if(opId >0 ){
			OptionData op = new OptionData();
			mapOption(rs, bean, op);
			bean.addOption(op);
		}
		}
		return lst;
	}
	
	protected void mapOption(ResultSet rs, QuestionData q, OptionData op)  throws SQLException{
		op.setOptionId(rs.getInt("OptionId"));
		op.setOptionText(rs.getString("OptionText"));
		op.setSeq(rs.getInt("OptionSeq"));
		op.setFeedback(rs.getString("OptionFeedBack"));
		op.setScore(rs.getInt("OptionScore"));
		//op.setSelectedOptionText(rs.getString("SelectedOptionText"));
		op.setSelected(rs.getInt("selected")>0);
		if(op.isSelected()){
			q.setAnswered(true);
		}
//		op.setSelectedOptionFeedback(rs.getString("SelectedOptionFeedback"));
//		op.setSelectedOptionScore(rs.getInt("SelectedOptionScore"));
		
	}
	
	protected void mapQuestion(ResultSet rs, QuestionData bean)  throws SQLException{
		bean.setQuestionId(rs.getInt("QuestionId"));
		bean.setOrder(rs.getInt("SeqNo"));
		bean.setQuestion(rs.getString("Question"));
		bean.setMandatory(rs.getBoolean("Mandatory"));
		bean.setSectionId(rs.getInt("SectionId"));
		bean.setAttrbCodeId(rs.getInt("AttributeCodeIdQuestion"));
		bean.setQuestionTypeId(rs.getInt("QuestionTypeId"));
		bean.setQuestionnaireId(rs.getInt("QuestionnaireID"));
		bean.setQuestionType(rs.getString("QuestionType"));
		bean.setStartDate(rs.getTimestamp("StartDate"));
		bean.setEndDate(rs.getTimestamp("EndDate"));
		bean.setParentQuestionId(rs.getInt("ParentQuestionId"));
		bean.setParentQuestionOpId(rs.getInt("ParentQuestionOpId"));
		bean.setTotalScore(rs.getInt("totalScore"));

	}

}
