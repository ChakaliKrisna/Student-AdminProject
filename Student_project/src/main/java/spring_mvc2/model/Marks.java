package spring_mvc2.model;

import javax.persistence.*;

@Entity
@Table(name = "marks_hibernate")
public class Marks {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // auto increment
    private int id;

    private String subject;
    public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	private String grade;
    private int marks;
    private int credits;

    public int getCredits() {
		return credits;
	}
	public void setCredits(int credits) {
		this.credits = credits;
	}
	@ManyToOne
    @JoinColumn(name = "student_id") // foreign key in marks_hibernate
    private Student student;

    private String course;

    // --- Getters and Setters ---
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getMarks() {
        return marks;
    }
    public void setMarks(int marks) {
        this.marks = marks;
    }

    public Student getStudent() {
        return student;
    }
    public void setStudent(Student student) {
        this.student = student;
    }

    public String getCourse() {
        return course;
    }
    public void setCourse(String course) {
        this.course = course;
    }
}
