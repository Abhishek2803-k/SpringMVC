package com.jspides.SpringMVC.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspides.SpringMVC.POJO.StudentPOJO;
import com.jspides.SpringMVC.Service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private StudentService service;

	@GetMapping("/home")
	public String home(@SessionAttribute(name = "login", required = false) StudentPOJO login, ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		return "home";
	}

	@GetMapping("/login")
	public String login() {
		return "home";
	}

	@PostMapping("/login")
	public String login(HttpServletRequest request, @RequestParam String username, @RequestParam String password,
			ModelMap map) {
		StudentPOJO student = service.login(username, password);
		if (student != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login", student);
			session.setMaxInactiveInterval(200);
			return "home";
		}
		map.addAttribute("msg", "Inavlid username or password...");
		return "LoginForm";
	}

	@GetMapping("/add")
	public String add(@SessionAttribute(name = "login", required = false) StudentPOJO login, ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		return "add";
	}

	@PostMapping("/add")
	public String addData(@SessionAttribute(name = "login", required = false) StudentPOJO login,
			@RequestParam String firstname, @RequestParam String lastname, @RequestParam String email,
			@RequestParam String username, @RequestParam String password, @RequestParam long contact,
			@RequestParam String dob, ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		StudentPOJO student = service.add(firstname, lastname, email, username, password, contact, dob);
		if (student != null) {
			map.addAttribute("student", student);
			System.out.println(student);
		} else {
			map.addAttribute("msg", "Data is not added, please add again...");
		}
		return "add";
	}

	@GetMapping("/search")
	public String search(@SessionAttribute(name = "login", required = false) StudentPOJO login,ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		return "search";
	}

	@PostMapping("/search")
	public String searchData(@SessionAttribute(name = "login", required = false) StudentPOJO login,
			@RequestParam int id, ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		StudentPOJO student = service.search(id);
		if (student != null) {
			System.out.println(student);
			map.addAttribute("student", student);
		} else {
			map.addAttribute("msg", "Data not Found in DataBase...");
		}
		return "search";
	}

	@GetMapping("/update")
	public String update(@SessionAttribute(name = "login", required = false) StudentPOJO login,ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		List<StudentPOJO> students = service.searchAll();
		map.addAttribute("students", students);
		return "update";
	}

	@PostMapping("/update")
	public String updateForm(@SessionAttribute(name = "login", required = false) StudentPOJO login,@RequestParam int id, ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		StudentPOJO student = service.search(id);
		if (student != null) {
			map.addAttribute("student", student);
		} else {
			map.addAttribute("msg", "Id not matched, Plaese Enter ID Correctly...");
			List<StudentPOJO> students = service.searchAll();
			map.addAttribute("students", students);
		}
		return "update";
	}

	@PostMapping("/updateData")
	public String updateData(@SessionAttribute(name = "login", required = false) StudentPOJO login, @RequestParam int id, @RequestParam String firstname, @RequestParam String lastname,
			@RequestParam String email, @RequestParam String username, @RequestParam String password,
			@RequestParam long contact, @RequestParam String dob, ModelMap map) {
		
//		System.out.println(id);
		
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		StudentPOJO student = service.search(id);
		if (student != null) {
			service.update(id, firstname, lastname, email, username, password, contact, dob);
			map.addAttribute("msg", "Student data update successfully...");
			List<StudentPOJO> students = service.searchAll();
			map.addAttribute("students", students);
		}
		return "update";
	}

	@GetMapping("/remove")
	public String remove(@SessionAttribute(name = "login", required = false) StudentPOJO login, ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		List<StudentPOJO> students = service.searchAll();
		map.addAttribute("students", students);
		return "remove";
	}

	@PostMapping("/remove")
	public String removeData(@SessionAttribute(name = "login", required = false) StudentPOJO login,@RequestParam int id, ModelMap map) {
		if (login==null) {
			map.addAttribute("msg", "Session is OUT, Please login first to Proceed...");
			return "LoginForm";
		}
		StudentPOJO student = service.remove(id);
		if (student != null) {
			map.addAttribute("msg", "Student data removed successfully");
		} else {
			map.addAttribute("msg", "Data not Found in DataBase...");
		}
		List<StudentPOJO> students = service.searchAll();
		map.addAttribute("students", students);
		return "remove";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, ModelMap map) {
		session.invalidate();
		map.addAttribute("msg", "Logged Out Successfully...");
		return "LoginForm";
	}

}
