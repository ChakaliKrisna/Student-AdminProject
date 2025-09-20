<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Marks & Student Details</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #e9f1fa, #ffffff);
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }

        /* Dashboard */
        .dashboard-box {
            text-align: center;
            font-size: 18px;
            color: white;
            background: linear-gradient(135deg, #2980b9, #2c3e50);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            margin-bottom: 25px;
            transition: transform 0.3s ease;
        }
        .dashboard-box:hover { transform: translateY(-3px); }
        .dashboard-box a {
            text-decoration: none;
            color: #fff;
            display: block;
            padding: 15px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        /* Grid Layout */
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
        }

        /* Card Box */
        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            padding: 20px;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 22px;
            margin-bottom: 15px;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 12px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 15px;
        }
        th {
            background: #34495e;
            color: white;
        }

        /* Form Inputs */
        label {
            display: block;
            margin-top: 10px;
            font-weight: 600;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: 0.3s;
        }
        input:focus, select:focus {
            border-color: #2980b9;
            box-shadow: 0 0 8px rgba(41,128,185,0.3);
            outline: none;
        }

        /* Buttons */
        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }

        /* Link */
        #a_display {
            display: block;
            margin-top: 20px;
            text-align: center;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            color: #2980b9;
            transition: 0.3s;
            margin-top:100px;
            border:none;
         
        }
        
        
        #a_display:hover {
            text-decoration: underline;
            color: #1c5980;
            
        }

        /* Hidden Update Box */
        #addmarks {
            display: none;
            margin-top: 20px;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(25px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">

        <!-- Admin Dashboard -->
        <div class="dashboard-box">
            <a href="${pageContext.request.contextPath}/admin_dashboard">ADMIN DASHBOARD</a>
        </div>

        <div class="grid">

            <!-- LEFT: Student Details & Result -->
            <div class="card">
                <h2>Student Details</h2>
                <table>
                    <tr><th>ID</th><th>Name</th></tr>
                    <tr>
                        <td>${Marks_student.studentId}</td>
                        <td>${Marks_student.name}</td>
                    </tr>
                </table>

                <h2>Result</h2>
                <table>
                    <tr>
                        <th>Subject</th><th>Marks</th><th>Grade</th><th>Course</th><th>Credits</th>
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
                        <td>RESULT</td>
                        <td>${key}</td>
                        <td>GRADE RESULT</td>
                        <td>${value}</td>
                        <td></td>
                    </tr>
                </table>

                
            </div>

            <!-- RIGHT: Update Form -->
            <div class="card" id="addmarks">
                <h2>Update Marks</h2>
                <form action="${pageContext.request.contextPath}/updatemarks" method="post">

                    <label for="exam">Examination</label>
                    <select name="revaluation" id="revaluation" required>
                        <option value="">---Select---</option>
                        <option value="revaluation">REVALUATION</option>
                    </select>

                    <label for="sub1">Subject 1</label>
                    <select name="sub1" id="sub1" required>
                        <option value="">Select</option>
                        <option value="ENGINNERING MATHEMATICS">Math</option>
                        <option value="DATA STRUCRES AND ALGORITHMS">DSA</option>
                        <option value="PYTHON">Python</option>
                        <option value="BASIC ELECTIRICAL ENGINEERING">BEE</option>
                        <option value="COMPUTER ORGANISATION AND MICROPROCESSORS">COM</option>
                    </select>
                    <input type="number" name="en_sub1" placeholder="(10-100)" min="0" max="100" required>

                    <label for="sub2">Subject 2</label>
                    <select name="sub2" id="sub2">
                        <option value="">Select</option>
                        <option value="ENGINNERING MATHEMATICS">Math</option>
                        <option value="DATA STRUCRES AND ALGORITHMS">DSA</option>
                        <option value="PYTHON">Python</option>
                        <option value="BASIC ELECTIRICAL ENGINEERING">BEE</option>
                        <option value="COMPUTER ORGANISATION AND MICROPROCESSORS">COM</option>
                    </select>
                    <input type="number" name="en_sub2" placeholder="(10-100)" min="0" max="100">

                    <label for="sub3">Subject 3</label>
                    <select name="sub3" id="sub3">
                        <option value="">Select</option>
                        <option value="ENGINNERING MATHEMATICS">Math</option>
                        <option value="DATA STRUCRES AND ALGORITHMS">DSA</option>
                        <option value="PYTHON">Python</option>
                        <option value="BASIC ELECTIRICAL ENGINEERING">BEE</option>
                        <option value="COMPUTER ORGANISATION AND MICROPROCESSORS">COM</option>
                    </select>
                    <input type="number" name="en_sub3" placeholder="(10-100)" min="0" max="100">

                    <button type="submit">Update Marks</button>
                </form>
            </div>
            <a id="a_display" onclick="updatemarks()">
                    MARKS ENTERED FOR ${Marks_student.name} - CLICK HERE TO UPDATE
                </a>
        </div>
    </div>

    <script>
        const sub1 = document.getElementById("sub1");
        const sub2 = document.getElementById("sub2");
        const sub3 = document.getElementById("sub3");

        sub1.addEventListener("change", checkSubjects);
        sub2.addEventListener("change", checkSubjects);
        sub3.addEventListener("change", checkSubjects);

        function checkSubjects() {
            if (sub1.value && sub1.value === sub2.value) {
                alert("Subjects must be different!");
                sub2.value = "";
            }
            if (sub2.value && sub2.value === sub3.value) {
                alert("Subjects must be different!");
                sub3.value = "";
            }
            if (sub1.value && sub1.value === sub3.value) {
                alert("Subjects must be different!");
                sub3.value = "";
            }
        }

        function updatemarks() {
            document.getElementById("addmarks").style.display = "block";
            document.getElementById("a_display").style.display = "none";
        }
    </script>
</body>
</html>
