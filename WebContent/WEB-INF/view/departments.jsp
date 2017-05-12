<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

  <title>KMBB CET | Departments</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 

.navbar {

      position: relative;
      min-height: 91px;
      margin-bottom: 20px;
      border: 1px solid transparent;
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #fff;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
.navbar-inverse {
    background-color: #0a0a29;
   
}
h3 {
    font-size: 24px;
    color: #777;
    font-family: sans-serif;
}

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
td {
    padding: 48px;
}
@media (min-width: 768px){
.navbar-nav {
    float: right;
    margin: 0;

}}


div.polaroid {
  width:180px;
  background-color: white;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 25px;
}

div.contain {
  text-align: center;
  padding: 10px 20px;
}



  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     <img src="/college-project/assets/img/logo.png" style="width:60px;height:60px;position: relative;
    top: -11px;"/>
    <b style="
    font-size: 50px; color:white"> KMBB <span style="
    font-size: small;
    -webkit-font-smoothing: subpixel-antialiased;
    font-family: cursive;
"></span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -160px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills" style="font-size: smaller;">
       
        <li><a href="departments?dept=mech">MECHANICAL</a></li>
        <li><a href="departments?dept=cse">COMPUTER SCIENCE</a></li>
         <li><a href="departments?dept=civil">CIVIL</a></li>
          <li><a href="departments?dept=ee">ELECTRICAL AND ELECTRONICS</a></li>
          <li><a href="departments?dept=ece">ELECTRONICS AND COMMUNICATION</a></li>
          <li><a href="departments?dept=hum">HUMANITIES</a></li>
      </ul>
      
    </div>
  </div>
</nav>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
     
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
       <c:forEach var="dep" items="${info}">
        <img src="/college-project/image/depPhoto?id=${dep.id}" alt="Image">
        <div class="carousel-caption">
      
          <h2>${dep.department} Engineering</h2>
       </c:forEach>
          <p>KMBB CET</p>
        </div>      
      </div>

    
    </div>

    <!-- Left and right controls -->
   
</div>

<div class="container">
<c:forEach var="dep" items="${info}">
<br>
<h1>${dep.department} Engineering</h1>
<p>${dep.information}</p>
</c:forEach>
<h2>Faculty</h2>
<h3>Profiles of faculty members in ${dep.department} Department at KMBB CET</h3>
<br><br>
<div class="container">
<c:forEach var="facList" items="${fac}">
<center>
<div class="col-lg-4 col-md-4 col-sm-4">
<div class="polaroid">
<img alt="image" src="/college-project/image/getFacultyImage?id=${facList.id}" height="200px" width="180px"><br>

<div class="contain">
<strong style="font-weight: 700;
    -webkit-font-smoothing: antialiased;
    font-family: initial;
    font-size: large;">${facList.name}</strong>
    </div>
    </div>
    
${facList.designation}<br>
${facList.qualification}
<br>

</div>
</center>

</c:forEach>

</div>

<%--old logic
<% int c=0; %>
<table class="table table-bordered" cellpadding="0" cellspacing="0" border="0">
<tbody>



<%c++; %>
<%
if(c  == 1 || c  == 4 || c  == 7 || c  == 10 || c == 13 || c  == 16 || c  == 19){
%><tr>
<%} %>

<td style=" padding: 48px;">
<img alt="image" src="/college-project/image/getFacultyImage?id=${facList.id}" height="100px" width="90px"><br>
<strong>${facList.name}</strong><br>
${facList.designation}<br>
${facList.qualification}
<br>
</td>

<%
if(c  == 3 || c  == 6 || c  == 9 || c  == 12 || c == 15 || c  == 18 || c  == 21){
%></tr>
<%} %>


</c:forEach>

</tbody>
</table>


--%>
</div>
<br>

<footer class="container-fluid text-center" style="background-color:#0a0a29;">
  <p style="color:white;">&copy  2017 KMBB Engineering College | All Rights Reserved</p>
</footer>

</body>
</html>
