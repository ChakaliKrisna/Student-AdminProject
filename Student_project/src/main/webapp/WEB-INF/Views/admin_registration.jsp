<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .registration-container {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 30px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: #0056b3;
        }

        p {
            margin-top: 20px;
            font-size: 14px;
        }

        p a {
            color: #007bff;
            text-decoration: none;
        }

        p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h2>Admin Registration</h2>
       <form action="${pageContext.request.contextPath}/admin_registration" method="post">

            <input type="text" name="admin_name" placeholder="Full Name" required>
            <input type="email" name="admin_email" placeholder="Email Address" required>
            <input type="password" name="admin_password" placeholder="Password" required>
            <input type="text" name="admin_phone" placeholder="Phone Number" required>
            <button type="submit">Register</button>
            
            
            
            
        </form>
        <p>Already registered? <a href="${pageContext.request.contextPath}/admin_dashboard">Login here</a></p>
        
        
          <c:if test="${not empty msg}">
   <p style="color:red;">${msg}</p>
</c:if>
    </div>
</body>
</html>
