package com.jspides.SpringMVC.Repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jspides.SpringMVC.POJO.StudentPOJO;

@Repository
public class StudentRepository {
	@Autowired
	private StudentPOJO pojo;
	
	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private static Query query;
	private static String jpqlQuery;
	

	private static void OpenConnection() {
		factory = Persistence.createEntityManagerFactory("student");
		manager = factory.createEntityManager();
		transaction = manager.getTransaction();
	}

	private static void CloseConnection() {
		if (factory != null) {
			factory.close();
		}
		if (manager != null) {
			manager.close();
		}
		if (transaction != null) {
			try {
				transaction.rollback();
			} catch (Exception e) {
				System.out.println("Transaction is committed");
			}
		}
	}

	public StudentPOJO login(String username, String password) {

		OpenConnection();
		transaction.begin();
		jpqlQuery ="from StudentPOJO where username='"+username+ "'and password='"+password+"'";
		query = manager.createQuery(jpqlQuery);
		List<StudentPOJO> list =(List<StudentPOJO>)query.getResultList();
		transaction.commit();
		CloseConnection();
		for (StudentPOJO pojo : list) {
			return pojo;
		}
		return null;
	}

	public StudentPOJO add(String firstname, String lastname, String email, String username, String password,long contact, String dob) {
		OpenConnection();
		transaction.begin();
		StudentPOJO pojo = new StudentPOJO();
		pojo.setFirstname(firstname);
		pojo.setLastname(lastname);
		pojo.setEmail(email);
		pojo.setUsername(username);
		pojo.setPassword(password);
		pojo.setContact(contact);
		pojo.setDob(dob);
		
		manager.persist(pojo);
		transaction.commit();
		CloseConnection();
		return pojo;
	}

	public StudentPOJO search(int id) {
		OpenConnection();
		transaction.begin();
		StudentPOJO pojo = manager.find(StudentPOJO.class, id);
		if (pojo==null) {
			return null;
		} 
		transaction.commit();
		CloseConnection();
		return pojo;
	}
	
	public List<StudentPOJO> searchAll() {
		OpenConnection();
		transaction.begin();
		jpqlQuery = "from StudentPOJO";
		query = manager.createQuery(jpqlQuery);
		List<StudentPOJO> pojos = query.getResultList();
		transaction.commit();
		CloseConnection();
		return pojos;
	}
	
	public StudentPOJO remove(int id) {
		OpenConnection();
		transaction.begin();
		StudentPOJO pojo = manager.find(StudentPOJO.class, id);
		if (pojo != null) {
			manager.remove(pojo);
		}
		transaction.commit();
		CloseConnection();
		return pojo;
	}

	public void update(int id, String firstname, String lastname, String email, String username, String password,
			long contact, String dob) {
		
		OpenConnection();
		transaction.begin();
		
		StudentPOJO pojo = manager.find(StudentPOJO.class, id);
		
		pojo.setFirstname(firstname);
		pojo.setLastname(lastname);
		pojo.setEmail(email);
		pojo.setUsername(username);
		pojo.setPassword(password);
		pojo.setContact(contact);
		pojo.setDob(dob);
		
		manager.persist(pojo);
		transaction.commit();
		
		CloseConnection();
		
	}

}
