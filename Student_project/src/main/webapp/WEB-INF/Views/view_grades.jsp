<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>


 <!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>College Departments Dashboard</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #f4f7fb;
      color: #333;
    }

    header {
      background-color: #2563eb;
      color: white;
      padding: 20px;
      text-align: center;
    }
	html{
    scroll-behavior: smooth;
}




    header h1 {
      margin: 0;
      font-size: 24px;
    }

    header p {
      margin: 5px 0 0;
      font-size: 14px;
    }

    main {
      padding: 20px;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
    }

    .card {
      background-color: white;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 16px;
      text-align: center;
      box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.1);
    }

    .card h2 {
      margin: 10px 0;
      font-size: 18px;
      color: #2563eb;
    }

    .card p {
      font-size: 14px;
      color: #555;
    }

    .card a {
      display: inline-block;
      margin-top: 10px;
      padding: 8px 12px;
      background-color: #2563eb;
      color: white;
      text-decoration: none;
      border-radius: 4px;
      font-size: 14px;
    }

    .card a:hover {
      background-color: #1e40af;
    }

    section {
      margin-top: 40px;
      padding: 20px;
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 8px;
    }

    section h2 {
      margin-top: 0;
      color: #2563eb;
    }

    ul {
      padding-left: 20px;
    }

    ul li {
      margin: 5px 0;
    }

    ul li a {
      color: #2563eb;
      text-decoration: none;
    }

    ul li a:hover {
      text-decoration: underline;
    }

    footer {
      margin-top: 40px;
      padding: 15px;
      text-align: center;
      font-size: 14px;
      color: #555;
      background-color: #f0f0f0;
    }
    
     table {
            width: 80%; margin: 20px auto; border-collapse: collapse;
            background: #fff; box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px; border: 1px solid #ddd; text-align: center;
        }
        th { background: #2563eb; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
    
    
    
    
    
  </style>
</head>
<body>
  <header>
    <h1>College Departments Dashboard</h1>
    <p>Quick links to department pages — CSE, ECE, EEE, MECH, CIVIL</p>
  </header>

  <main>
    <div class="grid">
      <div class="card">
        <h2>CSE — Computer Science & Engineering</h2>
        <p>Programming, AI, Web & Software.</p>
        <a href="#cse">Go to CSE</a>
      </div>

      <div class="card">
        <h2>ECE — Electronics & Communication</h2>
        <p>Circuits, Communication Systems, Embedded Design.</p>
        <a href="#ece">Go to ECE</a>
      </div>

      <div class="card">
        <h2>EEE — Electrical & Electronics</h2>
        <p>Power Systems, Control & Instrumentation.</p>
        <a href="#eee">Go to EEE</a>
      </div>

      <div class="card">
        <h2>MECH — Mechanical Engineering</h2>
        <p>Thermodynamics, Design & Manufacturing.</p>
        <a href="#mech">Go to MECH</a>
      </div>

      <div class="card">
        <h2>CIVIL — Civil Engineering</h2>
        <p>Structures, Transportation & Construction.</p>
        <a href="#civil">Go to CIVIL</a>
      </div>
    </div>

    <section id="cse">
      <h2>CSE — Computer Science & Engineering</h2>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Student Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Grade</th>
            <th>Result</th>
        </tr>
   <c:forEach var="student" items="${Student_arrayCSE}">
            <tr>
                <td>${student.student.studentId}</td>
                <td> ${student.student.name}</td>
                <td>${student.student.course}</td>
                <td>${student.student.email}</td>
                <td>${student.grade}</td>
                <td>${student.percentage} %</td>
                
            </tr>
        </c:forEach>
    </table>

 
    </section>

    <section id="ece">
      <h2>ECE — Electronics & Communication</h2>
      <table>
        <tr>
            <th>ID</th>
            <th>Student Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Grade</th>
            <th>Result</th>
        </tr>
   <c:forEach var="student" items="${Student_arrayECE}">
            <tr>
                <td>${student.student.studentId}</td>
                <td> ${student.student.name}</td>
                <td>${student.student.course}</td>
                <td>${student.student.email}</td>
                <td>${student.grade}</td>
                <td>${student.percentage} %</td>
                
            </tr>
        </c:forEach>
    </table>
    </section>

    <section id="eee">
      <h2>EEE — Electrical & Electronics</h2>
     
      <table>
        <tr>
            <th>ID</th>
            <th>Student Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Grade</th>
            <th>Result</th>
        </tr>
   <c:forEach var="student" items="${Student_arrayEEE}">
            <tr>
                <td>${student.student.studentId}</td>
                <td> ${student.student.name}</td>
                <td>${student.student.course}</td>
                <td>${student.student.email}</td>
                <td>${student.grade}</td>
                <td>${student.percentage} %</td>
                
            </tr>
        </c:forEach>
    </table>
</section>
    <section id="mech">
      <h2>MECH — Mechanical Engineering</h2>
      <table>
        <tr>
            <th>ID</th>
            <th>Student Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Grade</th>
            <th>Result</th>
        </tr>
   <c:forEach var="student" items="${Student_arrayMECH}">
            <tr>
                <td>${student.student.studentId}</td>
                <td> ${student.student.name}</td>
                <td>${student.student.course}</td>
                <td>${student.student.email}</td>
                <td>${student.grade}</td>
                <td>${student.percentage} %</td>
                
            </tr>
        </c:forEach>
    </table>

    </section>

    <section id="civil">
      <h2>CIVIL — Civil Engineering</h2>
      <table>
        <tr>
            <th>ID</th>
            <th>Student Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Grade</th>
            <th>Result</th>
        </tr>
   <c:forEach var="student" items="${Student_arrayCIVIL}">
            <tr>
                <td>${student.student.studentId}</td>
                <td> ${student.student.name}</td>
                <td>${student.student.course}</td>
                <td>${student.student.email}</td>
                <td>${student.grade}</td>
                <td>${student.percentage} %</td>
                
            </tr>
        </c:forEach>
    </table>
    </section>

    <footer>
      Built for quick navigation — simple and easy to understand.
    </footer>
  </main>
</body>
</html>
