<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Portal - Student Marks Management</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #dfe9f3, #ffffff);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: stretch;
            gap: 50px;
            background: rgba(255, 255, 255, 0.9);
            padding: 50px 70px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
            backdrop-filter: blur(10px);
            animation: fadeIn 0.8s ease;
        }

        /* Instructions box */
        .instructions {
            max-width: 340px;
            padding-right: 30px;
            border-right: 2px solid #e0e6f5;
        }

        .instructions h1 {
            font-size: 34px;
            margin-bottom: 20px;
            color: #0052d4;
            letter-spacing: 0.5px;
        }

        .instructions h3 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #222;
        }

        .instructions ul {
            font-size: 15px;
            line-height: 1.8;
            list-style: none;
            padding-left: 0;
            color: #444;
        }

        .instructions ul li {
            margin-bottom: 12px;
            position: relative;
            padding-left: 20px;
        }

        .instructions ul li::before {
            content: "✔";
            position: absolute;
            left: 0;
            top: 0;
            color: #0052d4;
            font-weight: bold;
        }

        /* Form box */
        .form-box {
            width: 420px;
            padding: 35px 40px;
            border-radius: 16px;
            background: #fff;
            box-shadow: 0 8px 22px rgba(0,0,0,0.12);
            transition: transform 0.3s ease;
        }

        .form-box:hover {
            transform: translateY(-3px);
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 10px;
            font-size: 26px;
            color: #222;
        }

        .form-box p {
            text-align: center;
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
        }

        label {
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
            color: #333;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 15px;
            transition: 0.3s;
            background: #f9faff;
        }

        input:focus {
            border-color: #0052d4;
            background: #fff;
            box-shadow: 0 0 8px rgba(0,82,212,0.2);
            outline: none;
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
            transition: all 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #4364f7, #0052d4);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(25px); }
            to   { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Instructions -->
        <div class="instructions">
            <h1>Admin Portal</h1>
            <h3>Steps to Add Marks</h3>
            <ul>
                <li>Enter <b>Student ID</b> and <b>Email</b> in the form.</li>
                <li>Click <b>Search & Add Marks</b>.</li>
                <li>View student details after lookup.</li>
                <li>Fill in subject-wise marks.</li>
                <li>Save to update academic records.</li>
            </ul>
        </div>

        <!-- Form -->
        <div class="form-box">
            <h2>Student Lookup</h2>
            <p>Search a student by ID & email to add marks.</p>
            <form action="${pageContext.request.contextPath}/get_student" method="post">
                <label for="student_id">Student ID</label>
                <input type="text" id="student_id" name="student_id" placeholder="Enter Student ID" required>

                <label for="student_email">Email Address</label>
                <input type="email" id="student_email" name="student_email" placeholder="Enter Email" required>

                <button type="submit">Search & Marks Report</button>
            </form>
        </div>
    </div>

</body>
</html>
