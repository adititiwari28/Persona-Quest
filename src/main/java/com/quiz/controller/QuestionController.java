package com.quiz.controller;

import com.quiz.model.Question;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.dao.QuestionDao;

@Controller
public class QuestionController {
     
	@Autowired
	 private QuestionDao quesDao;
	 
	 @GetMapping("/viewQ")
	 public String viewQuestions(Model model) {
		 List<Question> questions= quesDao.getAllQuestion();
		 model.addAttribute("questions", questions);
		 return "viewQ";
	 }
	 
//	 @GetMapping("/editQ")
//	 public String editQuestion(@RequestParam("id") int id, Model model) {
//	     Question q = quesDao.getQuestionById(id);
//	     model.addAttribute("question", q);
//	     return "editQ";
//	 }
	 
	 @GetMapping("/editQ")
	 public String editQuestion(@RequestParam(value = "id", required = false) Integer id, Model model) {
	     // Load all questions for the table
	     List<Question> questions = quesDao.getAllQuestion();
	     model.addAttribute("questions", questions);
	     model.addAttribute("actionType", "edit");

	     // If an ID is passed, load that question into the form
	     if (id != null) {
	         Question q = quesDao.getQuestionById(id);
	         model.addAttribute("question", q);
	     }

	     return "editQ";
	 }
     
	 @PostMapping("/updateQuestion")
	 public String updateQuestion(
	     @RequestParam("id") int id,
	     @RequestParam("qtext") String qtext,
	     @RequestParam("opta") String opta,
	     @RequestParam("optb") String optb,
	     @RequestParam("optc") String optc
	 ) {
	     Question q = new Question();
	     q.setId(id);
	     q.setQtext(qtext);
	     q.setOpta(opta);
	     q.setOptb(optb);
	     q.setOptc(optc);

	     quesDao.updateQuestion(q);
	     return "redirect:/editQ";
	 }

	 
//	 @GetMapping("/deleteQ")
//	 public String deleteQuestion(@RequestParam("id") int id) {
//	     quesDao.deleteQuestion(id);
//	     return "redirect:/viewq";
//	 }
	 
//	 @GetMapping("/deleteQ")
//	 public String deleteQuestion(@RequestParam("id") int id, Model model) {
//	     // Delete the selected question
//	     quesDao.deleteQuestion(id);
//
//	     // Reload updated question list
//	     List<Question> questions = quesDao.getAllQuestion();
//	     model.addAttribute("questions", questions);
//	     model.addAttribute("actionType", "delete");
//        
//	    
//	     
//	     return "deleteQ";
//	 }
	 
	 
	// 1. Load deleteQ.jsp without deleting anything
	 @GetMapping("/deleteQ")
	 public String loadDeletePage(Model model) {
	     List<Question> questions = quesDao.getAllQuestion();
	     model.addAttribute("questions", questions);
	     model.addAttribute("actionType", "delete");
	     return "deleteQ";
	 }

	 // 2. Delete a question and reload the page
	 @GetMapping("/deleteQ/confirm")
	 public String deleteQuestion(@RequestParam("id") int id, Model model) {
	     quesDao.deleteQuestion(id);
	     List<Question> questions = quesDao.getAllQuestion();
	     model.addAttribute("questions", questions);
	     model.addAttribute("actionType", "delete");
	     return "deleteQ";
	 }
	 
	 @GetMapping("/addQ")
	 public String showAddForm() {
	     return "addQ";
	 }


	 @PostMapping("/addQ")
	 public String addQuestion(
	     @RequestParam("qtext") String qtext,
	     @RequestParam("opta") String opta,
	     @RequestParam("optb") String optb,
	     @RequestParam("optc") String optc
	 ) {
	     Question q = new Question();
	     q.setQtext(qtext);
	     q.setOpta(opta);
	     q.setOptb(optb);
	     q.setOptc(optc);

	     quesDao.insertQuestion(q);
	     return "redirect:/editQ";
	 }



}
