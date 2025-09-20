package spring_mvc2.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import antlr.collections.List;
import spring_mvc2.model.Grade;
import spring_mvc2.model.Marks;
import spring_mvc2.model.Student;
import spring_mvc2.service.Grade_service;
import spring_mvc2.service.Marks_Service;
import spring_mvc2.service.Student_service;



@Controller
public class AddMarks {
	
	@Autowired
	Marks_Service marks_service;
	@Autowired
	Grade_service grade_service;
	@Autowired
	Student_service student_service;
	
	
	
	@RequestMapping("/addMarks")
	public String addMarks2(HttpSession httpsession, Model m) {		
	    Student Marks_student = (Student) httpsession.getAttribute("Marks_student");
	    m.addAttribute("Marks_student", Marks_student);
	    return "addMarks";
}
	
	
	@PostMapping("/saveMarks")
	public String saveMarks(@RequestParam("en_math") int math,
			@RequestParam("en_dsa") int dsa,@RequestParam("en_python") int python,
			@RequestParam("en_com") int com,@RequestParam("en_bee") int bee,HttpSession httpsession,RedirectAttributes redirectAttributes,Model m) {
		
		Student Marks_student = (Student) httpsession.getAttribute("Marks_student");
		
			
		String name=Marks_student.getName();
		
			if(!marks_service.isMarksEnterd(Marks_student)) {
				
				HashMap<String, Float> map=marks_service.saveMarks(math, python, com, dsa, bee,Marks_student);
				
				String key = map.keySet().iterator().next();
				Float value = map.get(key);
				
				System.out.println(key);
				
				System.out.println(value);
				
				
//				grade_service.Grades(Marks_student,key,value);
				
				
				grade_service.updateGrades(Marks_student, key, value);
				
				httpsession.setAttribute("result_p", value);
				
				httpsession.setAttribute("RESULT", key);
				
				
				redirectAttributes.addFlashAttribute("msg", "MARKS ADD FOR  "+ name +"   SUCCESSFULLY");
				
				return "redirect:/admin_dashboard";
				
				
			}


			


	
			redirectAttributes.addFlashAttribute("msg", name  +"marks aready entered");
			
			
			
			return "/saveMarks";
			
	}
	
	@RequestMapping("/viewStudent")
	public String viewStudent(Model m) {
		
		String[] course_array= {"CSE","ECE","EEE","CIVIL","AIML","MECH"};
		
		
		for(int i=0;i<course_array.length;i++) {
		ArrayList<Grade> Student_array= student_service.getStudent_course_array(course_array[i]);
		if(!Student_array.isEmpty()) {
		
		m.addAttribute("Student_array"+course_array[i],Student_array);
		}
		
		
	}
	
		return "view_grades";
}
	
	
	
	@RequestMapping("/add_Statistics")
	public String veiwStats(Model m) {
		
		
		String[] course_array= {"CSE","ECE","EEE","CIVIL","MECH"};
	long no_of_enrolled=student_service.getCountStudents();
	m.addAttribute("student_count",no_of_enrolled);
	
	for(int i=0;i<course_array.length;i++) {
		
		
		long course_wise=student_service.getCountByCourse(course_array[i]);
		m.addAttribute("student_count"+course_array[i],course_wise);
		System.out.println(course_wise);
	}
	
	long not_entered=grade_service.Marksnot_enterd_count("NOT ENTERED");
	System.out.println("not_entered "+not_entered);
	m.addAttribute("marks_not_enterd",not_entered);

	
	long pass_total=grade_service.Marksnot_enterd_count("PASS");
	System.out.println("pass_total"+pass_total);
m.addAttribute("pass_total",pass_total);
	long fail_total=0;
	
	 fail_total=grade_service.Marksnot_enterd_count("FAIL");
	System.out.println("fail_total"+fail_total);
	
	m.addAttribute("fail_total",fail_total);
	
	long pass_overall_percentage=0;
	if ((pass_total +  fail_total) > 0) {
	     pass_overall_percentage = (long) (( (double) pass_total/ 
	                    (pass_total +  fail_total) ) * 100);
	
	}
	
	
	
	
	m.addAttribute("pass_overall_percentage",pass_overall_percentage);
	
	
	
	
for(int i=0;i<course_array.length;i++) {
		
		
		long course_wise_pass=grade_service.passgetCountByCourse("PASS",course_array[i]);
		m.addAttribute("student_PASScount"+course_array[i],course_wise_pass);
		
		
		long course_wise_notenterd=grade_service.passgetCountByCourse("NOT ENTERED",course_array[i]);
		m.addAttribute("course_wise_notenterd"+course_array[i],course_wise_notenterd);
		
		
		
		long course_wise_fail=grade_service.passgetCountByCourse("FAIL",course_array[i]);
		m.addAttribute("student_FAILcount"+course_array[i],course_wise_fail);
		long pass_percent=0;
		if ((course_wise_pass + course_wise_fail) > 0) {
		    pass_percent = (long) (( (double) course_wise_pass / 
		                    (course_wise_pass + course_wise_fail) ) * 100);
		
		 System.out.println(course_wise_pass);
		 System.out.println(course_wise_pass+course_wise_fail);
		 System.out.println(pass_percent);
//		 System.out.println();
		 	}
		
		
		m.addAttribute("pass_percent"+course_array[i],pass_percent);
		
		
		

//		System.out.println("course"+course_array[i]+"pass count"+course_wise_pass);
//		System.out.println("course"+course_array[i]+"fail  count"+course_wise_fail);
//		System.out.println();
//		System.out.println("course"+course_array[i]+"pass percent:  "+ pass_percent+"%");
//		System.out.println();

		
	}
	
		
//		System.out.println(no_of_enrolled);
//		m.addAttribute("msg","hllo");
		return "addStatistics";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}