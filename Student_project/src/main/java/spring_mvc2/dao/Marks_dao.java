package spring_mvc2.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.cj.Query;
import com.mysql.cj.Session;

import spring_mvc2.model.Marks;
import spring_mvc2.model.Student;


@Repository
public class Marks_dao {
	
	@Autowired
	private HibernateTemplate hibernatetemplate;
	

	public void addMarks(Marks marks) {
		// TODO Auto-generated method stub
		
	}

	
	@Transactional
	public void saveMarks(ArrayList<Integer> marks_list, ArrayList<String> grade_list, ArrayList<Integer> credits_list, Student student) {
		// TODO Auto-generated method stub
		ArrayList<String> subject=new ArrayList<>();
		subject.add("ENGINNERING MATHEMATICS");
		subject.add("PYTHON");
		subject.add("COMPUTER ORGANISATION AND MICROPROCESSORS");
		subject.add("DATA STRUCRES AND ALGORITHMS");
		subject.add("BASIC ELECTIRICAL ENGINEERING");
		
//		Student student=(Student) session.getAttribute("Marks_student");
//		String studentId=student.getStudentId();
		String studentCourse=student.getCourse();
		
		
		
		for(int i=0;i<5;i++) {
			
			
			
			Marks marks=new Marks();
			marks.setCourse(studentCourse);
			marks.setStudent(student);
			marks.setGrade(grade_list.get(i));
			marks.setMarks(marks_list.get(i));
			marks.setCredits(credits_list.get(i));
			marks.setSubject(subject.get(i));
			
			
			hibernatetemplate.save(marks);
		}
		
		
	}


	public List<Student> findById(Student marks_student) {
		// TODO Auto-generated method stub
		String studentId=marks_student.getStudentId();
		
		
		
		
		String hql = "SELECT DISTINCT m.student FROM Marks m WHERE m.student.id = :studentId";
		List<Student> students = (List<Student>) hibernatetemplate.findByNamedParam(hql, "studentId", studentId);
		

		System.out.println(students);
		
		
		return students;
	
	}


	public List<Marks> getMarksOfStudent(Student student) {
		String studentId=student.getStudentId();
		
		// TODO Auto-generated method stub
		String hql="FROM Marks m WHERE m.student.id = :studentId";
		List<Marks> sub_mark_list = (List<Marks>) hibernatetemplate.findByNamedParam(hql, "studentId", studentId);
		
		return sub_mark_list;
		
		
	}

	@Transactional
	public void updateMarks(String subjectName, Integer marks, String studentId,String grade,HashMap<String , Integer> credit_map) {
		// TODO Auto-generated method stub
		
		
		
		
		
		System.out.println(subjectName);
		System.out.println(marks);
		
		  String hql = "FROM Marks m WHERE m.student.id = :studentId AND m.subject = :subjectName";
		    String[] paramNames = {"studentId", "subjectName"};
		    Object[] values = {studentId, subjectName};

		    List<Marks> list = (List<Marks>) hibernatetemplate.findByNamedParam(hql, paramNames, values);
		    
		    HashMap<String , Integer> map=new HashMap<String , Integer>();
		   

		    if (!list.isEmpty()) {
		    	System.out.println(list.get(0));
		        Marks marksObj = list.get(0);
		       
		        Integer old_marks=marksObj.getMarks();
		        
		        
		        
		        if(marks>old_marks) {
		        	marksObj.setCredits(credit_map.get(marksObj.getSubject()));
		        	 marksObj.setMarks(marks);
				        marksObj.setGrade(grade);
		        	
		        }
		       if(marksObj.getMarks()>40) {
		    	   marksObj.setCredits(credit_map.get(marksObj.getSubject()));
		       }
		       
		        
		        
		        
		        hibernatetemplate.update(marksObj);
		    }
	   
	}


		

		
		
		
		
	}
	
	
	


