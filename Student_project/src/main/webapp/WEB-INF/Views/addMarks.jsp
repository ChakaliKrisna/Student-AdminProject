<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Marks & Student Details</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Dashboard Button (floating top-right) */
        .dashboard-box {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #27ae60;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            z-index: 10;
            animation: fadeIn 1s ease;
        }
        .dashboard-box a {
            text-decoration: none;
            color: white;
            display: block;
            padding: 12px 18px;
            font-weight: 600;
            font-size: 14px;
        }
        .dashboard-box:hover {
            background: #1f8f4c;
        }

        /* Container Layout (reverse order) */
        .container {
            max-width: 1000px;
            margin: 100px auto 40px auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 2fr 1fr; /* form bigger, student box smaller */
            gap: 30px;
        }

        /* Student Box */
        .student-box {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
            transform: translateX(40px);
            animation: slideInRight 0.8s ease forwards;
        }
        .student-box h2 {
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
        }
        .student-box table {
            width: 100%;
            border-collapse: collapse;
        }
        .student-box th, .student-box td {
            padding: 12px 15px;
            border-bottom: 1px solid rgba(255,255,255,0.3);
            text-align: left;
        }
        .student-box th {
            font-weight: 600;
            width: 35%;
        }

        /* Form Box */
        .form-box {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
            transform: translateX(-40px);
            animation: slideInLeft 0.8s ease forwards;
        }
        .form-box h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            color: #2575fc;
            border-bottom: 2px solid #2575fc;
            display: inline-block;
            padding-bottom: 6px;
        }
        .form-box label {
            display: block;
            margin: 12px 0 6px;
            font-weight: bold;
            color: #444;
        }
        .form-box select{
        
         width: 95%;
            padding: 12px;
            margin-bottom: 18px;
           margin:10px 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background: #fafafa;
            font-size: 14px;
            transition: 0.3s;
        
        
        
        
        
        
        }
        .form-box input {
            width: 90%;
            padding: 12px;
            margin-bottom: 18px;
           margin:10px 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background: #fafafa;
            font-size: 14px;
            transition: 0.3s;
        }
        .form-box input:focus,
        .form-box select:focus {
            border-color: #2575fc;
            outline: none;
            background: #fff;
            box-shadow: 0 0 8px rgba(37,117,252,0.3);
        }
        .form-box button {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            color: white;
            background: #2575fc;
            cursor: pointer;
            transition: 0.3s;
        }
        .form-box button:hover {
            background: #1e63d6;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(37,117,252,0.3);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-60px); }
            to { opacity: 1; transform: translateX(0); }
        }
        @keyframes slideInRight {
            from { opacity: 0; transform: translateX(60px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>
</head>
<body>

    <!-- Dashboard Floating Button -->
    <div class="dashboard-box">
        <c:if test="${not empty msg}">
            <script>alert("${msg}");</script>
        </c:if>
        <a href="${pageContext.request.contextPath}/admin_dashboard">ADMIN DASHBOARD</a>
    </div>

    <!-- Two-column Container -->
    <div class="container">

        <!-- Add Marks Form (LEFT side now) -->
        <div class="form-box">
            <h2>➕ Add Marks</h2>
            <form action="${pageContext.request.contextPath}/saveMarks" method="post">
                <label for="Math">ENGINEERING MATHEMATICS</label>
                <select name="Math" id="Math" required>
                    <option value="Math">Math</option>
                </select>
                <input type="number" name="en_math" placeholder="Enter Marks (10-100)" min="0" max="100" required>

                <label for="dsa">DATA STRUCTURES & ALGORITHMS</label>
                <select name="dsa" id="dsa" required>
                    <option value="dsa">DSA</option>
                </select>
                <input type="number" name="en_dsa" placeholder="Enter Marks (10-100)" min="0" max="100" required>

                <label for="python">PYTHON</label>
                <select name="python" id="python" required>
                    <option value="python">Python</option>
                </select>
                <input type="number" name="en_python" placeholder="Enter Marks (10-100)" min="0" max="100" required>

                <label for="com">COMPUTER ORGANISATION AND MICROPROCESSORS</label>
                <select name="com" id="com" required>
                    <option value="com">COM</option>
                </select>
                <input type="number" name="en_com" placeholder="Enter Marks (10-100)" min="0" max="100" required>

                <label for="bee">BASIC ELECTRICAL ENGINEERING</label>
                <select name="bee" id="bee" required>
                    <option value="bee">BEE</option>
                </select>
                <input type="number" name="en_bee" placeholder="Enter Marks (10-100)" min="0" max="100" required>

                <button type="submit">💾 Save Marks</button>
            </form>
        </div>

        <!-- Student Details (RIGHT side now) -->
        <div class="student-box">
            <h2>👤 Student Details</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <td>${Marks_student.studentId}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${Marks_student.name}</td>
                </tr>
                
                
                 <tr>
                    <th>PHONE NUMBER</th>
                    <td>${Marks_student.phoneNumber}</td>
                </tr>
                
                 <tr>
                    <th>EMAIL</th>
                    <td>${Marks_student.email}</td>
                </tr>
                
                
                
                
                
                
                
                
            </table>
        </div>

    </div>





    <script>
        const math = document.getElementById("Math");
        math.addEventListener("change", function() {
            if (this.value !== "Math") {
                setTimeout(() => {
                    alert("You can only select Math!");
                    this.value = "Math";
                }, 100);
            }
        });

        const dsa = document.getElementById("dsa");
        dsa.addEventListener("change", function() {
            if (this.value !== "dsa") {
                setTimeout(() => {
                    alert("You can only select DSA!");
                    this.value = "dsa";
                }, 100);
            }
        });

        const python = document.getElementById("python");
        python.addEventListener("change", function() {
            if (this.value !== "python") {
                setTimeout(() => {
                    alert("You can only select PYTHON!");
                    this.value = "python";
                }, 100);
            }
        });

        const bee = document.getElementById("bee");
        bee.addEventListener("change", function() {
            if (this.value !== "bee") {
                setTimeout(() => {
                    alert("You can only select BEE!");
                    this.value = "bee";
                }, 100);
            }
        });

        const com = document.getElementById("com");
        com.addEventListener("change", function() {
            if (this.value !== "com") {
                setTimeout(() => {
                    alert("You can only select COM!");
                    this.value = "com";
                }, 100);
            }
        });
    </script>

</body>
</html>
