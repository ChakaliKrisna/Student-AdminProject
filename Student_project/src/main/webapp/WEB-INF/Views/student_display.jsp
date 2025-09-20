<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Result Sheet</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 90%;
            margin: 30px auto;
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .row {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            flex: 1;
            background: #ecf0f1;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .card h2 {
            text-align: center;
            color: #2980b9;
            margin-bottom: 15px;
        }

        .info-table, .result-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .info-table th, .info-table td,
        .result-table th, .result-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .info-table th {
            background: #34495e;
            color: #fff;
        }

        .result-table th {
            background: #2980b9;
            color: #fff;
        }

        .highlight {
            font-weight: bold;
            color: #27ae60;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: #888;
        }

        .summary-box {
            background: #dfe6e9;
            padding: 15px;
            margin-top: 10px;
            border-left: 6px solid #27ae60;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📘 Student Result Sheet</h1>

        <!-- Student Info + Result Summary in 2 Columns -->
        <div class="row">
            <!-- Student Info -->
            <div class="card">
                <h2>👤 Student Details</h2>
                <table class="info-table">
                    <tr><th>ID</th><td>${student.studentId}</td></tr>
                    <tr><th>Name</th><td>${student.name}</td></tr>
                   
                </table>
            </div>

            <!-- Result Summary -->
            <div class="card">
                <h2>🎯 Result Summary</h2>
                <div class="summary-box">
                    <p>RESULT: <span class="highlight">${grade}</span></p>
                    <p>GRADE: <span class="highlight">${percentage}</span></p>
                    
                </div>
                
                <div style="text-align: right; margin-bottom: 15px;">
    <a href="${pageContext.request.contextPath}/admin_dashboard" 
       style="background: #e74c3c; 
              color: white; 
              padding: 10px 18px; 
              text-decoration: none; 
              border-radius: 6px; 
              font-weight: bold; 
              transition: 0.3s;">
        🚪 Logout
    </a>
                
                
                </div>
            </div>
        </div>

        <!-- Marks Table -->
        <div class="card">
            <h2>📊 Subject-wise Results</h2>
            <table class="result-table">
                <tr>
                    <th>Subject</th>
                    <th>Marks</th>
                    <th>Grade</th>
                    <th>Course</th>
                    <th>Subject Credits</th>
                </tr>
                <c:forEach var="mark" items="${sub_marks_list}">
                    <tr>
                        <td>${mark.subject}</td>
                        <td>${mark.marks}</td>
                        <td>${mark.grade}</td>
                        <td>${mark.course}</td>
                        <td>${mark.credits}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="2"><strong>Overall Grade</strong></td>
                    <td>${grade}</td>
                    <td><strong>Overall Percentage</strong></td>
                    <td>${percentage}</td>
                </tr>
            </table>
        </div>

        <!-- Footer -->
        <div class="footer">
            <p>Generated on: 
                <fmt:formatDate value="<%= new java.util.Date() %>" pattern="dd-MMM-yyyy HH:mm:ss"/>
            </p>
            <p>&copy; 2025 Student Results Portal</p>
        </div>
    </div>
</body>
</html>
