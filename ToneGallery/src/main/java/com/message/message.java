package com.message;

import java.sql.Time;

public class message {
	private int id;
	private String name;
	private String email;
	private String message;
	private Time created_at;
	
	
	public message(int id, String name, String email, String message, Time created_at) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.message = message;
		this.created_at = created_at;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public Time getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Time created_at) {
		this.created_at = created_at;
	}
	
	
}
