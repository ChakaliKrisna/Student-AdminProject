<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Profile</title>
    <style>
        /* Base styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #a8edea, #fed6e3);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .profile-container {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            width: 400px;
            text-align: center;
            animation: fadeIn 1s ease-out;
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #1abc9c;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
        }

        h1 {
            margin: 10px 0;
            font-size: 22px;
            color: #1abc9c;
        }

        h2 {
            margin: 5px 0 20px 0;
            font-size: 18px;
            color: #34495e;
            font-weight: normal;
        }

        .info {
            text-align: left;
            margin-top: 20px;
        }

        .info p {
            margin: 12px 0;
            padding: 12px 15px;
            background: #e0f7f4;
            border-left: 5px solid #16a085;
            border-radius: 10px;
            color: #2c3e50;
            font-weight: 500;
            transition: transform 0.3s;
        }

        .info p:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .logout-btn {
            display: inline-block;
            margin-top: 25px;
            background: #16a085;
            color: white;
            padding: 10px 25px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background: #138d75;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive */
        @media (max-width: 480px) {
            .profile-container {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

<div class="profile-container">
    <!-- Optional avatar -->
    <img   class="profile-avatar">

    <h1>${student_profile.name}</h1>
    <h2>Student Profile</h2>

    <div class="info">
      <p><strong>Email:</strong> ${student_profile.studentId}</p>
        <p><strong>Email:</strong> ${student_profile.email}</p>
        <p><strong>Password:</strong> ${student_profile.password}</p>
        <p><strong>Address:</strong> ${student_profile.address}</p>
        <p><strong>Phone Number:</strong> ${student_profile.phoneNumber}</p>
    </div>

    <a href="${pageContext.request.contextPath}/dashboard" class="logout-btn">🚪 Logout</a>
</div>

</body>
</html>
