package com.quiz.model;

public class Question {
    
	private int id;
	private String qtext;
	private String opta;
	private String optb;
	private String optc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQtext() {
		return qtext;
	}
	public void setQtext(String qtext) {
		this.qtext = qtext;
	}
	public String getOpta() {
		return opta;
	}
	public void setOpta(String opta) {
		this.opta = opta;
	}
	public String getOptb() {
		return optb;
	}
	public void setOptb(String optb) {
		this.optb = optb;
	}
	public String getOptc() {
		return optc;
	}
	public void setOptc(String optc) {
		this.optc = optc;
	}
	public Question(int id, String qtext, String opta, String optb, String optc) {
		super();
		this.id = id;
		this.qtext = qtext;
		this.opta = opta;
		this.optb = optb;
		this.optc = optc;
	}
	public Question() {
		// TODO Auto-generated constructor stub
	}
	
	
}
