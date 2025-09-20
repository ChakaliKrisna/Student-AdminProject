package spring_mvc2.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "student_hibernate")
public class Student {

    @Id
    @Column(name = "student_id", nullable = false)
    private String studentId;

    @Column(name = "email")
    private String email;

    @Column(name = "name")
    private String name;

    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;

    @Column(name = "address")
    private String address;

    @Column(name = "course")
    private String course;

    @Column(name = "gender")
    private String gender;

    @Column(name = "password")
    private String password;

    // ----------------- Getters & Setters -----------------
    public String getStudentId() {
        return studentId;
    }
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getCourse() {
        return course;
    }
    public void setCourse(String course) {
        this.course = course;
    }

    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Override
    public String toString() {
        return "Student [studentId=" + studentId +
               ", email=" + email +
               ", name=" + name +
               ", phoneNumber=" + phoneNumber +
               ", address=" + address +
               ", course=" + course +
               ", gender=" + gender +
               ", password=" + password + "]";
    }
}
