<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
    <title>Admin Marks Portal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            margin: 0;
            background: #f4f7fb;
            color: #333;
        }

        /* HEADER */
        header {
            background: #2c3e50;
            color: white;
            padding: 18px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        header a {
            font-size: 20px;
            color:  #1abc9c;
            text-transform:italic;
            text-decoration:none;
            margin: 0;
              font-style: italic; 
            
           
  
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s, transform 0.2s;
            
            
            
            
            
            
            
        }
        .logout {
            background: #e74c3c;
            padding: 8px 14px;
            border-radius: 6px;
            font-size: 14px;
            text-decoration: none;
            color: white;
            transition: 0.3s;
        }
        .logout:hover {
            background: #c0392b;
        }

        /* LAYOUT */
        nav {
            width: 240px;
            background: #34495e;
            height: 100vh;
            position: fixed;
            top: 60px; /* below header */
            left: 0;
            padding-top: 20px;
            overflow-y: auto;
        }
        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        nav li {
            margin: 5px 0;
        }
        nav a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            font-size: 15px;
            transition: 0.3s;
            border-left: 4px solid transparent;
        }
        nav a:hover {
            background: #1abc9c;
            border-left: 4px solid #16a085;
        }

        /* MAIN CONTENT */
        main {
            margin-left: 240px;
            padding: 25px;
            animation: fadeIn 0.6s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* CARDS */
        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.08);
        }
        .card h3 {
            margin: 0 0 15px;
            font-size: 18px;
            color: #2c3e50;
        }

        /* STATS */
        .stats-box {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }
        .stat {
            padding: 20px;
            border-radius: 10px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: transform 0.3s;
        }
        .stat i {
            font-size: 28px;
            opacity: 0.8;
        }
        .stat:hover {
            transform: translateY(-10px);
        }
        .students { background: #3498db; }
        .courses { background: #9b59b6; }
        .pass { background: #27ae60; }
        .fail { background: #e74c3c; }

        /* WELCOME BOX */
        .welcome {
            font-size: 18px;
            margin-bottom: 20px;
            color: #555;
        }
        
        
    .guidelines-box {
    background: #f9fbff;
    border-left: 6px solid #4a90e2;
    border-radius: 12px;
    padding: 22px;
    margin: 20px 0;
    box-shadow: 0 4px 12px rgba(0,0,0,0.12);
    font-family: "Segoe UI", sans-serif;
    animation: fadeSlideIn 1s ease-out;
}

.guidelines-box h3 {
    margin-bottom: 14px;
    color: #2d4a73;
    font-size: 20px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    animation: textPop 1s ease-in-out;
}

.guidelines-box ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.guidelines-box ul li {
    position: relative;
    margin-bottom: 14px;
    padding-left: 34px;
    line-height: 1.6;
    color: #333;
    font-size: 15px;
    font-weight: 500;
    opacity: 0;
    animation: listFade 0.8s ease forwards;
}

.guidelines-box ul li:nth-child(1) { animation-delay: 0.2s; }
.guidelines-box ul li:nth-child(2) { animation-delay: 0.4s; }
.guidelines-box ul li:nth-child(3) { animation-delay: 0.6s; }
.guidelines-box ul li:nth-child(4) { animation-delay: 0.8s; }

.guidelines-box ul li::before {
    content: "✔";
    position: absolute;
    left: 0;
    top: 0;
    color: #4a90e2;
    font-weight: bold;
    font-size: 16px;
    transform: scale(0);
    animation: checkPop 0.6s ease forwards;
}

.guidelines-box ul li:nth-child(1)::before { animation-delay: 0.3s; }
.guidelines-box ul li:nth-child(2)::before { animation-delay: 0.5s; }
.guidelines-box ul li:nth-child(3)::before { animation-delay: 0.7s; }
.guidelines-box ul li:nth-child(4)::before { animation-delay: 0.9s; }

/* Animations */
@keyframes fadeSlideIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes listFade {
  to { opacity: 1; }
}

@keyframes checkPop {
  to { transform: scale(1); }
}

@keyframes textPop {
  0% { transform: scale(0.9); opacity: 0.6; }
  100% { transform: scale(1); opacity: 1; }
}
</style>
</head>
<body>

<header>
    <a href="${pageContext.request.contextPath}/admin_dashboard">Admin Marks Portal</a>
    
    
    <a href="javascript:void(0)" onclick="confirmLogout()" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    
    
    
</header>

<% String msg = (String) request.getAttribute("msg"); %>
<c:if test="${not empty msg}">
    <script>alert("${msg}");</script>
</c:if>

<script>
function loadContent(url) {
    fetch(url)
        .then(response => response.text())
        .then(html => {
            document.getElementById("mainContainer").innerHTML = html;
        })
        .catch(error => console.error("Error loading content:", error));
}
</script>









<nav>
    <ul>
        <li><a href="#" onclick="loadContent('/Student_project/addStudent'); return false;">➕ Register Student</a></li>
        <li><a href="#" onclick="loadContent('/Student_project/viewStudent'); return false;">👥 Manage Students</a></li>
        <li><a href="#" onclick="loadContent('/Student_project/check_student'); return false;">✏️ Enter Marks</a></li>
        <li><a href="#" onclick="loadContent('/Student_project/mark_report'); return false;">📊 Marks Report</a></li>
        <li><a href="#" onclick="loadContent('/Student_project/add_Statistics'); return false;">📈 Performance Stats</a></li>
    </ul>
</nav>

<!-- MAIN -->
<main>
    <div id="mainContainer">
        <div class="card">
          <h2><i> 👋 Welcome, Admin!<br>
            <small>Select an option from the left menu.</small></i> </h2>
        </div>
        
        
        <div class="guidelines-box">
  <h3>📝 Guidelines for Adding Marks</h3>
  <ul>
    <li>Please ensure accuracy while entering student marks, as these records directly reflect in academic reports.</li>
    <li>Verify student details (Name, Roll No, Course) before submitting marks.</li>
    <li>Enter marks within the valid range (e.g., 0–100). The system will not accept values beyond the permitted range.</li>
    <li>Review entries carefully before final submission. Once saved, edits may require additional approval.</li>
  </ul>
</div>
        

        <div class="card">
            <h3>Quick Stats</h3>
            <div class="stats-box">
                <div class="stat students">
                   <i> Students: ${student_count} <i class="fas fa-user-graduate"></i></i>
                </div>
                <div class="stat courses">
                   <i>No Of Courses: 5 <i class="fas fa-book"></i></i> 
                </div>
                <div class="stat pass">
                   <i>Pass %: ${pass_overall_percentage} <i class="fas fa-check-circle"></i></i> 
                </div>
                <div class="stat fail">
        <i>             Fail %: ${100-pass_overall_percentage} <i class="fas fa-times-circle"></i></i>
                </div>
            </div>
        </div>
    </div>
</main>





<script>


function confirmLogout(){

	if(confirm("Are you sure you want to exit?")){
		
		   window.location.href = "${pageContext.request.contextPath}/logout";
		
	}



}









</script>








</body>
</html>



