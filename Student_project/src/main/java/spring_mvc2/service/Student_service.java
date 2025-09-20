package spring_mvc2.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring_mvc2.dao.Marks_dao;
import spring_mvc2.dao.StudentDao;
import spring_mvc2.model.Grade;
//import spring_mvc2.dao.Student_Reposistory;
import spring_mvc2.model.Student;


	
	
	@Service
	public class Student_service {
		
		
		@Autowired
		StudentDao studentDao;
		
		
public Student findByEmail(String student_email) {
	Student student=studentDao.getStudentByemail(student_email);
	
	
	return student;
	
}


	

	public Student isValidateuser(String email, String password) {
			
			Student student= studentDao.getStudentByemail(email);
			if(student!=null && student.getPassword().equals(password) ) {
				return student;
			}
			
			else{
				return null;
			}
	

}
	
	public void registerStudent(Student student) {
		
		long count=studentDao.getCount(student.getCourse())	;
		
		String student_id=student.getCourse()+"-"+ String.format("%03d",count+1);
		student.setStudentId(student_id);
		
		student.setPassword(student_id);
		
		
		
		
		
		studentDao.SaveUser(student);
	}




	public ArrayList<Grade> getStudent_course_array(String course) {
		// TODO Auto-generated method stub
		
		
		
		
		ArrayList<Grade> students_array=studentDao.getCourseArray(course);
		return students_array;
	}




	public long getCountStudents() {
		// TODO Auto-generated method stub
		
		
		long count=studentDao.getAllCountOfStudent();
		return count;
	}




	public long getCountByCourse(String course) {
		// TODO Auto-generated method stub
		long course_count=studentDao.getCountByCourse(course);
		
		return course_count;
	}




	

	
	
	
	
	
	
	
	}
