package spring_mvc2.Controller;

import java.awt.Window;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring_mvc2.model.Student;
import spring_mvc2.service.Grade_service;
import spring_mvc2.service.Student_service;

@Controller
public class AddStudent {
	
	@Autowired
	Student_service service;
	@Autowired
	Grade_service grade_service;
	
	@RequestMapping("/addStudent")
    public String addStudent() {
    	
    System.out.println("called add Student controller");
    	
    	return "addStudent";
    }
	
	@PostMapping("/addStudent")
	public String registerStudent(@ModelAttribute Student student, Model model,RedirectAttributes redirectAttributes) {
	    Student existing = service.findByEmail(student.getEmail());
	    if (existing != null) {
	    	
			redirectAttributes.addFlashAttribute("msg", "⚠️ Account already exists with this email!");
	        return "redirect:/admin_dashboard"; // return only form fragment
	    } else {
	        service.registerStudent(student);
	        grade_service.saveGrades(student, "NOT ENTERED", 0);
	       
	        redirectAttributes.addFlashAttribute("msg", "✅ Student added successfully!");
	        return "redirect:/admin_dashboard"; // still same fragment
	    }

	}
    
	@RequestMapping("/student_logout")
	
		public String logoutStudent(HttpSession session, RedirectAttributes redirectAttributes) {
			
			 session.removeAttribute("Marks_student");
			 session.removeAttribute("Mark_student");
			    session.removeAttribute("grade");
			    session.removeAttribute("percentage");
			    session.removeAttribute("student");
			    if (session != null) {
			        session.invalidate(); 
			    }
			    
			    
			    
			 
//			    redirectAttributes.addFlashAttribute("msg", "You have been logged out successfully!");

		   
//		    redirectAttributes.addFlashAttribute("msg", "You have been logged out successfully!");

		    
		    return "redirect:/admin_dashboard";  
		}
		
		
		
	}
	
	
	
	
	
	
	


