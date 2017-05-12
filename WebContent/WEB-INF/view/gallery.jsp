<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head></head>
<link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">

  <title>Gallery | KMBB CET</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="/college-project/assets/css/w3.css">
  <link rel="stylesheet" href="/college-project/assets/css/bootstrap.min.css">
 
 
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
img{
 width: 100%;
    height: auto;
}

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }

@media (min-width: 768px){
.navbar-nav {
    float: right;
    margin: 0;

}}
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
     
      <img src="/college-project/assets/img/logo.png" style="width:60px;height:60px;position: relative;
    top: -11px;"/>
    <b style="
    font-size: 50px; color:white"> KMBB <span style="
    font-size: small;
    -webkit-font-smoothing: subpixel-antialiased;
    font-family: cursive;
">Gallery</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -204px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills">
       
       
      </ul>
      
    </div>   
  </div>
</nav>
<div class="container">


<div class="w3-container">
  <h2>Album List</h2>
  <p>Please click any album name from the list to view images </p>

  <ul class="w3-ul w3-card-4">
    
    <c:forEach var="bnb" items="${albumName}">
    <li class="w3-padding-16">
      
      <img src="/college-project/assets/img/right.png" class="w3-left w3-circle w3-margin-right" style="width:60px">
      <span class="w3-xlarge"><a href="showPhotos?my=${bnb.albumName}" target="_blank"><b>${bnb.albumName}</b></a></span><br>
      <span>KMBB CET</span>
    </li>
    </c:forEach>
    
    
    
  </ul>
</div>

 
 
 
 
</div>
<br>



</body>
</html>
