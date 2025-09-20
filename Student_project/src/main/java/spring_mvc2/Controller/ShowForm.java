package spring_mvc2.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpSession;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring_mvc2.model.Grade;
import spring_mvc2.model.Marks;
import spring_mvc2.model.Student;
import spring_mvc2.service.Grade_service;
import spring_mvc2.service.Marks_Service;
import spring_mvc2.service.Student_service;

@Controller
public class ShowForm {

    @Autowired
    private Student_service studentservice;
    @Autowired
    private Marks_Service marks_service;
    @Autowired
    private Grade_service grade_service;
    
    

    // Default root mapping → shows login page
    @GetMapping("/")
    public String homePage() {
        return "login";  // /WEB-INF/Views/login.jsp
    }

    @RequestMapping("/home")
    public String home() {
        return "redirect:/login";
    }

    @RequestMapping("/login")
    public String loginPage() {
        return "login"; // /WEB-INF/Views/login.jsp
    }

    @PostMapping("/login")
    public String loginSubmit(@RequestParam("email") String email,
                              @RequestParam("password") String password,
                              Model model,HttpSession student_session) {
    	
    	
    	
    	
    	Student student=studentservice.isValidateuser(email, password);

        if (student!=null) {
        	
        	student_session.setAttribute("student", student);
            return "redirect:/dashboard"; 
            
        }

        model.addAttribute("msg", "Invalid login");
        return "login";
    }
    
    
    @RequestMapping("/dashboard")
    public String dashboard(Model m,HttpSession student_session,RedirectAttributes redirectAttributes) {
    	
    	Student student=(Student) student_session.getAttribute("student");
    	
    	
    	
    	  if(student != null) {
    	        m.addAttribute("student", student);
    	    } else {
    	      
    	        m.addAttribute("student", new Student());
    	    }

    	
    	
    	
    	
    	
    	
    	
    
    	return "dashboard";
    }
    
    
    
    
    
    @RequestMapping("/student_display")
	public String student_dispaly(HttpSession student_session,Model m) {
		
		
		Student student = (Student) student_session.getAttribute("student");
		
m.addAttribute("student",student);
		
//		System.out.println(result);
		
		List<Marks> sub_marks_list =marks_service.getMarksOfStudent(student);
		
		Grade grade=grade_service.getGrades(student);
		
		
		if(grade!=null) {
		String key=grade.getGrade();
		float value=grade.getPercentage();
		
		
		
		System.out.println(sub_marks_list);
			
			m.addAttribute("grade",key);
			m.addAttribute("percentage",value);
			
			m.addAttribute("sub_marks_list",sub_marks_list);
			
			
			System.out.println(key);
			
		
	System.out.println(student.getAddress());
	
	System.out.println(student.getPassword());
		}
		
		return"student_display";
	}
    
    
    @RequestMapping("/student_display2")
   	public String student_dispaly2(HttpSession student_session,Model m) {
   		
   		
   		Student student = (Student) student_session.getAttribute("student");
   		
   m.addAttribute("student",student);
   		
//   		System.out.println(result);
   		
   		List<Marks> sub_marks_list =marks_service.getMarksOfStudent(student);
   		
   		Grade grade=grade_service.getGrades(student);
   		
   		
   		if(grade!=null) {
   		String key=grade.getGrade();
   		float value=grade.getPercentage();
   		
   		
   		
   		System.out.println(sub_marks_list);
   			
   			m.addAttribute("grade",key);
   			m.addAttribute("percentage",value);
   			
   			m.addAttribute("sub_marks_list",sub_marks_list);
   			
   			
   			System.out.println(key);
   			
   		
   	System.out.println(student.getAddress());
   	
   	System.out.println(student.getPassword());
   		}
   		
   		return"student_display1";
    
    
    
    
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @RequestMapping("/profile")
    
    public String getProfile(HttpSession student_session ,Model m) {
    	
    	Student student = (Student) student_session.getAttribute("student");
    	m.addAttribute("student_profile",student);
    
    	
    	return "student_profile";
    	
    	
    }
    
    
    
    
    
    
    
    @RequestMapping("/student_logout2")
    public String student_logout2(HttpSession session) {
    	
    	
    	session.invalidate();
    	return "login";
    }
    
    
    
    
    
    @RequestMapping("/mark_report")
    public String viewStudent()
    {
    	return "mark_report";
    }
    
    
    
}
