<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(120deg, #89f7fe, #66a6ff);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            width: 900px;
            height: 600px;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
            overflow: hidden;
            animation: fadeIn 0.9s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(50px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* Left Panel */
        .left-panel {
            flex: 1;
            background: linear-gradient(135deg, #0052d4, #4364f7);
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            text-align: center;
        }

        .left-panel h2 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .left-panel p {
            font-size: 16px;
            margin: 12px 0;
            max-width: 320px;
            line-height: 1.5;
        }

        .quote {
            font-style: italic;
            margin-top: 20px;
            font-size: 15px;
            opacity: 0.9;
        }

        /* Right Panel (Form) */
        .right-panel {
            flex: 1.2;
            padding: 40px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h3 {
            margin-bottom: 20px;
            font-size: 26px;
            color: #0052d4;
            text-align: center;
        }

        input[type="text"],
        input[type="email"],
        select {
            width: 100%;
            padding: 12px 14px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 15px;
            background: #f9faff;
            transition: 0.3s;
        }

        input:focus, select:focus {
            border-color: #0052d4;
            background: #fff;
            box-shadow: 0 0 8px rgba(0,82,212,0.2);
            outline: none;
        }

        .gender, .courseselect {
            margin: 15px 0;
            font-size: 14px;
            font-weight: 600;
            color: #333;
        }

        .gender input {
            margin-right: 6px;
        }

        button {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #0052d4, #4364f7);
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
            margin-top: 15px;
            transition: all 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #4364f7, #0052d4);
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Left Panel -->
    <div class="left-panel">
<h2>Welcome Admin!</h2>
<p>Register new students and manage their profiles efficiently.</p>
<p class="quote">“Guiding students today shapes the leaders of tomorrow.”</p>
<p class="quote">“Every student added is a step toward academic excellence.”</p>    </div>

    <!-- Right Panel -->
    <div class="right-panel">
        <c:if test="${not empty msg}">
            <script>alert("${msg}");</script>
        </c:if>

        <h3>Student Registration</h3>
        <form action="${pageContext.request.contextPath}/addStudent" method="post">

            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="text" name="Address" placeholder="Permanent Address" required>
            <input type="text" name="phoneNumber" pattern="\d{10}" required placeholder="Phone Number">

            <!-- Gender -->
            <div class="gender">
                <label>Gender:</label><br>
                <input type="radio" name="gender" value="male" id="male">
                <label for="male">Male</label>
                <input type="radio" name="gender" value="female" id="female">
                <label for="female">Female</label>
            </div>

            <!-- Course Select -->
            <div class="courseselect">
                <label for="course">Select Course:</label>
                <select name="course" id="course" required>
                    <option value="">-- Choose Course --</option>
                    <option>CSE</option>
                    <option>ECE</option>
                    <option>EEE</option>
                    <option>CIVIL</option>
                   
                    <option>MECH</option>
                </select>
            </div>

            <button type="submit">Register Student</button>
        </form>
    </div>
</div>

</body>
</html>
