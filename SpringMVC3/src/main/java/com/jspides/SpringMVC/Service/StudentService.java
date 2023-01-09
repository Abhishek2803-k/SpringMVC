package com.jspides.SpringMVC.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspides.SpringMVC.POJO.StudentPOJO;
import com.jspides.SpringMVC.Repository.StudentRepository;

@Service
public class StudentService {
	@Autowired
	private StudentRepository repository; 
	
	public StudentPOJO login(String username, String password) {
		StudentPOJO pojo = repository.login(username, password);
		return pojo;
	}

	public StudentPOJO add(String firstname, String lastname, String email, String username, String password,long contact, String dob) {
		StudentPOJO pojo = repository.add(firstname,lastname,email,username,password,contact,dob);
		return pojo;
	}

	public StudentPOJO search(int id) {
		StudentPOJO pojo= repository.search(id);
		return pojo;
	}
	
	public List<StudentPOJO> searchAll(){
		List<StudentPOJO> pojos = repository.searchAll();
		return pojos;
	}

	public StudentPOJO remove(int id) {
		StudentPOJO pojo = repository.remove(id);
		return pojo;
	}
	
	public void update(int id, String firstname, String lastname, String email, String username, String password,long contact, String dob) {
		repository.update(id,firstname,lastname,email,username,password,contact,dob);
	}
	
}
