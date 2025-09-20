<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="student_grade" items="${Student_arrayCSE}">
  
 <li>${student_grade.getGrade()} | ${student_grade.getStudent().getName()}|${student_grade.getPercentage()}</li>
 

 </c:forEach>
 
 
 <c:forEach var="student_grade" items="${Student_arrayECE}">
  
 <li>${student_grade.getGrade()} | ${student_grade.getStudent().getName()}|${student_grade.getPercentage()}</li>
 

 </c:forEach>
</body>
</html>