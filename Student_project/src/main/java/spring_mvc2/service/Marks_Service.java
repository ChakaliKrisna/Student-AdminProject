package spring_mvc2.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.security.auth.Subject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring_mvc2.dao.Marks_dao;
import spring_mvc2.model.Marks;
import spring_mvc2.model.Student;

@Service
public class Marks_Service {
	
	@Autowired 
	Marks_dao marks_dao;
	
	

	
	

	
	
	public void addMarks(Marks marks,Student student) {
		
		
	if(isStudentValid(student)){
	
		marks.setStudent(student);
		marks_dao.addMarks(marks);
		
		
		
	}
	else {
		throw new RuntimeException("Invalid student. Cannot add marks.");
	}
	
	
	
	

}
	
public boolean isStudentValid(Student student) {
	return false;






}


public String CalculateGrade(int marks) {
	String grade="";
	
	if(marks>90) {
		grade="A+";
	}
	else if(marks>80) {
		grade="A";
		
	}
	else if(marks>70) {
		grade="B";
		
	}
	else if(marks>60) {
		grade="C";
		
	}
	else if(marks>50) {
		grade="D";
		
	}else if(marks>=40) {
		grade="E";
		
	}
	else if(marks<40) {
		grade="F";
		
	}
	
	return grade;
	
	
}
public int CalculatePoints(int marks) {
int points=0;
	
	if(marks>90) {
		points=10;
	}
	else if(marks>80) {
		points=9;
		
	}
	else if(marks>70) {
		points=8;
		
	}
	else if(marks>60) {
		points=7;
		
	}
	else if(marks>50) {
		points=6;
		
	}else if(marks>=40) {
		points=5;
		
	}
	else if(marks<40) {
		points=0;
		
	}
	
	return points;
	
	
}






public HashMap<String, Float> saveMarks(int math,int python,int com,int dsa,int bee,Student student) {
	
	
	
	
	
	HashMap<String, Float> map = new HashMap<>();
	
	
	
	
	
	
	
	String math_g=this.CalculateGrade(math);
	String python_g=this.CalculateGrade(python);
	
	String com_g=this.CalculateGrade(com);
	
	String dsa_g=this.CalculateGrade(dsa);
	
	String bee_g=this.CalculateGrade(bee);
	
	
	
	int math_p=this.CalculatePoints(math);
int python_p=this.CalculatePoints(python);
	
	int com_p=this.CalculatePoints(com);
	
	int dsa_p=this.CalculatePoints(dsa);
	
	int bee_p=this.CalculatePoints(bee);
	
	
	
	
	
	
	
	
	
	
	
	
	ArrayList<Integer> marks_list=new ArrayList<>();
	ArrayList<String> grade_list=new ArrayList<>();
	ArrayList<Integer> credits_list=new ArrayList<>();
	ArrayList<Integer> points_list=new ArrayList<>();
	

	
	marks_list.add(math);
	marks_list.add(python);
	marks_list.add(com);
	marks_list.add(dsa);
	marks_list.add(bee);
	
	
	
	
	
	
	grade_list.add(math_g);
	grade_list.add(python_g);
			grade_list.add(com_g);
			grade_list.add(dsa_g);
			grade_list.add(bee_g);
			
//			credits_list=this.calculate_credits(grade_list);
			

			int[] credits_array={4,3,2,4,2};
			for(int i=0;i<credits_array.length;i++) {
				
				if(grade_list.get(i)=="F") {
					credits_list.add(0);
					
				}
				
				else {
					credits_list.add(credits_array[i]);
				}
				
				
				
			}
			
			
			
			
			
			
				
			
			
			
			
			
			
			
			
		
points_list.add(math_p);
points_list.add(python_p);


points_list.add(com_p);
points_list.add(dsa_p);

points_list.add(bee_p);

String Result="NA";
float result_p=0;

if(!grade_list.contains("F")) {
	
	
	 Result="PASS";
	 result_p=this.calculateResult(credits_list,points_list);
	
}
else {
	 Result="FAIL";
}
if(!this.isMarksEnterd(student))
		{
marks_dao.saveMarks(marks_list,grade_list,credits_list,student);


}
map.put(Result,result_p);
return map;
	
}



	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	



















private float calculateResult(ArrayList<Integer> credits_list, ArrayList<Integer> points_list) {
	// TODO Auto-generated method stub
	
	float sum=0;
	int total_credits=0;
for(int i=0;i<5;i++) {
		
	total_credits=total_credits+credits_list.get(i);
		
		
	}
	
	
	
	for(int i=0;i<5;i++) {
		
		sum=sum+credits_list.get(i)*points_list.get(i);
		
		
	}
	
	float result = (float) Math.round((sum / total_credits) * 100) / 100;
	
	
	return result;
	
//	return 0;
}

public boolean isMarksEnterd(Student marks_student) {
	// TODO Auto-generated method stub
	List<Student> students_list=marks_dao.findById(marks_student);
	
	
	if(!students_list.isEmpty()){
		return true;
		
	}
	
	
	
	return false;
	
}

public List<Marks> getMarksOfStudent(Student student) {
	// TODO Auto-generated method stub
	
	
	List<Marks> marks_sub_list=marks_dao.getMarksOfStudent(student);
	return marks_sub_list;
	
	
}

public void saveGrades(Student student, String grage, Float percentage) {
	
	
	
	
	// TODO Auto-generated method stub
	
	
	
	
	
	
	
	
	
	
	
}

public void updateMarks(ArrayList<String>subjects_list,ArrayList<Integer>Marks_list,Student student,HashMap<String , Integer> credit_map) {
	// TODO Auto-generated method stub
	
	
	
	
//	 HashMap<String , Integer> credit_map=new  HashMap<String , Integer>();
	
	
	
	
	for(int i=0;i<subjects_list.size();i++) {
		
		String grade=this.CalculateGrade(Marks_list.get(i));
		
		
		marks_dao.updateMarks(subjects_list.get(i),Marks_list.get(i),student.getStudentId(),grade,credit_map);
		
		
	}
}














}
