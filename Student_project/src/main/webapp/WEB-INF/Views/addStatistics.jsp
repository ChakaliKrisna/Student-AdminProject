<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Performance Statistics</title>
<style>
    body {
        font-family: "Segoe UI", Tahoma, sans-serif;
        background: #f9fbfc;
        margin: 0;
        padding: 20px;
        color: #333;
    }

    h1 {
        text-align: center;
        margin-bottom: 35px;
        font-size: 28px;
        font-weight: 700;
        color: #008B8B; /* Dark Aqua */
    }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
        gap: 25px;
    }

    .card {
        background: #fff;
        padding: 28px;
        border-radius: 12px;
        box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border-top: 5px solid #40E0D0; /* Aqua accent */
    }

    .card:hover {
        transform: translateY(-6px);
        box-shadow: 0px 8px 18px rgba(0,0,0,0.15);
        border-top-color: #FF6F61; /* Coral highlight on hover */
    }

    .card h2 {
        margin: 0 0 18px 0;
        font-size: 1.25rem;
        color: #2c3e50;
        border-bottom: 1px solid #eee;
        padding-bottom: 8px;
    }

    .counts {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 10px 15px;
        margin-bottom: 20px;
        font-size: 0.95rem;
        color: #444;
    }

    .counts span {
        font-weight: 500;
    }

    .progress-container {
        width: 100%;
        height: 26px;
        border-radius: 50px;
        background-color: #f1f1f1;
        position: relative;
        overflow: hidden;
        border: 2px solid #ddd;
    }

    .progress-fill {
        height: 100%;
        background: linear-gradient(90deg, #40E0D0, #20B2AA);
        width: 0%;
        transition: width 1s ease-in-out;
    }

    .progress-text {
        position: absolute;
        width: 100%;
        text-align: center;
        top: 0;
        left: 0;
        line-height: 26px;
        font-size: 0.95rem;
        font-weight: 600;
        color: #2c3e50;
    }
</style>
</head>
<body>

<h1>Department Performance Statistics</h1>

<div class="stats-grid">

    <!-- CSE -->
    <div class="card">
        <h2>CSE — Computer Science</h2>
        <div class="counts">
            <span>Students: ${student_countCSE}</span>
            <span>Pass: ${student_PASScountCSE}</span>
            <span>Marks Not Entered: ${course_wise_notenterdCSE}</span>
            <span>Fail: ${student_FAILcountCSE}</span>
        </div>
        <div class="progress-container">
            <div class="progress-fill" style="width:${pass_percentCSE}%;"></div>
            <div class="progress-text">${pass_percentCSE}%</div>
        </div>
    </div>

    <!-- ECE -->
    <div class="card">
        <h2>ECE — Electronics & Communication</h2>
        <div class="counts">
            <span>Students: ${student_countECE}</span>
            <span>Pass: ${student_PASScountECE}</span>
            <span>Marks Not Entered: ${course_wise_notenterdECE}</span>
            <span>Fail: ${student_FAILcounTECE}</span>
        </div>
        <div class="progress-container">
            <div class="progress-fill" style="width:${pass_percentECE}%;"></div>
            <div class="progress-text">${pass_percentECE}%</div>
        </div>
    </div>

    <!-- EEE -->
    <div class="card">
        <h2>EEE — Electrical & Electronics</h2>
        <div class="counts">
            <span>Students: ${student_countEEE}</span>
            <span>Pass: ${student_PASScountEEE}</span>
            <span>Marks Not Entered: ${course_wise_notenterdEEE}</span>
            <span>Fail: ${student_FAILcounTEEE}</span>
        </div>
        <div class="progress-container">
            <div class="progress-fill" style="width:${pass_percentEEE}%;"></div>
            <div class="progress-text">${pass_percentEEE}%</div>
        </div>
    </div>

    <!-- MECH -->
    <div class="card">
        <h2>MECHANICAL Engineering</h2>
        <div class="counts">
            <span>Students: ${student_countMECH}</span>
            <span>Pass: ${student_PASScountMECH}</span>
            <span>Marks Not Entered: ${course_wise_notenterdMECH}</span>
            <span>Fail: ${student_FAILcountMECH}</span>
        </div>
        <div class="progress-container">
            <div class="progress-fill" style="width:${pass_percentMECH}%;"></div>
            <div class="progress-text">${pass_percentMECH}%</div>
        </div>
    </div>

    <!-- CIVIL -->
    <div class="card">
        <h2>CIVIL Engineering</h2>
        <div class="counts">
            <span>Students: ${student_countCIVIL}</span>
            <span>Pass: ${student_PASScountCIVIL}</span>
            <span>Marks Not Entered: ${course_wise_notenterdCIVIL}</span>
            <span>Fail: ${student_FAILcountCIVIL}</span>
        </div>
        <div class="progress-container">
            <div class="progress-fill" style="width:${pass_percentCIVIL}%;"></div>
            <div class="progress-text">${pass_percentCIVIL}%</div>
        </div>
    </div>

    <!-- OVERALL -->
    <div class="card">
        <h2>Overall Performance</h2>
        <div class="counts">
            <span>Total Students: ${student_count}</span>
            <span>Total Pass: ${pass_total}</span>
            <span>Marks Not Entered: ${marks_not_enterd}</span>
            <span>Total Fail: ${fail_total}</span>
        </div>
        <div class="progress-container">
            <div class="progress-fill" style="width:${pass_overall_percentage}%;"></div>
            <div class="progress-text">${pass_overall_percentage}%</div>
        </div>
    </div>

</div>

</body>
</html>
