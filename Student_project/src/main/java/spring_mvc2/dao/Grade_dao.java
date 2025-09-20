package spring_mvc2.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spring_mvc2.model.Grade;
import spring_mvc2.model.Marks;
import spring_mvc2.model.Student;

@Repository
public class Grade_dao {


@Autowired
private HibernateTemplate hibernatetemplate;

	
	
	@Transactional
	public void saveGrades(Student student, String key, float value) {
		// TODO Auto-generated method stub
		
		Grade grade=new Grade();
		grade.setStudent(student);
		grade.setPercentage(value);
		grade.setGrade(key);
		grade.setCourse(student.getCourse());
			
		hibernatetemplate.save(grade);
	
		
	}



	



	public Grade getGrades(Student student) {
		// TODO Auto-generated method stub
		
		String studentId=student.getStudentId();
		System.out.print(studentId);
		
		Grade grade = hibernatetemplate.get(Grade.class, studentId);

		if (grade != null) {
		   return grade;
		}
		
	
		    System.out.println("No grade found for studentId = " + studentId);
		    
			
		
		
		return null;
		
		
	
	
	
	

}






@Transactional
	public void updateGrades(Student student, String key, Float value) {
		// TODO Auto-generated method stub
		
		String Studentid=student.getStudentId();
		
		String hql="from Grade g where g.student.studentId=:studentid";
		List<Grade> grade_list=(List<Grade>) hibernatetemplate.findByNamedParam(hql,"studentid",Studentid);
		
		if(!grade_list.isEmpty()) {
			
			Grade grade=grade_list.get(0);
			grade.setGrade(key);
			grade.setPercentage(value);
			hibernatetemplate.update(grade);
			
		}
		
	}







public long getMaksNotEnterdCount(String grade) {
	// TODO Auto-generated method stub
	
	
	String hql="select count(*) from Grade where grade=:grade";
	List<Long> grade_list= (List<Long>) hibernatetemplate.findByNamedParam(hql,"grade",grade);
	
	
	return grade_list.get(0);
}







public long passGetCountByCourse(String grade,String course) {
	// TODO Auto-generated method stub
	
	String hql="select count(*) from Grade where grade=:grade and course=:course";
	
	
	
	String[] parameter= {grade,course};
	
	
	String[] varibles= {"grade","course"};
	
	List<Long> grade_list= (List<Long>) hibernatetemplate.findByNamedParam(hql,varibles,parameter);
	
	return grade_list.get(0);
}
	

}
