package spring_mvc2.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring_mvc2.model.Admin;
import spring_mvc2.service.Admin_Service;
import spring_mvc2.service.Grade_service;
import spring_mvc2.service.Student_service;

@Controller
public class Admin_Controller {

    @Autowired
    private Admin_Service admin_service;
    @Autowired
    private Student_service student_service;
    @Autowired
    private Grade_service grade_service;

  
    @RequestMapping("/admin_login")
    public String adminLoginPage() {
        return "admin_login";
    }

    
    @PostMapping("/admin_login")
    public String adminLogin(@RequestParam("admin_email") String email,
                             @RequestParam("admin_password") String password,
                             HttpSession admin_session,
                             Model m) {
    	
    	
    	System.out.println(email);
    	System.out.println(password);
        Admin admin = admin_service.isValidAdmin(email, password);

        if (admin != null) {
            admin_session.setAttribute("admin", admin);
            
            return "redirect:/admin_dashboard";
        }
        System.out.println("admin is null");
        m.addAttribute("msg", "Invalid login");
        return "admin_login";
    }

  
    @RequestMapping("/admin_registration")
    public String adminRegistrationPage() {
        return "admin_registration";
    }

  

    @PostMapping("/admin_registration")
    public String adminRegistration(@ModelAttribute("admin") Admin admin, Model m) {
        Admin existing = admin_service.findByEmail(admin.getAdmin_email());

        if (existing != null) {
            m.addAttribute("msg", "Account already exists with this email!");
            return "admin_registration";
        }

        admin_service.registerAdmin(admin);
        m.addAttribute("msg","REGISTERED SUCCESSFULLY");
        return "redirect:/admin_login";
    }


   
    @RequestMapping("/admin_dashboard")
    public String adminDashboard(Model m, HttpSession admin_session) {
        Admin loggedAdmin = (Admin) admin_session.getAttribute("admin");

        if (loggedAdmin == null) {
        	
            return "redirect:/admin_login"; 
        }

        m.addAttribute("admin", loggedAdmin);
        
    	String[] course_array= {"CSE","ECE","EEE","CIVIL","MECH"};
    	
		long no_of_enrolled=student_service.getCountStudents();
    	m.addAttribute("student_count",no_of_enrolled);
    	
    	
    	long pass_total=grade_service.Marksnot_enterd_count("PASS");
    	System.out.println("pass_total"+pass_total);
    	
    	long fail_total=0;
    	 fail_total=grade_service.Marksnot_enterd_count("FAIL");
    	System.out.println("fail_total"+fail_total);
    	
    	
    	
    	long pass_overall_percentage=0;
    	if ((pass_total +  fail_total) > 0) {
    	     pass_overall_percentage = (long) (( (double) pass_total/ 
    	                    (pass_total +  fail_total) ) * 100);
    	
    	     
    	     System.out.println(pass_total);
    	     System.out.println(fail_total);
    	     
    	     
    	}
    	m.addAttribute("pass_overall_percentage",pass_overall_percentage);
    	     
    	     
        return "admin_dashboard";
    }
    
    
    
    
}
