<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Marks Lookup</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f7f8; /* soft neutral background */
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            gap: 60px;
            background: #ffffff;
            border-radius: 16px;
            padding: 50px 60px;
            box-shadow: 0 12px 35px rgba(0,0,0,0.12);
            max-width: 1000px;
            width: 90%;
        }

        /* Instructions section on the right */
        .instructions {
            flex: 1;
            order: 2; /* place instructions on the right */
            padding-left: 30px;
        }

        .instructions h1 {
            font-size: 28px;
            margin-bottom: 15px;
            color: #2c3e50;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .instructions h3 {
            font-size: 18px;
            margin-bottom: 12px;
            color: #34495e;
        }

        .instructions ul {
            font-size: 14px;
            line-height: 1.8;
            list-style: disc inside;
            color: #555;
            padding-left: 0;
        }

        /* Form section on the left */
        .form-box {
            flex: 1;
            order: 1; /* place form on the left */
            background: #fefefe;
            border-radius: 14px;
            padding: 40px 35px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-box h2 {
            font-size: 24px;
            margin-bottom: 12px;
            color: #2c3e50;
            text-align: left; /* heading left aligned */
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 6px;
        }

        .form-box p {
            font-size: 13px;
            color: #7f8c8d;
            margin-bottom: 25px;
            text-align: left;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            font-size: 13px;
            color: #34495e;
        }

        input {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 18px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #2980b9;
            box-shadow: 0 0 6px rgba(41,128,185,0.3);
            outline: none;
        }

        button {
            width: 100%;
            padding: 14px;
            border-radius: 8px;
            border: none;
            background: #2980b9;
            color: #fff;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #1f618d;
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        }

        /* Responsive for smaller screens */
        @media (max-width: 900px) {
            .container {
                flex-direction: column-reverse;
                padding: 30px 20px;
            }
            .instructions {
                order: 2;
                padding-left: 0;
                margin-bottom: 30px;
            }
            .form-box {
                order: 1;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Form on the left -->
        <div class="form-box">
            <h2>Lookup Student</h2>
            <p>Enter student credentials below to fetch marks information.</p>

            <form action="${pageContext.request.contextPath}/check_student" method="post">
                <label for="student_id">Student ID</label>
                <input type="text" id="student_id" name="student_id" placeholder="Enter Student ID" required>

                <label for="student_email">Email Address</label>
                <input type="email" id="student_email" name="student_email" placeholder="Enter Email" required>

                <button type="submit">Search & Add Marks</button>
            </form>
        </div>

        <!-- Instructions on the right -->
        <div class="instructions">
            <h1>Student Marks Entry</h1>
            <h3>Steps to Follow</h3>
            <ul>
                <li>Enter <b>Student ID</b> and <b>Email</b> in the form.</li>
                <li>Click <b>Search & Add Marks</b>.</li>
                <li>Check student details after lookup.</li>
                <li>Fill in marks for each subject.</li>
                <li>Save to update academic records.</li>
            </ul>
        </div>
    </div>

</body>
</html>
