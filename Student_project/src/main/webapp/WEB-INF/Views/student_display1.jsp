<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Result Sheet</title>
    <style>
        /* Reset & Base */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f8f8;
            margin: 0;
            padding: 0;
            color: #2c3e50;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
            animation: fadeIn 1s ease-out;
        }

        h1 {
            text-align: center;
            color: #34495e;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            margin-bottom: 30px;
        }

        .card {
            flex: 1 1 45%;
            background: #f8f9fa;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .card h2 {
            text-align: center;
            color: #1abc9c; /* Aqua/Turquoise */
            margin-bottom: 20px;
            font-size: 22px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #1abc9c; /* Aqua header */
            color: #fff;
            font-weight: 600;
        }

        tr:hover {
            background: #d1f2eb; /* Light aqua hover */
        }

        .highlight {
            font-weight: bold;
            color: #16a085; /* Dark aqua */
        }

        .summary-box {
            background: #e0f7f4;
            border-left: 6px solid #16a085; /* Darker aqua */
            padding: 15px;
            margin-top: 10px;
            font-size: 17px;
        }

        .logout-btn {
            display: inline-block;
            background: #16a085; /* Dark aqua */
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background: #138d75; /* Hover darker aqua */
            transform: scale(1.05);
        }

        .footer {
            text-align: center;
            margin-top: 35px;
            font-size: 14px;
            color: #7f8c8d;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        /* Responsive */
        @media (max-width: 768px) {
            .row {
                flex-direction: column;
            }
            .card {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📘 Student Result Sheet</h1>

        <!-- Student Info + Result Summary -->
        <div class="row">
            <!-- Student Info -->
            <div class="card">
                <h2>👤 Student Details</h2>
                <table>
                    <tr><th>ID</th><td>${student.studentId}</td></tr>
                    <tr><th>Name</th><td>${student.name}</td></tr>
                </table>
            </div>

            <!-- Result Summary -->
            <div class="card">
                <h2>🎯 Result Summary</h2>
                <div class="summary-box">
                    <p>Grade: <span class="highlight">${grade}</span></p>
                    <p>Percentage: <span class="highlight">${percentage}%</span></p>
                </div>
                <div style="text-align:right; margin-top:15px;">
                    <a href="${pageContext.request.contextPath}/dashboard" class="logout-btn">
                        🚪 Logout
                    </a>
                </div>
            </div>
        </div>

        <!-- Marks Table -->
        <div class="card" style="flex:1 1 100%;">
            <h2>📊 Subject-wise Results</h2>
            <table>
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
