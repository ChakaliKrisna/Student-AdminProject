package spring_mvc2.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class Marks_Controller {
	
	
	

	@Autowired
	Student_service student_service;
	
	@Autowired
	Marks_Service marks_service;
	
	@Autowired
	Grade_service grade_service;
	
	
	
	
	@RequestMapping("/check_student")
    public String checkStudent() {
    	
    System.out.println("called add Student controller");
    	
    	return "check_student";
    }
	
	
	
	@PostMapping("/updatemarks")
	public String updateMarks1(
	        HttpSession session,
	        @RequestParam("sub1") String subject1,
	        @RequestParam(value="sub2" ,required=false) String subject2,
	               @RequestParam(value = "sub3", required = false) String subject3,
	        @RequestParam("en_sub1") Integer marks1,
	        @RequestParam(value="en_sub2",required=false) Integer marks2,
	  @RequestParam(value = "en_sub3", required = false) Integer marks3,RedirectAttributes redirectAttributes) {

	    Student student = (Student) session.getAttribute("Marks_student");

	   

	    ArrayList<String> subjects_list = new ArrayList<>();
	    ArrayList<Integer> marks_list = new ArrayList<>();

	    if (subject1 != null && !subject1.isEmpty() && marks1 != null) {
	        subjects_list.add(subject1);
	        marks_list.add(marks1);
	    }
	    if (subject2 != null && !subject2.isEmpty() && marks2 != null) {
	        subjects_list.add(subject2);
	        marks_list.add(marks2);
	    }
	    if (subject3 != null && !subject3.isEmpty() && marks3 != null) {
	        subjects_list.add(subject3);
	        marks_list.add(marks3);
	    }
//	    ArrayList<Integer> credits=.calculate_credits(subjects_list);

	   
	    

	    ArrayList<Marks>sub_marks_list_old=(ArrayList<Marks>) marks_service.getMarksOfStudent(student);
	    
	    int[] credit_array= {4,3,2,4,2};
	    HashMap<String, Integer> credit_map=new HashMap<String, Integer> ();
	    
	    for(int i=0;i<credit_array.length;i++) {
	    	
	    	credit_map.put(sub_marks_list_old.get(i).getSubject(), credit_array[i]);
	    	
	    }
	    
	    marks_service.updateMarks(subjects_list, marks_list, student,credit_map);
	    
	    
	    ArrayList<Marks>sub_marks_list=(ArrayList<Marks>) marks_service.getMarksOfStudent(student);
	    

		HashMap<String, Float> map =marks_service.saveMarks(sub_marks_list.get(0).getMarks(), sub_marks_list.get(1).getMarks(), 
				sub_marks_list.get(2).getMarks(), sub_marks_list.get(3).getMarks(),
				sub_marks_list.get(4).getMarks(), student);
		
		
		
		
		
		
		
		String key = map.keySet().iterator().next();
		Float value = map.get(key);
		
		
		
		
		grade_service.updateGrades(student,key,value);
		
	    
	    
 
	    
	redirectAttributes.addFlashAttribute("msg", student.getName() +" marks updated successfully!");
	    return "redirect:/admin_dashboard";
	}

	
	
	
	
	
	@PostMapping("/check_student")
	
	public String check_Student(@RequestParam("student_email") String student_email,@RequestParam("student_id") String student_id,RedirectAttributes redirectAttributes,HttpSession session,Model m)
	{
		
		System.out.println(student_email);
		System.out.println(student_id);
		
		Student student=student_service.findByEmail(student_email);
		
		
		
		if(student!=null && student.getStudentId().matches(student_id)) {
		System.out.println(student.toString());
		
		session.setAttribute("Marks_student", student);
		
			
			boolean enterd=marks_service.isMarksEnterd(student);
			if(!enterd)
			{
			    redirectAttributes.addFlashAttribute("msg", "Successfull login ADD MARKS FOR  "+ student.getName() +" ");
	        	return "redirect:/addMarks";
			
			}
			
			else {
				List<Marks> sub_marks_list =marks_service.getMarksOfStudent(student);
				
				
				
				 
				System.out.println("the size of su_marks_list:"+sub_marks_list.size());
				
				
				
				HashMap<String, Float> map =marks_service.saveMarks(
						sub_marks_list.get(0).getMarks(), sub_marks_list.get(1).getMarks(), 
						sub_marks_list.get(2).getMarks(), sub_marks_list.get(3).getMarks(),
						sub_marks_list.get(4).getMarks(), student);
				
				m.addAttribute("sub_marks_list", sub_marks_list);
				m.addAttribute("msg","Marks already enterd for the"+student.getName());
				
				
				
				
				String key = map.keySet().iterator().next();
				Float value = map.get(key);
				
				 session.setAttribute("grade", key);
				    session.setAttribute("percentage", value);

				System.out.println(key);
				
				m.addAttribute("key",key);
				m.addAttribute("value",String.valueOf(value));
				
				
				
				
				
				return "updatemarks";
				
			}
		      
		
			
			
		}
	
		redirectAttributes.addFlashAttribute("msg", "Invalid Credentials");
		
        return "redirect:/admin_dashboard";

		
	}
	
	@PostMapping("/get_student")
	public String get_student_details(@RequestParam("student_email") String student_email,@RequestParam("student_id") String student_id,RedirectAttributes redirectAttributes,HttpSession session,Model m) {
        Student student=student_service.findByEmail(student_email);
		
		
		
		if(student!=null && student.getStudentId().matches(student_id)) {
		System.out.println(student.toString());
		
			session.setAttribute("Marks_student", student);
			
			boolean enterd=marks_service.isMarksEnterd(student);
			
			
			if(!enterd)
			{
				
				System.out.println("not enterd");
			    redirectAttributes.addFlashAttribute("msg", "Successfull login ADD MARKS FOR  "+ student.getName() +" ");
			    
			    m.addAttribute("student",student);
	        	return "marks_not_enterd";
			
			}
			
			
			
			else {
		m.addAttribute("student",student);
		
//		System.out.println(result);
		
		List<Marks> sub_marks_list =marks_service.getMarksOfStudent(student);
		
		Grade grade=grade_service.getGrades(student);
		
		
		
		String key=grade.getGrade();
		float value=grade.getPercentage();
		
		
		
		System.out.println(sub_marks_list);
			
			m.addAttribute("grade",key);
			m.addAttribute("percentage",value);
			
			m.addAttribute("sub_marks_list",sub_marks_list);
			
			
			System.out.println(key);
			
			return"student_display";
			
			
	} }
	
redirectAttributes.addFlashAttribute("msg", "Invalid Credentials");
		
        return "redirect:/admin_dashboard";
	

}
	
	

		@GetMapping("/logout")
		public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
		
			session.invalidate();
//			    redirectAttributes.addFlashAttribute("msg", "You have been logged out successfully!");

		   
//		    redirectAttributes.addFlashAttribute("msg", "You have been logged out successfully!");

		    
		    return "redirect:/admin_dashboard";  
		}
	
	

}