package com.jspides.SpringMVC.POJO;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

import lombok.Data;

@Entity
@Component
@Data
public class StudentPOJO {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private String firstname;
	private String lastname;
	private String email;
	private String username;
	private String password;
	private long contact;
	private String dob;
}
