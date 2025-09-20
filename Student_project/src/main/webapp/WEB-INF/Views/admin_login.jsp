<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-card {
            display: flex;
            width: 750px;
            max-width: 95%;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
            animation: fadeIn 1s ease-out;
        }

        /* Left side: info/instructions */
        .login-info {
            flex: 1;
            background: linear-gradient(135deg, #1E3A8A, #2563EB);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px 30px;
        }

        .login-info h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .login-info ul {
            list-style: none;
            padding: 0;
            font-size: 15px;
            line-height: 1.6;
        }

        .login-info ul li::before {
            content: "✔";
            margin-right: 8px;
            color: #FFD700;
        }

        /* Right side: form */
        .login-form {
            flex: 1;
            background: #ffffff;
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-form h2 {
            margin-bottom: 25px;
            color: #1E3A8A;
            font-weight: 700;
            text-align: center;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #bbb;
            border-radius: 8px;
            font-size: 14px;
            transition: border 0.3s, box-shadow 0.3s;
        }

        .login-form input[type="text"]:focus,
        .login-form input[type="password"]:focus {
            border-color: #2563EB;
            box-shadow: 0 0 6px rgba(37,99,235,0.5);
            outline: none;
        }

        .login-form input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #2563EB, #1E40AF);
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.3s;
        }

        .login-form input[type="submit"]:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(37,99,235,0.4);
        }

        .extra-links {
            margin-top: 18px;
            font-size: 14px;
            text-align: center;
        }

        .extra-links a {
            color: #2563EB;
            text-decoration: none;
            font-weight: 500;
        }

        .extra-links a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
    <div class="login-card">
        <!-- Left side: instructions -->
        <div class="login-info">
            <h1>Admin Portal</h1>
            <ul>
                <li>Use your admin credentials to login.</li>
                <li>Keep your password secure.</li>
                <li>New admins must register first.</li>
                <li>Session will expire after 15 minutes of inactivity.</li>
            </ul>
        </div>

        <!-- Right side: login form -->
        <div class="login-form">
            <h2>Admin Login</h2>
            <form action="admin_login" method="post">
                <input type="text" name="admin_email" placeholder="Enter Admin Email" required/><br/>
                <input type="password" name="admin_password" placeholder="Enter Password" required/><br/>
                <input type="submit" value="Sign In"/>
            </form>
            <div class="extra-links">
                <p>NEW ADMIN ? 
                   <a href="${pageContext.request.contextPath}/admin_registration">REGISTER</a>
                </p>
                <c:if test="${not empty msg}">
                    <p style="color:red;">${msg}</p>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
