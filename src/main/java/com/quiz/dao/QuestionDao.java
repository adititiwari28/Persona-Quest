package com.quiz.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.quiz.model.Question;

@Repository
public class QuestionDao {
    
	@Autowired
	private JdbcTemplate jdbctemp;
	public List<Question> getAllQuestion(){
		
		String query="Select * from questions";
		return jdbctemp.query(query, new RowMapper<Question>() {
	        public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Question q = new Question();
	            q.setId(rs.getInt("id"));
	            q.setQtext(rs.getString("qtext"));
	            q.setOpta(rs.getString("opta"));
	            q.setOptb(rs.getString("optb"));
	            q.setOptc(rs.getString("optc"));
	            return q;
	        }
	    });

}
	public Question getQuestionById(int id) {
		 String sql = "SELECT * FROM questions WHERE id = ?";
		    List<Question> list = jdbctemp.query(sql, new RowMapper<Question>() {
		        public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
		            Question q = new Question();
		            q.setId(rs.getInt("id"));
		            q.setQtext(rs.getString("qtext"));
		            q.setOpta(rs.getString("opta"));
		            q.setOptb(rs.getString("optb"));
		            q.setOptc(rs.getString("optc"));
		            return q;
		        }
		    }, id); // Pass id as vararg

		    return list.isEmpty() ? null : list.get(0);
		}

		public void updateQuestion(Question q) {
		    String sql = "UPDATE questions SET qtext = ?, opta = ?, optb = ?, optc = ? WHERE id = ?";
		    jdbctemp.update(sql, q.getQtext(), q.getOpta(), q.getOptb(), q.getOptc(), q.getId());
		}

		
		public void deleteQuestion(int id) {
		    String sql = "DELETE FROM questions WHERE id = ?";
		    jdbctemp.update(sql, id);
		}
		
		public void insertQuestion(Question q) {
		    String sql = "INSERT INTO questions (qtext, opta, optb, optc) VALUES (?, ?, ?, ?)";
		    jdbctemp.update(sql, q.getQtext(), q.getOpta(), q.getOptb(), q.getOptc());
		}



		
		
}
