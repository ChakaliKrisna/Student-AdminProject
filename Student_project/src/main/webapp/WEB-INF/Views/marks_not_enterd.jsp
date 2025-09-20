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

        .no-marks-box {
            background: #ffeaa7;
            padding: 15px;
            margin-top: 10px;
            border-left: 6px solid #d63031;
            font-size: 18px;
            text-align: center;
            color: #d63031;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>📘 Student Result Sheet</h1>

    <div class="row">
        <!-- Student Info -->
        <div class="card">
            <h2>👤 Student Details</h2>
            <table class="info-table">
                <tr><th>ID</th><td>${student.studentId}</td></tr>
                <tr><th>Name</th><td>${student.name}</td></tr>
               
            </table>
        </div>

        <!-- Marks Section -->
        <div class="card">
            <h2>📊 Marks</h2>

            <c:choose>
                <c:when test="${not empty marks}">
                    <table class="result-table">
                        <tr>
                            <th>Subject</th>
                            <th>Marks</th>
                            <th>Grade</th>
                        </tr>
                        <c:forEach var="m" items="${marks}">
                            <tr>
                                <td>${m.subject}</td>
                                <td>${m.marks}</td>
                                <td>${m.grade}</td>
                            </tr>
                        </c:forEach>
                    </table>

                    <!-- Optional summary -->
                    <div class="summary-box">
                        <p>Result: <span class="highlight">${grade.grade}</span></p>
                        <p>Total Percentage: <span class="highlight">${grade.percentage}%</span></p>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="no-marks-box">
                        ⚠️ Marks Not Entered
                    </div>
                    
                    <a href="addMarks?studentId=${student.studentId}" 
   style="text-decoration:none; padding:10px 20px; background:#27ae60; color:#fff; border-radius:5px;">
   ➕ Add Marks
</a>
                    
                    
                    
                    
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
</html>
