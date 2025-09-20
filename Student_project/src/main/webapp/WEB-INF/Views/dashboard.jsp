<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
        header h1 {
            font-size: 20px;
            margin: 0;
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
            transform: translateY(-5px);
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
        
        
        
        
        }
        .container {
            width: 80%;
            margin: 40px auto;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.15);
            padding: 30px;
            animation: fadeIn 1s ease-in-out;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 26px;
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        ul {
            list-style: none;
            padding: 0;
        }
       .container ul li {
            background: #f0f6ff;
            margin: 12px 0;
            padding: 14px 20px;
            border-radius: 10px;
            font-size: 17px;
            color: #34495e;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
       .container ul li::before {
            content: "🎯";
            margin-right: 10px;
        }
       .container ul li:hover {
            transform: translateY(-5px);
            box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
            background: #e8f0ff;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
      /* OBJECTIVES SECTION */
.objectives-section {
    margin-top: 30px;
    padding: 20px;
}

.objectives-section h2 {
    text-align: center;
    font-size: 24px;
    margin-bottom: 25px;
    color: #2c3e50;
}

.objectives-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}

.objective-card {
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    transition: transform 0.3s, box-shadow 0.3s, background 0.3s;
    cursor: pointer;
}

.objective-card i {
    font-size: 30px;
    color: #2575fc;
    margin-bottom: 15px;
}

.objective-card p {
    font-size: 15px;
    color: #333;
}

/* Hover base effect */
.objective-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    color: white;
}

/* Different hover colors */
.objectives-grid .objective-card:nth-child(1):hover {
    background: #3498db; /* Blue */
}
.objectives-grid .objective-card:nth-child(2):hover {
    background: #9b59b6; /* Purple */
}
.objectives-grid .objective-card:nth-child(3):hover {
    background: #f39c12; /* Orange */
}
.objectives-grid .objective-card:nth-child(4):hover {
    background: #27ae60; /* Green */
}
.objectives-grid .objective-card:nth-child(5):hover {
    background: #e74c3c; /* Red */
}

        
        
        
        
        
        
    </style>
</head>
<body>

<header>
    <h1>Student Marks Portal</h1>
    <a onClick="confirmLogout()" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
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

<!-- SIDEBAR -->
<nav>
    <ul>
      
        <li><a href="#" onclick="loadContent('/Student_project/student_display2'); return false;">📊 Marks Report</a></li>
        
        <li><a href="#" onclick="loadContent('/Student_project/profile'); return false;">profile</a></li>
    </ul>
</nav>

<!-- MAIN -->
<main>
    <div id="mainContainer">
        <div class="welcome">
            👋 Welcome, Student!<br>
            <small>Select an option from the left menu.</small>
        </div>
<!-- Replace only the objectives container part -->
<div class="objectives-section">
    <h2><i class="fas fa-bullseye"></i> Student Engineering Objectives</h2>
    <div class="objectives-grid">
        <div class="objective-card">
            <i class="fas fa-laptop-code"></i>
            <p>Build Strong Technical Skills – Gain proficiency in programming, data structures, and engineering fundamentals.</p>
        </div>
        <div class="objective-card">
            <i class="fas fa-industry"></i>
            <p>Apply Knowledge to Real-World Problems – Work on projects, internships, and industry-based case studies.</p>
        </div>
        <div class="objective-card">
            <i class="fas fa-lightbulb"></i>
            <p>Develop Critical Thinking & Problem-Solving – Analyze problems, design solutions, and optimize results effectively.</p>
        </div>
        <div class="objective-card">
            <i class="fas fa-users"></i>
            <p>Enhance Teamwork & Communication – Collaborate in projects, improve leadership, and professional communication.</p>
        </div>
        <div class="objective-card">
            <i class="fas fa-infinity"></i>
            <p>Focus on Innovation & Lifelong Learning – Stay updated with technologies, research, and continuous growth.</p>
        </div>
    </div>
</div>

</div>
            </div>
      
  
</main>
<script>


function confirmLogout(){
	
	if(confirm("Do you really want to logout?")){
		window.location.href = "${pageContext.request.contextPath}/student_logout2";
		
		
		
	}
	
}






</script>
</body>
</html>
