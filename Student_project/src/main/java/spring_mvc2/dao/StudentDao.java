package spring_mvc2.dao;

import java.util.ArrayList;
import java.util.List;

//import spring_mvc2.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spring_mvc2.model.Grade;
import spring_mvc2.model.Student;
//import jakarta.transaction.Transactional;


@Repository
public class StudentDao{
	
	@Autowired
	private  HibernateTemplate hibernatetemplate;
	
	
	@Transactional
	public void SaveUser(Student user) {
	    hibernatetemplate.save(user);
	}
	
	public Student getStudentByemail(String email) {
		
		String hql = "from Student where email = :email";
		List<Student> students = (List<Student>) hibernatetemplate.findByNamedParam(hql, "email", email);
		
		  if (students != null && !students.isEmpty()) {
	            return students.get(0); 
	        }
	        return null; 
	    }

	public  long getCount(String course) {
		// TODO Auto-generated method stub
		
		String hql = "select count(*) from Student where course = :course";
		List<Long> result = (List<Long>) hibernatetemplate.findByNamedParam(hql, "course", course);
		return result.get(0);
		
	
	}

	public ArrayList<Grade> getCourseArray(String course) {
		// TODO Auto-generated method stub
//		String course="CSE";
		String hql = "SELECT g FROM Grade g INNER JOIN g.student s " +
	             "WHERE s.studentId = g.studentId AND g.course = :course";

		
		
		List<Grade> list=(List<Grade>) hibernatetemplate.findByNamedParam(hql, "course", course);
		
	return (ArrayList<Grade>) list;
				
		
	}

	public Long getAllCountOfStudent() {
		// TODO Auto-generated method stub
		
		String hql="select Distinct count(*) from Student";
		List<Long> result = (List<Long>) hibernatetemplate.find(hql);
		return result.get(0);
		
		
	
	}

	public long getCountByCourse(String course) {
		
		
		String hql = "select count(*) from Student where course = :course";
		List<Long> result = (List<Long>) hibernatetemplate.findByNamedParam(hql, "course", course);
		return result.get(0);
		// TODO Auto-generated method stub
		
	}
	
	
	
	
	

}
