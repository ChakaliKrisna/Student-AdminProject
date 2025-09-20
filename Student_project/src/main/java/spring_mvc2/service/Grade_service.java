package spring_mvc2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import spring_mvc2.dao.Grade_dao;
import spring_mvc2.model.Grade;
import spring_mvc2.model.Student;

@Service
public class Grade_service {
	
	
	@Autowired
	Grade_dao grade_dao;
	
	
	public void saveGrades(Student student,String key,float value) {
		
		
		
		
		grade_dao.saveGrades(student,key,value);
		
	}


	public Grade getGrades(Student student) {
		// TODO Auto-generated method stub
		System.out.println(student.getStudentId());
		System.out.println(student.getName());
		
		Grade grade= grade_dao.getGrades(student);
		return grade;
	}


	public void updateGrades(Student student, String key, Float value) {
		// TODO Auto-generated method stub
		
		grade_dao.updateGrades(student,key,value);
		
		
		
		
		
		
	}


	public long Marksnot_enterd_count(String course) {
		// TODO Auto-generated method stub
		
		long count=grade_dao.getMaksNotEnterdCount(course);
		
		return count;
	}


	public long passgetCountByCourse(String grade,String course) {
		// TODO Auto-generated method stub
		long count=grade_dao.passGetCountByCourse(grade,course);
		return count;
	}

}
